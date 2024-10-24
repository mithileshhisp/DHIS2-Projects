
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
order by tei.uid

-- tei list
SELECT tei.trackedentityinstanceid,
tei.uid AS teiUID, org.organisationunitid, org.uid AS orgUID,org.name AS orgName
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid

order by tei.trackedentityinstanceid
select * from trackedentityattribute;


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

delete from datasetsource where sourceid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from datavalue where sourceid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from datavalueaudit where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from orgunitgroupmembers where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from program_organisationunits where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance where programinstanceid in(
select programinstanceid from programinstance where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g')) );

delete from programstageinstance where programinstanceid in(
select programinstanceid from programinstance where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g'));

delete from programinstance where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from trackedentityattributevalue where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g'));

delete from trackedentityprogramowner where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g'));

delete from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from userdatavieworgunits where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from usermembership where organisationunitid in (
select organisationunitid from organisationunit where 
uid = 'GOTcqXaeT9g');

delete from organisationunit where 
uid = 'GOTcqXaeT9g';

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
						