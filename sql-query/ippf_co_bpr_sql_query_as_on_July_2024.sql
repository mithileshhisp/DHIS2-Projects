
-- programsatge list -- 15/07/2024
select prg.uid programUID, ps.programid,programstageid, ps.uid, ps.created, ps.lastupdated, 
ps.name, mindaysfromstart, repeatable,executiondatelabel,autogenerateevent,
blockentryform,sort_order,validationstrategy,enableuserassignment from programstage ps
INNER JOIN program prg ON ps.programid = prg.programid
where prg.uid in('F9wFxXnlgyk','xUnQTUgX6d8','t4nOdXsmPmx',
'tW5hErR0DZ8','HiAwFURBwUS','FEuw3R9O3aT');

select uid,programid,name from program 
where name = 'BP - AU - 3.1, 3.2 and 3.3 Income Details'

-- programstage 15/07/2024
insert into programstage (programstageid, uid, created, lastupdated, name, mindaysfromstart, programid,repeatable,autogenerateevent,blockentryform,sort_order,validationstrategy,enableuserassignment) values
="(nextval('hibernate_sequence'),'"&A2&"', '2024-07-15', '2024-07-15', '"&I2&"', "&J2&","&C2&", '"&K2&"','"&M2&"', '"&N2&"', "&O2&",'"&P2&"','"&Q2&"'),"

update programstage set created = now()::timestamp where created ='2024-07-15';
update programstage set lastupdated = now()::timestamp where lastupdated ='2024-07-15';


-- programstagedataelement -- 15/07/2024
select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid in( 1622,506,2968,17096,725,
413,4905,4386,18118,4019,18004);

-- programstagedataelement -- 29/07/2024
select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid in( select programstageid from programstage
where programid in (select programid from program where uid = 'uo2YOCCVdS5'));

select programstageid from programstage
where programid in (select programid from program where uid = 'IsSUboXJWDq');

insert into programstagedataelement (programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, renderoptionsasradio, skipsynchronization, skipanalytics) values
="(nextval('hibernate_sequence'),'"&A2&"', '2024-07-15', '2024-07-15', "&E2&", "&F2&", '"&G2&"', '"&H2&"', "&I2&", '"&J2&"', '"&K2&"', '"&L2&"','"&M2&"','"&N2&"'),"


select * from programstagedataelement order by programstagedataelementid desc; ---67409
select * from programstagedataelement where programstagedataelementid > 67409;

update programstagedataelement set created = now()::timestamp where created = '2024-07-16';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2024-07-16';


-- programstagesection -- 15/07/2024
select  uid,lastupdatedby, name, 
rendertype,sortorder,programstageid,programstagesectionid from 
programstagesection where programstageid 
in(1622,506,2968,17096,725,413,4905,4386,18118,4019,18004) 
order by sortorder;

-- programstagesection -- 29/07/2024
select  uid,lastupdatedby, name, 
rendertype,sortorder,programstageid,programstagesectionid from 
programstagesection where programstageid 
in(select programstageid from programstage
where programid in (select programid from program where uid = 'uo2YOCCVdS5')) 
order by sortorder;


insert into programstagesection (programstagesectionid, uid, created, lastupdated, lastupdatedby, name, rendertype, programstageid, sortorder ) values
="(nextval('hibernate_sequence'),'"&A2&"', '2024-07-15', '2024-07-15', "&D2&",'"&E2&"', '"&G2&"',"&F2&","&H2&"),"

select * from programstagesection order by programstagesectionid desc; ---66507
select * from programstagesection where programstagesectionid > 66507;

update programstagesection set created = now()::timestamp where created = '2024-07-16';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2024-07-16';


-- programstagesection_dataelements -- 15/07/2024

select pss.programstageid, pssde.programstagesectionid,pssde.sort_order,
pssde.dataelementid from programstagesection_dataelements pssde
INNER join programstagesection pss ON pss.programstagesectionid = pssde.programstagesectionid
where pss.programstageid in (1622,506,2968,17096,725,413,4905,4386,18118,4019,18004);

