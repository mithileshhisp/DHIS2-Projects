-- timor

-- a. First I want to get the id of my chosen locale:

select * from i18nLocale where locale = 'no';


 i18nlocaleid |     uid     | code |         created         |       lastupdated       | locale |   name    | lastupdatedby 
--------------+-------------+------+-------------------------+-------------------------+--------+-----------+---------------
        52296 | oBMTTQceViV |      | 2013-11-18 13:00:43.837 | 2013-11-18 13:00:43.837 | no     | Norwegian |              
(1 row)

now I have the id = oBMTTQceViV

b. Now I can change that locale to the one I want:

UPDATE i18nLocale SET locale = 'ku' WHERE i18nLocale.uid = 'oBMTTQceViV';
UPDATE i18nLocale SET name = 'Kurdish Sorani' WHERE i18nLocale.uid = 'oBMTTQceViV';

// for timor / 23/06/2023
UPDATE i18nLocale SET locale = 'tet' WHERE i18nLocale.uid = 'sD3lxHOoGWI';
UPDATE i18nLocale SET name = 'Tetum' WHERE i18nLocale.uid = 'sD3lxHOoGWI';

-- given by dure technolies

-- before change no of table -- 321
-- after change no of table -- 321 + 7 = 328

-- delete TB Program id - TB Case Surveillance -  iOFS30Fk6D6  21/08/2023

delete from program_organisationunits where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

update program set relatedprogramid = null where 
programid = 73132;

delete from programstageinstance where programinstanceid in 
( select programinstanceid from programinstance where programid
in ( select programid from program where uid = 'iOFS30Fk6D6'));

