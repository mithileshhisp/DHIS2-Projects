package org.hisp.dhis.jdbc;

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

import org.hisp.dhis.period.Period;
import java.util.List;

/**
 * @author Lars Helge Overland
 * @version $Id: StatementBuilder.java 5715 2008-09-17 14:05:28Z larshelg $
 */
public interface StatementBuilder
{
    final String QUOTE = "'";

    //--------------------------------------------------------------------------
    // General
    //--------------------------------------------------------------------------

    /**
     * Encodes the provided SQL value.
     * 
     * @param value the value.
     * @return the SQL encoded value.
     */
    String encode( String value );
    
    /**
     * Returns statement for vacuum and analyze operations for a table. Returns
     * null if such statement is not relevant.
     * 
     * @param table the table to vacuum.
     * @return vacuum and analyze operations for a table.
     */
    String getVacuum( String table );
    
    /**
     * Returns the name of a double column type.
     * @return the name of a double column type.
     */
    String getDoubleColumnType();
    
    /**
     * Returns the value used to match a column to a regular expression.
     * @return the value used to match a column to a regular expression.
     */
    String getRegexpMatch();
    
    /**
     * Creates a SELECT statement returning the identifier of the given Period.
     * 
     * @param period the Period to use in the statement. 
     * @return a SELECT statement returning the identifier of the given Period.
     */
    String getPeriodIdentifierStatement( Period period );
    
    /**
     * Creates a create table statement for the aggregated datavalue table.
     */
    String getCreateAggregatedDataValueTable( boolean temp );

    /**
     * Creates a create table statement for the aggregated organisation unit
     * group datavalue table.
     */
    String getCreateAggregatedOrgUnitDataValueTable( boolean temp );
    
    /**
     * Creates a create table statement for the aggregated indicatorvalue table.
     */
    String getCreateAggregatedIndicatorTable( boolean temp );

    /**
     * Creates a create table statement for the aggregated organisation unit
     * group indicatorvalue table.
     */
    String getCreateAggregatedOrgUnitIndicatorTable( boolean temp );

    /**
     * Creates a create table statement for the aggregated datasetcompleteness table.
     */
    String getCreateDataSetCompletenessTable();

    /**
     * Creates a create table statement for the aggregated organisation unit
     * group datasetcompleteness table.
     */
    String getCreateOrgUnitDataSetCompletenessTable();
    
    /**
     * Creates a delete datavalue statement.
     * @return a delete datavalue statement.
     */
    String getDeleteZeroDataValues();
    
    String getMoveDataValueToDestination( int sourceId, int destinationId );

    String getSummarizeDestinationAndSourceWhereMatching( int sourceId, int destinationId );

    String getMoveFromSourceToDestination( int destDataElementId, int destCategoryOptionComboId,
        int sourceDataElementId, int sourceCategoryOptionComboId );

    String getUpdateDestination( int destDataElementId, int destCategoryOptionComboId,
        int sourceDataElementId, int sourceCategoryOptionComboId );
    
    String getStandardDeviation( int dataElementId, int categoryOptionComboId, int organisationUnitId );
    
    String getAverage( int dataElementId, int categoryOptionComboId, int organisationUnitId );
    
    String getDeflatedDataValues( int dataElementId, String dataElementName, int categoryOptionComboId,
    	String periodIds, int organisationUnitId, String organisationUnitName, int lowerBound, int upperBound );
    
    String limitRecord( int min, int max );
    
    String getAddDate( String dateField, int days );
    
    String getPatientFullName();

    String queryDataElementStructureForOrgUnit();

    String queryRawDataElementsForOrgUnitBetweenPeriods( Integer orgUnitId, List<Integer> betweenPeriodIds );
}