-- programstagesection_dataelements -- 29/07/2024
select pss.programstageid, pssde.programstagesectionid,pssde.sort_order,
pssde.dataelementid from programstagesection_dataelements pssde
INNER join programstagesection pss ON pss.programstagesectionid = pssde.programstagesectionid
where pss.programstageid in (select programstageid from programstage
where programid in (select programid from program where uid = 'uo2YOCCVdS5'));

insert into programstagesection_dataelements (programstagesectionid, sort_order, dataelementid) values
="("&D2&", "&E2&", "&F2&" ),"

-- as on 16/07/2024
update programstage set sharing = 
'{"users": {"M5zQapPyTZI": {"id": "M5zQapPyTZI", "access": "rw------"}}, "public": "rw------", "external": false, "userGroups": {}}';

update programstage set programid = 25937
where uid = 'Elli2lv1yUC';

-- ippf enrollmet list 16/07/2024
SELECT tei.uid tei_uid,org.uid org_uid,org.name org_name, prg.uid prg_uid, 
prg.name prg_name, pi.uid enrollment from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid;

-- ippf tei list
SELECT prg.uid prg_uid,org.uid org_uid,tei.uid tei_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid; 

SELECT prg.uid prg_uid,org.uid org_uid,tei.uid tei_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
where prg.uid = 'HIeoDAlHV5X' and org.uid = 'TmopmmnT6qr';



-- event list -- 23/07/2024

SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID,pi.programid,prg.name AS programName,
org.uid AS orgUID,org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
order by prg.name

-- IPPF CO event to event move for diffrent program -- 06/06/2025 
SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID, psi.executiondate::date as event_date, prg.uid program_uid, prg.name AS programName,
ps.uid ps_uid, ps.name AS programStageName,
org.uid AS orgUID, org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid in ( 'wQQAXG20nM9','eewYoJnOF4C','m7SjVk2okZO','ZuAtETfMY4l','HIeoDAlHV5X','UfiR3SCT6nu' )
and org.uid in ('PnCs1iIYmLh') order by prg.name;


-- IPPF CO event to event move for diffrent program -- 06/06/2025 
SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID, psi.executiondate::date as event_date, prg.uid program_uid, prg.name AS programName,
ps.uid ps_uid, ps.name AS programStageName,
org.uid AS orgUID, org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid in ( 'wQQAXG20nM9','eewYoJnOF4C','m7SjVk2okZO','ZuAtETfMY4l','HIeoDAlHV5X','UfiR3SCT6nu' )
and org.uid in ('AvxukaOJ0jZ') order by prg.name;








-- tei list

SELECT tei.uid AS teiUID, org.uid AS orgUID,org.name AS orgName
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid

-- enrollment list

SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, org.uid AS orgUID,
org.organisationunitid,org.name AS orgName,pi.uid AS enrollmentUID,
pi.programid,prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
order by tei.uid

-- tei count
SELECT tei.trackedentityinstanceid,
tei.uid AS teiUID, org.organisationunitid, org.uid AS orgUID,org.name AS orgName
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
where tei.created::date ='2024-07-23'


select * from trackedentityattribute;


SELECT tei.trackedentityinstanceid,
tei.uid AS teiUID, org.organisationunitid, org.uid AS orgUID,org.name AS orgName
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
where tei.created::date ='2024-07-23'
order by tei.trackedentityinstanceid
select * from trackedentityattribute;


-- enrollment list
SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, org.uid AS orgUID,
org.organisationunitid,org.name AS orgName,pi.uid AS enrollmentUID,
pi.programid,prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where prg.uid = 'XdyicAxrGPC' and org.uid = 'DKmBzs8T5HF' and 
pi.enrollmentdate::date = '2025-01-11';
order by tei.uid;

-- tei list
SELECT tei.trackedentityinstanceid,
tei.uid AS teiUID, org.organisationunitid, org.uid AS orgUID,org.name AS orgName
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid

order by tei.trackedentityinstanceid
select * from trackedentityattribute;

-- Philippines Multisectoral Nutrition Project -- household and members
-- enrollment list trackedentityattributevalue
SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, pi.uid AS enrollmentUID,
pi.programid,prg.name AS programName, teav.value as Household_ID
from programinstance pi

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where prg.uid = 'oSNoNtcmLXL' and teav.trackedentityattributeid = 1992
order by tei.uid;


SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, pi.uid AS enrollmentUID,
pi.programid,prg.name AS programName, teav.value as Household_ID
from programinstance pi

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where prg.uid = 'VVLirjoOGbj' and teav.trackedentityattributeid = 7483
order by tei.uid;


SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, org.uid AS orgUID,
org.organisationunitid,org.name AS orgName,pi.uid AS enrollmentUID,
pi.programid,prg.name AS programName
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid 
where prg.uid = 'VVLirjoOGbj'
order by tei.uid;

select count(*) from trackedentityinstance;
select count(*) from programinstance;
select count(*) from programstageinstance; 



------ 





select programid,name from program where programid not in (
17088,608,20353,25928,430,22117,
20344,1998,1673,877,25937,20362)

-- event list
SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID,pi.programid,prg.name AS programName,
org.uid AS orgUID,org.name AS orgName programinstance
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
order by prg.name


select * from program where uid != 'F9wFxXnlgyk' -- 19942

select * from programinstance
where enrollmentdate::date = '2024-07-22';

select * from programinstance
where programid = 19942;

select * from organisationunit;


select * from programstageinstance 
where eventdatavalues is not null;


SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID,pi.programid,prg.name AS programName,
org.uid AS orgUID,org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
order by prg.name

select * from trackedentityinstance  order by organisationunitid 
desc; -- 560


WHERE psi.programstageid in ( select programstageid from programstage where uid = 'wmKHppc1gL7')
and tei.uid = 'KeNI7TmlH3I' and de.uid = 'icJeQiH7vf3';

select * from trackedentityattributevalueaudit 
where trackedentityinstanceid in (136,110,
105,
559,
125,
102,
124,
127);

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2024-07-23', '2024-07-23', '2024-07-23', 'ACTIVE', "&A2&", "&C2&",'2024-07-23', "&B2&", 'false','admin' ),"

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&A2&", "&C2&",'2024-07-23','2024-07-23',"&B2&",'admin' ),"


update programinstance set created = now()::timestamp where created = '2024-08-01';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-08-01';


update trackedentityprogramowner set created = now()::timestamp where created = '2024-08-01';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-08-01';

-- 25/07/2024
delete from programstageinstance where uid in (
'T2tGCE7Tf0T','Bm3cHZDGTjH','AkaAnc3jCKW','LaurhR31i94','auJSq9Ao9Tc','vKwtLs78BNQ');


-- 25/07/2024
-- -- program/program-stage/ program-stage-section wise dataelement-list
SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid = 'xUnQTUgX6d8' order by de.dataelementid;



SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid = 'xUnQTUgX6d8' and de.uid = 'GbGunhHaiDt'
order by de.dataelementid;

-- 25/07/2024

delete from organisationunit where organisationunitid in (5349,
5372,5415,5417,5430,5431,5434,5435,5436,5437,5438,5439,5441,5443,
5442,5445,5446,5452,5453,5455,5456,5459,5460,5461,5462,5467,5468,
5474,5483,5480);

-- event list 01/08/2024
SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID,pi.programid,prg.name AS programName,
org.uid AS orgUID,org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
Where prg.uid = 'F9wFxXnlgyk'
order by prg.name

-- event list 27/02/2025
-- based on programs and stagesa nd ou

SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID,pi.programid, prg.uid AS programUid,prg.name AS programName,
ps.uid AS programSatgeUid, ps.name AS programStageName,
org.uid AS orgUID,org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps on ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
Where prg.uid in ('wQQAXG20nM9', 'eewYoJnOF4C', 'm7SjVk2okZO','ZuAtETfMY4l','HIeoDAlHV5X', 'UfiR3SCT6nu')
and ps.uid in ( 'TKVrtesVq4i','jOJ5RcCN3LF','i1h5ewrsi84','TwgLo3e2qS9','hMclSv5L1pV','x9EaVh48t1d','Bfcdu2SthGt',
'OgyWHzn9gWv','uvrGFFUBJov','aNP5oQupLI9','mkZSGnlhwZz' ) and org.uid = 'c3WmG5qfB83'
order by prg.name



