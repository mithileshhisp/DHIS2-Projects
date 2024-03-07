
-- M!th!lesh@123 links -- 172.105.47.164 96 4444
-- push orgUnit to dhis2 lvel 2 and 3 ( state and district )

-- take database backup before delete all tracker/aggregated data and import with new query
-- Dh!sUs3Rp@SS1
-- pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_08Dec2023_with104_Program.sql

-- pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_08Dec2023_with_out_dataValue.sql



-- 104 event list count

https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:4

https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:3

-- 06/03/2024 
-- ou list
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&paging=false
-- HWC registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI'));

select * from program;

-- HWC registration/enrollment count
select count(*) from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI');

-- for HWC ID ( HWC facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'v0l6GSGw7TS' and orgunit.hierarchylevel = 5;


-- HWC registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI'));

select * from program;

-- HWC registration/enrollment count
select count(*) from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI');


-- bayer registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid = 7294 ) and organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641 );

select count(*) from programinstance 
where programid = 7294 and organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641 );



-- bayer event count
select count(*) from programstageinstance 
where programstageid = 146164 and organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641 );

-- 1097 prefered language attribute

select value,count(value) from trackedentityattributevalue where 
trackedentityattributeid = 6900511 group by value;

-- 1097 TEI attributeValue

SELECT teav.value,tei.uid tei_uid,org.uid org_uid
FROM programinstance pi
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ggbtdN2DyfR' and teav.trackedentityattributeid = 7210;

-- 1097 age on visit

SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int,psi.created
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ggbtdN2DyfR' and teav.trackedentityattributeid = 7206
order by psi.created desc;

select count(*) from programstageinstance psi 
where programstageid = 6900528;

select * from programstageinstance 
where programstageid = 6900528 order by created desc;

select uid,programstageinstanceid,created from programstageinstance 
where programstageid = 6900528 order by programstageinstanceid desc;


select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid = 'MQzM9kXQuxk'
order by opv.name;


-- 1097 registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid = 6345158 );

select count(*) from programinstance 
where programid = 6345158

-- 1097 event count

select count(*) from programstageinstance psi 
where programstageid = 6900528;


SELECT psi.uid AS eventUID,psi.eventdatavalues
from programstageinstance psi where programstageid = 7391
and  psi.eventdatavalues is null;

select count(*) from programstageinstance psi 
where programstageid = 7391;

select programstageinstanceid,uid from programstageinstance psi 
where programstageid = 7391 order by programstageinstanceid desc limit 1;

SELECT psi.uid AS eventUID,psi.executiondate::date
from programstageinstance psi where programstageid = 7391
and  psi.eventdatavalues -> 'hsbXpo83f4I' is not null;

select count(*) from programstageinstance psi 
where programstageid = 7391 -- 254866;

select count(*) from programstageinstance psi 
where programstageid = 7391 and 
psi.eventdatavalues -> 'hsbXpo83f4I' is null; -- 145688

SELECT psi.uid AS eventUID,psi.executiondate::date
from programstageinstance psi where programstageid = 7391
and  psi.eventdatavalues -> 'hsbXpo83f4I' is null;


select count(*) from programstageinstance psi 
where programstageid = 7391 and 
psi.eventdatavalues -> 'hsbXpo83f4I' is not null; -- 109178


SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where teav.trackedentityattributeid = 7206;



-- TM event list with BenVisitID and BeneficiaryRegID

	
SELECT psi.uid eventID,psi.executiondate::date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS BenVisitID,
teav.value as BeneficiaryRegID
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' and de.uid = 'Q7aA5HvvV7L'
and teav.trackedentityattributeid = 7210;


SELECT psi.uid eventID,psi.executiondate::date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS BenVisitID
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'hQUeRtU70wj' and de.uid = 'Q7aA5HvvV7L';	



-- 104 BenCallID event-dataValue query

SELECT psi.uid eventID,psi.executiondate::date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'vyQPQ07JB9M'
and de.uid = 'hsbXpo83f4I';



-- piramal event list with age on visit( diffrence of age from event-date to date-of-birth)
SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' and teav.trackedentityattributeid = 7206;

-- for TM program event list with age on visit( diffrence of age from event-date to date-of-birth)
SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' and teav.trackedentityattributeid = 7206;


-- for MMU program event list with age on visit( diffrence of age from event-date to date-of-birth)

SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' and teav.trackedentityattributeid = 7206;


SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' and teav.trackedentityattributeid = 7206
and de.uid = 'Q7aA5HvvV7L' and psi.executiondate::date between '2023-01-01' and '2023-12-31';


SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' and teav.trackedentityattributeid = 7206
and psi.executiondate::date 
between '2023-01-01' and '2023-12-31';


select count(*) from programstageinstance
where programstageid in ( select programstageid
from programstage where programid in ( select 
programid from program where uid = 'NMGbY2nXCKu') );


-- event dataValue -- age on visist for TM program

SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'P5a5E6m8llj' and psi.programstageid in (
select programstageid from programstage where programid 
in ( select programid from program where uid = 'hQUeRtU70wj'));

-- event dataValue -- whith dataelement value == Beneficiary Call ID_104
SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'hsbXpo83f4I';

-- event dataValue
SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'ZTNtr3RK0kh';

SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'ioNKjuWD3s9' 
order by psi.programstageinstanceid desc;

-- https://links.hispindia.org/timor/api/system/id.csv?limit=10000

insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid) values
="(nextval('hibernate_sequence'),'"&B2&"', '2023-11-02','2023-11-02', '"&E2&"','"&E2&"','"&E2&"', "&C2&", "&D2&" ),"


update trackedentityinstance set created = now()::timestamp where created = '2023-11-02';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';

update trackedentityinstance set lastupdatedby = 1,storedby = 'admin';

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&C2&","&E2&",'2023-11-02','2023-11-02','"&D2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2023-11-02';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2023-11-02';

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&B2&","&J2&",'2023-12-09','2023-12-09','"&A2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2023-12-09';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2023-12-09';


update trackedentityattributevalue set created = now()::timestamp where created = '2023-12-12';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2023-12-12';

insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid) values
="(nextval('hibernate_sequence'),'"&B2&"', '2023-12-08','2023-12-08', 'false','false','false', "&C2&", 7214 ),"


update trackedentityinstance set created = now()::timestamp where created = '2023-12-08';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2023-12-08';

update trackedentityinstance set created = now()::timestamp where created = '2024-02-17';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-02-17';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-02-17';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-02-17';

update programinstance set created = now()::timestamp where created = '2024-02-17';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-02-17';

select * from programinstance where created::date = '2024-02-17';

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&B2&"', '2023-11-02', '2023-11-02', '"&D2&"', 'ACTIVE', "&C2&", 7295,'"&D2&"', "&E2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2023-11-02';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&C2&"', '2023-12-08', '2023-12-08', '"&E2&"', 'ACTIVE', "&B2&", 7295,'"&E2&"', "&D2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2023-12-08';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2023-12-08';

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&C2&", 7295,'2023-11-02','2023-11-02',"&E2&",'admin' ),"

update trackedentityprogramowner set created = now()::timestamp where created = '2023-11-02';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2023-11-02';

update trackedentityprogramowner set created = now()::timestamp where created = '2023-12-08';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2023-12-08';

insert into programstageinstance (programstageinstanceid, uid, created, lastupdated, programinstanceid, programstageid, attributeoptioncomboid, storedby,  executiondate, organisationunitid, status, deleted ) values
="(nextval('hibernate_sequence'),'"&C2&"', '2023-11-02', '2023-11-02', "&E2&", 7391, 24, 'admin','"&F2&"',"&D2&", 'ACTIVE','false'),"

select * programstageinstance  where created::date = '2023-12-27';

update programstageinstance set created = now()::timestamp where created = '2023-12-27';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2023-12-27';

update programstageinstance set created = now()::timestamp where created = '2023-11-02';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';



update programstageinstance set created = now()::timestamp where created = '2023-11-02';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';



-- MMU event insert query

