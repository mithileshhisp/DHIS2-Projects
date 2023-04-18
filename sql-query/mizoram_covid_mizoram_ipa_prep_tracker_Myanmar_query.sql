---


-- datavalue 
 -- COVID19 - DCHC & CCC Reporting Dataset rnayK9uGowo
 -- COVID19 - CCCC (4C) Reporting Dataset HiuM9tRwiT7
 
 
select * from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'HiuM9tRwiT7')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-12-23' and '2022-01-10');

select * from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'HiuM9tRwiT7')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-12-23' and '2022-01-10'); 

 
select * from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'rnayK9uGowo')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-10-25' and '2021-10-31');

select * from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'rnayK9uGowo')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-10-25' and '2021-10-31'); 
 
 
select * from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-08-01' and '2021-08-31');

select * from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-08-01' and '2021-08-31');

delete from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-09-01' and '2021-09-30');

delete from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-09-01' and '2021-09-30');

select programstageinstanceid,uid,programstageid,executiondate::date,created::date,
lastupdated::date from programstageinstance where executiondate::date = '2021-10-27';


delete from programstageinstance where executiondate::date = '2021-10-27';

select * from programstageinstance where executiondate::date = '2021-10-27';

select programinstanceid,uid,programid,trackedentityinstanceid,enrollmentdate::date,
created::date,lastupdated::date from programinstance where enrollmentdate::date = '2021-10-27';

delete from programinstance where enrollmentdate::date = '2021-10-27';

select * from programinstance where enrollmentdate::date = '2021-10-27';

-- 31/10/2021
select count(*) from trackedentityinstance; 119071
select count(*) from programinstance; 119069
select count(*) from programstageinstance; 139275

-- 23/11/2021

select * from programinstance where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2022-01-24 05:30:00'::timestamp 
where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2021-11-22 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-12-27';

update programinstance set enrollmentdate = '2021-11-22 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-11-22';

SELECT CAST('2021-11-22' AS timestamp);

SELECT CAST('2021-11-22 12:45:15.255' AS timestamp) AS CURRENT_DATE

update programinstance set enrollmentdate = '2021-12-27' where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2021-12-27 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-12-27';

select * from trackedentityattributevalue where trackedentityattributeid = 22745; -- serial no

-- run on 18/04/2022

select * from programinstance where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2022-04-13 05:30:00'::timestamp 
where enrollmentdate::date = '1970-01-01';

-- 

--event list 22/11/2022


SELECT psi.uid eventID, psi.executiondate::date,org.uid AS orgUnitUID,
org.name AS orgUnitName,prg.uid AS prgUID,prg.name AS prgName,
ps.uid AS programStageUID,ps.name AS programStageName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where psi.executiondate = '2022-04-01' and prg.uid = 'a7e2Yf1OdI5';

SELECT psi.programstageinstanceid, psi.uid eventID, psi.executiondate::date,
prg.uid AS prgUID, ps.uid AS programStageUID,teav.value AS serial_no FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate = '2022-01-18' and teav.trackedentityattributeid = 22745
and prg.uid = 'CTUqdqhrb46' and ps.uid = 'xikrKb0k2Eg';

SELECT psi.programstageinstanceid, psi.uid eventID, 
tei.trackedentityinstanceid AS teiID FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where tei.trackedentityinstanceid in (311,309,303);

--- mizorun IPA

-- program/program-stage/ program-stage-section without dataelement

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid
FROM programstagesection ps_se 
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid = 'KHvMmIe88PQ' order by ps_se.name, ps_de.sort_order;

-- program/program-stage/ program-stage-section wise dataelement-list
SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid = 'k6OM7dIb2X6' order by ps_se.name, ps_de.sort_order;

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid ( 'OoVJA33zyQY', 'E5Iai5pZBOI','NStri4nXf16','clexs6sWeOl','SH5rbquuI7L','mXBbntd7peT','yisMZUE85x5')
order by pg.name;


-- programstagedataelement list witout section
SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_de.sort_order,
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where  ps.uid in( 't0tWNua9VQL','R8Yvu2xBGIz','stpGlwydi7Z');
 
 -- program  wise dataelement count
select pg.name,pg.programid, count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid;

-- program /stage wise dataelement count
select pg.name,pg.programid,psde.programstageid, ps.name, 
count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid,psde.programstageid,ps.name;

SELECT prg.programid,prg.uid as program_UID, prg.name AS program_name,ps.programstageid, 
ps.uid AS stage_UID, ps.name as stage_name,pss.programstagesectionid, pss.uid AS section_UID,
pss.name AS section_name from programstagesection pss
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN program prg ON prg.programid = ps.programid;