SELECT tei.uid AS teiUID, 
psi.uid AS eventUID,psi.executiondate::date, prg.uid AS programUid,
ps.uid AS programSatgeUid, org.uid AS orgUID FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps on ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
Where prg.uid in ('wQQAXG20nM9', 'eewYoJnOF4C', 'm7SjVk2okZO','ZuAtETfMY4l','HIeoDAlHV5X', 'UfiR3SCT6nu')
and ps.uid in ( 'TKVrtesVq4i','jOJ5RcCN3LF','i1h5ewrsi84','TwgLo3e2qS9','hMclSv5L1pV','x9EaVh48t1d','Bfcdu2SthGt',
'OgyWHzn9gWv','uvrGFFUBJov','aNP5oQupLI9','mkZSGnlhwZz' ) and org.uid = 'c3WmG5qfB83'
order by prg.name



-- 13/08/2024
-- dataValueSet
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, split_part(pe.startdate::TEXT,'-', 1) as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and org.uid = 'avYXPLqGiCo';


-- dataSet source with name uid
SELECT  dss.datasetid,ds.name, dss.sourceid,
org.uid orgUID,org.name orgName from datasetsource dss
INNER JOIN dataset ds ON ds.datasetid = dss.datasetid
INNER JOIN organisationunit org ON org.organisationunitid = dss.sourceid
where ds.uid = 'bnq1MlIycGX';

-- eventDataValue 20/08/2024

SELECT psi.uid as eventUID,psi.executiondate::date,psi.created::date, 
psi.deleted FROM programstageinstance psi
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where psi.organisationunitid in (select organisationunitid from 
organisationunit where uid = 'vXS042miHoG') and  psi.programstageid in ( select programstageid
from programstage where uid = 'jOJ5RcCN3LF') 

-- and psi.executiondate::date between '2024-08-01' AND '2024-08-31';

select * from programstageinstance 
where uid = 'pZnoJbYyjMo'


-- event list
SELECT psi.uid.ps.uid stage_uid as eventUID FROM programstageinstance psi
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
where ps.uid = 'x5kv7GMSzws';


SELECT psi.uid.ps.uid stage_uid as eventUID FROM programstageinstance psi
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
where ps.uid = 'hMclSv5L1pV';


SELECT psi.uid as eventUID,de.name as de_name,de.uid as de_uid,prg.uid as prg_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.deleted FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
where ps.uid = 'hMclSv5L1pV';




-- eventdataValue

SELECT psi.uid as eventUID,de.name,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.deleted,
len(psi.eventdatavalues::json) FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid in('GbGunhHaiDt');

SELECT psi.uid as eventUID, de.name, psi.created::date,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value
FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where prg.uid in('xQmFHKzf5uR') order by created desc;


-- multiple eventDataValue with conditions 17/10/2024
SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,
cast(data1.value::json ->> 'value' AS VARCHAR) AS de_value_1,
cast(data2.value::json ->> 'value' AS VARCHAR) AS de_value_2
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN dataelement de1 ON de1.uid = data1.key
INNER JOIN dataelement de2 ON de2.uid = data2.key
where de.uid in('zGn5c7EZLr0') and de1.uid = 'rpQi6D8L58H' and 
cast(data1.value::json ->> 'value' AS VARCHAR) = '2024' and 
de2.uid = 'T1poFhLsB2S' and cast(data2.value::json ->> 'value' AS VARCHAR) = 'Semi-Annual Reporting';
 
 
-- program_organisationunits 17/10/2024 
select org.uid org_uid, prg_org.organisationunitid,org.name as org_name,
prg_org.programid,
prg.uid prg_uid from program_organisationunits prg_org
INNER JOIN organisationunit org on org.organisationunitid = prg_org.organisationunitid
INNER JOIN program prg ON prg.programid = prg_org.programid
where prg.uid = 'HrI5y3dLrJJ'

rpQi6D8L58H: 2024
T1poFhLsB2S: Semi-Annual Reporting (edited) 



