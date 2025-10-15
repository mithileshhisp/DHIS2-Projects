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



-- 25/01/2024 insert enrollment, trackedentityprogramowner

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&A2&"', '2025-01-25', '2025-01-25', '"&B2&"', 'ACTIVE', "&G2&", "&E2&", '"&B2&"', "&F2&", 'false','admin' ),"

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&G2&", "&E2&", '2025-01-25', '2025-01-25', "&F2&",'admin' ),"


update programinstance set created = now()::timestamp where created = '2025-01-25';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-01-25';


update trackedentityprogramowner set created = now()::timestamp where created = '2025-01-25';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-01-25';

select * from programstageinstance where  
organisationunitid = 86 and programinstanceid in ( select programinstanceid
from programinstance  where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance  where uid in (
'fUShNIy1TOm','ebpuN2cLPFV','IUgHovfNpek','paoZ4Y6VVVd','JFcNHPT37TT',
'Qhy8qcz5roY','PXhDtVDeFvC','tzASFUMGc1x','gGfBwNTfG23','cx50F1rRq9F','Cqkiyk7T8zL',
'ydU6dFxlJff','H4StKiGZrhW','YriUdOnmR6j','oqWgrJ7X0sh','kbnI6Oa46sU','wley27MS6Z7',
'utPFaj27ZpP','CT5U2ar09Ev','ALplMfQHVp4','lEPOZR0kq3j','Xr5KZkS1IMz','n7nygvuj9WP',
'l3UEb5ac8eR','KdzMSU4DpmG','lRZMUkVMAey','cP6EteFggG5','Vt3FRtbwLzF','dSqWyrEjJwC',
'F0hlLUYnQox','WiqvliJ41eH','YGrPaXHhp9W','lgfMfrBLRAh','fIR8m6cDckA','COWGW3Y6Nzi',
'OHELRuDsaHn','OQjo4OaGzI2','dNelIJ7743u','pIyZZOFVepM','jYS8I4zBAvy','EwLHy6BhyeC',
'IQflasK6R0J','WfIUkPVknvJ','kzfVa08kHJm','mVCx7dD9Qsr','VSiBYZrEyNX','f5zI7MZB94S','vNw31wpWlfn')));


-- device_imei_list sql view
select value from trackedentityattributevalue where trackedentityattributeid
in (select trackedentityattributeid from trackedentityattribute where uid = 'D7chPF3UUUy' );

-- timor tracker data move from dev instance to live instance 
-- 14/05/2025

SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, org.uid AS orgUID,
org.organisationunitid,org.name AS orgName,pi.uid AS enrollmentUID,pi.enrollmentdate::date,
pi.programid,prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where prg.uid in ('xQmFHKzf5uR','sa5481ZXKW2','RUqNUsv6WBp') 
and org.uid in ('oCU7r1R0a6b','jiCiipBxDnH','xHFaJVNFPtv');



-- TB Health Facility Surveillance program for ORG CHC Suai Villa and for period Jan-2025
SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, org.uid AS orgUID,
org.organisationunitid,org.name AS orgName,pi.uid AS enrollmentUID,pi.enrollmentdate::date,
pi.programid,prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where prg.uid in ('RUqNUsv6WBp') and pi.enrollmentdate::date between '2025-01-01' and '2025-01-31'
and org.uid in ('PVG92wXrgMV');


select tei.uid AS teiUID, teav.trackedentityinstanceid, teav.trackedentityattributeid, 
teav.value, teav.storedby from trackedentityattributevalue teav 
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
where  tei.uid in ( 'yaA4bMaTvZA',
'SxTQaGommU8',
'OdCvKLnxko1',
'bEXV5BOKSd4',
'vFEs9B9Mm2K',
'zD8cW1zchCs',
'UjlWrHavtLD',
'HfoNYJ8cvCU',
'YK1ChToJXS7');

SELECT tei.uid AS teiUID, tei.trackedentityinstanceid,  org.uid AS orgUID,
org.organisationunitid, org.name AS orgName, pi.uid AS enrollmentUID, pi.enrollmentdate::date,
pi.programid, prg.uid as programUID, prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where tei.uid in ( 'yaA4bMaTvZA',
'SxTQaGommU8',
'OdCvKLnxko1',
'bEXV5BOKSd4',
'vFEs9B9Mm2K',
'zD8cW1zchCs',
'UjlWrHavtLD',
'HfoNYJ8cvCU',
'YK1ChToJXS7');


insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid) values
="(nextval('hibernate_sequence'),'"&B2&"', '2025-05-15','2025-05-15', 'false','false','false', "&E2&", 20 ),"

update trackedentityinstance set created = now()::timestamp where created = '2025-05-15';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2025-05-15';

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&E2&"', '2025-05-15', '2025-05-15', '"&H2&"', 'ACTIVE', "&D2&", "&G2&",'"&H2&"', "&F2&", 'false','hispdev' ),"


update programinstance set created = now()::timestamp where created = '2025-05-15';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-05-15';

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&D2&", "&G2&" ,'2025-05-15','2025-05-15',"&F2&",'hispdev' ),"


update trackedentityattributevalue set created = now()::timestamp where created = '2025-05-15';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-05-15';


insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&C2&","&D2&",'2025-05-15','2025-05-15','"&E2&"','"&F2&"'),"


update trackedentityprogramowner set created = now()::timestamp where created = '2025-05-15';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-05-15';

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&C2&","&D2&",'2025-05-15','2025-05-15','"&E2&"','"&F2&"'),"

