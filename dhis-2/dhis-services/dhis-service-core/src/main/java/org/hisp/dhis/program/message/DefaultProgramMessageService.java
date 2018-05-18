package org.hisp.dhis.program.message;

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

import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hisp.dhis.common.IdentifiableObjectManager;
import org.hisp.dhis.common.IllegalQueryException;
import org.hisp.dhis.message.MessageSender;
import org.hisp.dhis.organisationunit.OrganisationUnitService;
import org.hisp.dhis.program.Program;
import org.hisp.dhis.program.ProgramInstance;
import org.hisp.dhis.program.ProgramInstanceService;
import org.hisp.dhis.program.ProgramService;
import org.hisp.dhis.program.ProgramStageInstance;
import org.hisp.dhis.program.ProgramStageInstanceService;
import org.hisp.dhis.sms.outbound.GatewayResponse;
import org.hisp.dhis.trackedentity.TrackedEntityInstanceService;
import org.hisp.dhis.user.CurrentUserService;
import org.hisp.dhis.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Zubair <rajazubair.asghar@gmail.com>
 */

@Transactional
public class DefaultProgramMessageService
    implements ProgramMessageService
{
    private static final Log log = LogFactory.getLog( DefaultProgramMessageService.class );

    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    @Autowired
    protected IdentifiableObjectManager manager;

    @Autowired
    private ProgramMessageStore programMessageStore;

    @Autowired
    private OrganisationUnitService organisationUnitService;

    @Autowired
    private TrackedEntityInstanceService trackedEntityInstanceService;

    @Autowired
    private ProgramInstanceService programInstanceService;

    @Autowired
    private ProgramService programService;

    @Autowired
    private ProgramStageInstanceService programStageInstanceService;

    @Autowired
    private List<MessageSender> messageSenders;

    @Autowired
    private CurrentUserService currentUserService;

    @Autowired
    private List<DeliveryChannelStrategy> strategies;

    // -------------------------------------------------------------------------
    // Implementation methods
    // -------------------------------------------------------------------------

    @Override
    public ProgramMessageQueryParams getFromUrl( Set<String> ou, String piUid, String psiUid,
        ProgramMessageStatus messageStatus, Integer page, Integer pageSize, Date afterDate, Date beforeDate )
    {
        ProgramMessageQueryParams params = new ProgramMessageQueryParams();

        if ( piUid != null )
        {
            if ( manager.exists( ProgramInstance.class, piUid ) )
            {
                params.setProgramInstance( manager.get( ProgramInstance.class, piUid ) );
            }
            else
            {
                throw new IllegalQueryException( "ProgramInstance does not exist." );
            }
        }

        if ( psiUid != null )
        {
            if ( manager.exists( ProgramStageInstance.class, psiUid ) )
            {
                params.setProgramStageInstance( manager.get( ProgramStageInstance.class, psiUid ) );
            }
            else
            {
                throw new IllegalQueryException( "ProgramStageInstance does not exist." );
            }
        }

        params.setOrganisationUnit( ou );
        params.setMessageStatus( messageStatus );
        params.setPage( page );
        params.setPageSize( pageSize );
        params.setAfterDate( afterDate );
        params.setBeforeDate( beforeDate );

        return params;
    }

    @Override
    public boolean exists( String uid )
    {
        return programMessageStore.exists( uid );
    }

    @Override
    public ProgramMessage getProgramMessage( int id )
    {
        return programMessageStore.get( id );
    }

    @Override
    public ProgramMessage getProgramMessage( String uid )
    {
        return programMessageStore.getByUid( uid );
    }

    @Override
    public List<ProgramMessage> getAllProgramMessages()
    {
        return programMessageStore.getAll();
    }

    @Override
    public List<ProgramMessage> getProgramMessages( ProgramMessageQueryParams params )
    {
        hasAccess( params, currentUserService.getCurrentUser() );
        validateQueryParameters( params );

        return programMessageStore.getProgramMessages( params );
    }

    @Override
    public int saveProgramMessage( ProgramMessage programMessage )
    {
        return programMessageStore.save( programMessage );
    }

    @Override
    public void updateProgramMessage( ProgramMessage programMessage )
    {
        programMessageStore.update( programMessage );
    }

    @Override
    public void deleteProgramMessage( ProgramMessage programMessage )
    {
        programMessageStore.delete( programMessage );
    }

    @Override
    public String sendMessage( ProgramMessage programMessage )
    {
        String result = "";

        ProgramMessage tmp = fillAttributesBasedOnStrategy( programMessage );

        Map<DeliveryChannel, Set<String>> to = fillRecipients( tmp );

        for ( MessageSender messageSender : messageSenders )
        {
            if ( messageSender.accept( programMessage.getDeliveryChannels() ) )
            {
                if ( messageSender.isServiceReady() )
                {
                    log.info( "Invoking " + messageSender.getClass().getSimpleName() );

                    result = messageSender.sendMessage( tmp.getSubject(), tmp.getText(),
                        to.get( messageSender.getDeliveryChannel() ) );
                }
                else
                {
                    log.error( "No gateway configuration found." );

                    return GatewayResponse.RESULT_CODE_503.getResponseMessage();
                }
            }
        }

        if ( programMessage.getStoreCopy() )
        {
            programMessage.setProgramInstance( getProgramInstance( programMessage ) );
            programMessage.setProgramStageInstance( getProgramStageInstance( programMessage ) );
            programMessage.setProcessedDate( new Date() );
            programMessage.setMessageStatus(
                result.equals( "success" ) ? ProgramMessageStatus.SENT : ProgramMessageStatus.FAILED );

            saveProgramMessage( programMessage );
        }

        return result;
    }

    @Override
    public void hasAccess( ProgramMessageQueryParams params, User user )
    {
        ProgramInstance programInstance = null;

        Set<Program> programs = new HashSet<>();

        if ( params.hasProgramInstance() )
        {
            programInstance = params.getProgramInstrance();
        }

        if ( params.hasProgramStageInstance() )
        {
            programInstance = params.getProgramStageInstance().getProgramInstance();
        }

        programs = programService.getUserPrograms( user );

        if ( user != null && !programs.contains( programInstance.getProgram() ) )
        {
            throw new IllegalQueryException( "User does not have access to the required program." );
        }
    }

    @Override
    public void validateQueryParameters( ProgramMessageQueryParams params )
    {
        String violation = null;

        if ( !params.hasProgramInstance() && !params.hasProgramStageInstance() )
        {
            violation = "ProgramInstance or ProgramStageInstance must be provided.";
        }

        if ( violation != null )
        {
            log.warn( "Parameter validation failed: " + violation );

            throw new IllegalQueryException( violation );
        }
    }

    @Override
    public void validatePayload( ProgramMessage message )
    {
        String violation = null;

        ProgramMessageRecipients recipients = message.getRecipients();

        if ( message.getText() == null )
        {
            violation = "Message content must be provided";
        }

        if ( message.getDeliveryChannels() == null || message.getDeliveryChannels().isEmpty() )
        {
            violation = "Delivery Channel must be provided";
        }

        if ( message.getProgramInstance() == null && message.getProgramStageInstance() == null )
        {
            violation = "ProgramInstance or ProgramStageInstance must be provided";
        }

        if ( recipients.getTrackedEntityInstance() != null && trackedEntityInstanceService
            .getTrackedEntityInstance( recipients.getTrackedEntityInstance().getUid() ) == null )
        {
            violation = "TrackedEntity does not exist";
        }

        if ( recipients.getOrganisationUnit() != null
            && organisationUnitService.getOrganisationUnit( recipients.getOrganisationUnit().getUid() ) == null )
        {
            violation = "OrganisationUnit does not exist";
        }

        if ( violation != null )
        {
            log.info( "Message validation failed: " + violation );

            throw new IllegalQueryException( violation );
            
        }
    }

    // ---------------------------------------------------------------------
    // Supportive Methods
    // ---------------------------------------------------------------------

    private ProgramInstance getProgramInstance( ProgramMessage programMessage )
    {
        if ( programMessage.getProgramInstance() != null )
        {
            return programInstanceService.getProgramInstance( programMessage.getProgramInstance().getUid() );
        }

        return null;
    }

    private ProgramStageInstance getProgramStageInstance( ProgramMessage programMessage )
    {
        if ( programMessage.getProgramStageInstance() != null )
        {
            return programStageInstanceService
                .getProgramStageInstance( programMessage.getProgramStageInstance().getUid() );
        }

        return null;
    }

    private ProgramMessage fillAttributesBasedOnStrategy( ProgramMessage message )
    {
        Set<DeliveryChannel> channels = message.getDeliveryChannels();

        for ( DeliveryChannel channel : channels )
        {
            for ( DeliveryChannelStrategy strategy : strategies )
            {
                if ( strategy.getDeliveryChannel().equals( channel ) )
                {
                    strategy.fillAttributes( message );
                }
            }
        }

        return message;
    }

    private Map<DeliveryChannel, Set<String>> fillRecipients( ProgramMessage tmp )
    {
        Map<DeliveryChannel, Set<String>> mapper = new HashMap<>();

        mapper.put( DeliveryChannel.EMAIL, tmp.getRecipients().getEmailAddresses() );
        mapper.put( DeliveryChannel.SMS, tmp.getRecipients().getPhoneNumbers() );
        return mapper;
    }
}