insert into programstageinstance (programstageinstanceid, uid, created, lastupdated, programinstanceid, programstageid, attributeoptioncomboid, storedby, executiondate, organisationunitid, status, deleted ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2024-01-17', '2024-01-17', "&F2&", 7226, 24, 'admin','"&E2&"',"&G2&", 'ACTIVE','false'),"
 
-- 734978 + 334318 + 672290 = 1741586
update programstageinstance set created = now()::timestamp where created = '2024-01-17';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2024-01-17';

-- 

select * from organisationunit; 788 ( 36 + 751 + 1)

delete from organisationunit where hierarchylevel in(2,3);

select * from organisationunit where hierarchylevel = 2;
select * from organisationunit where hierarchylevel = 3;

-- 26/10/2023

delete from organisationunit where hierarchylevel in(2,3,4);
delete from program_organisationunits;
delete from programinstance;
delete from programstageinstance;
delete from trackedentityinstance;
delete from trackedentityprogramowner;
delete from trackedentityattributevalue;


select * from trackedentityinstance;
select * from programinstance;
select * from programstageinstance;

select count(*) from trackedentityinstance where created::date = '2023-11-01';
select count(*) from programinstance where created::date = '2023-11-01';
select count(*) from programstageinstance where created::date = '2023-11-01';





-- TEI delete based on created date


delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance where created::date = '2023-11-01');

delete from programstageinstance where created::date = '2023-11-01';

delete from programinstance where created::date = '2023-11-01';

delete from trackedentityattributevalue where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance 
where created::date = '2023-11-01');

delete from trackedentityprogramowner where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance 
where created::date = '2023-11-01');

delete from trackedentityinstance where created::date = '2023-11-01';