select * from optionset where uid = 'dZADjoohpK8';

update optionset set valuetype = 'BOOLEAN' where uid = 'dZADjoohpK8';

select * from dataelement where valuetype = 'BOOLEAN';

update dataelement set valuetype = 'NUMBER' where valuetype = 'BOOLEAN';

update dataelement set optionsetid = 386219 where valuetype = 'NUMBER';

select * from dataelement where optionsetid= 131;

update dataelement set optionsetid = 131 where valuetype = 'NUMBER'

select * from programstagesection_dataelements where programstagesectionid in (
select programstagesectionid from programstagesection where name in (
'6.0 Hand-washing','7.0 Toilets','8.0 Shower Facilities for Patients','9.0 Medical Waste Handling','5.0 Cleanliness of Wards'));

update dataelement set optionsetid = 386219 where valuetype = 'NUMBER'
and  dataelementid in (
1445,103674);

delete from programrulevariable where uid in ('aA38eZbu2Pq','aArpCyDgBNv');
delete from programrule where uid in ('aA38eZbu2Pq','aArpCyDgBNv');
delete from programruleaction where programruleid in (select programruleid from programrule where uid in ('aA38eZbu2Pq','aArpCyDgBNv'));



select programstagedataelementid, uid, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, renderoptionsasradio, 
skipsynchronization, skipanalytics from programstagedataelement where programstageid in (4005)
order by sort_order;


select * from programstagesection_dataelements where programstagesectionid 
in ( 102390,341878,102397,102393,341877,102394,102395,102396,416241,416242)
order by sort_order;

select * from programstagedataelement where 
programstageid in (11121,5860,56461,131447,182659,1482,173088);


select prg.name,ps.* from programstage ps
INNER JOIN program prg ON prg.programid = ps.programid 
where ps.programid in(
349540,349548,349503,349572,349532,349521,349556,349564);


select programstagesectionid,dataelementid,sort_order from programstagesection_dataelements
where programstagesectionid in (341877) order by sort_order;

-- section list 102390,341878,102397,102393,341877,102394,102395,102396,416241,416242

-- 

select programstagedataelementid, programstageid, dataelementid, rendertype 
from programstagedataelement where dataelementid in (
select dataelementid from dataelement where optionsetid is not null) and
programstageid in (select programstageid from programstage where programid = 349503);


UPDATE programstagedataelement
SET rendertype = jsonb_pretty('{"MOBILE": {"type": "HORIZONTAL_CHECKBOXES"}}')::jsonb
WHERE programstagedataelementid in(431412,431281,431284);



UPDATE programstagedataelement SET rendertype = jsonb_pretty('{"MOBILE": {"type": "HORIZONTAL_CHECKBOXES"}}')::jsonb
WHERE programstagedataelementid in(431412,431281,431284);


="update programstagedataelement set SET rendertype = jsonb_pretty('{"MOBILE": {"type": "HORIZONTAL_CHECKBOXES"}}')::jsonb where programstagedataelementid = "&A2&";"


select * from programstagedataelement where programstageid in (5860,11121,56461,131447,1482,173088,182659)
and dataelementid in (1436,388058,1472,341867);


-- 01/07/2022

select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid in(173088);

select * from programstagedataelement where programstageid in 
(249457);  -- 256
262
select * from programstagedataelement where programstageid in 
(249465); -- 245

select * from programstagedataelement order by programstagedataelementid desc; --453777

select * from programstagedataelement where programstagedataelementid > 453777;

