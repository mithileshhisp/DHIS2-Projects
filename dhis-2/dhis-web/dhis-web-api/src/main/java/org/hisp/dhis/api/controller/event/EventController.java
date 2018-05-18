package org.hisp.dhis.api.controller.event;

/*
 * Copyright (c) 2004-2013, University of Oslo
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * * Neither the name of the HISP project nor the names of its contributors may
 *   be used to endorse or promote products derived from this software without
 *   specific prior written permission.
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

import org.hisp.dhis.api.utils.ContextUtils;
import org.hisp.dhis.dxf2.event.EventService;
import org.hisp.dhis.dxf2.importsummary.ImportSummaries;
import org.hisp.dhis.dxf2.utils.JacksonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author Morten Olav Hansen <mortenoh@gmail.com>
 */
@Controller
@RequestMapping( value = EventController.RESOURCE_PATH )
public class EventController
{
    public static final String RESOURCE_PATH = "/events";

    @Autowired
    private EventService eventService;

    // -------------------------------------------------------------------------
    // Controller
    // -------------------------------------------------------------------------

    @RequestMapping( method = RequestMethod.POST, consumes = "application/xml" )
    @PreAuthorize( "hasRole('ALL') or hasRole('F_PATIENT_DATAVALUE_ADD')" )
    public void postXmlEvents( HttpServletResponse response, InputStream inputStream ) throws IOException
    {
        ImportSummaries importSummaries = eventService.saveEventsXml( inputStream );

        if ( importSummaries.getImportSummaries().size() == 1 )
        {
            JacksonUtils.toXml( response.getOutputStream(), importSummaries.getImportSummaries().get( 0 ) );
        }
        else
        {
            JacksonUtils.toXml( response.getOutputStream(), importSummaries );
        }
    }

    @RequestMapping( method = RequestMethod.POST, consumes = "application/json" )
    @PreAuthorize( "hasRole('ALL') or hasRole('F_PATIENT_DATAVALUE_ADD')" )
    public void postJsonEvents( HttpServletResponse response, InputStream inputStream ) throws IOException
    {
        ImportSummaries importSummaries = eventService.saveEventsJson( inputStream );

        if ( importSummaries.getImportSummaries().size() == 1 )
        {
            JacksonUtils.toJson( response.getOutputStream(), importSummaries.getImportSummaries().get( 0 ) );
        }
        else
        {
            JacksonUtils.toJson( response.getOutputStream(), importSummaries );
        }

    }

    @ExceptionHandler( IllegalArgumentException.class )
    public void handleError( IllegalArgumentException ex, HttpServletResponse response )
    {
        ContextUtils.conflictResponse( response, ex.getMessage() );
    }
}