delete from programstageinstance 
where programinstanceid in (select programinstanceid from 
programinstance where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr'));

delete from trackedentityattributevalue where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr')

delete from programinstance where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr');

delete from trackedentityprogramowner where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr');

delete from trackedentityinstance where uid = 'ojfxSpZqSCr';

delete from programstageinstance 
where programinstanceid in (select programinstanceid from 
programinstance where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE'));




delete from trackedentityattributevalue where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE')

delete from programinstance where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE');

delete from trackedentityprogramowner where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE');

delete from trackedentityinstance where uid = 'tfwT5NFaesE';








-- level 2
SELECT StateID, StateName, StateCode,GovtStateID Language FROM m_state; -- 36

-- level --3 
SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID -- 710

-- level - 4

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID,
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID -- 6447;


select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.optionvalueid optionvalueID, opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid = 'ZE69SPZUlBr' order by ops.name;

-- optionValue with attribueValue

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.optionvalueid optionvalueID, opv.sort_order,cast(optionAttribute.value::json ->> 'value' AS VARCHAR) 
AS villageID from optionvalue opv 
JOIN json_each_text(opv.attributevalues::json) optionAttribute ON TRUE 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
INNER JOIN attribute attr ON attr.uid = optionAttribute.key
where ops.uid = 'p6fHp8sI0gA' and attr.uid = 'RDZKbFFn7EL' order by ops.name;



-- optionValue with attribueValue

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.optionvalueid optionvalueID, opv.sort_order,cast(optionAttribute.value::json ->> 'value' AS VARCHAR) 
AS villageID from optionvalue opv 
JOIN json_each_text(opv.attributevalues::json) optionAttribute ON TRUE 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
INNER JOIN attribute attr ON attr.uid = optionAttribute.key
where ops.uid = 'p6fHp8sI0gA' and attr.uid = 'RDZKbFFn7EL' order by ops.name;

-- organisationunit with attribueValue
select cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR)
AS BayerVanID,orgunit.organisationunitid, orgunit.uid,orgunit.name
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'OZW5netBBfD';


-- organisationunit with attribueValue
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'l38VgCtdLFD' and orgunit.hierarchylevel = 4;

select orgunit.organisationunitid, orgunit.uid,orgunit.name,
orgunit.parentid, parent.uid parentUID,
parent.organisationunitid parentID ,parent.name as parentname, concat(orgunit.uid,'-',parent.uid),
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
left join organisationunit parent on parent.organisationunitid = orgunit.parentid
where attr.uid = 'l38VgCtdLFD' and orgunit.hierarchylevel = 3
and orgunit.name = 'Not Disclosed';

SELECT orgGrpMember.organisationunitid,orgunitgrp.orgunitgroupid, 
orgunitgrp.uid,orgunitgrp.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from orgunitgroup orgunitgrp 
JOIN json_each_text(orgunitgrp.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
INNER JOIN orgunitgroupmembers orgGrpMember ON orggrpmember.orgunitgroupid = orgunitgrp.orgunitgroupid
where attr.code = 'XMLName';

-- for VanID
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'EnxzhgiA5ra' and orgunit.hierarchylevel = 4;


-- for HWC ID ( HWC facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'v0l6GSGw7TS' and orgunit.hierarchylevel = 5;

-- API
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&paging=false

-- // MY-sql installer
--https://dev.mysql.com/downloads/installer/
--https://downloads.mysql.com/archives/community/


-- My-SQL
SELECT VERSION();

SELECT USER(), CURRENT_USER;

SHOW GRANTS;

SHOW TABLE STATUS FROM db_iemr;


172.104.206.140 3306
hisp_web
GRgfW1@GRWg

hisp
GRgfW1@GRWg

Server IP : 172.104.206.140
User: piramal_dev
Pass: gWRE!@Fq1e$G
mysql root pass: @gWRE!Fq1e@$G#
Ye hai sir detail

CREATE USER 'hisp'@'%' IDENTIFIED BY 'GRgfW1G@RWg';
GRANT ALL PRIVILEGES ON *.*TO 'hisp'@'%';

-- 31/08/2023
-- from database name shared by client -- iemr

SHOW VARIABLES WHERE variable_name = 'port';
SELECT VERSION();

SELECT USER(), CURRENT_USER;

SHOW GRANTS;

SHOW TABLE STATUS FROM db_iemr;

SELECT USER FROM mysql.user;



-- 13/09/2023

 select * from `m_district`
 
 select * from `m_districtblock`;
 
 select * from `m_state`;
 
select VisitNo,CreatedDate,VisitCode from t_benvisitdetail;

SELECT * FROM t_benvisitdetail;  30002100000003
 
select * from `m_van`

SELECT * FROM `m_facility`

select * from `m_chiefcomplaint`;

select * from `t_benchiefcomplaint`


select * from `m_vantype`;

select * from `m_bloodgroup`;

`db_iemr`


-- master data -- 14/09/2023
select * from m_visitreason;
select * from m_visitcategory; 
select * from m_subvisitcategory;
select * from t_prescription;
select * from m_diagnosisprovided; SELECT * FROM t_diagnosisprovided; -- not present
select * from m_procedurename;  SELECT * FROM m_procedure;
select * from t_lab_testorder;
select * from m_highriskstatus; SELECT * FROM t_highriskstatus; SELECT * FROM m_highriskstatus; -- NOT present
select * from m_highriskcondition; -- not present
select * from t_benreferdetails;

SELECT * FROM `m_chiefcomplaint`;

SELECT * FROM t_benreferdetails;


SELECT * FROM `t_benreferdetails`;

SELECT * FROM i_ben_flow_outreach;
 
SELECT * FROM t_benvisitdetail;
 
SELECT DISTINCT(beneficiary_id) FROM i_ben_flow_outreach;

SELECT DISTINCT(*) FROM i_ben_flow_outreach;
 
 
 SELECT * FROM t_ancdiagnosis;
 
 SELECT * FROM `m_gender`;
 
 SELECT * FROM `m_procedure`;
 
 SELECT * FROM `m_referralreason`;
 
 SELECT * FROM t_phy_vitals;
 
 SELECT * FROM `m_labtests`;
 
https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:4
https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:3

-- for attributeValue
https://links.hispindia.org/amrit/api/trackedEntityAttributes.json?fields=id,displayName,code&paging=false
https://links.hispindia.org/amrit/api/optionSets/p6fHp8sI0gA.json?fields=id,displayName,code,options[id,name,code,attributeValues[attribute[id,displayName,code],value]]

https://links.hispindia.org/amrit/api/trackedEntityAttributes.json?fields=id,displayName,code&paging=false



https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=HExrvaAcDEB&trackedEntityInstance=aDtGTyYTUqx&paging=false&fields=trackedEntityInstance,orgUnit,enrollment,enrollmentDate,incidentDate,status

https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=HExrvaAcDEB&fields=trackedEntityInstance,orgUnit,enrollment,enrollmentDate,incidentDate,status,&trackedEntityInstance=aDtGTyYTUqx&skipPaging=true

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=oeJ39c39Uy1&ouMode=DESCENDANTS&program=vyQPQ07JB9M&attribute=HKw3ToP2354:EQ:396361&paging=false

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=vyQPQ07JB9M&attribute=HKw3ToP2354&skipPaging=true

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=vyQPQ07JB9M&&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

&filter=attributeValues.attribute.id:eq:

&filter=attributeValues.attribute.id:eq:HKw3ToP2354

https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&paging=false

https://links.hispindia.org/amrit/api/trackedEntityInstances/KyZ2a02rtsN.json

-- enrollment list
https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=GDInuuoYIQw&paging=false&ouMode=DESCENDANTS

-- event list
https://links.hispindia.org/amrit/api/events.json?program=vyQPQ07JB9M&skipPaging=true

-- orgUnit post to dhis2 query

-- teli list
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?program=vyQPQ07JB9M&ou=NQjElqVFZTm&ouMode=DESCENDANTS
https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=GDInuuoYIQw&ouMode=DESCENDANTS&paging=false

-- dhis 2 url -- https://links.hispindia.org/amrit/dhis-web-commons/security/login.action
-- version -- 2.40.0.1
-- database name -- piramal_240

-- level - 2
SELECT StateID, StateName, StateCode,GovtStateID Language FROM m_state;

-- level - 3

SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID


SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID where md.GovtDistrictID is null;

select * from `m_districtblock`

-- level - 4

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID

SELECT mdb.BlockID , mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where md.GovtDistrictID is null;

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.DistrictName,md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where md.DistrictName = 'Biswanath';


SELECT mdb.BlockID , mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where mdb.GovSubDistrictID is null;


SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID


 
 
 


SELECT * FROM i_beneficiaryaccount;

SELECT IsOutbound FROM t_bencall;

SELECT  ReceivedRoleName, CZcallStartTime, CZcallEndTime,
isCallAnswered,isCallDisconnected,IsOutbound,CreatedDate FROM t_bencall;

SELECT * FROM i_beneficiaryaddress;

SELECT * FROM t_outboundcallrequest;

SELECT * FROM t_104benmedhistory;

SELECT DiseaseSummaryID,DiseaseSummary FROM t_104benmedhistory;

SELECT * FROM t_104benmedhistory;

SELECT DiseaseSummaryID,DiseaseSummary FROM t_104benmedhistory;

SELECT * FROM i_beneficiaryaddress;

SELECT * FROM m_104diseasesummary;

SELECT * FROM t_feedback;

SELECT * FROM m_agegroup;

SELECT * FROM t_feedback;

SELECT * FROM t_104benmedhistory;

SELECT DISTINCT beneficiary_reg_id,beneficiary_id,ben_name,date(ben_dob),ben_gender  
FROM i_ben_flow_outreach;

SELECT DISTINCT beneficiary_reg_id,beneficiary_id,ben_name,date(ben_dob),ben_gender,
districtID, date(created_date) FROM i_ben_flow_outreach;


-- 11/10/2023

select count(*) from i_beneficiarydetails; -- 4673109

SELECT * FROM i_beneficiarydetails limit 10000;  


beneficiary_reg_id

SELECT COUNT(DISTINCT BeneficiaryDetailsId ) FROM i_beneficiarydetails;  -- 4673109
SELECT COUNT(DISTINCT BeneficiaryRegID ) FROM i_beneficiarydetails;  -- 119718

select * from i_beneficiarydetails where 
BeneficiaryRegID != '(NULL)';

SELECT * FROM i_beneficiarydetails WHERE 
BeneficiaryRegID IS not NULL;

select * from i_beneficiarydetails where CreatedDate
between '2023-10-01 12:00:00' and '2023-10-01 23:30:00';

select * from i_beneficiarydetails where cast(CreatedDate AS DATE)
between '2023-10-01' and '2023-10-01';

select * from i_beneficiarydetails 
where BeneficiaryRegID = 265244;


356916757841

between DATE('2023-10-01') and DATE('2023-10-01');

SELECT * FROM i_beneficiarydetails WHERE 
BeneficiaryRegID is null;

select * from i_beneficiarydetails where 
BeneficiaryRegID = 265244;



SELECT * FROM `m_blocksubcentermapping`;

SELECT * FROM `m_providerservicemapping`;

SELECT * FROM `m_serviceprovider`;

SELECT * FROM `m_servicemaster`;

-- 12/10/2023 after call


-- db_identity
select *  from i_beneficiarymapping limit 1;

select *  from i_beneficiarydetails;



-- db_iemr
select *  from t_benvisitdetail;

select *  from t_bencall;

select * from m_districtbranchmapping;




--- 17/10/2023
select *  from i_beneficiarymapping where BenRegId 
in ( 265244,265245,265248) -- and BenAddressId ; 

select *  from i_beneficiaryaddress where BenAddressID 
in(2394,2395,2398 );

details  regID  address
2406	265244  2394
2407	265245  2395 
2410	265248  2398 

2394
2395
2398


select *  from i_beneficiaryaddress where BenAddressID 
in(2394,2395,2398 );


-- final
select *  from i_beneficiaryaddress where BenAddressID 
in( select BenAddressId from i_beneficiarymapping where BenRegId 
in ( select BeneficiaryRegID from i_beneficiarydetails WHERE 
BeneficiaryRegID in ( 265244,265245,265248 ) ) );

-- visit

select * from t_benvisitdetail where BeneficiaryRegID 
in ( 265244,265245,265248);

SELECT * FROM m_providerservicemapping where 
ProviderServiceMapID = 18;

SELECT * FROM m_serviceprovider where ServiceProviderID in (
select 12 );

SELECT * FROM m_serviceprovider where ServiceProviderID in (
select ServiceProviderID from m_providerservicemapping where
ProviderServiceMapID in ( select ProviderServiceMapID from t_benvisitdetail
where BeneficiaryRegID in ( 265244,265245,265248)));

select * from m_facility mf; 

select *  from t_benvisitdetail limit 10;

select * from m_van; 
where ProviderServiceMapID = 18;

select * from m_facility mf

select count(*) from m_districtbranchmapping; -- village -- 659790

select count(*) from m_districtblock ; -- block 6459 

select count(*) from m_district; -- 710

select count(*) from m_state; -- 36


-- 18/10/2023

select BenAddressID,PermVillageId ,PermVillage   
from i_beneficiaryaddress where VanID = 3 and BenAddressID
in( select BenAddressId from i_beneficiarymapping where BenRegId 
in ( select BeneficiaryRegID from i_beneficiarydetails WHERE 
BeneficiaryRegID != 'null')) and PermStateId = 5;

SELECT * FROM i_beneficiarydetails WHERE VanID = 2 LIMIT 1000;
BeneficiaryRegID in ( 265244,265245,265248 );

-- visit

select count(*) from t_bencall -- 2887837;
where BeneficiaryRegID in ( 265244,265245,265248)
limit 100


select * from t_bencall where BeneficiaryRegID
is not null limit 10000; -- 739947

select * from m_calltype mc 


-- 19/10/2023

select * from t_bencall where BeneficiaryRegID
is not null and TypeOfComplaint is not null limit 10000; -- 739947

select * from t_bencall where BeneficiaryRegID
is not null and TypeOfComplaint is not null limit 10000; -- 739947


select * from t_bencall where Category is not null 
and SubCategory is not null;

select * from t_bencall where Category is not null 
and SubCategory is not null;

select * from t_bencall where
SubCategory is not null;

select * from m_calltype mc 

select * from m_category mc ;

select * from m_subcategory ms; 

select * from m_serviceprovider ms 

select * from m_diseasetype md  mc 

select * from m_chiefcomplaint mc 


-- 01/11/2023

select * from db_iemr.m_van; 

SELECT COUNT(*) FROM db_identity.i_beneficiarydetails where 
VanID = 3; -- 3386136

SELECT COUNT(*) FROM i_beneficiarydetails WHERE 
BeneficiaryRegID IS  NULL; -- 4553391

select count(*) from i_beneficiarydetails where 
BeneficiaryRegID is not null; -- 119718


-- 20/10/2023
-- final query for 104 program registration details


SELECT * FROM i_beneficiarydetails 
WHERE BeneficiaryRegID IS NOT NULL;

i_beneficiarydetails -- `LastName`,`Gender`,`MiddleName`,`FirstName`,`BeneficiaryRegID`,`DOB`,`VanID``CreatedDate` -- enrollmentDate

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate
FROM i_beneficiarydetails i_ben_details 

WHERE i_ben_details.BeneficiaryRegID IS NOT NULL;


SELECT *  FROM i_beneficiaryaddress WHERE BenAddressID 
IN( SELECT BenAddressId FROM i_beneficiarymapping WHERE BenRegId 
IN ( SELECT BeneficiaryRegID FROM i_beneficiarydetails WHERE 
BeneficiaryRegID IN ( 265244,265245,265248 ) ) );

i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage

SELECT i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage FROM i_beneficiaryaddress i_ben_address




SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL;

-- 26/10/2023

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL;

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 10;

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 10;

-- event data call list

SELECT db_iemr.t_bencall.CallTypeID,db_iemr.t_bencall.Category, mct.CallType FROM db_iemr.t_bencall 
INNER JOIN db_iemr.m_calltype mct ON mct.CallTypeID = db_iemr.t_bencall.CallTypeID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 937838 );

SELECT db_iemr.t_bencall.* FROM db_iemr.t_bencall WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( SELECT db_identity.i_beneficiarydetails.BeneficiaryRegID
 FROM db_identity.i_beneficiarydetails )
LIMIT 1000;

SELECT db_iemr.t_bencall.CallTypeID, mct.CallType FROM db_iemr.t_bencall 
INNER JOIN db_iemr.m_calltype mct ON mct.CallTypeID = db_iemr.t_bencall.CallTypeID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 937838 );

INNER JOIN db_iemr.t_104benmedhistory benhistory ON benhistory.BeneficiaryRegID = db_iemr.t_bencall.BeneficiaryRegID 
,benhistory.DiseaseSummary
select * from db_iemr.m_category mc ;

select * from db_iemr.m_subcategory ms; 

select * from db_iemr.m_diseasetype md  mc 


select * from db_iemr.t_bencall where Category is not null 
and SubCategory is not null;

select * from db_iemr.t_bencall where Category is not null 
and SubCategory is not null;

select * from db_iemr.t_104benmedhistory; 

select * from db_iemr.m_diseasetype md  mc 

select * from db_iemr.m_104diseasesummary order by DiseaseName md 

select * from db_iemr.m_calltype order by CallType;


-- MMU -- registration -- 01/11/2023

SELECT * FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 3; -- TM

SELECT * FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 1; -- MMU

-- MMU registration data
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.Gender ,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_details.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 1 ) -- 11691-- MMU

