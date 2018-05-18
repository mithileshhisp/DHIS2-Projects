package org.hisp.dhis.dataelement;

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

import org.hisp.dhis.DhisSpringTest;
import org.hisp.dhis.common.GenericIdentifiableObjectStore;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.*;
/**
 * @author Lars Helge Overland
 * @version $Id$
 */
public class DataElementCategoryOptionStoreTest
    extends DhisSpringTest
{
    @Resource(name="org.hisp.dhis.dataelement.CategoryOptionStore")
    private GenericIdentifiableObjectStore<DataElementCategoryOption> categoryOptionStore;
    
    private DataElementCategoryOption categoryOptionA;
    private DataElementCategoryOption categoryOptionB;
    private DataElementCategoryOption categoryOptionC;

   
    // -------------------------------------------------------------------------
    // Tests
    // -------------------------------------------------------------------------

    @Test
    public void testAddGet()
    {
        categoryOptionA = new DataElementCategoryOption( "CategoryOptionA" );
        categoryOptionB = new DataElementCategoryOption( "CategoryOptionB" );
        categoryOptionC = new DataElementCategoryOption( "CategoryOptionC" );
        
        categoryOptionStore.save( categoryOptionA );
        int idA = categoryOptionA.getId();
        categoryOptionStore.save( categoryOptionB );
        int idB = categoryOptionB.getId();
        categoryOptionStore.save( categoryOptionC );
        int idC = categoryOptionC.getId();

        assertEquals( categoryOptionA, categoryOptionStore.get( idA ) );
        assertEquals( categoryOptionB, categoryOptionStore.get( idB ) );
        assertEquals( categoryOptionC, categoryOptionStore.get( idC ) );
    }

    @Test
    public void testDelete()
    {
        categoryOptionA = new DataElementCategoryOption( "CategoryOptionA" );
        categoryOptionB = new DataElementCategoryOption( "CategoryOptionB" );
        categoryOptionC = new DataElementCategoryOption( "CategoryOptionC" );

        categoryOptionStore.save( categoryOptionA );
        int idA = categoryOptionA.getId();
        categoryOptionStore.save( categoryOptionB );
        int idB = categoryOptionB.getId();
        categoryOptionStore.save( categoryOptionC );
        int idC = categoryOptionC.getId();
        
        assertNotNull( categoryOptionStore.get( idA ) );
        assertNotNull( categoryOptionStore.get( idB ) );
        assertNotNull( categoryOptionStore.get( idC ) );
        
        categoryOptionStore.delete( categoryOptionA );

        assertNull( categoryOptionStore.get( idA ) );
        assertNotNull( categoryOptionStore.get( idB ) );
        assertNotNull( categoryOptionStore.get( idC ) );

        categoryOptionStore.delete( categoryOptionB );

        assertNull( categoryOptionStore.get( idA ) );
        assertNull( categoryOptionStore.get( idB ) );
        assertNotNull( categoryOptionStore.get( idC ) );
    }

    @Test
    public void testGetAll()
    {
        categoryOptionA = new DataElementCategoryOption( "CategoryOptionA" );
        categoryOptionB = new DataElementCategoryOption( "CategoryOptionB" );
        categoryOptionC = new DataElementCategoryOption( "CategoryOptionC" );

        categoryOptionStore.save( categoryOptionA );
        categoryOptionStore.save( categoryOptionB );
        categoryOptionStore.save( categoryOptionC );
        
        List<DataElementCategoryOption> categoryOptions = categoryOptionStore.getAll();
        
        assertEquals( 4, categoryOptions.size() ); // Including default
        assertTrue( categoryOptions.contains( categoryOptionA ) );
        assertTrue( categoryOptions.contains( categoryOptionB ) );
        assertTrue( categoryOptions.contains( categoryOptionC ) );        
    }
}
