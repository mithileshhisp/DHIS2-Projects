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
package org.hisp.dhis.program;

import java.util.Date;
import java.util.Collection;

import org.hisp.dhis.common.GenericStore;
import org.hisp.dhis.organisationunit.OrganisationUnit;
import org.hisp.dhis.patient.Patient;

/**
 * @author Abyot Asalefew
 * @version $Id$
 */
public interface ProgramInstanceStore
    extends GenericStore<ProgramInstance>
{
    String ID = ProgramInstanceStore.class.getName();

    Collection<ProgramInstance> get( Integer status );

    Collection<ProgramInstance> get( Program program );

    Collection<ProgramInstance> get( Collection<Program> programs );

    Collection<ProgramInstance> get( Program program, Integer status );

    Collection<ProgramInstance> get( Collection<Program> programs, Integer status );

    Collection<ProgramInstance> get( Patient patient );

    Collection<ProgramInstance> get( Patient patient, Integer status );

    Collection<ProgramInstance> get( Patient patient, Program program );

    Collection<ProgramInstance> get( Patient patient, Program program, Integer status );

    Collection<ProgramInstance> get( Program program, OrganisationUnit organisationUnit );

    Collection<ProgramInstance> get( Program program, OrganisationUnit organisationUnit, int min, int max );

    Collection<ProgramInstance> get( Program program, OrganisationUnit organisationUnit, Date startDate, Date endDate );

    Collection<ProgramInstance> get( Program program, Collection<Integer> orgunitIds, Date startDate, Date endDate,
        int min, int max );

    int count( Program program, OrganisationUnit organisationUnit );
    
    int count( Program program, Collection<Integer> orgunitIds, Date startDate, Date endDate );
    
    void removeProgramEnrollment( ProgramInstance programInstance );
    
    int countByStatus( Integer status, Program program, Collection<Integer> orgunitIds, Date startDate, Date endDate );
    
    Collection<ProgramInstance> getByStatus( Integer status, Program program, Collection<Integer> orgunitIds,
        Date startDate, Date endDate );
    
    Collection<SchedulingProgramObject> getSendMesssageEvents( String dateToCompare );
}