-- mmu event -- -- 01/11/2023
SELECT * FROM db_iemr.t_benvisitdetail WHERE BeneficiaryRegID IN ( 5090720,
5090969,5278131,5330794,5337246);

-- MMU events
-- stage -- 1
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.VisitReason,
db_iemr.t_benvisitdetail.VisitCategory,db_iemr.t_benvisitdetail.SubVisitCategory,
db_iemr.t_benvisitdetail.RCHID,db_iemr.t_benvisitdetail.CreatedDate FROM db_iemr.t_benvisitdetail
where db_iemr.t_benvisitdetail.BeneficiaryRegID in ( select i_ben_details.BeneficiaryRegID from
i_beneficiarydetails i_ben_details where i_ben_details.VanID IN 
( SELECT VanID FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 1 )) -- 82001 MMU events -- Beneficiary MMU Visit Details;

-- stage -- 2
select db_iemr.t_phy_vitals.BeneficiaryRegID,

db_iemr.t_phy_vitals.SystolicBP_1stReading,
db_iemr.t_phy_vitals.DiastolicBP_1stReading,
db_iemr.t_phy_vitals.CreatedDate from db_iemr.t_phy_vitals -- MMU stage blood pressure

-- stage -- 3
select PrescriptionID,count( PrescriptionID ) 
from db_iemr.t_prescribeddrug group by  PrescriptionID;

SELECT * FROM db_iemr.t_prescribeddrug where 
PrescriptionID = 1 and BeneficiaryRegID in( ) -- MMU  query 

-- stage -- 4
select db_iemr.t_benreferdetails.BeneficiaryRegID,
db_iemr.t_benreferdetails.referredToInstituteID,
db_iemr.t_benreferdetails.referredToInstituteName 
from db_iemr.t_benreferdetails where db_iemr.t_benreferdetails.referredToInstituteID
is not null -- mmu referal details limit 1000;


-- stage -- 5 lab test
select db_iemr.t_lab_testorder.BeneficiaryRegID,db_iemr.t_lab_testorder.BenVisitID,
db_iemr.t_lab_testorder.ProcedureID, db_iemr.t_lab_testorder.ProcedureName,proname.ProcedureType,
db_iemr.t_lab_testorder.CreatedDate from db_iemr.t_lab_testorder 
INNER JOIN db_iemr.m_procedure proname ON proname.ProcedureID = db_iemr.t_lab_testorder.ProcedureID 
limit 1000; -- MMU test



-- TM 
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.Gender ,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_details.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 3 ) -- TM;


-- mmu event -- -- 01/11/2023
SELECT * FROM db_iemr.t_benvisitdetail WHERE BeneficiaryRegID IN ( 5090720,
5090969,5278131,5330794,5337246);

select count(*) from t_benvisitdetail -- 2036512;


-- 104 final registration Query


SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 1000;
-- final event query


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound,db_iemr.t_bencall.CallTime,db_iemr.t_bencall.CallEndTime,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds,
db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.TypeOfComplaint
,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;


AND db_iemr.t_bencall.BeneficiaryRegID IN ( 265244,
265245,265248,265252,265253,265262,265271,265276,265279,265280 );

111102 + 1000
112103

-- for 104 program event data data for category type/sub type/Diasease

-- 24/11/2023 query send by client team

select t.BenCallID,t.BeneficiaryRegID,t.CallID,t.PhoneNo,t.CallTypeID,
t.is1097,c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
t.IsOutbound,t.CallTime,t.CallEndTime,t.ReceivedRoleName,
t.CreatedDate,t.TypeOfComplaint,m.CallType from db_iemr.t_bencall t

inner join db_iemr.t_104benmedhistory b on b.BenCallID=t.BenCallID
inner join db_iemr.m_calltype m on m.CallTypeID=t.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID;


WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 265244,
265245,265248,265252,265253,265262,265271,265276,265279,265280 );


-- 104 final event query as on 08/12/2023

SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;




-- 31/10/2023-- limit 1000;  -- 265244 to 940214
-- 01/11/2023-- limit 10000; -- 940539 to 4696159

and i_ben_details.BeneficiaryRegID  > 940214

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
AND i_ben_details.BeneficiaryRegID  > 2826563 and i_ben_details.BeneficiaryRegID  <= 4696159 
order by i_ben_details.BeneficiaryRegID;



SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
AND i_ben_details.BeneficiaryRegID  > 2929052 and i_ben_details.BeneficiaryRegID  <= 4696159 



-- 02/11/2023

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
AND i_ben_details.BeneficiaryRegID  > 3502979 ORDER BY i_ben_details.BeneficiaryRegID; -- 105713



-- event -- 310343


