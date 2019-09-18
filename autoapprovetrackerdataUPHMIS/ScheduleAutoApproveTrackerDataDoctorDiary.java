package org.hisp.dhis.autoapprovetrackerdata;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hisp.dhis.dataelement.DataElement;
import org.hisp.dhis.dataelement.DataElementService;
import org.hisp.dhis.email.EmailService;
import org.hisp.dhis.outboundmessage.OutboundMessageResponse;
import org.hisp.dhis.period.Period;
import org.hisp.dhis.program.ProgramStageInstance;
import org.hisp.dhis.program.ProgramStageInstanceService;
import org.hisp.dhis.scheduling.AbstractJob;
import org.hisp.dhis.scheduling.JobConfiguration;
import org.hisp.dhis.scheduling.JobType;
import org.hisp.dhis.setting.SettingKey;
import org.hisp.dhis.setting.SystemSettingManager;
import org.hisp.dhis.trackedentity.TrackedEntityInstanceService;
import org.hisp.dhis.trackedentitydatavalue.TrackedEntityDataValue;
import org.hisp.dhis.trackedentitydatavalue.TrackedEntityDataValueService;
import org.hisp.dhis.user.CurrentUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

/**
 * @author Mithilesh Kumar Thakur
 */
public class ScheduleAutoApproveTrackerDataDoctorDiary extends AbstractJob
{
    private static final Log log = LogFactory.getLog( ScheduleAutoApproveTrackerData.class );

    private final static int   UPHMIS_DOCTORS_DIARY_PROGRAM_ID = 73337033;
    private final static int   TEIA_USER_NAME_ID = 76755184;
    
    private final static int   CURRENT_STATUS_DOC_DIARY_DATAELEMENT_ID = 88199674;
    private final static String   UPHMIS_DOCTORS_DIARY_USER_GROUP_ID = "110948738";
    private final static String   UPHMIS_DOCTORS_DIARY_APPROVAL_USER_GROUP_ID = "110948739";
    
    
    private static final String KEY_TASK = "scheduleAutoApproveTrackerDataTaskDoctorDiary";

    // -------------------------------------------------------------------------
    // Dependencies
    // -------------------------------------------------------------------------

    @Autowired
    private SystemSettingManager systemSettingManager;
    
    @Autowired
    private ProgramStageInstanceService programStageInstanceService;

    @Autowired
    private CurrentUserService currentUserService;
    
    @Autowired
    private TrackedEntityDataValueService trackedEntityDataValueService;
    
    @Autowired
    private TrackedEntityInstanceService trackedEntityInstanceService;
    
    @Autowired
    private DataElementService dataElementService;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    @Autowired
    private EmailService emailService;
    
    private List<String> userEMailList = new ArrayList<String>();
    private List<String> userMobileNumberList = new ArrayList<String>();
    private List<String> approvalEMailList = new ArrayList<String>();
    private List<String> approvalMobileNumberList = new ArrayList<String>();
    
    private List<String> autoApprovedEMailList = new ArrayList<String>();
    
    private SimpleDateFormat simpleDateFormat;

    private String complateDate = "";

    private Period currentperiod;

    private String trackedEntityInstanceIds = "";

    String currentDate = "";

    String currentMonth = "";

    String currentYear = "";

    String todayDate = "";
    
    private String psiIdsByCommas = "-1";
    
    // -------------------------------------------------------------------------
    // Implementation
    // -------------------------------------------------------------------------

    
    
    @Override
    public JobType getJobType()
    {
        return JobType.AUTO_APPROVE_TRACKER_DATA_DOCTOR_DAIRY;
    }