-- 14/09/2022
select * from programstagedataelement where programstageid in 
(select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','xzulp49cjax','LAtXB6WXmMR'));

select uid,programstageid,name from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','xzulp49cjax','LAtXB6WXmMR')

select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid 
in(select programstageid from programstage where uid in (
'fU8LWbcPjS6'));

select programstageid,uid,name from programstage where uid in ('PhqMTB0eOhE');

select * from programstagedataelement where programstageid in (347595,754131,570515);

select * from programstagedataelement order by programstagedataelementid desc; -- 1043318

select * from programstagedataelement where programstagedataelementid > 1043318;

update programstagedataelement set created = now()::timestamp where created = '2022-10-16';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2022-10-16';

update programstagedataelement set created = now()::timestamp where created = '2022-09-14';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2022-09-14';

update programstagedataelement set created = now()::timestamp where created = '2022-09-20';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2022-09-20';

update programstagedataelement set created = now()::timestamp where created = '2022-09-29';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2022-09-29';

insert into programstagedataelement (programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, renderoptionsasradio, skipsynchronization, skipanalytics,rendertype) values
="(nextval('hibernate_sequence'),'"&A2&"', '2022-09-29', '2022-09-29', "&C2&", "&D2&", '"&E2&"', '"&F2&"', "&G2&", '"&H2&"', '"&I2&"', '"&J2&"','"&K2&"','"&L2&"','"&M2&"'),"


-- 13/03/2023 -- 15/03/2023 -- 24/03/2023

-- 24/03/2023

select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid in(select programstageid 
from programstage where uid = 'xk27RgGNs1J') and dataelementid in (
select dataelementid from programstagesection_dataelements where programstagesectionid in (
select programstagesectionid from programstagesection
where uid in ('nU2DkrG5rPn','jr1LoPVdAjj','MYbj641ubFk','SHpCKPFDZYd',
'kiVMbkZulE8','Sh9opikkhA6','gQLXKngNSeN','mxAp2AOdUpG','RKeVX7O53FX',
'X0vqpWG9TVo','u7UPuLov6YP','zTTTlVrUCku','qEWurhnMfQu','vMvJN9Z28Qy',
'tGEgauHx5Rz','rE8VGTYBlpK','MrIVstE6D6x','st24PbjJhYI','XNMpnRbmquC',
'Hs7b3lSzrNu','FXgkTAVRRHP','omA4m63q8yM','ln6nFu0uxML','WIR3eSGFRns') ));

select * from programstagedataelement order by programstagedataelementid desc; -- 1530590
select * from programstagedataelement where programstagedataelementid > 1530590;

update programstagedataelement set created = now()::timestamp where created = '2023-03-24';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2023-03-24';

select  uid,lastupdatedby, name, 
rendertype,sortorder,programstageid,programstagesectionid from 
programstagesection where programstageid 
in(select programstageid from programstage where uid in (
'xk27RgGNs1J')) and uid in ('nU2DkrG5rPn','jr1LoPVdAjj','MYbj641ubFk','SHpCKPFDZYd',
'kiVMbkZulE8','Sh9opikkhA6','gQLXKngNSeN','mxAp2AOdUpG','RKeVX7O53FX',
'X0vqpWG9TVo','u7UPuLov6YP','zTTTlVrUCku','qEWurhnMfQu','vMvJN9Z28Qy',
'tGEgauHx5Rz','rE8VGTYBlpK','MrIVstE6D6x','st24PbjJhYI','XNMpnRbmquC',
'Hs7b3lSzrNu','FXgkTAVRRHP','omA4m63q8yM','ln6nFu0uxML','WIR3eSGFRns') 
order by sortorder;

select * from programstagesection order by programstagesectionid desc;
select * from programstagesection where  programstagesectionid > 1481568;

update programstagesection set created = now()::timestamp where created = '2023-03-24';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2023-03-24';





--

select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid in(select programstageid 
from programstage where uid = 'gM7tYCvJp5A');

select programstageid,uid,name from programstage where uid in ('iE1hvCYwKjm');

select * from programstagedataelement order by programstagedataelementid desc; -- 1494262

select * from programstagedataelement where programstagedataelementid > 1494262;

insert into programstagedataelement (programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, renderoptionsasradio, skipsynchronization, skipanalytics) values
="(nextval('hibernate_sequence'),'"&A2&"', '2023-03-13', '2023-03-13', "&E2&", "&F2&", '"&G2&"', '"&H2&"', "&I2&", '"&J2&"', '"&K2&"', '"&L2&"','"&M2&"','"&N2&"'),"

update programstagedataelement set created = now()::timestamp where created = '2023-03-13';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2023-03-13';

update programstagedataelement set created = now()::timestamp where created = '2023-03-15';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated = '2023-03-15';

select * from programstagesection order by programstagesectionid desc; ---1463156
select * from programstagesection where programstagesectionid > 1463156

update programstagesection set created = now()::timestamp where created = '2023-03-13';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2023-03-13';


update programstagesection set created = now()::timestamp where created = '2023-03-15';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2023-03-15';


select  uid,lastupdatedby, name, 
rendertype,sortorder,programstageid,programstagesectionid from 
programstagesection where programstageid 
in(select programstageid from programstage where uid in (
'gM7tYCvJp5A')) and name not like '%NQAS%' order by sortorder;


select  uid,lastupdatedby, name, 
rendertype,sortorder,programstageid,programstagesectionid from 
programstagesection where programstageid 
in(select programstageid from programstage where uid in (
'xk27RgGNs1J')) and uid in ('nU2DkrG5rPn','jr1LoPVdAjj','MYbj641ubFk','SHpCKPFDZYd',
'kiVMbkZulE8','Sh9opikkhA6','gQLXKngNSeN','mxAp2AOdUpG','RKeVX7O53FX',
'X0vqpWG9TVo','u7UPuLov6YP','zTTTlVrUCku','qEWurhnMfQu','vMvJN9Z28Qy',
'tGEgauHx5Rz','rE8VGTYBlpK','MrIVstE6D6x','st24PbjJhYI','XNMpnRbmquC',
'Hs7b3lSzrNu','FXgkTAVRRHP','omA4m63q8yM','ln6nFu0uxML','WIR3eSGFRns') 
order by sortorder;



select * from programrulevariable order by programrulevariableid desc;
select * from programrulevariable where  programrulevariableid > 1481568;

update programrulevariable set created = now()::timestamp where created = '2023-03-15';
update programrulevariable set lastupdated = now()::timestamp where lastupdated = '2023-03-15';

select * from programrule order by  programruleid desc; -- 1494287
select * from programrule where  programruleid > 1494287;

update programrule set created = now()::timestamp where created = '2023-03-15';
update programrule set lastupdated = now()::timestamp where lastupdated = '2023-03-15';


select * from programruleaction order by  programruleactionid desc; -- 1496029
select * from programruleaction where  programruleactionid > 1496029;

update programruleaction set created = now()::timestamp where created = '2023-03-15';
update programruleaction set lastupdated = now()::timestamp where lastupdated = '2023-03-15';




---
select programstagesectionid, uid, created, lastupdated, lastupdatedby, name, 
rendertype, programstageid, sortorder from 
programstagesection where programstageid 
in(select programstageid from programstage where uid in (
'fU8LWbcPjS6'));

select  uid,lastupdatedby, name, 
rendertype,sortorder,programstageid,programstagesectionid from 
programstagesection where programstageid 
in(select programstageid from programstage where uid in (
'ufk3NFIBbNv'));

select * from  programstagesection where programstageid in( 347595,754131,570515);

select * from programstagesection_dataelements where programstagesectionid in (
select programstagesectionid from programstagesection
where programstageid in( 347595,754131,570515));


insert into programstagesection (programstagesectionid, uid, created, lastupdated, lastupdatedby, name, rendertype, programstageid, sortorder ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2022-07-12', '2022-07-12', "&F2&",'"&G2&"','"&I2&"', "&H2&","&J2&"),"

select * from programstagesection order by programstagesectionid desc; ---978320
select * from programstagesection where programstagesectionid > 978320

update programstagesection set created = now()::timestamp where created = '2022-10-16';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2022-10-16';

update programstagesection set created = now()::timestamp where created = '2022-09-14';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2022-09-14';


update programstagesection set created = now()::timestamp where created = '2022-09-20';
update programstagesection set lastupdated = now()::timestamp where lastupdated = '2022-09-20';


select * from  programstagesection where programstageid in( 347595,754131,570515)
order by programstagesectionid desc;


select * from programstagesection_dataelements where programstagesectionid in (
select programstagesectionid from programstagesection
where programstageid in( 347595,754131,570515));

select * from programstagesection_dataelements where 
programstagesectionid in( select programstagesectionid 
from programstagesection where uid = 'TQy1RYUHPdA');

select * from programstagesection_dataelements where 
programstagesectionid in( select programstagesectionid 
from programstagesection where programstageid in (select programstageid
from programstage where uid = 'om7NH0wMt2L'));

select * from programstagesection_dataelements where 
programstagesectionid in( select programstagesectionid 
from programstagesection where programstageid in (
347595,754131,570515));


select pss.programstageid, pssde.programstagesectionid,pssde.sort_order,
pssde.dataelementid from programstagesection_dataelements pssde
INNER join programstagesection pss ON pss.programstagesectionid = pssde.programstagesectionid
where pss.programstageid in ( select programstageid from 
programstage where uid in ('ufk3NFIBbNv'));

insert into programstagesection_dataelements (programstagesectionid, sort_order, dataelementid) values
="("&B2&", "&G2&", "&E2&" ),"

 -- 04/07/2022
select * from programrulevariable order by programrulevariableid desc where programid in (select programid from program
where uid = 'xil8ellyMgi');

select * from program where uid = 'xil8ellyMgi'; -- PHC 07 - Quality Management G + IPA Assessment -- 349564

select * from programrulevariable where  programrulevariableid > 455332;


select * from programrulevariable order by programrulevariableid desc


insert into programrulevariable (programrulevariableid,uid,created,lastupdated,name,programid,dataelementid,sourcetype,usecodeforoptionset,valuetype) values
="(nextval('hibernate_sequence'),'"&A2&"', '2022-07-04', '2022-07-04','"&E2&"',"&D2&","&G2&",'"&F2&"','"&H2&"','"&I2&"'),"

-- 12/12/2022

select * from programrulevariable where  programrulevariableid > 1222470;
select * from programrulevariable order by programrulevariableid desc;


select * from programrulevariable where  programrulevariableid > 1446651;
select * from programrulevariable order by programrulevariableid desc;


update programrulevariable set created = now()::timestamp where created ='2022-12-12';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-12-12';

update programrulevariable set created = now()::timestamp where created ='2023-01-16';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2023-01-16';

select * from programrulevariable where  programrulevariableid > 1432146;
select * from programrulevariable order by programrulevariableid desc;

update programrulevariable set created = now()::timestamp where created ='2023-01-23';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2023-01-23';





="update programrulevariable set programid  = "&D2&" where programrulevariableid = "&B2&";"

-- 08/07/2022

select * from programrulevariable  where programid in (select programid from program
where uid = 'xil8ellyMgi');

select * from program where uid = 'go6Fw0IRk6Z'; -- 349556 -- PHC 06 - Infection Control F + IPA Assessment


select programrulevariableid,uid,created,lastupdated,name,programid,dataelementid,
sourcetype,usecodeforoptionset,valuetype from programrulevariable where programid 
in (select programid from program where uid = 'k6OM7dIb2X6');


update programrulevariable set created = now()::timestamp where created ='2022-10-19';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-10-19';

update programrulevariable set created = now()::timestamp where created ='2022-10-17';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-10-17';

update programrulevariable set created = now()::timestamp where created ='2022-10-16';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-10-16';


update programrulevariable set created = now()::timestamp where created ='2022-10-11';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-10-11';

update programrulevariable set created = now()::timestamp where created ='2022-10-13';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-10-13';


update programrulevariable set created = now()::timestamp where created ='2022-12-27';
update programrulevariable set lastupdated = now()::timestamp where lastupdated ='2022-12-27';




insert into programrule (programruleid,uid,created,lastupdated,lastupdatedby,name,programid,rulecondition,priority) values
="(nextval('hibernate_sequence'),'"&A2&"', '2022-07-05', '2022-07-05',"&E2&",'"&F2&"',"&G2&",'"&I2&"',"&J2&"),"

select programruleid,uid,created,lastupdated,lastupdatedby,name,programid,programstageid,rulecondition,priority
 from programrule where programid 
in (select programid from program where uid = 'k6OM7dIb2X6');


select * from programrule order by  programruleid desc; -- 501532
select * from programrule where  programruleid > 501532;

insert into programrule (programruleid,uid,created,lastupdated,lastupdatedby,name,programid,programstageid,rulecondition,priority) values
="(nextval('hibernate_sequence'),'"&A2&"', '2022-07-05', '2022-07-05',"&D2&",'"&E2&"',"&F2&","&G2&",'"&H2&"',"&I2&"),"


update programrule set created = now()::timestamp where created ='2022-10-16';
update programrule set lastupdated = now()::timestamp where lastupdated ='2022-10-16';

update programrule set created = now()::timestamp where created ='2022-10-13';
update programrule set lastupdated = now()::timestamp where lastupdated ='2022-10-13';


select programruleactionid,uid,created,lastupdated,lastupdatedby,actiontype,programruleid,dataelementid,content, data,evaluationtime,environments
 from programruleaction where programruleid 
in (select programruleid from programrule where programid = 349503);

insert into programruleaction (programruleactionid,uid,created,lastupdated,lastupdatedby,actiontype,programruleid,dataelementid,content, data,evaluationtime,environments) values
="(nextval('hibernate_sequence'),'"&A2&"', '2022-07-08', '2022-07-08',"&C2&",'"&D2&"',"&F2&","&G2&",'"&H2&"','"&I2&"','"&J2&"','"&K2&"'),"

update programstagedataelement set created = now()::timestamp where created ='2022-07-11';
update programstagedataelement set lastupdated = now()::timestamp where lastupdated ='2022-07-11';


-- 12/07/2022

insert into programstagesection (programstagesectionid, uid, created, lastupdated, lastupdatedby, name, rendertype, programstageid, sortorder ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2022-07-12', '2022-07-12', "&F2&",'"&G2&"','"&I2&"', "&H2&","&J2&"),"


update programstagesection set created = now()::timestamp where created ='2022-07-12';
update programstagesection set lastupdated = now()::timestamp where lastupdated ='2022-07-12';


select * from programstagesection_dataelements where 
programstagesectionid in( select programstagesectionid 
from programstagesection where uid = 'TQy1RYUHPdA');

select * from programrulevariable  where programid in (select programid from program
where uid in('kZ1sTUuqdbJ','wpQQKp9Hy5E','PJogjQhf9rJ'));

select * from programrulevariable  order by programrulevariableid desc; -- 890285
select * from programrulevariable where programrulevariableid > 890285;


select * from program where uid in('kZ1sTUuqdbJ','wpQQKp9Hy5E','PJogjQhf9rJ');

update programrulevariable  set created = now()::timestamp where created ='2022-07-15';
update programrulevariable  set lastupdated = now()::timestamp where lastupdated ='2022-07-15';

update programrulevariable  set created = now()::timestamp where created ='2022-08-25';
update programrulevariable  set lastupdated = now()::timestamp where lastupdated ='2022-08-25';

update programrulevariable  set created = now()::timestamp where created ='2022-09-26';
update programrulevariable  set lastupdated = now()::timestamp where lastupdated ='2022-09-26';


-- 20/03/2023
select * from programrulevariable  order by programrulevariableid desc; -- 1502546
select * from programrulevariable where programrulevariableid > 1502546;

update programrulevariable  set created = now()::timestamp where created ='2023-03-20';
update programrulevariable  set lastupdated = now()::timestamp where lastupdated ='2023-03-20';

-- 28/03/2023

select programrulevariableid,uid,created,lastupdated,name,programid,dataelementid,
sourcetype,usecodeforoptionset,valuetype from programrulevariable where programid 
in (select programid from program where uid = 'HoSWGbzZxF9');

select * from programrulevariable  order by programrulevariableid desc; -- 1540166
select * from programrulevariable where programrulevariableid > 1540166;

update programrulevariable  set created = now()::timestamp where created ='2023-03-28';
update programrulevariable  set lastupdated = now()::timestamp where lastupdated ='2023-03-28';



select programruleid,uid,created,lastupdated,lastupdatedby,name,programid,programstageid,rulecondition,priority
 from programrule where programid 
in (select programid from program where uid = 'HoSWGbzZxF9');


select * from programrule order by  programruleid desc; -- 501532
select * from programrule where  programruleid > 501532;

update programrule  set created = now()::timestamp where created ='2023-03-28';
update programrule  set lastupdated = now()::timestamp where lastupdated ='2023-03-28';



select programruleactionid,uid,created,lastupdated,lastupdatedby,actiontype,programruleid,dataelementid,content, 
data,evaluationtime,environments
 from programruleaction where programruleid 
in (select programruleid from programrule where programid in
( select programid from program where uid = 'HoSWGbzZxF9'));

update programruleaction  set created = now()::timestamp where created ='2023-03-28';
update programruleaction  set lastupdated = now()::timestamp where lastupdated ='2023-03-28';


="update programruleaction set dataelementid  = "&H2&" where programruleactionid = "&B2&";"
="update programruleaction set content  = '"&I2&"' where programruleactionid = "&B2&";"
="update programruleaction set data  = '"&J2&"' where programruleactionid = "&B2&";"

-- 16/07/2022

01 Total Score (Ex-Ante) Max 1000
01 Total Score (Ex-Post) Max 1000


select name,programid,programstageid from programstage 
where programid in ( 349503,349572) order by name;

update programrule  set created = now()::timestamp where created ='2022-07-16';
update programrule  set lastupdated = now()::timestamp where lastupdated ='2022-07-16';


update programrule  set created = now()::timestamp where created ='2022-09-08';
update programrule  set lastupdated = now()::timestamp where lastupdated ='2022-09-08';


update programruleaction  set created = now()::timestamp where created ='2022-09-08';
update programruleaction  set lastupdated = now()::timestamp where lastupdated ='2022-09-08';

select * from programruleaction order by programruleactionid desc;
select * from programruleaction where programruleactionid > 1085929;


update programruleaction  set created = now()::timestamp where created ='2022-10-13';
update programruleaction  set lastupdated = now()::timestamp where lastupdated ='2022-10-13';

update programruleaction  set created = now()::timestamp where created ='2022-10-16';
update programruleaction  set lastupdated = now()::timestamp where lastupdated ='2022-10-16';

update programruleaction set content = null where content = 'NULL';

select * from programruleaction where content = 'NULL';

update programruleaction set content = null where content = 'NULL';
-- for EPI YEMEN
select * from trackedentityinstance where deleted is true;

delete from trackedentityinstance where deleted is true;

delete from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true);

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true));

