-- 21/05/2025 house hold instance queries

select * from programstageinstance 
where executiondate::date between '2024-01-01' and '2024-12-31'; -- 636


select * from programstageinstance 
where executiondate::date between '2025-01-01' and '2025-12-31'; -- 8557

select * from programinstance where enrollmentdate::date 
between '2024-01-01' and '2024-12-31'; -- 222

select * from programinstance where enrollmentdate::date 
between '2025-01-01' and '2025-12-31'; -- 4342


SELECT tei.uid AS teiUID, prg.uid as program_uid,prg.name as program_name,
psi.uid eventID, psi.executiondate::date

FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
order by tei.uid;



select * from trackedentityattributevalue where trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF');


select * from trackedentityattributevalue where trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'b4UUhQPwlRH');


-- event datavalue single dataElement Value 28/05/2025


SELECT prg.uid as program_uid,prg.name as program_name,
psi.uid eventID, psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS event_de_value, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'KrSqdwQgJoe';


SELECT tei.uid AS teiUID, prg.uid as program_uid,prg.name as program_name,
psi.uid eventID, psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS Survey_Date, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where ps.uid = 'E3qbFZ8MmGe'

where de.uid = 'tjXaQPI9OcQ';

-- -- hh program
SELECT tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
psi.uid eventID, psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS Survey_Date, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
left JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'b4UUhQPwlRH') and 
de.uid = 'tjXaQPI9OcQ'; -- 938, 888



-- hh member program

SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
psi.uid eventID, psi.executiondate::date FROM programstageinstance psi 

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF');


SELECT tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
psi.uid eventID, psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS Survey_Date, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
left JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where prg.uid = 'xvzrp56zKvI' and teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF') and ps.uid = 'E3qbFZ8MmGe';

-- hh member program event_list

SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
ps.uid as program_stage_uid, ps.name as program_stage_name,
psi.uid eventID, psi.executiondate::date FROM programstageinstance psi 

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF') and prg.uid = 'xvzrp56zKvI' and ps.uid = 'E3qbFZ8MmGe';


-- hh member program event_list member details

SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
ps.uid as program_stage_uid, ps.name as program_stage_name,
psi.uid eventID, psi.executiondate::date FROM programstageinstance psi 

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF') and prg.uid = 'xvzrp56zKvI' and ps.uid = 'Ux1dcyOiHe7';



-- hh member program all datavalue member details
SELECT tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
ps.uid as program_stage_uid, ps.name as program_stage_name,
psi.uid eventID, psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS event_data_value, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
left JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF') and prg.uid = 'xvzrp56zKvI' and ps.uid = 'Ux1dcyOiHe7';




-- hh member program all datavalue
SELECT tei.uid AS teiUID, teav.value AS dwelling_ID, pi.uid as enrollment_uid,
pi.enrollmentdate::date as enrollment_date,
prg.uid as program_uid, prg.name as program_name,
ps.uid as program_stage_uid, ps.name as program_stage_name,
psi.uid eventID, psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS event_data_value, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
left JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where teav.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid  = 'hDE1WNqTTwF') and prg.uid = 'xvzrp56zKvI' and ps.uid = 'E3qbFZ8MmGe';


-- createdbyuserinfo

SELECT data.key as de_uid,
cast(data.username::json → ‘value’ AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON true

{"id": 10997, "uid": "WcmqYQ15AH7", "surname": "PHC", "username": "KamichuPHC_AHS", "firstName": "Kamichu"}

select psi.uid, psi.organisationunitid, org.name org_name,psi.created::date, psi.executiondate::date,
 ps.name stage_name,psi.eventdatavalues,
cast(psi.createdbyuserinfo::json ->> 'username' AS VARCHAR) as user_name
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
where cast(psi.createdbyuserinfo::json ->> 'username' AS VARCHAR) = 'SamtengangPHC_AHS'
order by psi.created desc;


-- 02/06/2025 TEI move complete

-- 21/08/2025
select * from organisationunit where name ='Kadag_Silambi_01' -- 5736

select * from trackedentityattributevalue where 
select * from trackedentityattributevalue where 
value in('107 14 05 01 263', '107 14 05 01 168', '107 14 05 01 803')
trackedentityattributeid = 299

value = '107 14 05 01 263'

select * from trackedentityattribute where uid 
in( 'hDE1WNqTTwF','b4UUhQPwlRH' );


select * from trackedentityinstance where 
trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641);

select * from programinstance where 
trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641);

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where 
trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641));

select * from trackedentityprogramowner where 
trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641);


update trackedentityprogramowner set organisationunitid = 5736
where trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641);

update trackedentityinstance set organisationunitid = 5736
where trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641);

update programinstance set organisationunitid = 5736 where 
trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641);