-- 14/10/2024
SELECT psi.uid as eventUID, prg.uid AS program_uid, de.name,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.deleted FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid in('GbGunhHaiDt');

SELECT psi.uid as eventUID,de.name,prg.uid AS program_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.deleted,
length(cast(data.value::json ->> 'value' AS VARCHAR)) FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where psi.created between '2024-10-01' and '2024-10-31';


SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where  ps.uid = 'Elli2lv1yUC';


---



SELECT psi.uid as eventUID,de.name,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.deleted FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where prg.uid = 'xUnQTUgX6d8' and cast(data.value::json ->> 'value' AS VARCHAR) = '0' and de.uid in('aWlpjka1mVz',
'k9LPfFwTJHI',
'QYOswDe3zUY',
'cd9yPIu51s7',
'xNArLODjiTU',
'GhYRLvdSwkT',
'PBv3HOq3fcJ',
'hgKdTSeKwv6',
'aFn5KZhINE2',
'X9NlhLS2ldP',
'MdUxIYY5ioj',
'QqldoQRif29',
'DJUNzZCeb3S',
'IUyp0VkwPCr',
'AoWpvnCVKGi',
'Xw5uuxaGjoh',
'vkd8GMEfvIA');


-- delete organisationunit and its delendencies date 24/10/2024
begin;

