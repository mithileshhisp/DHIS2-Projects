package org.hisp.dhis.webapi.controller.metadata;

/*
 * Copyright (c) 2004-2016, University of Oslo
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * Neither the name of the HISP project nor the names of its contributors may
 * be used to endorse or promote products derived from this software without
 * specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import org.apache.commons.collections.map.HashedMap;
import org.hisp.dhis.common.IdentifiableObject;
import org.hisp.dhis.commons.util.StreamUtils;
import org.hisp.dhis.dxf2.metadata2.Metadata;
import org.hisp.dhis.dxf2.metadata2.MetadataImportParams;
import org.hisp.dhis.dxf2.metadata2.MetadataImportService;
import org.hisp.dhis.dxf2.metadata2.feedback.ImportReport;
import org.hisp.dhis.render.RenderFormat;
import org.hisp.dhis.render.RenderService;
import org.hisp.dhis.schema.Schema;
import org.hisp.dhis.schema.SchemaService;
import org.hisp.dhis.system.util.ReflectionUtils;
import org.hisp.dhis.webapi.mvc.annotation.ApiVersion;
import org.hisp.dhis.webapi.service.ContextService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import static org.hisp.dhis.webapi.mvc.annotation.ApiVersion.Version;

/**
 * @author Morten Olav Hansen <mortenoh@gmail.com>
 */
@Controller
@RequestMapping( "/metadata" )
@ApiVersion( Version.ALL )
public class MetadataImportController
{
    @Autowired
    private MetadataImportService metadataImportService;

    @Autowired
    private ContextService contextService;

    @Autowired
    private RenderService renderService;

    @Autowired
    private SchemaService schemaService;

    @RequestMapping( value = "", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE )
    public void postJsonMetadata( HttpServletRequest request, HttpServletResponse response ) throws IOException
    {
        MetadataImportParams params = metadataImportService.getParamsFromMap( contextService.getParameterValuesMap() );
        params.setObjects( renderService.fromMetadata( StreamUtils.wrapAndCheckCompressionFormat( request.getInputStream() ), RenderFormat.JSON ) );

        ImportReport importReport = metadataImportService.importMetadata( params );
        renderService.toJson( response.getOutputStream(), importReport );
    }

    @SuppressWarnings( "unchecked" )
    @RequestMapping( value = "", method = RequestMethod.POST, consumes = MediaType.APPLICATION_XML_VALUE )
    public void postXmlMetadata( HttpServletRequest request, HttpServletResponse response ) throws IOException
    {
        MetadataImportParams params = metadataImportService.getParamsFromMap( contextService.getParameterValuesMap() );
        Metadata metadata = renderService.fromXml( StreamUtils.wrapAndCheckCompressionFormat( request.getInputStream() ), Metadata.class );

        Map<Class<? extends IdentifiableObject>, List<IdentifiableObject>> objectMap = new HashedMap();

        for ( Schema schema : schemaService.getMetadataSchemas() )
        {
            Object value = ReflectionUtils.invokeGetterMethod( schema.getPlural(), metadata );

            if ( value != null )
            {
                if ( Collection.class.isAssignableFrom( value.getClass() ) && schema.isIdentifiableObject() )
                {
                    List<IdentifiableObject> objects = new ArrayList<>( (Collection<IdentifiableObject>) value );

                    if ( !objects.isEmpty() )
                    {
                        objectMap.put( (Class<? extends IdentifiableObject>) schema.getKlass(), objects );
                    }
                }
            }
        }

        params.setObjects( objectMap );

        ImportReport importReport = metadataImportService.importMetadata( params );
        renderService.toXml( response.getOutputStream(), importReport );
    }
}
