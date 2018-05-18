package org.hisp.dhis.dashboard.impl;

/*
 * Copyright (c) 2004-2012, University of Oslo
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

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hisp.dhis.chart.ChartService;
import org.hisp.dhis.common.IdentifiableObject;
import org.hisp.dhis.dashboard.DashboardContent;
import org.hisp.dhis.dashboard.DashboardContentStore;
import org.hisp.dhis.dashboard.DashboardService;
import org.hisp.dhis.document.Document;
import org.hisp.dhis.document.DocumentService;
import org.hisp.dhis.mapping.Map;
import org.hisp.dhis.mapping.MappingService;
import org.hisp.dhis.report.Report;
import org.hisp.dhis.report.ReportService;
import org.hisp.dhis.reporttable.ReportTable;
import org.hisp.dhis.reporttable.ReportTableService;
import org.hisp.dhis.user.User;
import org.hisp.dhis.user.UserService;
import org.springframework.transaction.annotation.Transactional;

/**
 * Note: The remove associations methods must be altered if caching is introduced.
 * 
 * @author Lars Helge Overland
 */
@Transactional
public class DefaultDashboardService
    implements DashboardService
{
    private static final int MAX_PER_OBJECT = 5;
    private static final int MAX_OBJECTS = 15;
    
    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    private DashboardContentStore dashboardContentStore;

    public void setDashboardContentStore( DashboardContentStore dashboardContentStore )
    {
        this.dashboardContentStore = dashboardContentStore;
    }
    
    private UserService userService;
    
    public void setUserService( UserService userService )
    {
        this.userService = userService;
    }

    private ChartService chartService;

    public void setChartService( ChartService chartService )
    {
        this.chartService = chartService;
    }

    private MappingService mappingService;

    public void setMappingService( MappingService mappingService )
    {
        this.mappingService = mappingService;
    }

    private ReportService reportService;

    public void setReportService( ReportService reportService )
    {
        this.reportService = reportService;
    }
    
    private ReportTableService reportTableService;

    public void setReportTableService( ReportTableService reportTableService )
    {
        this.reportTableService = reportTableService;
    }
    
    private DocumentService documentService;

    public void setDocumentService( DocumentService documentService )
    {
        this.documentService = documentService;
    }

    // -------------------------------------------------------------------------
    // DashboardService implementation
    // -------------------------------------------------------------------------

    public List<IdentifiableObject> search( String query )
    {
        List<IdentifiableObject> objects = new ArrayList<IdentifiableObject>();
        
        int remaining = 0;
        
        objects.addAll( userService.getAllUsersBetweenByName( query, 0, MAX_PER_OBJECT ) );
        objects.addAll( chartService.getChartsBetweenByName( query, 0, MAX_PER_OBJECT ) );
        objects.addAll( mappingService.getMapsBetweenLikeName( query, 0, MAX_PER_OBJECT ) );

        remaining = MAX_OBJECTS - objects.size();
        
        if ( remaining > 0 )
        {
            objects.addAll( reportService.getReportsBetweenByName( query, 0, MAX_PER_OBJECT ) );
        }
        
        remaining = MAX_OBJECTS - objects.size();
        
        if ( remaining > 0 )
        {
            objects.addAll( reportTableService.getReportTablesBetweenByName( query, 0, Math.min( remaining, MAX_PER_OBJECT ) ) );
        }

        remaining = MAX_OBJECTS - objects.size();
        
        if ( remaining > 0 )
        {
            objects.addAll( documentService.getDocumentsBetweenByName( query, 0, Math.min( remaining, MAX_PER_OBJECT ) ) );
        }
        
        return objects;
    }
    
    public void saveDashboardContent( DashboardContent dashboardContent )
    {
        dashboardContentStore.save( dashboardContent );
    }

    public void updateDashboardContent( DashboardContent dashboardContent )
    {
        dashboardContentStore.update( dashboardContent );
    }
    
    public DashboardContent getDashboardContent( int id )
    {
        return dashboardContentStore.get( id );
    }

    public DashboardContent getDashboardContent( User user )
    {
        DashboardContent content = dashboardContentStore.get( user.getId() );

        return content != null ? content : new DashboardContent( user );
    }

    public Collection<DashboardContent> getAllDashboardContent()
    {
        return dashboardContentStore.getAll();
    }
    
    public void deleteDashboardContent( DashboardContent content )
    {
        dashboardContentStore.delete( content );
    }
    
    public Collection<DashboardContent> getByDocument( Document document )
    {
        return dashboardContentStore.getByDocument( document );
    }
    
    public Collection<DashboardContent> getByMap( Map map )
    {
        return dashboardContentStore.getByMap( map );
    }
    
    public Collection<DashboardContent> getByReport( Report report )
    {
        return dashboardContentStore.getByReport( report );
    }
    
    public Collection<DashboardContent> getByReportTable( ReportTable reportTable )
    {
        return dashboardContentStore.getByReportTable( reportTable );
    }
}