delete from programmessage where programstageinstanceid in (select 
programstageinstanceid from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true)));


-- 10/08/2022

select programstagedataelementid, uid, created, lastupdated, programstageid, dataelementid, 
compulsory, allowprovidedelsewhere, sort_order, displayinreports, allowfuturedate, 
renderoptionsasradio, skipsynchronization, skipanalytics,rendertype from 
programstagedataelement where programstageid in(173088);


-- for analytics issue
select * from dataelement where optionsetid is not null;

select * from dataelement where optionsetid in (131,
417507,392667,386219,281566);

select * from optionset where optionsetid in (
select optionsetid from dataelement where optionsetid is not null);

update optionset set valuetype = 'INTEGER_ZERO_OR_POSITIVE' where optionsetid in (131,
417507,392667,386219,281566);

update dataelement set valuetype = 'INTEGER_ZERO_OR_POSITIVE' where optionsetid in (131,
417507,392667,386219,281566);

update optionset set valuetype = 'INTEGER_POSITIVE' where optionsetid in (131,
417507,392667,386219,281566);

update dataelement set valuetype = 'INTEGER_POSITIVE' where optionsetid in (131,
417507,392667,386219,281566);

update dataelement set zeroissignificant = true where optionsetid in (131,
417507,392667,386219,281566);