SELECT DISTINCT (db_iemr.t_bencall.BenCallID),db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097,db_iemr.t_bencall.Category,db_iemr.t_bencall.SubCategory,
db_iemr.t_bencall.IsOutbound,db_iemr.t_bencall.CallTime,db_iemr.t_bencall.CallEndTime,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS DifferenceInSeconds,
db_iemr.t_bencall.ReceivedRoleName,CAST(db_iemr.t_bencall.CreatedDate AS DATE),db_iemr.t_bencall.TypeOfComplaint
,mct.CallType  FROM db_iemr.t_bencall 
INNER JOIN db_iemr.m_calltype mct ON mct.CallTypeID = db_iemr.t_bencall.CallTypeID
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 2826563);



select DISTINCT (db_iemr.t_bencall.ReceivedRoleName) from db_iemr.t_bencall 


-- final query  for MMU -- 07/11/2023

select * from db_iemr.m_van;

select * from db_iemr.m_servicemaster ms ;

SELECT * FROM db_iemr.m_serviceprovider;

SELECT * FROM db_iemr.m_servicemaster;

select *  from db_iemr.m_van
where ProviderServiceMapID in (6,7,9,10,11,18); -- MMU 

select *  from db_iemr.m_van
where ProviderServiceMapID in (12,13,14,15,16,17,19,21); -- TM 

select *  from db_iemr.m_serviceprovider
where ServiceProviderID in (3,4,5,6,12); -- MMU service provider

select *  from db_iemr.m_servicemaster;

select *  from db_iemr.m_serviceprovider
where ServiceProviderID = 12; 

select * from db_iemr.m_providerservicemapping
where ServiceID = 2; -- MMU

select * from db_iemr.m_providerservicemapping
where ServiceID = 4; -- TM


select * from db_iemr.m_providerservicemapping
where ServiceID = 8; -- HWC

-- final query  for MMU -- 07/11/2023

-- MMU -- registration -- 11691 
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.Gender ,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_details.VanID IN ( SELECT VanID FROM db_iemr.m_van where ProviderServiceMapID in (6,7,9,10,11,18) ) 
-- 11691 -- MMU


SELECT * FROM db_iemr.m_van where ProviderServiceMapID in (6,7,9,10,11,18 );

select *  from db_iemr.m_servicemaster;
select * from db_iemr.m_providerservicemapping
where ServiceID = 2; -- MMU

select *  from db_iemr.m_serviceprovider
where ServiceProviderID in (3,4,5,6,12); 

select *  from db_iemr.m_serviceprovider
where ServiceProviderID in (3,4,5,6,12); -- MMU orgUnit list -- 5


-- MMU stage data
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.VisitReason,
db_iemr.t_benvisitdetail.VisitCategory,db_iemr.t_benvisitdetail.SubVisitCategory,
db_iemr.t_benvisitdetail.RCHID,db_iemr.t_benvisitdetail.CreatedDate FROM db_iemr.t_benvisitdetail
where db_iemr.t_benvisitdetail.BeneficiaryRegID in ( select i_ben_details.BeneficiaryRegID from
i_beneficiarydetails i_ben_details where i_ben_details.VanID IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ));



-- call on 28/11/2023 for update 104 registration query 
 -- correct query i_ben_mapping table is main table in which 
 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3
LIMIT 10000;


 
-- 29/11/2023 with venkat

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID =  3; -- 3383561 -- 104 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID !=  3; -- 1275832 -- other 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ); -- 1135046 -- MMU

SELECT *  FROM db_iemr.m_servicemaster;
-- TM
SELECT * FROM db_iemr.m_providerservicemapping
WHERE ServiceID = 4; -- TM 

SELECT * FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21); -- TM


SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID =  3; -- 3383561 -- 104 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID !=  3; -- 1275832 -- other 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ); -- 1135046 -- MMU


SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21) ); -- 137537 -- TM 

SELECT COUNT(*) FROM i_beneficiarymapping; -- 4659393

SELECT * FROM db_iemr.m_providerservicemapping
WHERE ServiceID = 2; -- FLW 

SELECT * FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21); -- TM


-- TM - 137537
-- MMU -- 1135046
-- 104 -- 3383561

-- total - 137537 + 1135046 + 3383561 + 3249 == 4,659,393
-- TM - 137537
-- MMU -- 1135046
-- 104 -- 3383561
-- 1097 -- 0
-- HWC -- 0
-- others -- 3249
-- VanID -- 0 -- 2536
-- VanID -- 6 -- 38 -- MCTS
-- VanID -- 10 -- 675 -- Reserved for future

-- 104 -- registration
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3
LIMIT 1000;

-- -- 104 -- registration 2022-2023
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3 AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2024-01-01 00:00:00'; -- 257857



-- MMU 

SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE)
, i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) )
LIMIT 1000;

select * from i_beneficiarydetails where BeneficiaryRegID = 276026; -- created date diffrent 
select * from i_beneficiarymapping where BenRegId  = 276026; -- -- created date diffrent
--- 29/11/2023 end

-- MMU update on 30/11/2023 

SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE)
, i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId
AND i_ben_details.VanID = i_ben_mapping.VanID 

INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.VanSerialNo = i_ben_mapping.BenAddressId
AND i_ben_address.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ) -- 1135085
LIMIT 10000;





-- MMU Registration 2022 to 2023

SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE)
, i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 

INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId
AND i_ben_details.VanID = i_ben_mapping.VanID 

INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.VanSerialNo = i_ben_mapping.BenAddressId
AND i_ben_address.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ) AND i_ben_mapping.CreatedDate 
between '2022-01-01 00:00:00' and '2024-01-01 00:00:00'; -- 986836


--  MMU all Stage data
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName
FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID


where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ));


select * from db_iemr.t_prescription tp 
limit 1000

-- update MMU all stage data with DiagnosisProvided

SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ))
limit 100000;


-- TM -- 04/12/2023
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL

AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21) )
LIMIT 10000;


SELECT * FROM db_iemr.m_van WHERE -- VanName = 'PSMRI MMU Majuli'
ProviderServiceMapID IN (6,7,9,10,11,18); -- MMU -- orgUnit

SELECT * FROM db_iemr.m_van WHERE -- VanName = 'PSMRI MMU Majuli'
ProviderServiceMapID IN (12,13,14,15,16,17,19,21); -- TM orgUNit

-- TM registration data from 2022 to 2023

-- TM 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,
i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN ( 12,13,14,15,16,17,19,21 ) ) 
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2023-01-01 00:00:00';

-- AND  CAST(i_ben_mapping.CreatedDate AS DATE) between '2022-01-01' and '2022-12-31';

-- LIMIT 10000; -- 108046

-- TM registration final 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,
i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN ( 12,13,14,15,16,17,19,21 ) ) 
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2024-01-01 00:00:00'; --- 121778

-- AND  CAST(i_ben_mapping.CreatedDate AS DATE) between '2022-01-01' and '2022-12-31';

-- LIMIT 10000; -- 2023 -- 13732 total -- 121778

--  event data TM Stage -1 
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.VisitReason,
db_iemr.t_benvisitdetail.VisitCategory,db_iemr.t_benvisitdetail.SubVisitCategory,
db_iemr.t_benvisitdetail.RCHID,db_iemr.t_benvisitdetail.CreatedDate FROM db_iemr.t_benvisitdetail
where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (12,13,14,15,16,17,19,21) ));


--
select * from db_iemr.m_visitcategory;
select * from db_iemr.m_subvisitcategory;

--

-- TM stage data
select * from db_iemr.t_ncddiagnosis tn; 
select NCD_Condition, from 
db_iemr.t_ncddiagnosis limit 1000; 

select * from db_iemr.t_pncdiagnosis tp;
select ProvisionalDiagnosis from 
db_iemr.t_pncdiagnosis limit 1000;

select * from db_iemr.t_ancdiagnosis ta;
select HighRiskCondition,ComplicationOfCurrentPregnancy  
from db_iemr.t_ancdiagnosis limit 10000;