    @Override
    public void execute( JobConfiguration jobConfiguration ) throws AddressException, MessagingException, MalformedURLException, IOException
    {
        System.out.println("INFO: scheduler Auto Approve Tracker Data Doctor Diary job has started at : " + new Date() +" -- " + JobType.AUTO_APPROVE_TRACKER_DATA_DOCTOR_DAIRY );
        boolean isAutoApproveTrackerDataEnabled = (Boolean) systemSettingManager.getSystemSetting( SettingKey.AUTO_APPROVE_TRACKER_DATA_DOCTOR_DAIRY );
        System.out.println( "isAutoApproveTrackerDataEnabled -- " + isAutoApproveTrackerDataEnabled );
        
        if ( !isAutoApproveTrackerDataEnabled )
        {
            log.info( String.format( "%s aborted. Auto Approve Job Doctor Diary  are disabled", KEY_TASK ) );

            return;
        }

        log.info( String.format( "%s has started", KEY_TASK ) );
          
        simpleDateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
        
        Date date = new Date();
        
        todayDate = simpleDateFormat.format( date );
        currentDate = simpleDateFormat.format( date ).split( "-" )[2];
        currentMonth = simpleDateFormat.format( date ).split( "-" )[1];
        currentYear = simpleDateFormat.format( date ).split( "-" )[0];
 
        if ( currentDate.equalsIgnoreCase( "02" ) || currentDate.equalsIgnoreCase( "08" ))
        {
            String subject = "Doctor Diary Reminder";
            String dataEntryUserMessage = "Previous month will get disabled for data entry on 10th.";
            String approvalUserMessage = "Previous month will be frozen and auto approved on 21st of the month";
            userEMailList = new ArrayList<String>( getUserEmailList( UPHMIS_DOCTORS_DIARY_USER_GROUP_ID ) );
            approvalEMailList = new ArrayList<String>( getUserEmailList( UPHMIS_DOCTORS_DIARY_APPROVAL_USER_GROUP_ID ) );
            
            userMobileNumberList = new ArrayList<String>( getUserMobleNoList( UPHMIS_DOCTORS_DIARY_USER_GROUP_ID ) );
            approvalMobileNumberList = new ArrayList<String>( getUserMobleNoList( UPHMIS_DOCTORS_DIARY_APPROVAL_USER_GROUP_ID )  );
            
            sendEmailOneByOne( subject, userEMailList, dataEntryUserMessage );
            sendEmailOneByOne( subject, approvalEMailList, approvalUserMessage );
            
            sendSMS( dataEntryUserMessage, userMobileNumberList );
            sendSMS( approvalUserMessage, approvalMobileNumberList );
        }
        
        if( currentDate.equalsIgnoreCase( "15" ) || currentDate.equalsIgnoreCase( "18" ) )
        {
            String subject = "Doctor Diary Reminder";
            String approvalUserMessage = "Previous month will be frozen and auto approved on 21st of the month";
            approvalEMailList = new ArrayList<String>( getUserEmailList( UPHMIS_DOCTORS_DIARY_APPROVAL_USER_GROUP_ID ) );
            
            approvalMobileNumberList = new ArrayList<String>( getUserMobleNoList( UPHMIS_DOCTORS_DIARY_APPROVAL_USER_GROUP_ID )  );
            
            sendEmailOneByOne( subject, approvalEMailList, approvalUserMessage );
            sendSMS( approvalUserMessage, approvalMobileNumberList );
        }
        
        /*
        Set<String> recipients = new HashSet<>();
        recipients.add( "mithilesh.hisp@gmail.com" );
        recipients.add( "mithilesh.thakur@hispindia.org" );
        recipients.add( "harsh.atal@hispindia.org" );
         
        String finalMessage = "";
        finalMessage = "Dear User,";
        finalMessage  += "\n\n Your data has been Auto-Approved for " + "2019-01-01" + ".";
        finalMessage  += "\n Thank you for using UPHMIS Doctor Dairy application." ;
        finalMessage  += "\n\n Thanks & Regards, ";
        finalMessage  += "\n UPHMIS Doctor Dairy Team ";
        
        OutboundMessageResponse emailResponse = emailService.sendEmail( "Doctor Dairy Data Approval Status", finalMessage, recipients );
        */
        
        if( currentDate.equalsIgnoreCase( "21" ) )
        {
            autoApproveTrackedEntityDataValue();
            
            //System.out.println( "psiIdsByCommas -- " + psiIdsByCommas );
            //autoApprovedEMailList = new ArrayList<String>( getUserEmailListForAutoApproval( psiIdsByCommas ));
           
            
            //System.out.println( "autoApprovedEMailList -- " + autoApprovedEMailList.size() );
            if( autoApprovedEMailList != null && autoApprovedEMailList.size() > 0 )
            {
                for( String eventDateAndEmail : autoApprovedEMailList )
                {
                    String eventDate = eventDateAndEmail.split( ":" )[0];
                    String email = eventDateAndEmail.split( ":" )[1];
                    String subject = "Doctor Dairy Data Approval Status";
                    
                    //System.out.println( " 1 eventDate -- " + eventDate + " email " + email );
                    if( email != null && !email.equalsIgnoreCase( "" ) && isValidEmail( email ) )
                    {
                        //System.out.println( " 2 eventDate -- " + eventDate + " email " + email );
                        sendEmailAutoApprove( subject, email, eventDate );
                    }
                }
            }
        }
        
        System.out.println("INFO: Scheduler job has ended at : " + new Date() );
             
    }