update programstageinstance set organisationunitid = 5736 where programinstanceid in (
select programinstanceid from programinstance where 
trackedentityinstanceid in (11085,11065,11087,11418,
11667,13209,11686,11641));

-- 03/06/2025

select * from organisationunit 
where organisationunitid = 5599;

select * from trackedentityattributevalue where 
value in('107 14 05 01 263') and trackedentityattributeid = 282 
and trackedentityinstanceid = 11065;

update trackedentityattributevalue set value = '107 14 03 01 263' 
where trackedentityattributeid = 282 and trackedentityinstanceid = 11065;


update trackedentityattributevalue set value = '107 14 03 01 168' 
where trackedentityattributeid = 282 and trackedentityinstanceid = 11418;


update trackedentityattributevalue set value = '107 14 03 01 803' 
where trackedentityattributeid = 282 and trackedentityinstanceid = 11641;



-- 15/06/2025

-- Family Information 3.3 L0EgY4EomHv  attribute_with_TEI ,Unique Dwelling No -- b4UUhQPwlRH
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'L0EgY4EomHv'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'b4UUhQPwlRH');


-- Family member details 4.0 xvzrp56zKvI attribute__Unique dwelling ID hDE1WNqTTwF _with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'xvzrp56zKvI'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'hDE1WNqTTwF ');


-- Family member details 4.0 xvzrp56zKvI attribute__Family Information UID gv9xX5w4kKt -- 1886_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'xvzrp56zKvI'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'gv9xX5w4kKt');



-- tei attributeValue not enroll in any program 20/06/2025
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,teav.value AS Household_UID,tet.name AS trackedentitytypeName from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance)
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid in( 'b4UUhQPwlRH','hDE1WNqTTwF'));


-- 23/06/2025

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,pi.uid as enrollmentUID,pi.programinstanceid,teav.value AS Household_UID,
tet.name AS trackedentitytypeName from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.uid in ( 'wOfBoVlASUQ', 'LCXPGvEdLiK', 'x32UZZZBv5a');


delete from programinstance where programinstanceid = 36958;

delete from programstageinstance 
where programinstanceid = 36958;

select * from trackedentityinstance where uid = 'YhXhyqXGaZI'

select * from trackedentityattributevalue
where trackedentityinstanceid = 40173;

select * from trackedentityattribute 
where uid = 'b4UUhQPwlRH';

select * from trackedentityattributevalue

update trackedentityinstance set uid = 'wOfBoVlASUQ'
where uid = 'YhXhyqXGaZI'

select * from programinstance where 
trackedentityinstanceid = 40173;

update programinstance set uid = 'usNfVFH03Hq'
where uid = 'qgDfrcg2GlM';


where trackedentityattributeid = 282 and trackedentityinstanceid = 40173;

update trackedentityattributevalue set value = '119 12 01 01 499'
where trackedentityattributeid = 282 and trackedentityinstanceid = 40173;



insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&B2&","&F2&",'2025-06-15','2025-06-15','"&E2&"','hispdev'),"



update trackedentityattributevalue set created = now()::timestamp where created = '2025-06-15';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-06-15';	

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&A2&", "&H2&",'2025-06-15','2025-06-15',"&D2&",'hispdev' ),"


insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&I2&"', '2025-06-15', '2025-06-15', '"&J2&"', 'ACTIVE', "&A2&", "&H2&",'"&J2&"', "&D2&", 'false','hispdev' ),"



update programinstance set created = now()::timestamp where created = '2025-06-15';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-06-15';	


update trackedentityprogramowner set created = now()::timestamp where created = '2025-06-15';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-06-15';	

select * from trackedentityinstance where uid = 'YhXhyqXGaZI'

select * from trackedentityattributevalue
where trackedentityinstanceid = 40173;

select * from trackedentityattribute 
where uid = 'b4UUhQPwlRH';

select * from trackedentityattributevalue

update trackedentityinstance set uid = 'wOfBoVlASUQ'
where uid = 'YhXhyqXGaZI'

select * from programinstance where 
trackedentityinstanceid = 40173;

update programinstance set uid = 'usNfVFH03Hq'
where uid = 'qgDfrcg2GlM';


where trackedentityattributeid = 282 and trackedentityinstanceid = 40173;

update trackedentityattributevalue set value = '119 12 01 01 499'
where trackedentityattributeid = 282 and trackedentityinstanceid = 40173;

-- 24/06/2025

SELECT psi.uid as eventUid,prg.uid as programUid,
tei.uid as teiUid, org.uid as orgunit, org.code as org_code
from programstageinstance psi

INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid

WHERE psi.uid in ( );

-- 30/06/2025

-- tei list with enrollment
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,pi.uid as enrollmentUID,pi.programinstanceid,teav.value AS Household_UID,
tet.name AS trackedentitytypeName from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.uid in ( 'wOfBoVlASUQ', 'LCXPGvEdLiK', 'x32UZZZBv5a');