-- http://127.0.0.1:8091/ipa/api/events/IW8mCfproQP.json

delete from programstageinstance where uid = 'IW8mCfproQP';

select * from program where uid = 'CZLfL0vYlpl';

select * from optionset where uid = 'uysm1lQPUN7';
update optionset set valuetype = 'TEXT' where uid = 'uysm1lQPUN7';

select * from programstagedataelement where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid = 'CZLfL0vYlpl'));

select * from dataelement where dataelementid in (
select dataelementid from programstagedataelement where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid = 'CZLfL0vYlpl')));

update dataelement set valuetype = 'TEXT'  where dataelementid in (
select dataelementid from programstagedataelement where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid = 'CZLfL0vYlpl')));

select * from programrulevariable where programid in (
select programid from program where uid = 'CZLfL0vYlpl');

update programrulevariable set valuetype = 'TEXT' where programid in (
select programid from program where uid = 'CZLfL0vYlpl');


select * from dataelement where dataelementid in (
select dataelementid from programstagedataelement where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid = 'lf1lggOFGsR'))) and name not in (
'Total NQAS score', 'Total NQAS score (%)');

update dataelement set valuetype = 'TEXT'  where dataelementid in (
select dataelementid from programstagedataelement where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid = 'lf1lggOFGsR'))) and name not in (
'Total NQAS score', 'Total NQAS score (%)');

