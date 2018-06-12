package org.hisp.dhis.setting;

/*
 * Copyright (c) 2004-2015, University of Oslo
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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hisp.dhis.DhisSpringTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Stian Strandli
 * @author Lars Helge Overland
 * @version $Id: SystemSettingManagerTest.java 4866 2008-04-11 10:40:35Z larshelg $
 */
public class SystemSettingManagerTest
    extends DhisSpringTest
{
    @Autowired
    private SystemSettingManager systemSettingManager;

    @Test
    public void testSaveGetSystemSetting()
    {
        systemSettingManager.saveSystemSetting( "settingA", new String( "valueA" ) );
        systemSettingManager.saveSystemSetting( "settingB", new String( "valueB" ) );

        assertEquals( new String( "valueA" ), systemSettingManager.getSystemSetting( "settingA" ) );
        assertEquals( new String( "valueB" ), systemSettingManager.getSystemSetting( "settingB" ) );
    }

    @Test
    public void testGetDefaultSystemSetting()
    {
        assertEquals( new String( "valueA" ), systemSettingManager.getSystemSetting( "settingA", new String( "valueA" ) ) );
        assertEquals( new String( "valueB" ), systemSettingManager.getSystemSetting( "settingB", new String( "valueB" ) ) );
    }

    @Test
    public void testGetAllSystemSettings()
    {
        systemSettingManager.saveSystemSetting( "settingA", new String( "valueA" ) );
        systemSettingManager.saveSystemSetting( "settingB", new String( "valueB" ) );
        systemSettingManager.saveSystemSetting( "settingC", new String( "valueC" ) );
        
        List<SystemSetting> settings = systemSettingManager.getAllSystemSettings();
        
        assertNotNull( settings );
        assertEquals( 3, settings.size() );
    }

    @Test
    public void testGetSystemSettingsAsMap()
    {
        systemSettingManager.saveSystemSetting( "settingA", new String( "valueA" ) );
        systemSettingManager.saveSystemSetting( "settingB", new String( "valueB" ) );
        systemSettingManager.saveSystemSetting( "settingC", new String( "valueC" ) );

        Map<String, Serializable> settingsMap = systemSettingManager.getSystemSettingsAsMap();

        assertTrue( settingsMap.containsKey( "settingA" ) );
        assertTrue( settingsMap.containsKey( "settingB" ) );
        assertTrue( settingsMap.containsKey( "settingC" ) );
        assertEquals( "valueA", settingsMap.get( "settingA" ) );
        assertEquals( "valueB", settingsMap.get( "settingB" ) );
        assertEquals( "valueC", settingsMap.get( "settingC" ) );
    }
}
