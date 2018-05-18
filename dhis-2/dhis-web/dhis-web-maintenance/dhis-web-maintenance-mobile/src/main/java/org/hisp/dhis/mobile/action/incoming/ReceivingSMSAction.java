package org.hisp.dhis.mobile.action.incoming;

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
import java.util.List;
import org.hisp.dhis.i18n.I18n;
import org.hisp.dhis.sms.SmsConfigurationManager;
import org.hisp.dhis.sms.config.ModemGatewayConfig;
import org.hisp.dhis.sms.incoming.IncomingSms;
import org.hisp.dhis.sms.incoming.IncomingSmsService;
import org.hisp.dhis.sms.incoming.SmsMessageStatus;
import org.springframework.beans.factory.annotation.Autowired;
import com.opensymphony.xwork2.Action;

/**
 * @author Nguyen Kim Lai
 */
public class ReceivingSMSAction
    implements Action
{
    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    private IncomingSmsService incomingSmsService;

    public void setIncomingSmsService( IncomingSmsService incomingSmsService )
    {
        this.incomingSmsService = incomingSmsService;
    }

    private I18n i18n;

    public void setI18n( I18n i18n )
    {
        this.i18n = i18n;
    }

    @Autowired
    private SmsConfigurationManager smsConfigurationManager;

    // -------------------------------------------------------------------------
    // Input & Output
    // -------------------------------------------------------------------------

    private List<IncomingSms> listIncomingSms = new ArrayList<IncomingSms>();

    public List<IncomingSms> getListIncomingSms()
    {
        return listIncomingSms;
    }

    private String message;

    public String getMessage()
    {
        return message;
    }

    private Integer pollingInterval;

    public Integer getPollingInterval()
    {
        return pollingInterval;
    }

    private String smsStatus;

    public String getSmsStatus()
    {
        return smsStatus;
    }

    public void setSmsStatus( String smsStatus )
    {
        this.smsStatus = smsStatus;
    }

    // -------------------------------------------------------------------------
    // Action Implementation
    // -------------------------------------------------------------------------
    @Override
    public String execute()
        throws Exception
    {
        ModemGatewayConfig gatewayConfig = (ModemGatewayConfig) smsConfigurationManager
            .checkInstanceOfGateway( ModemGatewayConfig.class );

        if ( gatewayConfig != null )
        {
            pollingInterval = gatewayConfig.getPollingInterval() * 1000;
        }
        else
        {
            pollingInterval = 4000;
        }
        listIncomingSms = incomingSmsService.listAllMessageFromModem();

        if ( listIncomingSms.size() > 0 )
        {
            for ( IncomingSms each : listIncomingSms )
            {
                incomingSmsService.save( each );
            }

            message = i18n.getString( "new_message" );

            incomingSmsService.deleteAllFromModem();
        }

        if ( smsStatus == null || smsStatus.trim().equals( "" ) )
        {
            listIncomingSms = incomingSmsService.listAllMessage();
        }
        else
        {
            SmsMessageStatus[] statusArray = SmsMessageStatus.values();

            for ( int i = 0; i < statusArray.length; i++ )
            {
                if ( statusArray[i].toString().equalsIgnoreCase( smsStatus ) )
                {
                    listIncomingSms = new ArrayList<IncomingSms>( incomingSmsService.getSmsByStatus( statusArray[i] ) );
                    break;
                }
            }

        }

        return SUCCESS;
    }
}