delete from programinstance where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from programstagesection_dataelements where programstagesectionid
in ( select programstagesectionid from  programstagesection where programstageid in 
( select programstageid from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6')));

delete from programstagesection where programstageid in 
( select programstageid from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6'));

delete from programstagedataelement where programstageid in 
( select programstageid from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6'));

delete from programstage where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from program_attributes where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from trackedentityprogramowner where programid
in ( select programid from program where uid = 'iOFS30Fk6D6');

delete from program where uid = 'iOFS30Fk6D6';

delete from dataelement where uid in (
'mgm4KZI0kji',
'nW4gOBm8JgO',
'QQqdJjkS5Js');

delete from trackedentitydatavalueaudit where dataelementid 
in ( select dataelementid from dataelement where uid in (
'mgm4KZI0kji',
'nW4gOBm8JgO',
'QQqdJjkS5Js',
'YfOzH9DqJeN',
'H2qjZE32mMF'));

-- http://172.105.47.158/ihip_timor -- ict4cop_kenya - 4646
-- delete event program -- http://172.105.47.158/ihip_timor -- 26/09/2023

select * from program where uid = 'sKFnwwYd4Bv'

select * from program where programid = 61435;


delete from programstageinstance where programinstanceid
in ( select programinstanceid from programinstance where 
programid = 61435);

delete from programinstance where 
programid = 61435;

delete from programstage where 
programid = 61435;

delete from program where programid = 61435;


-- 18/04/2024
select uid, trackedentityinstanceid from trackedentityinstance
where created::date = '2024-04-18';

update trackedentityinstance set created = now()::timestamp where created = '2024-04-18';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-04-18';

select uid, programinstanceid from programinstance
where created::date = '2024-04-18';

update programinstance set created = now()::timestamp where created = '2024-04-18';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-04-18';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-04-18';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-04-18';


update trackedentityattributevalue set created = now()::timestamp where created = '2024-07-27';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-07-27';


-- 29/05/2024

SELECT last_value FROM trackedentityinstance_sequence;
ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 550741;

SELECT last_value FROM hibernate_sequence;
ALTER SEQUENCE hibernate_sequence RESTART WITH 550741;


insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&A2&","&B2&",'2024-07-27','2024-07-27','"&C2&"','hispdev'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2024-07-27';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-07-27';


-- 28/07/2024 enrollment list

select tei.uid tei_uid, org.uid org_uid ,pi.uid enrollment_uid, pi.enrollmentdate::DATE from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
where prg.uid = 'mgQS5cw2rVi';

-- event count
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'GOBK8Afcz6W');

-- https://links.hispindia.org/timor//api/29/sqlViews/idWYOv0eLU4/data?paging=false



-- 02/08/2024 issue to save TEI from link

SELECT last_value FROM trackedentityinstance_sequence; -- 664501
ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 664501;

select * from trackedentityinstance where trackedentityinstanceid = 594785

SELECT last_value FROM programinstance_sequence; -- 664501
ALTER SEQUENCE programinstance_sequence RESTART WITH 664501;

SELECT last_value FROM programstageinstance_sequence; -- 664501
ALTER SEQUENCE programstageinstance_sequence RESTART WITH 664501;

SELECT last_value FROM trackedentitydatavalueaudit_sequence; -- 664501
ALTER SEQUENCE trackedentitydatavalueaudit_sequence RESTART WITH 664501;

SELECT last_value FROM datavalueaudit_sequence; -- 664501
ALTER SEQUENCE datavalueaudit_sequence RESTART WITH 664501;

SELECT last_value FROM hibernate_sequence; -- 664501
ALTER SEQUENCE hibernate_sequence RESTART WITH 664501;

664501


select * from trackedentityprogramowner
order by trackedentityprogramownerid desc;


select * from trackedentitydatavalueaudit
order by trackedentitydatavalueauditid desc;

select * from trackedentitydatavalueaudit 
where trackedentitydatavalueauditid = 63775



-- 03/08/2024 run on dev instance https://ln4.hispindia.org/timor_dev

SELECT last_value FROM trackedentityinstance_sequence; -- 593663
ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 664501;

select * from trackedentityinstance where trackedentityinstanceid = 594785

SELECT last_value FROM programinstance_sequence; -- 268199
ALTER SEQUENCE programinstance_sequence RESTART WITH 664501;

SELECT last_value FROM programstageinstance_sequence; -- 59988
ALTER SEQUENCE programstageinstance_sequence RESTART WITH 664501;

SELECT last_value FROM trackedentitydatavalueaudit_sequence; -- 200392
ALTER SEQUENCE trackedentitydatavalueaudit_sequence RESTART WITH 664501;

SELECT last_value FROM datavalueaudit_sequence; -- 66497
ALTER SEQUENCE datavalueaudit_sequence RESTART WITH 664501;

SELECT last_value FROM hibernate_sequence; -- 628214
ALTER SEQUENCE hibernate_sequence RESTART WITH 664501;


-- delete event-data-value 21/08/2024
select uid from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'HnFkeXeiDQx') 
and organisationunitid in ( select organisationunitid from organisationunit where parentid in 
( select organisationunitid from organisationunit where parentid in  (
select organisationunitid from organisationunit where parentid in (
( select organisationunitid
from organisationunit where parentid = 606)))) );


select * from organisationunit where uid = 'AJb0ijkNtcb'

select * from organisationunit where parentid in 
( select organisationunitid from organisationunit where parentid in  (
select organisationunitid from organisationunit where parentid in (
( select organisationunitid
from organisationunit where parentid = 606)))) and uid = 'AQna4djucPl'





SELECT psi.uid eventID,psi.created::date,psi.lastupdated::date,psi.executiondate::date as eventdate, 
psi.storedby,psi.status,psi.completeddate::date,psi.completedby,org.uid AS orgUID,org.name AS orgName,
prg.uid AS prgUID, prg.name AS prgName,ps.uid AS prgStageUID, ps.name AS prgStageName,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'qTUYdgL1HLD' and ps.uid = 'HnFkeXeiDQx'
AND org.organisationunitid in (select organisationunitid from organisationunit where parentid in 
( select organisationunitid from organisationunit where parentid in  (
select organisationunitid from organisationunit where parentid in (
( select organisationunitid
from organisationunit where parentid = 606)))));


-- tei list with UIC and coordinate
select tei.trackedentityinstanceid, tei.uid, tei.geometry,teav.value
as uic from  trackedentityinstance tei 
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid

where tei.geometry is not null and  teav.trackedentityattributeid = 89298;


-- -- enrollment list based on program and enrollment date
SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, org.uid AS orgUID,
org.organisationunitid,org.name AS orgName,pi.uid AS enrollmentUID,
pi.programid,prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'RUqNUsv6WBp' and pi.enrollmentdate::date <= '2024-08-25'
order by tei.uid;



-- event list based on program and enrollment date
select * from programstageinstance where programstageid 
in ( select programstageid from programstage where programid = 73132)
and executiondate::date <= '2024-08-25';

delete from programstageinstance where programstageinstanceid in (671453,
671456,671422);

