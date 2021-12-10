-- json query

-- got from global-team

SELECT data.key as de_uid,
cast(data.value::json → ‘value’ AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE

-- json query for eventdatavalues in programstageinstance table

-- for all events dataelement and its value
SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE;


SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid eventID,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE
and psi.executiondate between '2021-01-01' and '2021-10-05'; 

-- event list with dataelement-value
SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid eventID,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE
and psi.executiondate between '2021-08-01' and '2021-11-30'; 

-- event list with dataelement-value
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where psi.executiondate between '2021-08-01' and '2021-11-30';

-- program wise event list with dataelement-value
SELECT psi.uid eventID,psi.storedby, psi.status, psi.executiondate::date,
psi.completedby, psi.completeddate::date,psi.deleted,data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, de.name AS dataElementName,
prg.uid AS prgUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where prg.uid = 'dzizG8i1cmP' and psi.executiondate between '2021-08-01' and '2021-08-31'
order by psi.programstageinstanceid;

-- event list with dataelement-value with trackedentityattributevalue
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate between '2021-08-01' and '2021-11-30' and teav.trackedentityattributeid = 3418;

-- tei list based on eventdatavalues particular dataelement value
SELECT tei.uid as tei_uid, psi.uid eventID, psi.executiondate::date as eventDate,
psi.status as eventStatus, pi.enrollmentdate::date as enrollmentDate, org.uid as orgUnitUID,
data.key as dataElementUID, cast(data.value::json ->> 'value' AS VARCHAR) AS data_value
FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE org.path like '%cCTQiGkKcTk%' and prg.uid = 'L78QzNqadTV' and psi.deleted is false 
and prgs.uid = 'zRUw1avYEvI' and de.uid = 'gPHLt0PQq1b' 
and cast(data.value::json ->> 'value' AS VARCHAR) between '2021-01-01' and '2021-12-31';

-- sql-view with parameters
SELECT tei.uid as tei_uid, org.uid as orgUnitUID, data.key as dataElementUID, 
cast(data.value::json ->> 'value' AS VARCHAR) AS data_value FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE org.path like '%${orgunit}%' and prg.uid = 'L78QzNqadTV' and psi.deleted is false 
and prgs.uid = 'zRUw1avYEvI' and de.uid = '${dataelement}' 
and cast(data.value::json ->> 'value' AS VARCHAR) between '${startdate}' and '${enddate}';

api/sqlViews/UoB6FSJlnkz/data.json?var=orgunit:cCTQiGkKcTk&var=dataelement:gPHLt0PQq1b&var=startdate:2021-01-01&var=enddate:2021-12-31&paging=false
https://tracker.hivaids.gov.np/save-child-2.27/api/sqlViews/UoB6FSJlnkz/data.json?var=orgunit:cCTQiGkKcTk&var=dataelement:gPHLt0PQq1b&var=startdate:2021-01-01&var=enddate:2021-12-31&paging=false

-- for all events dataelement and its value and programstageinstanceid , UID
SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid,psi.programstageinstanceid
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE;


SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid,psi.programstageinstanceid
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE where psi.programstageinstanceid = 79876;


 -- single dataElement value
SELECT e.uid, eventdatavalues -> 'ooIQeHbhH61' ->> 'value' as dataValue
FROM programstageinstance e
where eventdatavalues -> 'ooIQeHbhH61' is not null 
ORDER BY eventdatavalues -> 'ooIQeHbhH61' ->> 'value';


-- json query for AMR-2.34


SELECT e.uid, eventdatavalues -> 'ooIQeHbhH61' ->> 'value' as amrid
FROM programstageinstance e
and eventdatavalues -> 'ooIQeHbhH61' is not null 
ORDER BY eventdatavalues -> 'ooIQeHbhH61' ->> 'value';


SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%mKmB0wcw7Gf%' and eventdatavalues -> 'lIkk661BLpG' is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';


SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%mKmB0wcw7Gf%' and eventdatavalues is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';

 -- for HIV tracker
 -- eventdatavalues

SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'aXquUzlrYYv' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null  and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'transfer_out' order by psi.created desc;

-- event -data-value

SELECT org.uid as orgUnit, tei.uid as tei, pi.uid AS enrollment, psi.uid as event, psi.created,
psi.status, eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status, psi.duedate, psi.executiondate as eventDate from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = '${program}' and tei.uid = '${tei}' and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'transfer_out'
and psi.deleted is false order by psi.executiondate desc LIMIT 1 ; 

-- based on enrollmentdate

SELECT distinct tei.uid  as tei_uid FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'UcFtqIBF6dF' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null and pi.enrollmentdate::date between
'2019-01-01' and '2019-12-31';

SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as dataValue FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'UcFtqIBF6dF' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null and pi.enrollmentdate::date between
'2019-01-01' and '2019-12-31';


-- tei list based on eventdatavalues dataelement value
SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status, pi.enrollmentdate::date FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
WHERE org.path like  '%cCTQiGkKcTk%' and prg.uid = 'L78QzNqadTV' and pi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null  and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'transfer_out'
and pi.enrollmentdate::date <= '2020-12-31';


-- tei list based on eventdatavalues particular dataelement value

SELECT tei.uid as tei_uid, psi.uid eventID, psi.executiondate::date as eventDate,
psi.status as eventStatus, pi.enrollmentdate::date as enrollmentDate, org.uid as orgUnitUID,
data.key as dataElementUID, cast(data.value::json ->> 'value' AS VARCHAR) AS data_value
FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE org.path like '%cCTQiGkKcTk%' and prg.uid = 'L78QzNqadTV' and psi.deleted is false 
and prgs.uid = 'zRUw1avYEvI' and de.uid = 'gPHLt0PQq1b' 
and cast(data.value::json ->> 'value' AS VARCHAR) between '2021-01-01' and '2021-12-31';


SELECT tei.uid as tei_uid,  psi.uid as eventUID, psi.executiondate::date as eventDate, 
psi.status as eventStatus, eventdatavalues -> 'rQnmYAF1899' ->> 'value' as art_tre_date, 
pi.enrollmentdate::date as enrollmentDate, org.uid as orgUnitUID FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
WHERE org.path like  '%cCTQiGkKcTk%' and prg.uid = 'L78QzNqadTV' and psi.deleted is false 
and prgs.uid = 'zRUw1avYEvI' and eventdatavalues -> 'rQnmYAF1899' is not null and 
eventdatavalues -> 'rQnmYAF1899' ->> 'value' between '2021-01-01' and '2021-12-31';

SELECT tei.uid as tei_uid,  psi.uid as eventUID, psi.executiondate::date as eventDate, 
psi.status as eventStatus, eventdatavalues -> 'gPHLt0PQq1b' ->> 'value' as art_tre_date, 
pi.enrollmentdate::date as enrollmentDate, org.uid as orgUnitUID FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
WHERE org.path like  '%cCTQiGkKcTk%' and prg.uid = 'L78QzNqadTV' and psi.deleted is false 
and prgs.uid = 'zRUw1avYEvI' and eventdatavalues -> 'gPHLt0PQq1b' is not null and 
eventdatavalues -> 'gPHLt0PQq1b' ->> 'value' between '2021-01-01' and '2021-12-31';



select * from json_each_text('{"a":"foo", "b":"bar"}')

SELECT programstageinstanceid,uid,
   eventdatavalues -> 'zTwMKXGt0xF' ->> 'value' as value
FROM
   programstageinstance where uid in ( 'AiSdX1jtq0x','ykEs09tttt7','vpcxSuFm4CS','d8f0Fjbjk2j',
'QuV5wz4fzbK','YfwXSS3Q6F1','YHPOHL4Z7Q7')


SELECT programstageinstanceid,
   eventdatavalues -> 'FU4eoBAjxVJ' ->> 'value' as value,
   eventdatavalues -> 'T7L6dtXlGRh' ->> 'value' as value,
   eventdatavalues -> 'QPCKDxWIlds' ->> 'value' as value
FROM
   programstageinstance

SELECT programstageinstanceid,
   eventdatavalues ->> 'FU4eoBAjxVJ' AS deUid
FROM
   programstageinstance;

SELECT programstageinstanceid, uid,
 eventdatavalues #>> '{FU4eoBAjxVJ, value}',
 eventdatavalues #>> '{T7L6dtXlGRh, value}',
 eventdatavalues #>> '{T7L6dtXlGRh, value}'
 
 FROM
   programstageinstance;


SELECT programstageinstanceid, uid,
 eventdatavalues #>> '{gC5vAvkiDQC, value}'
 
 FROM
   programstageinstance;   


SELECT programstageinstanceid, uid,
 eventdatavalues #>> '{S1sDvEir5Ur, value}'
 
 FROM
   programstageinstance;



create or replace function generate_uid()
  returns text as
$$
declare
  chars  text [] := '{0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}';
  result text := chars [11 + random() * (array_length(chars, 1) - 11)];
begin
  for i in 1..10 loop
    result := result || chars [1 + random() * (array_length(chars, 1) - 1)];
  end loop;
  return result;	
end;
$$
language plpgsql;