    //--------------------------------------------------------------------------------
    // Get ProgramStageInstanceIds
    //--------------------------------------------------------------------------------
    // for doctor diary
    public List<String> programStageInstanceIdsAndDataValue()
    {
        List<String> programStageInstanceIdsAndDataValue = new ArrayList<>();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime( new Date() );
        calendar.set( Calendar.MONTH, (calendar.get( Calendar.MONTH ) - 1 ) );
        Date perivousMonth = calendar.getTime();
        
        Calendar lastDatePreviousMonth = Calendar.getInstance();
        lastDatePreviousMonth.setTime( perivousMonth );
        lastDatePreviousMonth.set( Calendar.DAY_OF_MONTH, calendar.getActualMaximum( Calendar.DAY_OF_MONTH ) );
        Date lastDatePreviousMonthDate = lastDatePreviousMonth.getTime();
        
        String endDatePreviousMonth = simpleDateFormat.format( lastDatePreviousMonthDate );
        
        String startDatePreviousMonth = simpleDateFormat.format( lastDatePreviousMonthDate ).split( "-" )[0] + "-" + simpleDateFormat.format( lastDatePreviousMonthDate ).split( "-" )[1] + "-01";

        System.out.println(startDatePreviousMonth +  "  = " + endDatePreviousMonth );
        
        //SELECT trackedentityinstanceid, value FROM trackedentityattributevalue WHERE CURRENT_DATE > value::date and trackedentityattributeid = 1085;
        try
        {
            String query = "SELECT psi.programstageinstanceid, psi.executiondate::date, pi.trackedentityinstanceid, " +
                           "teav.value,us.username,usinfo.email from programstageinstance psi  " +
                           "INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid " +
                           "LEFT JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid " +
                           "LEFT JOIN users us ON teav.value = us.username " +
                           "LEFT JOIN userinfo usinfo ON usinfo.userinfoid = us.userid " +
                           "WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( "+ UPHMIS_DOCTORS_DIARY_PROGRAM_ID +" ) ) AND " +
                           "psi.executiondate::date BETWEEN '" + startDatePreviousMonth + "' AND '" + endDatePreviousMonth + "'  AND psi.status = 'COMPLETED' " +
                           "and teav.trackedentityattributeid  = " + TEIA_USER_NAME_ID + " order by psi.completeddate desc; ";
             
            
            /*
            SELECT psi.programstageinstanceid, psi.executiondate::date, pi.trackedentityinstanceid, teav.value from programstageinstance psi
            INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
            INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
            WHERE psi.programstageid in 
            ( SELECT programstageid from programstage where  programid in ( 73337033 ) ) 
            AND psi.executiondate::date BETWEEN '2019-08-01' AND '2019-08-31'  
            AND psi.status = 'COMPLETED' and teav.trackedentityattributeid  = 76755184 order by psi.completeddate desc
                        
            String query = "SELECT psi.programstageinstanceid, psi.completeddate from programstageinstance psi  " +
                "WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( "+ UPHMIS_DOCTORS_DIARY_PROGRAM_ID +" ) ) AND " +
                "psi.completeddate <= CURRENT_DATE - interval '30 day' AND psi.status = 'COMPLETED' order by psi.completeddate desc; ";
            
            String query = "SELECT psi.programstageinstanceid, psi.completeddate from programstageinstance psi  " +
                            "WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( "+ UPHMIS_DOCTORS_DIARY_PROGRAM_ID +" ) ) AND " +
                            "psi.completeddate::date BETWEEN '" + startDatePreviousMonth + "' AND '" + endDatePreviousMonth + "'  AND psi.status = 'COMPLETED' order by psi.completeddate desc; ";
            */
            
            System.out.println( "query = " + query );
            
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );
            
            //System.out.println( "-- RS " + rs.toString() + " -- " + rs.isFirst() + " -- " + rs.next() ) ;
            
            while ( rs.next() )
            {
                Integer psiId = rs.getInt( 1 );
                String eventDate = rs.getString( 2 );
                Integer teiId = rs.getInt( 3 );
                String teav = rs.getString( 4 );
                String userName = rs.getString( 5 );
                String userEmail = rs.getString( 6 );
                //System.out.println( i + " -- psi Id added " + psiId ) ;
                if ( psiId != null )
                {
                    ProgramStageInstance psi = programStageInstanceService.getProgramStageInstance( psiId );
                    DataElement de = dataElementService.getDataElement( CURRENT_STATUS_DOC_DIARY_DATAELEMENT_ID );
                    if( psi != null && de != null)
                    {
                        TrackedEntityDataValue teDataValue = trackedEntityDataValueService.getTrackedEntityDataValue( psi, de );
                        if( teDataValue != null && teDataValue.getValue().equalsIgnoreCase( "Pending1" ))
                        {
                            programStageInstanceIdsAndDataValue.add( psi.getId() + ":" + "Auto-Approved" + ":" + eventDate + ":" + userEmail );
                        }
                        else if( teDataValue != null && teDataValue.getValue().equalsIgnoreCase( "Pending2" ) )
                        {
                            programStageInstanceIdsAndDataValue.add( psi.getId() + ":" + "Auto-Approved" + ":" + eventDate + ":" + userEmail  );
                        }
                    }
                }
            }

            return programStageInstanceIdsAndDataValue;
        }
        catch ( Exception e )
        {
            throw new RuntimeException( "Illegal ProgramStage ids", e );
        }
    }    
    
    
    // user E-mail
    public List<String> getUserEmailList( String userGroupIds )
    {
        List<String> emailList = new ArrayList<>();
        try
        {
            String query = "SELECT us.username,usinfo.surname, usinfo.firstname, usinfo.email, usinfo.phonenumber from users us  " +
                            "INNER JOIN userinfo usinfo ON usinfo.userinfoid = us.userid " +
                            "INNER JOIN usergroupmembers usgm ON usgm.userid = us.userid " +
                            "WHERE usgm.usergroupid in ( "+ userGroupIds +" ); ";
              
            //System.out.println( "query = " + query );
            
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );
            
            //System.out.println( "-- RS " + rs.toString() + " -- " + rs.isFirst() + " -- " + rs.next() ) ;
            
            while ( rs.next() )
            {
                String eMail = rs.getString( 4 );
                if( eMail != null && isValidEmail( eMail ) )
                {
                    emailList.add( eMail );
                }
            }
            return emailList;
        }
        
        catch ( Exception e )
        {
            throw new RuntimeException( "Illegal UserGroupId ids", e );
        }
    }        
    
    // user Mobile no
    public List<String> getUserMobleNoList( String userGroupIds )
    {
        List<String> mobileNumberList = new ArrayList<>();
        try
        {
            String query = "SELECT us.username,usinfo.surname, usinfo.firstname, usinfo.email, usinfo.phonenumber from users us  " +
                            "INNER JOIN userinfo usinfo ON usinfo.userinfoid = us.userid " +
                            "INNER JOIN usergroupmembers usgm ON usgm.userid = us.userid " +
                            "WHERE usgm.usergroupid in ( "+ userGroupIds +" ); ";
              
            //System.out.println( "query = " + query );
            
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );
            
            //System.out.println( "-- RS " + rs.toString() + " -- " + rs.isFirst() + " -- " + rs.next() ) ;
            
            while ( rs.next() )
            {
                String mobileNumber = rs.getString( 5 );
                
                if( mobileNumber != null && mobileNumber.length() == 10 )
                {
                    mobileNumberList.add( mobileNumber );
                }
            }
            return mobileNumberList;
        }
        catch ( Exception e )
        {
            throw new RuntimeException( "Illegal UserGroupId ids", e );
        }
    }        
    
    // e-mail validation
    public boolean isValidEmail(String email) 
    { 
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
                            "[a-zA-Z0-9_+&*-]+)*@" + 
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
                            "A-Z]{2,7}$"; 
                              
        Pattern pat = Pattern.compile(emailRegex); 
        if (email == null)
        {
            return false; 
        }
            
        return pat.matcher(email).matches(); 
    }
    
    // Send E-mail
    public static void sendEmail( String subject, List<String> toEmailList, String message )
        throws AddressException, MessagingException
    {
        // sets SMTP server properties
        System.out.println( "inside method" );
        
        /*
        String host = "smtp.gmail.com";
        String port = "587";
        final String mailFrom = "dhis.devs.india@gmail.com";
        final String password = "hispindia";
        
        Properties properties = new Properties();
        properties.put( "mail.smtp.host", host );
        properties.put( "mail.smtp.port", port );
        properties.put( "mail.smtp.auth", "true" );
        properties.put( "mail.smtp.starttls.enable", "true" );
        properties.put( "mail.user", mailFrom );
        properties.put( "mail.password", password );
        */
        
        // Sender's email ID needs to be mentioned
        final String mailFrom = "dhis.devs.india@gmail.com";
        final String password = "hispindia";

        // Assuming you are sending email from localhost
        String host = "smtp.gmail.com";
        
        // Get system properties
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");     
        properties.setProperty("mail.host", host);  
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");  
        properties.put("mail.smtp.user", mailFrom);
        properties.put("mail.debug", "true");  
        properties.put("mail.smtp.socketFactory.port", "465");  
        properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
        properties.put("mail.smtp.socketFactory.fallback", "false");  
        properties.put("mail.smtp.starttls.enable", "true");
        
        // creates a new session with an authenticator
        Session session = Session.getDefaultInstance( properties, new javax.mail.Authenticator()
        {
          protected PasswordAuthentication getPasswordAuthentication()
          {
            return new PasswordAuthentication( mailFrom, password );
          }
        });
        
        
        // creates a new session with an authenticator
        /*
        Authenticator auth = new Authenticator()
        {
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication( mailFrom, password );
            }
        };
        
        Session session = Session.getInstance( properties, auth );
        */
        
        // creates a new e-mail message
        
        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com" , 465 , mailFrom, password);
        
        //Message msg = new MimeMessage( session );
        //msg.setFrom( new InternetAddress( mailFrom ) );
        
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom( new InternetAddress( mailFrom ) );
        msg.setSender( new InternetAddress( mailFrom ) );
        
        // can put multiple receivers in the array
        // for set multiple TO address seperated by semi-colon
        if( toEmailList != null && toEmailList.size() > 0)
        {
            //String[] mailAddressTo = (String[]) toEmailList.toArray();
            String[] mailAddressTo = toEmailList.toArray(new String[toEmailList.size()]);  
            InternetAddress[] mailAddress_TO = new InternetAddress[mailAddressTo.length];
            for ( int i = 0; i < mailAddressTo.length; i++ )
            {
                mailAddress_TO[i] = new InternetAddress( mailAddressTo[i] );
                System.out.println( mailAddress_TO[i] );
            }
            System.out.println( mailAddress_TO );
            
            msg.addRecipients( Message.RecipientType.TO, mailAddress_TO );
        }
        
        /*    
        if( toAddressCC != null && toAddressCC.length() > 0)
        {
            String[] mailAddressCC = toAddressCC.split( ";" );
            InternetAddress[] mailAddress_CC = new InternetAddress[mailAddressCC.length];
            for ( int i = 0; i < mailAddressCC.length; i++ )
            {
                mailAddress_CC[i] = new InternetAddress( mailAddressCC[i] );
                System.out.println( mailAddress_CC[i] );
            }
            System.out.println( mailAddress_CC );
            
            msg.addRecipients( Message.RecipientType.CC, mailAddress_CC );
        }
        */
        
        //InternetAddress[] toAddressesCC = { new InternetAddress( toAddressCC ) };
        //msg.setRecipients( Message.RecipientType.CC, toAddressesCC );

        msg.setSubject( subject );
        msg.setSentDate( new Date() );
        
        //msg.setSender( mailFrom );

        // creates message part
        
        //MimeBodyPart messageBodyPart = new MimeBodyPart();
        //messageBodyPart.setContent( message, "text/html" );
        
        String finalMessage = "";
        finalMessage = message;
        finalMessage  += "\n\n Thanks and Regards ";
        finalMessage  += "\n\n" + new InternetAddress( mailFrom ) ;
        finalMessage  += "\n\n HISP-INDIA-DEVELOPER ";
        
        msg.setContent( finalMessage, "text/plain");
        
        // sends the e-mail
        Transport.send( msg );
        System.out.println( "e-mail send " );
        transport.close();
    }

    public static void sendEmailOneByOne( String subject, List<String> toEmailList, String message )  throws AddressException, MessagingException
    {
        // Sender's email ID needs to be mentioned
        if ( toEmailList != null && toEmailList.size() > 0 )
        {
            final String mailFrom = "dhis.devs.india@gmail.com";
            final String password = "hispindia";

            // Assuming you are sending email from localhost
            String host = "smtp.gmail.com";
            
            // Get system properties
            Properties properties = new Properties();
            properties.setProperty("mail.transport.protocol", "smtp");     
            properties.setProperty("mail.host", host);  
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.port", "465");  
            properties.put("mail.smtp.user", mailFrom);
            properties.put("mail.debug", "true");  
            properties.put("mail.smtp.socketFactory.port", "465");  
            properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
            properties.put("mail.smtp.socketFactory.fallback", "false");  
            properties.put("mail.smtp.starttls.enable", "true");
            
            // creates a new session with an authenticator
            Session session = Session.getDefaultInstance( properties, new javax.mail.Authenticator()
            {
              protected PasswordAuthentication getPasswordAuthentication()
              {
                return new PasswordAuthentication( mailFrom, password );
              }
            });
            
            if( toEmailList != null && toEmailList.size() > 0)
            {
                for( String eachEmail : toEmailList )
                {
                    Transport transport = session.getTransport("smtp");
                    transport.connect("smtp.gmail.com" , 465 , mailFrom , password);
                    
                    String finalMessage = "";
                    finalMessage = message;
                    finalMessage  += "\n\n Thanks and Regards ";
                    finalMessage  += "\n" + new InternetAddress( mailFrom ) ;
                    finalMessage  += "\n HISP-INDIA-DEVELOPER ";
                    
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom( new InternetAddress( mailFrom ) );
                    msg.setSender( new InternetAddress( mailFrom ) );
                    msg.setContent( finalMessage, "text/plain");
                    msg.setSubject( subject );
                    msg.setSentDate( new Date() );
                    
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress( eachEmail ));
                    Transport.send (msg ) ; 
                    transport.close();
                }
            }
        }
        else
        {
            System.out.println( "No Email Found" );
        }
        
        
    }
    
    // sending message to multiple mobile no
    public void sendSMS( String message, List<String> phonenos ) throws MalformedURLException, IOException
    {
        String phoneNo = null;
        String response = "";
        Iterator<String> it = phonenos.iterator();
        
        if( phonenos != null && phonenos.size() >0 )
        {
            while ( it.hasNext() )
            {
                if ( phoneNo == null )
                {
                    phoneNo = (String) it.next();
                } 
                
                else
                {
                    phoneNo += "," + it.next();
                }
            }
            
            System.out.println( "mobile no -- " + phoneNo );
            
            String username = "Indianhealthaction";
            String password = "12345678";

            String senderid = "LBWKMC";
            String channel = "TRANS";

            try 
            {
              String encoding = "UTF-8";
              
              String urlParameters = "user=" + URLEncoder.encode(username, encoding)
                + "&password=" + URLEncoder.encode(password, encoding)
                + "&senderid=" + URLEncoder.encode(senderid, encoding)
                + "&channel="+URLEncoder.encode(channel, encoding)
                + "&DCS="+URLEncoder.encode("0", encoding)
                + "&flashsms="+URLEncoder.encode("0", encoding)
                + "&number=" + URLEncoder.encode(phoneNo, encoding)
                + "&text=" + URLEncoder.encode(message, encoding)
                + "&route="+URLEncoder.encode("02", encoding);

              // Send request to the API servers over HTTPS
              URL url_string = new URL("http://aanviit.com/api/mt/SendSMS?" + urlParameters );
              
              HttpURLConnection urlConnection = (HttpURLConnection) url_string.openConnection();
              
              System.out.println( "SMS Response -- " + urlConnection.getResponseMessage() );
              
              urlConnection.disconnect();
           
              urlConnection.disconnect();
            
            } 
            
            catch (Exception e) 
            {
              System.out.println( "Exception - " + e.getMessage() );
            }
        }
        else
        {
            System.out.println( "No Mobile No Found" );
        }

    }
    
    public void autoApproveTrackedEntityDataValue() 
    { 
        
        List<String> programStageInstanceIdsAndDataValue = new ArrayList<String>( programStageInstanceIdsAndDataValue() );
        
        /*
        System.out.println( " PSI Size -- " + programStageInstanceIdsAndDataValue.size());
        for( String psiIdDataValue : programStageInstanceIdsAndDataValue )
        {
            String psiId = psiIdDataValue.split( ":" )[0];
            String value = psiIdDataValue.split( ":" )[1];
            System.out.println( psiId + " -- " + value );
        }
        */
        
        String storedBy = "admin";
       
        String importStatus = "";
        Integer updateCount = 0;
        Integer insertCount = 0;
       
        Date sqldate = new Date();
        java.sql.Timestamp lastUpdatedDate = new Timestamp( sqldate.getTime() );
        java.sql.Timestamp createdDate = new Timestamp( sqldate.getTime() );
        //System.out.println( new Timestamp(date.getTime() ) );

        String insertQuery = "INSERT INTO trackedentitydatavalue ( programstageinstanceid, dataelementid, value, providedelsewhere, storedby, created, lastupdated ) VALUES ";
        String updateQuery = "";
        //String value = "Auto-Approved";
        int insertFlag = 1;
        int count = 1;
        autoApprovedEMailList = new ArrayList<String>();
        if( programStageInstanceIdsAndDataValue != null && programStageInstanceIdsAndDataValue.size() > 0 )
        {
            try
            {
                for( String psiIdDataValue : programStageInstanceIdsAndDataValue )
                {
                    String psiId = psiIdDataValue.split( ":" )[0];
                    String value = psiIdDataValue.split( ":" )[1];
                    
                    String email = psiIdDataValue.split( ":" )[3];
                    
                    if( email != null && !email.equalsIgnoreCase( "" ) && isValidEmail( email ) )
                    {
                        String eventDateEmail = psiIdDataValue.split( ":" )[2] + ":" + psiIdDataValue.split( ":" )[3];
                        autoApprovedEMailList.add( eventDateEmail );
                    }
                    
                    updateQuery = "SELECT value FROM trackedentitydatavalue WHERE dataelementid = " + CURRENT_STATUS_DOC_DIARY_DATAELEMENT_ID + " AND programstageinstanceid = " + psiId;
                    
                    SqlRowSet updateSqlResultSet = jdbcTemplate.queryForRowSet( updateQuery );
                    if ( updateSqlResultSet != null && updateSqlResultSet.next() )
                    {
                        String tempUpdateQuery = "UPDATE trackedentitydatavalue SET value = '" + value + "', storedby = '" + storedBy + "',lastupdated='" + lastUpdatedDate + 
                                                  "' WHERE dataelementid = " + CURRENT_STATUS_DOC_DIARY_DATAELEMENT_ID + " AND programstageinstanceid = " + psiId;

                        jdbcTemplate.update( tempUpdateQuery );
                        
                        updateCount++;
                    }
                    else
                    {
                        insertQuery += "( " + psiId + ", " + CURRENT_STATUS_DOC_DIARY_DATAELEMENT_ID + ", '" + value + "', false ,'" + storedBy + "', '" + createdDate + "', '" + lastUpdatedDate + "' ), ";
                        insertFlag = 2;
                        insertCount++;
                    }
                    
                    if ( count == 1000 )
                    {
                        count = 1;

                        if ( insertFlag != 1 )
                        {
                            insertQuery = insertQuery.substring( 0, insertQuery.length() - 2 );
                            //System.out.println( " insert Query 2 -  " );
                            jdbcTemplate.update( insertQuery );
                        }

                        insertFlag = 1;

                        insertQuery = "INSERT INTO trackedentitydatavalue ( programstageinstanceid, dataelementid, value, providedelsewhere, storedby, created, lastupdated ) VALUES ";
                    }
                    count++;
                }
                //System.out.println(" Count - "  + count + " -- Insert Count : " + insertCount + "  Update Count -- " + updateCount );
                if ( insertFlag != 1 )
                {
                    insertQuery = insertQuery.substring( 0, insertQuery.length() - 2 );
                    //System.out.println(" insert Query 1 -  ");
                    jdbcTemplate.update( insertQuery );
                }
                
                importStatus = "Successfully populated tracker data : "; 
                importStatus += "<br/> Total new records : " + insertCount;
                importStatus += "<br/> Total updated records : " + updateCount;
                
                //System.out.println( importStatus );     
                
            }
            catch ( Exception e )
            {
                importStatus = "Exception occured while import, please check log for more details" + e.getMessage();
            }
        }
        
        System.out.println("ImportStatus : " + importStatus + " PSI Size -- " + programStageInstanceIdsAndDataValue.size() );
       
    }
    
    
    // user E-mail for Auto-Approve
    public List<String> getUserEmailListForAutoApproval( String psiIdsByCommas )
    {
        List<String> emailList = new ArrayList<>();
        try
        {
            String query = "SELECT email from userinfo where userinfoid in ( select userid from users where username in (  " +
                            "SELECT teav.value from programstageinstance psi " +
                            "INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid " +
                            "INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid " +
                            "WHERE psi.programstageinstanceid in ( " + psiIdsByCommas + " )) ); ";
              
            System.out.println( "query = " + query );
                 
            SqlRowSet rs = jdbcTemplate.queryForRowSet( query );
            
            //System.out.println( "-- RS " + rs.toString() + " -- " + rs.isFirst() + " -- " + rs.next() ) ;
            
            while ( rs.next() )
            {
                String eMail = rs.getString( 1 );
                if( eMail != null && isValidEmail( eMail ) )
                {
                    emailList.add( eMail );
                }
            }
            return emailList;
        }
        
        catch ( Exception e )
        {
            throw new RuntimeException( "Illegal PSI ids", e );
        }
    }        

    public static void sendEmailAutoApprove( String subject, String toEmail, String message )  throws AddressException, MessagingException
    {
        // Sender's email ID needs to be mentioned
        if ( toEmail != null && !toEmail.equalsIgnoreCase( "" ) )
        {
            final String mailFrom = "dhis.devs.india@gmail.com";
            final String password = "hispindia";

            // Assuming you are sending email from localhost
            String host = "smtp.gmail.com";
            
            // Get system properties
            Properties properties = new Properties();
            properties.setProperty("mail.transport.protocol", "smtp");     
            properties.setProperty("mail.host", host);  
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.port", "465");  
            properties.put("mail.smtp.user", mailFrom);
            properties.put("mail.debug", "true");  
            properties.put("mail.smtp.socketFactory.port", "465");  
            properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
            properties.put("mail.smtp.socketFactory.fallback", "false");  
            properties.put("mail.smtp.starttls.enable", "true");
            
            // creates a new session with an authenticator
            Session session = Session.getDefaultInstance( properties, new javax.mail.Authenticator()
            {
              protected PasswordAuthentication getPasswordAuthentication()
              {
                return new PasswordAuthentication( mailFrom, password );
              }
            });
            
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com" , 465 , mailFrom , password);
            
            String finalMessage = "";
            finalMessage = "Dear User,";
            finalMessage  += "\n\n Your data has been Auto-Approved for " + message + ".";
            finalMessage  += "\n Thank you for using UPHMIS Doctor Dairy application." ;
            finalMessage  += "\n\n Thanks & Regards, ";
            finalMessage  += "\n UPHMIS Doctor Dairy Team ";
            
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom( new InternetAddress( mailFrom ) );
            msg.setSender( new InternetAddress( mailFrom ) );
            msg.setContent( finalMessage, "text/plain");
            msg.setSubject( subject );
            msg.setSentDate( new Date() );
             
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress( toEmail ));
            Transport.send (msg ) ; 
            transport.close();
            
        }
        else
        {
            System.out.println( "No Email Found" );
        }

    }    
    
    
}