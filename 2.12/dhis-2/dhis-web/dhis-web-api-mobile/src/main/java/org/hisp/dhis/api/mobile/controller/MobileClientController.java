package org.hisp.dhis.api.mobile.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hisp.dhis.api.mobile.NotAllowedException;
import org.hisp.dhis.api.mobile.model.DataStreamSerializable;
import org.hisp.dhis.api.mobile.model.MobileOrgUnitLinks;
import org.hisp.dhis.api.mobile.model.OrgUnits;
import org.hisp.dhis.organisationunit.OrganisationUnit;
import org.hisp.dhis.user.CurrentUserService;
import org.hisp.dhis.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.util.UrlUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping( value = "/mobile" )
public class MobileClientController
    extends AbstractMobileController
{
    @Autowired
    private CurrentUserService currentUserService;

    @RequestMapping( method = RequestMethod.GET )
    @ResponseBody
    public OrgUnits getOrgUnitsForUser2_8( HttpServletRequest request )
        throws NotAllowedException
    {
        User user = currentUserService.getCurrentUser();

        if ( user == null )
        {
            throw NotAllowedException.NO_USER;
        }

        Collection<OrganisationUnit> units = user.getOrganisationUnits();

        List<MobileOrgUnitLinks> unitList = new ArrayList<MobileOrgUnitLinks>();
        for ( OrganisationUnit unit : units )
        {
            unitList.add( getOrgUnit( unit, request ) );
        }
        OrgUnits orgUnits = new OrgUnits( unitList );
        orgUnits.setClientVersion( DataStreamSerializable.TWO_POINT_EIGHT );
        return orgUnits;
    }

    @RequestMapping( method = RequestMethod.GET, value = "/{version}" )
    @ResponseBody
    public OrgUnits getOrgUnitsForUser( HttpServletRequest request, @PathVariable
    String version )
        throws NotAllowedException
    {
        User user = currentUserService.getCurrentUser();

        if ( user == null )
        {
            throw NotAllowedException.NO_USER;
        }

        Collection<OrganisationUnit> units = user.getOrganisationUnits();

        List<MobileOrgUnitLinks> unitList = new ArrayList<MobileOrgUnitLinks>();
        for ( OrganisationUnit unit : units )
        {
            unitList.add( getOrgUnit( unit, request ) );
        }
        OrgUnits orgUnits = new OrgUnits( unitList );
        orgUnits.setClientVersion( DataStreamSerializable.TWO_POINT_NINE );
        return orgUnits;
    }

    @RequestMapping( method = RequestMethod.GET, value = "/{version}/LWUIT" )
    @ResponseBody
    public OrgUnits getOrgUnitsForUserLWUIT( HttpServletRequest request, @PathVariable
    String version )
        throws NotAllowedException
    {
        User user = currentUserService.getCurrentUser();

        if ( user == null )
        {
            throw NotAllowedException.NO_USER;
        }

        Collection<OrganisationUnit> units = user.getOrganisationUnits();

        List<MobileOrgUnitLinks> unitList = new ArrayList<MobileOrgUnitLinks>();
        for ( OrganisationUnit unit : units )
        {
            unitList.add( getOrgUnit( unit, request ) );
        }
        OrgUnits orgUnits = new OrgUnits( unitList );
        orgUnits.setClientVersion( version );
        return orgUnits;
    }

    private MobileOrgUnitLinks getOrgUnit( OrganisationUnit unit, HttpServletRequest request )
    {
        MobileOrgUnitLinks orgUnit = new MobileOrgUnitLinks();

        orgUnit.setId( unit.getId() );
        orgUnit.setName( unit.getShortName() );

        orgUnit.setDownloadAllUrl( getUrl( request, unit.getId(), "all" ) );
        orgUnit.setUpdateActivityPlanUrl( getUrl( request, unit.getId(), "activitiyplan" ) );
        orgUnit.setUploadFacilityReportUrl( getUrl( request, unit.getId(), "dataSets" ) );
        orgUnit.setUploadActivityReportUrl( getUrl( request, unit.getId(), "activities" ) );
        orgUnit.setUpdateDataSetUrl( getUrl( request, unit.getId(), "updateDataSets" ) );
        orgUnit.setChangeUpdateDataSetLangUrl( getUrl( request, unit.getId(), "changeLanguageDataSet" ) );
        orgUnit.setSearchUrl( getUrl( request, unit.getId(), "search" ) );
        orgUnit.setUpdateNewVersionUrl( getUrl( request, unit.getId(), "updateNewVersionUrl" ) );
        orgUnit.setUpdateContactUrl( getUrl( request, unit.getId(), "updateContactForMobile" ) );
        orgUnit.setFindPatientUrl( getUrl( request, unit.getId(), "findPatient" ) );
        orgUnit.setRegisterPersonUrl( getUrl( request, unit.getId(), "registerPerson" ) );
        orgUnit.setUploadProgramStageUrl( getUrl( request, unit.getId(), "uploadProgramStage" ) );
        orgUnit.setEnrollProgramUrl( getUrl( request, unit.getId(), "enrollProgram" ) );
        orgUnit.setGetVariesInfoUrl( getUrl( request, unit.getId(), "getVariesInfo" ) );
        orgUnit.setAddRelationshipUrl( getUrl( request, unit.getId(), "addRelationship" ) );
        orgUnit.setDownloadAnonymousProgramUrl( getUrl( request, unit.getId(), "downloadAnonymousProgramUrl" ) );
        orgUnit.setFindProgramUrl( getUrl( request, unit.getId(), "findProgram" ) );
        orgUnit.setFindLatestPersonUrl( getUrl( request, unit.getId(), "findLatestPerson" ) );

        // generate URL for download new version
        String full = UrlUtils.buildFullRequestUrl( request );
        String root = full.substring( 0, full.length() - UrlUtils.buildRequestUrl( request ).length() );
        String updateNewVersionUrl = root + "/dhis-web-api-mobile/updateClient.action";
        orgUnit.setUpdateNewVersionUrl( updateNewVersionUrl );

        return orgUnit;
    }

    private static String getUrl( HttpServletRequest request, int id, String path )
    {
        String url = UrlUtils.buildFullRequestUrl( request );
        if ( url.endsWith( "/" ) )
        {
            url = url + "orgUnits/" + id + "/" + path;
        }
        else
        {
            url = url + "/orgUnits/" + id + "/" + path;
        }
        return url;
    }
}