select SystolicBP_1stReading,DiastolicBP_1stReading  
from db_iemr.t_phy_vitals tpv limit 1000; 


select * from db_iemr.t_tmrequest limit 1000;


select PrescriptionID  from db_iemr.t_patientissue limit 1000;

select PrescriptionID  from db_iemr.t_prescribeddrug limit 1000;

select * from db_iemr.t_tmrequest limit 1000;

select PrescriptionID  from db_iemr.t_patientissue limit 1000;

select PrescriptionID  from db_iemr.t_prescribeddrug limit 1000;

select referredToInstituteName  from db_iemr.t_benreferdetails limit 1000;

select ProcedureName  from db_iemr.t_lab_testorder limit 1000;

SELECT *  FROM db_iemr.t_prescription LIMIT 1000; -- 2139823

-- master table list 06/12/2023
select * from db_iemr.m_ncdscreeningcondition mn 

select * from db_iemr.m_status ms 

select * from db_iemr.m_complication mc 

select count(*) from db_iemr.t_prescription limit
10000; -- 2139823

select * from db_iemr.t_prescription limit
10000; 

-- TM all stage events data


SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (12,13,14,15,16,17,19,21) ));


-- 13/12/2023

-- db_iemr.m_institution details with hierarchy
SELECT ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,institution.InstitutionID 
from db_iemr.m_institution institution
INNER JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
INNER JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
INNER JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID; 


-- TM all stage events data db_iemr.m_institution details with hierarchy
SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (12,13,14,15,16,17,19,21) ));






-- MMU all stage events data db_iemr.m_institution details with hierarchy

SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.CreatedDate between '2022-01-01 00:00:00' and '2023-01-01 00:00:00'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) )); -- 851707



SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.CreatedDate between '2023-01-01 00:00:00' and '2023-06-30 00:00:00'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) )); -- 728701 -- 1086941


SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.CreatedDate between '2023-06-30 00:00:01' and '2024-01-01 00:00:00'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) )); -- 358240 + 728701 -- 1086941



--


SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
-- AND i_ben_mapping.createddate between '2019-01-01 00:00:00' and '2019-12-31 23:59:59' 
LIMIT 1000; 


 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL 

AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
LIMIT 1000;

4659393 - 4451507 -- 4454108
 
 
 
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 1000;


SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenDetailsId = i_ben_details.BeneficiaryDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
LIMIT 1000;


-- from t_bencall BeneficiaryRegID

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM db_iemr.t_bencall t
left join i_beneficiarymapping i_ben_mapping ON i_ben_mapping.benregid = t.beneficiaryregid
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
LIMIT 1000;


db_identity.i_beneficiarydetails == BeneficiaryRegID
db_identity.i_beneficiarymapping  = BenRegId


SELECT * FROM i_beneficiarydetails WHERE 
BeneficiaryDetailsId = 3294768;

select * from db_identity.i_beneficiarymapping 
where BenRegId=5773338;

select count(*) from db_identity.i_beneficiarymapping  --4659393

select count(*) from db_identity.i_beneficiarymapping 
where BenRegId is not null; --4659393

where BenRegId=5773338;



-- 02/01/2023

select * from db_iemr.m_104diseasesummary md; 
select * from db_iemr.t_ncddiagnosis tn; 

select DISTINCT (NCD_Condition) from 
db_iemr.t_ncddiagnosis where NCD_Condition is not null;

select * from db_iemr.m_ncdscreeningcondition;

select * from db_iemr.t_ancdiagnosis ta limit 1000 

-- MMU month wise all stage events data db_iemr.m_institution details with hierarchy

SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where CAST(db_iemr.t_benvisitdetail.CreatedDate AS DATE ) between '2022-01-01' and '2022-02-28'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ));


-- Drug Prescription ID
-- Procedure Name
-- Diagnosis provided
-- Complication of current pregnancy
-- High risk condition
-- Provisional Diagnosis
-- Visit Sub-Category


-- jan 2022 -- 12923
-- feb 2022 -- 13164


select * from program;

select * from programstage where 
programid = 7220

select * from programstageinstance where 
programstageid = 7226;


-- 11/01/2024 new indicators relatd queries

select * from db_iemr.t_nhmagentrealtimedata limit 1000; -- 25


select * from db_iemr.t_104prescription; -- 62921

select * from db_iemr.t_104benmedhistory limit 1000; -- 322279


select * from db_iemr.t_detailedcallreport 
limit 1000; -- 863611

select db_iemr.t_detailedcallreport.AgentName,db_iemr.t_detailedcallreport.Campaign_Name,
db_iemr.t_detailedcallreport.AgentID, db_iemr.t_detailedcallreport.Call_Start_Time,
db_iemr.t_detailedcallreport.Call_End_Time,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_detailedcallreport.Call_End_Time,
db_iemr.t_detailedcallreport.Call_Start_Time)) AS duration_second
from db_iemr.t_detailedcallreport 
limit 1000;


select db_iemr.t_detailedcallreport.Campaign_Name,
db_iemr.t_detailedcallreport.Call_Start_Time,
db_iemr.t_detailedcallreport.Call_End_Time,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_detailedcallreport.Call_End_Time,
db_iemr.t_detailedcallreport.Call_Start_Time)) AS duration_second
from db_iemr.t_detailedcallreport 
limit 1000;


-- 12/01/2024 for 104 shared by client

SELECT Count(distinct case when db_iemr.t_bencall.ReceivedRoleName like '%HAO%' and
db_iemr.t_bencall.IsOutbound is false
then db_iemr.t_bencall.BenCallID end) As Total_Calls,
count(distinct db_iemr.t_bencall.BeneficiaryRegID) As Unique_beneficiary,
count(distinct case when (db_iemr.t_bencall.ReceivedRoleName like '%HAO%' 
and db_iemr.t_bencall.IsOutbound is false) then db_iemr.t_bencall.CallID end) As Unique_Calls,
count(c.CategoryName) As Category,count(s.SubCategoryName) As Subcategory,count(b.SelecteDiagnosis) As Diasease
FROM db_iemr.t_bencall
 
inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
 
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;



-- 17/01/2024

SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, 
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL 
and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

inner join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID 

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL 
and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;



select * from db_iemr.t_104prescription; 62921 -- join with BenCallID



-- 18/01/2024

-- 104 query shared by venkat

SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall
left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;





SELECT distinct db_iemr.t_bencall.CallID, 
p.PrescriptionID,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;

















-- 19/01/2024
-- 104 query shared by venkat
SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;


SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL and 
AND db_iemr.t_bencall.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59';



-- 104 final query as on 08/02/2024
SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType
FROM db_iemr.t_bencall

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
left join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

AND db_iemr.t_bencall.CreatedDate between '2022-01-01 00:00:00' and '2023-12-31 23:59:59';













SELECT count(distinct db_iemr.t_bencall.BenCallID),db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL and 
AND db_iemr.t_bencall.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59';


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType
FROM db_iemr.t_bencall

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
left join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID


WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;

SELECT count(*) from  db_iemr.t_bencall; -- 2887837

-- agent query for add new program Agent
select CampaignName,Loggedin,CreatedDate,LastModDate,Incall,
HOLD,AWT,NotReady,Free,Aux  from db_iemr.t_nhmagentrealtimedata; -- 25

select db_iemr.t_detailedcallreport.SessionID,
db_iemr.t_detailedcallreport.Queue_time, from db_iemr.t_detailedcallreport
where db_iemr.t_detailedcallreport.SessionID in ( );


-- SessionID duplicate

select db_iemr.t_detailedcallreport.SessionID,
db_iemr.t_detailedcallreport.Queue_time from db_iemr.t_detailedcallreport
where db_iemr.t_detailedcallreport.SessionID in ( 1696267902.8164000000,
1687632180.3517000000);

select db_iemr.t_104prescription.BenCallID, db_iemr.t_104prescription.PrescriptionID
from db_iemr.t_104prescription
where db_iemr.t_104prescription.BenCallID in ( );