begin;

	delete from datasetsource where sourceid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from datavalue where sourceid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from datavalueaudit where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from orgunitgroupmembers where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from program_organisationunits where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz'));

	delete from trackedentitydatavalueaudit where programstageinstanceid
	in ( select programstageinstanceid from programstageinstance where programinstanceid in(
	select programinstanceid from programinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') )) );

	delete from programstageinstance where programinstanceid in(
	select programinstanceid from programinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') ));

	delete from programinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz'));

	delete from trackedentityattributevalue where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz')));

	delete from trackedentityprogramowner where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') ));

	delete from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from userdatavieworgunits where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from usermembership where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz');

end;

end;



--











/*
                        $.ajax({
                            type: "GET",
                            async: false,
                            url: 'https://links.hispindia.org/hivtracker/api/me.json&paging=false',
                            headers: {
                                "Content-Type": "text/plain",
                                //'Authorization': 'aGlzcGRldjpEZXZoaXNwQDE=',
                                'Authorization': 'Basic ' + btoa('hispdev' + ":" + 'Devhisp@1'),
                            },
                            json: true,
                            crossDomain: true,
                            success: function (eventResponse) {
                                console.log(  "login to server" );
                            }
                        })
                        */
						
data: JSON.stringify(updateEventDataValue),
                                        url: 'https://bpr.ippf.org/api/events/' + row.event,

                                        headers: {
                                            //'Authorization': 'aGlzcGRldjpEZXZoaXNwQDE=',
                                            'Authorization': 'Basic ' + btoa('admin' + ":" + 'district'),
                                        },

                                        json: true,
                                        crossDomain: true,						
						
						
		
select * from dataelement where uid = 'Cdxi6aNEkbf'


-- multiple eventDataValue with conditions 06/03/2025
SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,
cast(data1.value::json ->> 'value' AS VARCHAR) AS de_value_1,
cast(data2.value::json ->> 'value' AS VARCHAR) AS de_value_2
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN dataelement de1 ON de1.uid = data1.key
INNER JOIN dataelement de2 ON de2.uid = data2.key
where de.uid in('Cdxi6aNEkbf') and cast(data.value::json ->> 'value' AS VARCHAR) = '2023 - 2025'
and de1.uid = 'rpQi6D8L58H' and 
cast(data1.value::json ->> 'value' AS VARCHAR) = '2024' and 
de2.uid = 'T1poFhLsB2S' and cast(data2.value::json ->> 'value' AS VARCHAR) = 'Semi-Annual Reporting';

-- 25/04/2025 duplicate events list

SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,
cast(data1.value::json ->> 'value' AS VARCHAR) AS de_value_1,
cast(data2.value::json ->> 'value' AS VARCHAR) AS de_value_2
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN dataelement de1 ON de1.uid = data1.key
INNER JOIN dataelement de2 ON de2.uid = data2.key
where prg.uid = 'ffwRgqIfrj2' and  de.uid in('Cdxi6aNEkbf') and cast(data.value::json ->> 'value' AS VARCHAR) = '2023 - 2025'
and de1.uid = 'rpQi6D8L58H' and 
cast(data1.value::json ->> 'value' AS VARCHAR) = '2024' and 
de2.uid = 'T1poFhLsB2S' and cast(data2.value::json ->> 'value' AS VARCHAR) = 'Annual Reporting' order by org.uid asc;					



--12/08/2025
-- dataValueSet for orgunit  -- hIFCudhx8js
-- push same dataValue to all source of dataSet bnq1MlIycGX
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, split_part(pe.startdate::TEXT,'-', 1) as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and org.uid = 'hIFCudhx8js';

-- dataSet source with name uid
SELECT  dss.datasetid,ds.name, dss.sourceid,
org.uid orgUID,org.name orgName from datasetsource dss
INNER JOIN dataset ds ON ds.datasetid = dss.datasetid
INNER JOIN organisationunit org ON org.organisationunitid = dss.sourceid
where ds.uid = 'bnq1MlIycGX';


-- event_datavalue reporting year query find query signle dataelement value
SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS reporting_year

FROM programstageinstance psi

JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid = 'rpQi6D8L58H' and 
cast(data.value::json ->> 'value' AS VARCHAR) in( '2026','2027','2028')
 
order by org.uid asc;

SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 

cast(data1.value::json ->> 'value' AS VARCHAR) AS de_value_1,
cast(data2.value::json ->> 'value' AS VARCHAR) AS de_value_2
FROM programstageinstance psi

JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

INNER JOIN dataelement de1 ON de1.uid = data1.key
INNER JOIN dataelement de2 ON de2.uid = data2.key
where prg.uid = 'wQQAXG20nM9' and ps.uid in ('TKVrtesVq4i')
and de1.uid = 'rpQi6D8L58H' and 
cast(data1.value::json ->> 'value' AS VARCHAR) = '2025' and 
de2.uid = 'T1poFhLsB2S' and cast(data2.value::json ->> 'value' AS VARCHAR) = 'Annual Reporting' 
order by psi.executiondate::date desc;

-- orgUnit details section dataValue

SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
de.uid as dataElementUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS event_data_value

FROM programstageinstance psi

JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
where de.dataelementid in (4371,4372,4373,4374,4375,4376,4377,4378,
4379,4380,4381,4382,4383,4384) and 

 psi.uid in ( 'AiMNNmLKwK4',
'nUJmEJeYKiV',
'pWCpZxMdTOg',
'RlyH5NS3cqP',
'Wm7IhWuXgsO',
'jd4GNCxvlym');




-- aggregated dataValue to be deleted for period 2026 Yearly

-- Commodities Dataset - Price Master -- bnq1MlIycGX
select * from datavalue where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from dataelement
where uid in ( 'XQ7vwV6137f','w1NRl9LCopC','eakKEqUGcTF','w8rfqMMZQjI','YpbZAV3Le8N' )); -- 600





select * from datavalue where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn')); -- 7082


select * from datavalueaudit where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from dataelement
where uid in ( 'XQ7vwV6137f','w1NRl9LCopC','eakKEqUGcTF','w8rfqMMZQjI','YpbZAV3Le8N' )); -- 2454

select * from datavalueaudit where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn')); -- 2866

-- Commodities Dataset - Order Master -- ytjPaXko7Hn
select * from datavalue where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2024-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn')); -- 188



-- for delete datavalue

delete from datavalueaudit where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from dataelement
where uid in ( 'XQ7vwV6137f','w1NRl9LCopC','eakKEqUGcTF','w8rfqMMZQjI','YpbZAV3Le8N' ));


delete from datavalue where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from dataelement
where uid in ( 'XQ7vwV6137f','w1NRl9LCopC','eakKEqUGcTF','w8rfqMMZQjI','YpbZAV3Le8N' ));

delete from datavalueaudit where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn')); -- 2866

delete from datavalue where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2026-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn'));

delete from datavalueaudit where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2024-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn')); 

