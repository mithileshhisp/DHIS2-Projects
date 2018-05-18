package org.hisp.dhis.security;

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

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hisp.dhis.ivb.useractivity.UserActivity;
import org.hisp.dhis.ivb.useractivity.UserActivityService;
import org.hisp.dhis.security.intercept.LoginInterceptor;
import org.hisp.dhis.user.CurrentUserService;
//import org.hisp.dhis.user.String;
import org.hisp.dhis.user.UserCredentials;
import org.hisp.dhis.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 * Since ActionContext is not available at this point, we set a mark in the
 * session that signales that login has just occured, and that LoginInterceptor
 * should be run.
 * 
 * @author mortenoh
 */
public class DefaultAuthenticationSuccessHandler
    extends SavedRequestAwareAuthenticationSuccessHandler
{

    @Autowired
    public UserActivityService useractivityservices;

    @Autowired
    public CurrentUserService currentuserservice;

    /**
     * Default is 1 hour of inactivity, this is mostly for when we are using the
     * mobile client, since entering data can take time, and data will be lost
     * if the session times out while entering data.
     */
    public static final int DEFAULT_SESSION_TIMEOUT = 60 * 60;

    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess( HttpServletRequest request, HttpServletResponse response,
        Authentication authentication )
        throws ServletException, IOException
    {
        HttpSession session = request.getSession();

        String username = ((User) authentication.getPrincipal()).getUsername();
        
        /*
        UserActivity useractivity = new UserActivity();
        useractivity.setUser( currentuserservice.getCurrentUser() );

        useractivity.setLoginTime( new Date() );
        useractivityservices.addUserActivity( useractivity );
        */
       
        session.setAttribute( LoginInterceptor.JLI_SESSION_VARIABLE, Boolean.TRUE );
        session.setMaxInactiveInterval( DefaultAuthenticationSuccessHandler.DEFAULT_SESSION_TIMEOUT );

        UserCredentials credentials = userService.getUserCredentialsByUsername( username );

        if ( credentials != null )
        {
            credentials.updateLastLogin();
            userService.updateUserCredentials( credentials );
            
            // for add in userActivity table
            UserActivity useractivity = new UserActivity();
        	org.hisp.dhis.user.User loginActivityUser = userService.getUser( credentials.getUser().getUid() );
            useractivity.setUser( loginActivityUser );
            useractivity.setLoginTime( new Date() );
            useractivityservices.addUserActivity( useractivity );
            //System.out.println(" user - " + loginActivityUser.getUsername() );
            //System.out.println("Curren user - " + currentuserservice.getCurrentUser() );
        }

        super.onAuthenticationSuccess( request, response, authentication );
    }
}