select * from programstageinstance where programinstanceid in ( 
select programinstanceid from programinstance where trackedentityinstanceid 
in ( select trackedentityinstanceid from trackedentityinstance where uid in ( 
'jSLZVEN3NSp',
'T0oAdr1mNeV',
'eQDM3Q9NreT',
'C8Jj11Xo6pF',
'VpjaHFgy6ad')));


select reltype.name, rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid
inner join relationshiptype reltype on reltype.relationshiptypeid = rels.relationshiptypeid 

order by rel1.trackedentityinstanceid;	


select reltype.name,  rel1.trackedentityinstanceid
as from_tei_id,tei_from.uid as from_tei_uid,  rel2.trackedentityinstanceid as to_tei_id,
tei_to.uid as to_tei_uid from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid
inner join relationshiptype reltype on reltype.relationshiptypeid = rels.relationshiptypeid
inner join trackedentityinstance tei_from on tei_from.trackedentityinstanceid = rel1.trackedentityinstanceid
inner join trackedentityinstance tei_to on tei_to.trackedentityinstanceid = rel2.trackedentityinstanceid

order by rel1.trackedentityinstanceid;


-- 10/06/2025 analytics isssue due to wrong date /age/dob attribute value

select * from trackedentityattributevalue  where value = '0000-03-26'; -- dob or age

select * from trackedentityattribute where trackedentityattributeid = 61187;

select * from trackedentityattributevalue
where trackedentityattributeid in( 61177, 61378);


select * from trackedentityattribute where uid = 'uuZ2ngqdsjm';

select * from trackedentityattributevalue where trackedentityinstanceid = 692376;

select * from trackedentityattributevalue where 
trackedentityinstanceid = 692376 and trackedentityattributeid = 61187;

update trackedentityattributevalue set value = '2001-03-26'
where trackedentityinstanceid = 692376 and trackedentityattributeid = 61187
and value = '0000-03-26';





select psi.uid eventID,psi.programstageinstanceid, psi.executiondate::date,
psi.duedate::date,org.uid orgUID,org.name orgName,data.key as dataElement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS ADMISSION_NUMBER from programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where --de.uid = 'VxScEPPSjq8' and 
(EXTRACT(year from psi.executiondate) < 1975 
or EXTRACT(year from psi.executiondate) > 2050) 
order by psi.executiondate;


select teav.trackedentityattributeid,teav.trackedentityinstanceid,
teav.value from trackedentityattributevalue teav
where teav.trackedentityattributeid = 61187 order by value;

select * from trackedentityattributevalue  where value = '0000-03-26'; -- dob or age

select * from trackedentityattributevalue  
where trackedentityattributeid = 61187 and value like  '0%';

select * from trackedentityattribute where trackedentityattributeid = 61187;

select * from trackedentityattributevalue
where trackedentityattributeid in( 61177, 61378);


select * from trackedentityattribute where uid = 'uuZ2ngqdsjm';

select * from trackedentityattributevalue where trackedentityinstanceid = 692376;


select tei.uid as tei_uid, org.uid as org_uid, org.name as org_name, 
prg.uid as prg_uid, prg.name as prg_name, teav.trackedentityinstanceid, 
teav.trackedentityattributeid, teav.value,teav.storedby  from trackedentityattributevalue teav
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
inner join organisationunit org on org.organisationunitid = tei.organisationunitid
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join program prg on prg.programid = pi.programid
where trackedentityattributeid = 61187 and value like '0%'
order by value;


update trackedentityattributevalue set value = '2024-06-10'
where  trackedentityattributeid = 61187 and trackedentityinstanceid
in ( );

update trackedentityattributevalue set value = '2024-06-10'
--select * from trackedentityattributevalue
where  trackedentityattributeid = 61187 and trackedentityinstanceid
in (692797,690152,690508,690575,691120);


-- 23/06/2025
select tei.uid as tei_uid, org.uid as org_uid, org.name as org_name, 
prg.uid as prg_uid, prg.name as prg_name, teav.trackedentityinstanceid, 
teav.trackedentityattributeid, teav.value,teav.storedby,pi.created::date,pi.lastupdated::date
from trackedentityattributevalue teav
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
inner join organisationunit org on org.organisationunitid = tei.organisationunitid
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join program prg on prg.programid = pi.programid
where trackedentityattributeid = 61187 and value like '0%'
order by created desc;-- 646

update trackedentityattributevalue set value = '2024-06-23'
where  trackedentityattributeid = 61187 and trackedentityinstanceid
in ( );

-- 24/06/2025

-- delete tei for below prg HSS and ORG --  Test

select * from program where uid = 'HqBRRCVycno'; -- 764525

select * from organisationunit where uid = 'YuLfw0onLNC'; -- 732215

select * from programinstance where programid = 764525
and organisationunitid = 732215 and created::date <= '2025-06-23';

delete from trackedentityattributevalue where trackedentityinstanceid in (
698269) -- 2420 trackedentityattributevalueaudit -- 2586

delete from programstageinstance where programinstanceid in 
( select programinstanceid from 
programinstance where trackedentityinstanceid in (
698269)); -- 399

delete from programinstancecomments where programinstanceid in (
select programinstanceid from 
programinstance where trackedentityinstanceid in (
698269)); -- 2

delete from programinstance where trackedentityinstanceid in (
698269,
698235); -- 208

delete from trackedentityprogramowner where trackedentityinstanceid in (
698269) -- 208

delete from trackedentityinstance where trackedentityinstanceid in (
698269,
698235) -- 207

-- 14/08/2025

update  trackedentityinstance set geometry = null where uid in ('Uk3qINMycvY',
'qvspUqTjTAx','giQPTEqeVTy');