select * from programrulevariable where programid in (
select programid from program where uid = 'lf1lggOFGsR') and dataelementid is not null;

update programrulevariable set valuetype = 'TEXT' where programid in (
select programid from program where uid = 'lf1lggOFGsR') and dataelementid is not null;


-- pccds

="update trackedentityinstance set organisationunitid  = "&F2&" where trackedentityinstanceid = "&C2&";"

="update programinstance set organisationunitid  = "&C2&" where trackedentityinstanceid = "&A2&";"

="update trackedentityprogramowner set organisationunitid  = "&C2&" where trackedentityinstanceid = "&A2&";"

-- event list for move
SELECT psi.programstageinstanceid, psi.uid eventID, 
tei.trackedentityinstanceid AS teiID FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where tei.trackedentityinstanceid in (311,309,303);

="update programstageinstance set organisationunitid  = "&D2&" where uid = '"&B2&"' and programstageinstanceid = "&A2&";"



-- PCCDS 17/02/2023

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance
where executiondate::date <= '2023-01-31');

delete from programstageinstancecomments where programstageinstanceid in (
select programstageinstanceid from programstageinstance
where executiondate::date <= '2023-01-31');

delete from programstageinstance
where executiondate::date <= '2023-01-31';


select * from programinstance where  programid in (
select programid from program where uid = 'AN1fCD4dONc');

