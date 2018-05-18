package org.hisp.dhis.datamart.crosstab;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.RandomStringUtils;
import org.hisp.dhis.DhisTest;
import org.hisp.dhis.dataelement.DataElementOperand;
import org.hisp.dhis.datamart.crosstab.jdbc.CrossTabStore;
import org.junit.Test;

public class CrossTabStoreTest
    extends DhisTest
{
    private CrossTabStore crossTabStore;
    
    private List<DataElementOperand> operands;
    
    private String key = RandomStringUtils.randomAlphanumeric( 8 );

    // -------------------------------------------------------------------------
    // Fixture
    // -------------------------------------------------------------------------

    @Override
    public void setUpTest()
    {
        crossTabStore = (CrossTabStore) getBean( CrossTabStore.ID );
        
        operands = new ArrayList<DataElementOperand>();
        operands.add( new DataElementOperand( "a", "a" ) );
        operands.add( new DataElementOperand( "a", "b" ) );
        operands.add( new DataElementOperand( "b", "a" ) );
        operands.add( new DataElementOperand( "b", "b" ) );        
    }

    @Override
    public boolean emptyDatabaseAfterTest()
    {
        return true;
    }

    // -------------------------------------------------------------------------
    // Tests
    // -------------------------------------------------------------------------
    
    @Test
    public void testDropCrossTabTable()
    {
        crossTabStore.createCrossTabTable( operands, key );
        
        crossTabStore.dropCrossTabTable( key );
    }
    
    @Test
    public void testDropAggregatedDataCache()
    {
        crossTabStore.createAggregatedDataCache( operands, key );
        
        crossTabStore.dropAggregatedDataCache( key );
    }
}