-- 08/02/2024
-- Queue_time for indicators -- table t_detailedcallreport 
-- agent registration 
select date(Call_Start_Time), AgentID as AgentID ,
Campaign_Name  As Campaign_Name,avg(Queue_time) 
from db_iemr.t_detailedcallreport 
group by date(Call_Start_Time), Campaign_Name,AgentID;

select date(Call_Start_Time), avg(Queue_time) 
from db_iemr.t_detailedcallreport group by date(Call_Start_Time);

select  *  from db_iemr.t_detailedcallreport limit 1000;


-- agent update indicator count query

select date(CreatedDate) As Date,
(case when CampaignName in ('H_104_Hybrid_CO','H_104_CO','H_104_PD_MH') then 'CO' 
when CampaignName in ('H_104_Hybrid_HAO','H_104_HAO','ECD_ASSOCIATE','ECD_OUTBOUND_ANM') then 'HAO'
when CampaignName in ('H_104_Hybrid_MO','H_104_MO','ECD_OUTBOUND_MO') then 'MO' end) As Campaign_Name,
sum(Loggedin) As Agents_loggedin,
(sum(Incall)+sum(Hold)) As Agents_Incall,
sum(AWT) As Agents_Closure,
(sum(Free)+Sum(NotReady)+sum(Aux)) As Agents_Idle
from db_iemr.t_nhmagentrealtimedata
where CampaignName in ('H_104_Hybrid_CO','H_104_Hybrid_HAO','H_104_Hybrid_MO','H_104_CO','H_104_MO',
'H_104_HAO','ECD_ASSOCIATE','H_104_PD_MH','ECD_OUTBOUND_ANM','ECD_OUTBOUND_MO')
group by Date,Campaign_name;




-- -- 1097 registration query  13/02/2024

-- 1097 registration query 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict

FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL 
-- and i_ben_address.PermStateId = 19 and i_ben_address.PermDistrictId = 332
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 

-- AND i_ben_address.PermSubDistrictId IS NOT NULL
-- AND i_ben_mapping.VanID = 1
LIMIT 10000; -- 187864




-- 1097 registration query final
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, 
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,
i_ben_details.Gender,YEAR(i_ben_details.DOB),
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_details.SexualOrientationType,i_ben_address.PermDistrictId, i_ben_address.PermDistrict

FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL 
-- and i_ben_address.PermStateId = 19 and i_ben_address.PermDistrictId = 332
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 
order by i_ben_mapping.BenRegId ASC; -- till 6828 done


SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_details.preferredLanguage 
FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_mapping.BenRegId > 6828
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2023-12-31 23:59:59';



SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_details.preferredLanguage 
FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
and i_ben_address.PermDistrict = 'Not Disclosed'




select * from i_beneficiarydetails limit 1000;

select count(*) from 1097_db_1097_identity.i_beneficiarymapping;
-- master table

select * from 1097_db_iemr.m_sexualorientation ms;


-- 1097 event query 
select count(*) from 1097_db_iemr.t_bencall;


-- 19/02/2024 ServiceProviderName ServiceProviderName As Project_Name
select m.ProviderServiceMapID,p.ServiceProviderName  As Project_Name,s.ServiceName from m_providerservicemapping m
inner join m_serviceprovider p on p.ServiceProviderID=m.ServiceProviderID
inner join m_servicemaster s on s.ServiceID=m.ServiceID;


-- 1097 event query

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 1097_db_iemr.t_bencall.BeneficiaryRegID,
1097_db_iemr.t_bencall.PhoneNo,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,
1097_db_iemr.t_bencall.CreatedDate
 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

and 1097_db_iemr.t_bencall.BeneficiaryRegID  = 7110;


-- mysql query for age calculation

select CURDATE();
select NOW();
year(curdate())-year(1097_db_iemr.t_bencall.CreatedDate) as StudentAge from AgeDemo;
SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),'2010-11-25')), '%Y')+0 AS Age;
-- 1097 event query with ageOnVisit

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType

 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL -- 594241



-- 2nd query for age on visit
SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,1097_db_iemr.t_bencall.CreatedDate,