select * from programstageinstance where programinstanceid in(
select programinstanceid from programinstance where  programid in (
select programid from program where uid = 'AN1fCD4dONc'));

-- delete event of event program 24/02/2023
delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programinstanceid in(
select programinstanceid from programinstance where  programid in (
select programid from program where uid = 'AN1fCD4dONc')));

delete from programstageinstancecomments where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programinstanceid in(
select programinstanceid from programinstance where  programid in (
select programid from program where uid = 'AN1fCD4dONc')));

delete from programstageinstance where programinstanceid in(
select programinstanceid from programinstance where  programid in (
select programid from program where uid = 'AN1fCD4dONc'));

delete from programinstance where  programid in (
select programid from program where uid = 'AN1fCD4dONc');



delete from program_organisationunits where programid = 18585;
delete from programstagedataelement where programstageid = 18583;
delete from programstage where programid = 18585;
delete from program where programid = 18585;

update programinstance set programid = 16454 where programid = 18585;


-- 02/03/2023 Kyrgyzstan  datavalue delete sql-query

select * from dataset where datasetid = 742;

select * from datavalue where periodid in (28249,27738,27473)
and dataelementid in (select dataelementid from datasetelement 
where datasetid = 742) order by created desc;

select * from organisationunit where organisationunitid = 6610;