delete from datavalue where periodid in(
select periodid from period where periodtypeid =17 and startdate = '2024-01-01') 
and dataelementid in ( select dataelementid from datasetelement where datasetid in(
select datasetid from dataset where uid = 'ytjPaXko7Hn')); 


-- all event_datavalue for program and stage -- with null value
SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS event_data_value

FROM programstageinstance psi

JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
WHERE prg.uid = 'ygYngjW5iYY'  AND ps.uid = 'V9OmnYWiC2j'
and cast(data.value::json ->> 'value' AS VARCHAR) IS NULL;

AND (
   cast(data.value::json ->> 'value' AS VARCHAR) IS NULL
   OR cast(data.value::json ->> 'value' AS VARCHAR) = ''
);







-- single event_dataValue

SELECT 
    tei.uid AS teiUID,
    pi.uid AS enrollmentUID,
    psi.uid AS eventUID,
    org.uid AS orgUnitUID,
    org.name AS orgUnitName,
    de1.name AS de_name,
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date,
    (psi.eventdatavalues::json -> 'lsdeQnuiFDT' ->> 'value') AS de_value
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de1 ON de1.uid = 'lsdeQnuiFDT'
WHERE prg.uid = 'ygYngjW5iYY' 
  AND ps.uid = 'V9OmnYWiC2j'
ORDER BY psi.executiondate::date DESC;



-- all event_data_value

SELECT 
    psi.uid AS eventUID,
    de.name AS dataelement_name,
    psi.created::date AS event_created_date,
    CAST(data.value::json ->> 'value' AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
WHERE prg.uid IN ('xQmFHKzf5uR')
ORDER BY psi.created DESC;




-- multiple event_data_value

SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 

cast(data1.value::json ->> 'value' AS VARCHAR) AS Income_Restricted_15,
cast(data2.value::json ->> 'value' AS VARCHAR) AS Income_Restricted_14,
cast(data3.value::json ->> 'value' AS VARCHAR) AS Reporting_Year,
cast(data4.value::json ->> 'value' AS VARCHAR) AS Reporting_periodicity

FROM programstageinstance psi

JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data3 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data4 ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

INNER JOIN dataelement de1 ON de1.uid = data1.key
INNER JOIN dataelement de2 ON de2.uid = data2.key
INNER JOIN dataelement de3 ON de3.uid = data3.key
INNER JOIN dataelement de4 ON de4.uid = data4.key

where prg.uid = 'ygYngjW5iYY' and ps.uid in ('V9OmnYWiC2j')
and de1.uid = 'hgL1wdB6phE' and de2.uid = 'lsdeQnuiFDT' 
and de3.uid = 'rpQi6D8L58H' and de4.uid = 'T1poFhLsB2S'

order by psi.executiondate::date desc;




SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 

cast(data1.value::json ->> 'value' AS VARCHAR) AS Income_Restricted_15,
cast(data2.value::json ->> 'value' AS VARCHAR) AS Income_Restricted_14,
cast(data3.value::json ->> 'value' AS VARCHAR) AS Reporting_Year,
cast(data4.value::json ->> 'value' AS VARCHAR) AS Reporting_periodicity

FROM programstageinstance psi

LEFT JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
LEFT JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
LEFT JOIN json_each_text(psi.eventdatavalues::json) data3 ON TRUE 
LEFTJOIN json_each_text(psi.eventdatavalues::json) data4 ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

LEFT JOIN dataelement de1 ON de1.uid = data1.key
LEFT JOIN dataelement de2 ON de2.uid = data2.key
LEFT JOIN dataelement de3 ON de3.uid = data3.key
LEFT JOIN dataelement de4 ON de4.uid = data4.key

where prg.uid = 'ygYngjW5iYY' and ps.uid in ('V9OmnYWiC2j')
and de1.uid = 'hgL1wdB6phE' and de2.uid = 'lsdeQnuiFDT' 
and de3.uid = 'rpQi6D8L58H' and de4.uid = 'T1poFhLsB2S'

order by psi.executiondate::date desc;

-- refector query
SELECT 
    tei.uid AS teiUID, 
    pi.uid AS enrollmentUID,
    psi.uid as eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name as prg_name,
    ps.name as stage_name,
    psi.executiondate::date, 

    cast(data1.value::json ->> 'value' AS VARCHAR) AS Income_Restricted_15,
    cast(data2.value::json ->> 'value' AS VARCHAR) AS Income_Restricted_14,
    cast(data3.value::json ->> 'value' AS VARCHAR) AS Reporting_Year,
    cast(data4.value::json ->> 'value' AS VARCHAR) AS Reporting_periodicity

FROM programstageinstance psi

-- extract each required DE separately
LEFT JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'hgL1wdB6phE'
) data1 ON TRUE

