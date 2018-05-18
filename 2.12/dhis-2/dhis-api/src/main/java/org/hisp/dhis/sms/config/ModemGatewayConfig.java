package org.hisp.dhis.sms.config;

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

public class ModemGatewayConfig
    extends SmsGatewayConfig
{
    private static final long serialVersionUID = 5824899163489665038L;

    private String port;

    private int baudRate;

    private String manufacturer;

    private String model;

    private String pin;

    private String simMemLocation;
    
    private Integer pollingInterval;

    private boolean inbound;

    private boolean outbound;

    public String getPort()
    {
        return port;
    }

    public void setPort( String port )
    {
        this.port = port;
    }

    public int getBaudRate()
    {
        return baudRate;
    }

    public void setBaudRate( int baudRate )
    {
        this.baudRate = baudRate;
    }

    public String getManufacturer()
    {
        return manufacturer;
    }

    public void setManufacturer( String manufacturer )
    {
        this.manufacturer = manufacturer;
    }

    public String getModel()
    {
        return model;
    }

    public void setModel( String model )
    {
        this.model = model;
    }

    public String getPin()
    {
        return pin;
    }

    public void setPin( String pin )
    {
        this.pin = pin;
    }

    public boolean isInbound()
    {
        return inbound;
    }

    public void setInbound( boolean inbound )
    {
        this.inbound = inbound;
    }

    public boolean isOutbound()
    {
        return outbound;
    }

    public void setOutbound( boolean outbound )
    {
        this.outbound = outbound;
    }

    public String getSimMemLocation()
    {
        return simMemLocation;
    }

    public void setSimMemLocation( String simMemLocation )
    {
        this.simMemLocation = simMemLocation;
    }

    public Integer getPollingInterval()
    {
        return pollingInterval;
    }

    public void setPollingInterval( Integer pollingInterval )
    {
        this.pollingInterval = pollingInterval;
    }

}