select * from period where periodtypeid = 8
order by startdate desc;

select * from periodtype;

delete from datavalue where periodid in (28249,27738,27473)
and dataelementid in (select dataelementid from datasetelement 
where datasetid = 742);

delete from datavalueaudit where periodid in (28249,27738,27473)
and dataelementid in (select dataelementid from datasetelement 
where datasetid = 742);




-- 10/03/2023 -- prep_tracker

INSERT INTO programindicator(programindicatorid, uid, created, lastupdated, name, shortname, programid, expression, filter, aggregationtype, analyticstype) VALUES
="(nextval('hibernate_sequence'),'"&A2&"','2023-03-10','2023-03-10','"&D2&"','"&E2&"',"&C2&",'"&H2&"','"&I2&"','"&F2&"','"&G2&"'),"

select * from program;

select * from programindicator order by programindicatorid desc;

select * from programindicator where programindicatorid > 138202;

update programindicator  set created = now()::timestamp where created ='2023-03-10';
update programindicator  set lastupdated = now()::timestamp where lastupdated ='2023-03-10';


select * from periodboundary order by periodboundaryid desc;
select * from periodboundary order by periodboundaryid desc;

select * from periodboundary where periodboundaryid > 138209;


INSERT INTO periodboundary(periodboundaryid, uid, created, lastupdated, boundarytarget, analyticsperiodboundarytype, programindicatorid ) VALUES
="(nextval('hibernate_sequence'),'"&A2&"','2023-03-10','2023-03-10','"&C2&"','"&D2&"',"&B2&"),"

update periodboundary  set created = now()::timestamp where created ='2023-03-10';
update periodboundary  set lastupdated = now()::timestamp where lastupdated ='2023-03-10';


-- 30/03/2023

-- delete programstagesection

delete from programstagesection_dataelements where programstagesectionid in (
select programstagesectionid from 
programstagesection where uid in ('FeaiKArlR1b','VidtGcuYDZX','loqf7ZvsB0F','rkUFInRkvcb');

update programruleaction set programstagesectionid = null where programstagesectionid in (
select programstagesectionid from 
programstagesection where uid in  ('FeaiKArlR1b','VidtGcuYDZX','loqf7ZvsB0F','rkUFInRkvcb'));

delete from programstagesection where uid in  (
'FeaiKArlR1b','VidtGcuYDZX','loqf7ZvsB0F','rkUFInRkvcb',
'SLw3GEenFnS','jr1LoPVdAjj','WQFLY65vCpY','EF730hctVq9');

-- delete programstage

delete from programstagesection_dataelements
where programstagesectionid in ( select programstagesectionid 
from programstagesection where programstageid in (
select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR')));

delete from programstagesection where programstageid in (
select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR'));

delete from programstagedataelement where programstageid in (
select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR'));

delete from trackedentitydatavalueaudit
where programstageinstanceid in ( select programstageinstanceid 
from programstageinstance where programstageid in (
select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR')));

delete from programstageinstance where programstageid in (
select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR'));

update programrulevariable set programstageid = null where programstageid in (
select programstageid from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR'));


delete from programstage where uid in (
'y47jycLM4Zf','ZcueVAt15bf','IhgmHzWLtdD','UC0HBBPXtn3',
'xlFBXDzoNsp','fU8LWbcPjS6','xzulp49cjax','LAtXB6WXmMR');


-- program delete

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5')));

delete from programinstance where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'));

delete from programrulevariable where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'));

delete from program_attributes where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'));

delete from trackedentityprogramowner where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'));

delete from programruleaction where programruleid in (
select programruleid from programrule where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5')));

delete from programrule where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'));

delete from programstagesection_dataelements where programstagesectionid
in (select programstagesectionid from programstagesection where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'))));

delete from programstagesection where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5')));

delete from programstagedataelement where programstageid in (
select programstageid from programstage where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5')));

delete from programstage where programid in (
select programid from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5'));

delete from program where uid in (
'KHvMmIe88PQ', 'KgLaG1OfLJK','Z6cnbLH3QB5');