LEFT JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'lsdeQnuiFDT'
) data2 ON TRUE

LEFT JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rpQi6D8L58H'
) data3 ON TRUE

LEFT JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'T1poFhLsB2S'
) data4 ON TRUE

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

WHERE prg.uid = 'ygYngjW5iYY' 
  AND ps.uid IN ('V9OmnYWiC2j')

ORDER BY psi.executiondate::date DESC;





SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 

cast(data1.value::json ->> 'value' AS VARCHAR) AS de_value_1,
cast(data2.value::json ->> 'value' AS VARCHAR) AS de_value_2

FROM programstageinstance psi

JOIN json_each_text(psi.eventdatavalues::json) data1 ON TRUE 
JOIN json_each_text(psi.eventdatavalues::json) data2 ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

INNER JOIN dataelement de1 ON de1.uid = data1.key
INNER JOIN dataelement de2 ON de2.uid = data2.key
where prg.uid in('wQQAXG20nM9') and  ps.uid = 'jOJ5RcCN3LF'

and de1.uid = 'rpQi6D8L58H ' and 
cast(data1.value::json ->> 'value' AS VARCHAR) = '2025' and 
de2.uid = 'fkHkH5jcJV0' order by org.uid asc;


-- 08/09/2025

-- trackedentitydatavalueaudit

select psi.uid as event_uid,org.name as org_name ,
de.name as de_name,tedva.audittype,tedva.value,tedva.modifiedby
from trackedentitydatavalueaudit tedva

INNER JOIN programstageinstance psi on psi.programstageinstanceid = tedva.programstageinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = ps.programid
INNER JOIN dataelement de ON de.dataelementid = tedva.dataelementid
where org.uid = 'p1PcUNlietY' and prg.uid = 'HrI5y3dLrJJ'  order by tedva.created desc;

-- 09/09/2025
select psi.*,org.name as org_name
from programstageinstance psi

INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = ps.programid
--INNER JOIN dataelement de ON de.dataelementid = tedva.dataelementid
where org.uid = 'p1PcUNlietY';


-- all event_data_value

-- all event list for single orgUnit

-- IPPF CO event to event move for diffrent program and single orgUnit-- 23/09/2025 

SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID, psi.executiondate::date as event_date, prg.uid program_uid, prg.name AS programName,
ps.uid ps_uid, ps.name AS programStageName,
org.uid AS orgUID, org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid in ( 'F9wFxXnlgyk','xUnQTUgX6d8','t4nOdXsmPmx','aCP7imixkBS','HiAwFURBwUS','FEuw3R9O3aT' )
and org.uid in ('Nk6iNbOf8WJ') order by prg.name;

-- chat GPT
SELECT 
    tei.uid AS tei_uid,
    pi.uid AS enrollment_uid,
    psi.uid AS event_uid,
    psi.executiondate::date AS event_date,
    prg.uid AS program_uid,
    prg.name AS program_name,
    ps.uid AS programstage_uid,
    ps.name AS programstage_name,
    org.uid AS org_uid,
    org.name AS org_name
FROM programstageinstance psi
INNER JOIN programinstance pi 
    ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org 
    ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei 
    ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid IN (
        'F9wFxXnlgyk','xUnQTUgX6d8','t4nOdXsmPmx',
        'aCP7imixkBS','HiAwFURBwUS','FEuw3R9O3aT'
      )
  AND org.uid = 'Nk6iNbOf8WJ'
ORDER BY prg.name, event_date;







aCP7imixkBS
HiAwFURBwUS
FEuw3R9O3aT