year(1097_db_iemr.t_bencall.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(1097_db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(1097_db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') As IsOutbound,
1097_db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 

1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType

FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL limit 1000

-- 26/02/2024 1097 event query

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,1097_db_iemr.t_bencall.Category
 ,servicesmapping.InstituteDirMapID,servicesmapping.FeedbackID

 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

left join 1097_db_iemr.m_bencall1097servicesmapping servicesmapping ON 
servicesmapping.BenCallID = 1097_db_iemr.t_bencall.BenCallID


-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL


--- 1097 event query

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,1097_db_iemr.t_bencall.Category
 -- ,cate.CategoryName,
 
 ,feedback.FeedbackID

 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

left join 1097_db_iemr.t_feedback feedback ON 
feedback.BenCallID = 1097_db_iemr.t_bencall.BenCallID

-- left join 1097_db_iemr.m_category cate on cate.CategoryID=servicesmapping.CategoryID


-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL


-- --- 1097 event query provide by venkat

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID,
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound,
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,feedback.FeedbackID,
ftype.FeedbackTypeName,inst.InstitutionName,inst.InstitutionID
FROM 1097_db_iemr.t_bencall
left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID
left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
left join 1097_db_iemr.t_feedback feedback ON
feedback.BenCallID = 1097_db_iemr.t_bencall.BenCallID
 
left join 1097_db_iemr.m_feedbacktype ftype on ftype.FeedbackTypeID=feedback.FeedbackTypeID
 
left join 1097_db_iemr.m_institution inst on inst.InstitutionID=feedback.InstitutionID

WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL -- total records -- 594250

-- feedback master
select * from 1097_db_iemr.m_feedbacktype;

-- institution master
select * from 1097_db_iemr.m_institution;


select * from 1097_db_iemr.m_bencall1097servicesmapping;

select * from 1097_db_iemr.m_category;

select * from 1097_db_iemr.m_calltype mc 
select * from 1097_db_iemr.t_feedback tf 


-- t_bencall, db_iemr.m_bencall1097servicesmapping

select * from 1097_db_iemr.m_bencall1097servicesmapping;

-- CallID and InstituteDirMapID,FeedbackID

select * from 1097_db_iemr.m_category mc

select * from 1097_db_iemr.t_bencall tb limit 1000

-- pyton script 1097 event query 28/02/2023

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,1097_db_iemr.t_bencall.CreatedDate,

year(1097_db_iemr.t_bencall.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(1097_db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,

IF(1097_db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') As IsOutbound,

1097_db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, mct.CallType,mct.CallGroupType,

feedback.FeedbackID,ftype.FeedbackTypeName,inst.InstitutionID, inst.InstitutionName

FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct ON mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

left join 1097_db_iemr.t_feedback feedback ON
feedback.BenCallID = 1097_db_iemr.t_bencall.BenCallID

left join 1097_db_iemr.m_feedbacktype ftype on ftype.FeedbackTypeID=feedback.FeedbackTypeID
left join 1097_db_iemr.m_institution inst on inst.InstitutionID=feedback.InstitutionID

WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND 1097_db_iemr.t_bencall.BenCallID BETWEEN 1 AND 10000
order by 1097_db_iemr.t_bencall.BenCallID ASC;


-- 1) 1097_db_iemr.t_bencall.BenCallID BETWEEN 1 AND 10000 -- 1776 -- done
-- 2) 1097_db_iemr.t_bencall.BenCallID BETWEEN 10001 AND 20000 -- 1677 -- done















--- bayer

SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermSubDistrict
FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_address.PermSubDistrictId IS NOT NULL -- -- 98009




--- bayer final query -- 29/02/2024
SELECT bayer_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId, bayer_db_identity.i_ben_details.BeneficiaryRegID, 
CAST(bayer_db_identity.i_ben_mapping.CreatedDate AS DATE),
bayer_db_identity.i_ben_details.FirstName,
bayer_db_identity.i_ben_details.MiddleName,
bayer_db_identity.i_ben_details.LastName,bayer_db_identity.i_ben_details.Gender,

IF(bayer_db_identity.i_ben_details.DOB IS NOT NULL, DATE_FORMAT(bayer_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

bayer_db_identity.i_ben_mapping.VanID,
bayer_db_identity.i_ben_address.PermStateId,bayer_db_identity.i_ben_address.PermState,
bayer_db_identity.i_ben_address.PermDistrictId,
bayer_db_identity.i_ben_address.PermDistrict,
bayer_db_identity.i_ben_address.PermSubDistrictId,
bayer_db_identity.i_ben_address.PermSubDistrict,
sp.ServiceProviderName As Project,mp.ProviderServiceMapID,
bayerVan.VanID,bayerVan.VanName,bayerFacility.FacilityName

FROM bayer_db_identity.i_beneficiarymapping i_ben_mapping

left JOIN bayer_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN bayer_db_identity.i_beneficiaryaddress i_ben_address 
ON bayer_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

inner join bayer_db_iemr.m_van bayerVan ON  bayerVan.VanID = bayer_db_identity.i_ben_mapping.VanID
inner join bayer_db_iemr.m_facility bayerFacility on bayerVan.FacilityID = bayerFacility.FacilityID
inner join bayer_db_iemr.m_providerservicemapping mp on mp.ProviderServiceMapID = bayerVan.ProviderServiceMapID
inner join bayer_db_iemr.m_serviceprovider sp on mp.ServiceProviderID = sp.ServiceProviderID


WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_address.PermSubDistrictId IS NOT NULL
AND bayerVan.ProviderServiceMapID = 1; -- 98007


--- bayer final query -- 29/02/2024 for DHIS2 TEA registration
SELECT bayer_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
bayer_db_identity.i_ben_details.BeneficiaryRegID, 
CAST(bayer_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
bayer_db_identity.i_ben_details.FirstName,bayer_db_identity.i_ben_details.MiddleName,
bayer_db_identity.i_ben_details.LastName,bayer_db_identity.i_ben_details.Gender,
IF(bayer_db_identity.i_ben_details.DOB IS NOT NULL, 
DATE_FORMAT(bayer_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
bayerVan.VanID

FROM bayer_db_identity.i_beneficiarymapping i_ben_mapping

LEFT JOIN bayer_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN bayer_db_iemr.m_van bayerVan ON  bayerVan.VanID = bayer_db_identity.i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND bayerVan.ProviderServiceMapID = 1
ORDER by MappingBenRegId ASC; -- 98007


select sp.ServiceProviderName As Project,mp.ProviderServiceMapID,m.VanID,m.VanName,f.FacilityName from m_van m
inner join m_facility f on m.FacilityID=f.FacilityID
inner join m_providerservicemapping mp on mp.ProviderServiceMapID=m.ProviderServiceMapID
inner join m_serviceprovider sp on mp.ServiceProviderID=sp.ServiceProviderID
where m.ProviderServiceMapID = 1



-- bayer final event / TRANSACTION query -- 01/03/2024 for DHIS2 Event

SELECT bayer_db_iemr.t_benvisitdetail.BenVisitID, bayer_db_iemr.t_benvisitdetail.BeneficiaryRegID,
bayer_db_iemr.t_benvisitdetail.VisitNo,bayer_db_iemr.t_benvisitdetail.CreatedDate,

 year(bayer_db_iemr.t_benvisitdetail.CreatedDate) - 
 year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

bayer_db_iemr.t_benvisitdetail.VisitReason,bayer_db_iemr.t_benvisitdetail.VisitCategory,

bayer_db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,

prescription.DiagnosisProvided FROM bayer_db_iemr.t_benvisitdetail

LEFT JOIN  bayer_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = bayer_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  bayer_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN bayer_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_phy_vitals phy on phy.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_tmrequest tm on tm.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_patientissue patient on patient.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN bayer_db_iemr.t_benreferdetails referal ON referal.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_prescription prescription ON prescription.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID

WHERE i_ben_mapping.VanID  IN 
( SELECT VanID FROM bayer_db_iemr.m_van WHERE ProviderServiceMapID in (1));




-- HWC registration data -- 05/03/2024 for DHIS2 TEI and enrollment
SELECT gok_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
gok_db_identity.i_ben_details.BeneficiaryRegID, 
CAST(gok_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
gok_db_identity.i_ben_details.FirstName,gok_db_identity.i_ben_details.MiddleName,
gok_db_identity.i_ben_details.LastName,gok_db_identity.i_ben_details.Gender,

IF(gok_db_identity.i_ben_details.DOB IS NOT NULL, 
DATE_FORMAT(gok_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

gok_db_identity.i_ben_mapping.VanID,gok_db_identity.i_ben_address.PermStateId,
gok_db_identity.i_ben_address.PermState,gok_db_identity.i_ben_address.PermDistrictId,
gok_db_identity.i_ben_address.PermDistrict,gok_db_identity.i_ben_address.PermSubDistrictId,
gok_db_identity.i_ben_address.PermSubDistrict,i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM gok_db_identity.i_beneficiarymapping i_ben_mapping

LEFT JOIN gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_identity.i_beneficiaryaddress i_ben_address 
ON gok_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
ORDER by MappingBenRegId ASC; 



-- HWC event / TRANSACTION query -- 05/03/2024 for DHIS2 Event

select count(*) from gok_db_iemr.t_benvisitdetail; -- 4347

SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

 year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
 year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

gok_db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
order by BenVisitID asc; -- 4760


-- HWC registration data shared by venkat 06/03/2024
SELECT beneficiaryregidmapping.BeneficiaryID,gok_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
gok_db_identity.i_ben_details.BeneficiaryRegID,
CAST(gok_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
gok_db_identity.i_ben_details.FirstName,
gok_db_identity.i_ben_details.MiddleName,
gok_db_identity.i_ben_details.LastName,
gok_db_identity.i_ben_details.Gender,
IF(gok_db_identity.i_ben_details.DOB IS NOT NULL,
DATE_FORMAT(gok_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
gok_db_identity.i_ben_mapping.VanID,gok_db_identity.i_ben_address.PermStateId,
gok_db_identity.i_ben_address.PermState,gok_db_identity.i_ben_address.PermDistrictId,
gok_db_identity.i_ben_address.PermDistrict,gok_db_identity.i_ben_address.PermSubDistrictId,
gok_db_identity.i_ben_address.PermSubDistrict,
dm.DistrictBranchID AS registration_facility_id, dm.VillageName AS registration_facility

-- i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM gok_db_identity.i_beneficiarymapping i_ben_mapping

left join gok_db_identity.m_beneficiaryregidmapping beneficiaryregidmapping  ON
beneficiaryregidmapping.BenRegId = i_ben_mapping.BenRegId

LEFT JOIN gok_db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_identity.i_beneficiaryaddress i_ben_address
ON gok_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
left join gok_db_iemr.m_user m on i_ben_mapping.CreatedBy=m.UserName
left join gok_db_iemr.t_usermastervillagemapping mv on mv.user_id=m.UserID
left join gok_db_iemr.m_districtbranchmapping dm on dm.DistrictBranchID=mv.masterVillage_id
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
ORDER by MappingBenRegId ASC;


-- HWC event data 07/03/2024
SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

 year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
 year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

-- gok_db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy, pnc.ProvisionalDiagnosis,ncd.NCD_Condition,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,

patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
order by BenVisitID asc; -- 4760

select * from gok_db_iemr.t_infantbirthdetails ti limit 1000; -- no records
select * from gok_db_iemr.t_femaleobstetrichistory tf limit 1000; -- no records
select * from gok_db_iemr.t_ancdiagnosis ta; -- no records
select * from gok_db_iemr.t_phy_vitals tpv -- 4324


-- STFC registration/demographic query shared by venkat as on 07/03/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,
YEAR(i_ben_details.DOB),IF(i_ben_details.DOB IS NOT NULL,
DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_mapping.CreatedDate,CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,
i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM stfc_db_identity.i_beneficiarymapping i_ben_mapping

INNER join stfc_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN stfc_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN stfc_db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 
AND i_ben_address.PermSubDistrictId IS NOT NULL; -- 717,782



