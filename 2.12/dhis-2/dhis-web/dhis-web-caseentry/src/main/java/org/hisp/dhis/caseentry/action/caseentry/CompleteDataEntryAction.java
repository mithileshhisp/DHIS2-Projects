/*
 * Copyright (c) 2004-2009, University of Oslo
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
package org.hisp.dhis.caseentry.action.caseentry;

import java.util.Calendar;
import java.util.Date;
import java.util.Set;

import org.hisp.dhis.patient.Patient;
import org.hisp.dhis.patient.PatientService;
import org.hisp.dhis.period.PeriodType;
import org.hisp.dhis.program.Program;
import org.hisp.dhis.program.ProgramInstance;
import org.hisp.dhis.program.ProgramInstanceService;
import org.hisp.dhis.program.ProgramStageInstance;
import org.hisp.dhis.program.ProgramStageInstanceService;
import org.hisp.dhis.user.CurrentUserService;

import com.opensymphony.xwork2.Action;

/**
 * @author Viet Nguyen
 */
public class CompleteDataEntryAction
    implements Action
{
    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    private ProgramStageInstanceService programStageInstanceService;

    public void setProgramStageInstanceService( ProgramStageInstanceService programStageInstanceService )
    {
        this.programStageInstanceService = programStageInstanceService;
    }

    private ProgramInstanceService programInstanceService;

    public void setProgramInstanceService( ProgramInstanceService programInstanceService )
    {
        this.programInstanceService = programInstanceService;
    }

    private PatientService patientService;

    public void setPatientService( PatientService patientService )
    {
        this.patientService = patientService;
    }

    private CurrentUserService currentUserService;

    public void setCurrentUserService( CurrentUserService currentUserService )
    {
        this.currentUserService = currentUserService;
    }

    // -------------------------------------------------------------------------
    // Input / Output
    // -------------------------------------------------------------------------

    private Integer programStageId;

    public Integer getProgramStageId()
    {
        return programStageId;
    }

    public void setProgramStageId( Integer programStageId )
    {
        this.programStageId = programStageId;
    }

    public Integer programStageInstanceId;

    public Integer getProgramStageInstanceId()
    {
        return programStageInstanceId;
    }

    public void setProgramStageInstanceId( Integer programStageInstanceId )
    {
        this.programStageInstanceId = programStageInstanceId;
    }

    // -------------------------------------------------------------------------
    // Implementation Action
    // -------------------------------------------------------------------------

    public String execute()
        throws Exception
    {
        if ( programStageInstanceId == null )
        {
            return INPUT;
        }

        ProgramStageInstance programStageInstance = programStageInstanceService
            .getProgramStageInstance( programStageInstanceId );

        programStageInstance.setCompleted( true );

        Calendar today = Calendar.getInstance();
        PeriodType.clearTimeOfDay( today );
        Date date = today.getTime();

        programStageInstance.setCompletedDate( date );
        programStageInstance.setCompletedUser( currentUserService.getCurrentUsername() );

        programStageInstanceService.updateProgramStageInstance( programStageInstance );

        // ----------------------------------------------------------------------
        // Check Completed status for all of ProgramStageInstance of
        // ProgramInstance
        // ----------------------------------------------------------------------

        if ( !programStageInstance.getProgramInstance().getProgram().getType()
            .equals( Program.SINGLE_EVENT_WITHOUT_REGISTRATION ) )
        {
            ProgramInstance programInstance = programStageInstance.getProgramInstance();

            Set<ProgramStageInstance> stageInstances = programInstance.getProgramStageInstances();

            for ( ProgramStageInstance stageInstance : stageInstances )
            {
                if ( !stageInstance.isCompleted() || stageInstance.getProgramStage().getIrregular() )
                {
                    return SUCCESS;
                }
            }

            programInstance.setStatus( ProgramInstance.STATUS_COMPLETED );
            programInstance.setEndDate( new Date() );

            programInstanceService.updateProgramInstance( programInstance );

            Program program = programInstance.getProgram();
            if ( !program.getOnlyEnrollOnce() )
            {
                Patient patient = programInstance.getPatient();
                patient.getPrograms().remove( program );
                patientService.updatePatient( patient );
            }
        }

        return "programcompleted";
    }
}
