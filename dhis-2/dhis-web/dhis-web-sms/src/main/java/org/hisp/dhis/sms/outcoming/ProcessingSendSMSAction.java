package org.hisp.dhis.sms.outcoming;

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

import com.opensymphony.xwork2.Action;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;
import org.codehaus.jackson.annotate.JsonMethod;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.hisp.dhis.i18n.I18n;
import org.hisp.dhis.message.MessageSender;
import org.hisp.dhis.organisationunit.OrganisationUnit;
import org.hisp.dhis.oust.manager.SelectionTreeManager;
import org.hisp.dhis.patient.Patient;
import org.hisp.dhis.patient.PatientService;
import org.hisp.dhis.sms.outbound.OutboundSmsTransportService;
import org.hisp.dhis.user.CurrentUserService;
import org.hisp.dhis.user.User;
import org.hisp.dhis.user.UserGroup;
import org.hisp.dhis.user.UserGroupService;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Dang Duy Hieu
 * @version $Id$
 */
public class ProcessingSendSMSAction
    implements Action
{
    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    @Autowired
    private SelectionTreeManager selectionTreeManager;

    @Autowired
    private CurrentUserService currentUserService;

    @Autowired
    private PatientService patientService;

    @Autowired
    private UserGroupService userGroupService;

    @Autowired
    private OutboundSmsTransportService transportService;

    private MessageSender messageSender;

    public void setMessageSender( MessageSender messageSender )
    {
        this.messageSender = messageSender;
    }

    // -------------------------------------------------------------------------
    // Input & Output
    // -------------------------------------------------------------------------

    private String gatewayId;

    public void setGatewayId( String gatewayId )
    {
        this.gatewayId = gatewayId;
    }

    private String smsSubject;

    public void setSmsSubject( String smsSubject )
    {
        this.smsSubject = smsSubject;
    }

    private String smsMessage;

    public void setSmsMessage( String smsMessage )
    {
        this.smsMessage = smsMessage;
    }

    private String sendTarget;

    public void setSendTarget( String sendTarget )
    {
        this.sendTarget = sendTarget;
    }

    private Integer userGroup;

    public void setUserGroup( Integer userGroup )
    {
        this.userGroup = userGroup;
    }

    private Set<String> recipients = new HashSet<String>();

    public void setRecipients( Set<String> recipients )
    {
        this.recipients = recipients;
    }

    private String message = "success";

    public String getMessage()
    {
        return message;
    }

    // -------------------------------------------------------------------------
    // I18n
    // -------------------------------------------------------------------------

    private I18n i18n;

    public void setI18n( I18n i18n )
    {
        this.i18n = i18n;
    }

    // -------------------------------------------------------------------------
    // Action Implementation
    // -------------------------------------------------------------------------

    @SuppressWarnings("unchecked")
    public String execute()
    {
        gatewayId = transportService.getDefaultGateway();

        if ( gatewayId == null || gatewayId.trim().length() == 0 )
        {
            message = i18n.getString( "please_select_a_gateway_type_to_send_sms" );

            return ERROR;
        }

        if ( smsMessage == null || smsMessage.trim().length() == 0 )
        {
            message = i18n.getString( "no_message" );

            return ERROR;
        }

        User currentUser = currentUserService.getCurrentUser();

        Set<User> recipientsList = new HashSet<User>();

        if ( sendTarget != null && sendTarget.equals( "phone" ) )
        {
            try
            {
                ObjectMapper mapper = new ObjectMapper().setVisibility( JsonMethod.FIELD, Visibility.ANY );
                mapper.configure( DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false );
                recipients = mapper.readValue( recipients.iterator().next(), Set.class );

                for ( String each : recipients )
                {
                    User user = new User();
                    user.setPhoneNumber( each );
                    recipientsList.add( user );
                }
            }
            catch ( JsonParseException e )
            {
                e.printStackTrace();
            }
            catch ( JsonMappingException e )
            {
                e.printStackTrace();
            }
            catch ( IOException e )
            {
                e.printStackTrace();
            }
            //message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, true, recipients, gatewayId );
            message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, recipientsList, false );

        }
        else if ( sendTarget.equals( "userGroup" ) )
        {
            UserGroup group = userGroupService.getUserGroup( userGroup );

            if ( group == null )
            {
                message = i18n.getString( "selected_user_group_is_unavailable" );

                return ERROR;
            }

            if ( group.getMembers() == null || group.getMembers().isEmpty() )
            {
                message = i18n.getString( "selected_user_group_has_no_member" );

                return ERROR;
            }

            //message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, false, group.getMembers(), gatewayId );
            message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, group.getMembers(), false );
        }
        else if ( sendTarget.equals( "user" ) )
        {
            Collection<OrganisationUnit> units = selectionTreeManager.getReloadedSelectedOrganisationUnits();

            if ( units != null && !units.isEmpty() )
            {
                //Set<User> users = new HashSet<User>();

                for ( OrganisationUnit unit : units )
                {
                    //users.addAll( unit.getUsers() );
                    recipientsList.addAll( unit.getUsers() );
                }

                //if ( users.isEmpty() )
                if ( recipientsList.isEmpty() )
                {
                    message = i18n.getString( "there_is_no_user_assigned_to_selected_units" );

                    return ERROR;
                }

                //message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, false, users, gatewayId );
                message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, recipientsList, false );
            }
        }
        else if ( sendTarget.equals( "unit" ) )
        {
            for ( OrganisationUnit unit : selectionTreeManager.getSelectedOrganisationUnits() )
            {
                if ( unit.getPhoneNumber() != null && !unit.getPhoneNumber().isEmpty() )
                {
                    //recipients.add( unit.getPhoneNumber() );
                    User user = new User();
                    user.setPhoneNumber( unit.getPhoneNumber() );
                    recipientsList.add( user );
                }
            }

            if ( recipientsList.isEmpty() )
            {
                message = i18n.getString( "selected_units_have_no_phone_number" );

                return ERROR;
            }

            //message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, true, recipients, gatewayId );
            message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, recipientsList, false );
        }
        else
        {
            Patient patient = null;
            //Set<String> phones = new HashSet<String>();

            try
            {
                ObjectMapper mapper = new ObjectMapper().setVisibility( JsonMethod.FIELD, Visibility.ANY );
                mapper.configure( DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false );

                recipients = mapper.readValue( recipients.iterator().next(), Set.class );
            }
            catch ( JsonParseException e )
            {
                e.printStackTrace();
            }
            catch ( JsonMappingException e )
            {
                e.printStackTrace();
            }
            catch ( IOException e )
            {
                e.printStackTrace();
            }

            for ( String patientId : recipients )
            {
                patient = patientService.getPatient( Integer.parseInt( patientId ) );

                if ( patient != null && patient.getPhoneNumber() != null && !patient.getPhoneNumber().isEmpty() )
                {
                    //phones.add( patient.getPhoneNumber() );
                    User user = new User();
                    user.setPhoneNumber( patient.getPhoneNumber() );
                    recipientsList.add( user );
                }
            }

            if ( recipientsList.isEmpty() )
            {
                message = i18n.getString( "selected_persons_have_no_phone_number" );

                return ERROR;
            }

            //message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, true, phones, gatewayId );
            message = messageSender.sendMessage( smsSubject, smsMessage, currentUser, recipientsList, false );
        }

        if ( message != null && !message.equals( "success" ) )
        {
            message = i18n.getString( message );

            return ERROR;
        }

        return SUCCESS;
    }
}
