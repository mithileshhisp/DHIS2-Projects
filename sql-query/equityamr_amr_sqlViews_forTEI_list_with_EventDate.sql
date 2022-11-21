
-- SQL-View-Id -- WKhh3qxwcPW -- name -- AMRNEWDATAVIEW
-- query

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false and psi.executiondate >  CURRENT_DATE - INTERVAL '2 months'  order by psi.executiondate desc,psi.created desc

-- updated query

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false order by psi.executiondate desc,psi.created desc
 -- for sample testing only
SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  order by psi.executiondate desc,psi.created desc

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  
and psi.created >  CURRENT_DATE - INTERVAL '2 months' order by psi.executiondate desc,psi.created desc

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  
and tei.created >  CURRENT_DATE - INTERVAL '2 months' order by psi.executiondate desc,psi.created desc;

-- event list with trackedentityattributevalue
SELECT org.name AS orgName,tei.uid AS teiUID,teav.value as CR_Number,psi.uid eventID,
psi.executiondate::date,psi.status,psi.completeddate::date,psi.completedby 
FROM programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
where psi.status = 'COMPLETED' and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and teav.trackedentityattributeid =  3418;


-- event list with multiple TEA value trackedentityattributevalue
SELECT teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and psi.status = 'COMPLETED';