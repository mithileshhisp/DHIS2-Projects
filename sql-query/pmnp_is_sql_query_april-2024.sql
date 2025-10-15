
-- PMNP-IS -- 25/04/2025


-- 29/04/2025
SELECT tei.trackedentityinstanceid,
tei.uid as tei,  org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid

INNER JOIN program prg ON prg.programid = pi.programid

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid

WHERE prg.uid = 'oSNoNtcmLXL';

SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei,  org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid

INNER JOIN program prg ON prg.programid = pi.programid

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'oSNoNtcmLXL'
and teav.trackedentityattributeid in( select trackedentityattributeid from trackedentityattribute where uid = 'eMYBznRdn0t');

-- house_hold_ID attribute_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'oSNoNtcmLXL'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'IKOSsYJJZis');



-- house_hold_member attribute__house_hold_id_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'VVLirjoOGbj'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'RDQQ3t9oXw5 ');


-- house_hold_member attribute__Family Information UID_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'VVLirjoOGbj'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'gv9xX5w4kKt');



insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&A2&","&C2&",'2025-04-25','2025-04-25','"&D2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2025-04-25';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-04-25';	

update trackedentityattributevalue set created = now()::timestamp where created = '2025-04-29';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-04-29';	


-- 30/04/2025
-- event dataValue
SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid in('wrebGMGk0a2');

SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.uid as prg_uid, prg.name as prg_name, ps.name as stage_name, psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid in('qKRCwp6iYV7');

-- orgUnit details 04/05/2025

select * from organisationunit where uid in ( 
'TnrcliUXV5a','yzpQBw1bzh2','c9yQkn9meqL','xdjZobQ9rak', 'MZG9dvMzzeK');

select * from organisationunit where 
parentid in (92,93,96,94,244);

 -- 05/05/2025
select * from organisationunit where uid in ( 
'TnrcliUXV5a','yzpQBw1bzh2','c9yQkn9meqL','xdjZobQ9rak', 'MZG9dvMzzeK','ZQBdFVxYVGl','CmYCcxj9j2d');


select * from organisationunit where parentid  in ( select organisationunitid from
organisationunit where uid in ( 
'iaCYPDtHgcc','SPhZ5eP05iO','tNPqEBG2dJf','edqW5VXEPSc', 'Xp2gUoKsN8d',
'nkz7gwwXILI','q52zjp4ueMp','MKTGZkg5hIL','rofjmy09NSl'));


iaCYPDtHgcc


select * from organisationunit where uid = 'tjHB2d3o6LM';

select * from organisationunit where parentid in ( 608174 );

select count(*) from organisationunit;

select * from organisationunit order by lastupdated desc;

select count(*) from userinfo; -- 170

-- delete orgUnit

delete from trackedentitydatavalueaudit where programstageinstanceid in ( 
select programstageinstanceid from 
programstageinstance  where organisationunitid in ( 187,189 );

delete from programstageinstance  where organisationunitid in (
187,189);

delete from programinstance  where organisationunitid in (
187,189);

delete from trackedentityattributevalueaudit where trackedentityinstanceid in
( select trackedentityinstanceid from trackedentityinstance  where organisationunitid in (
187,189);

delete from trackedentityprogramowner where trackedentityinstanceid in 
( select trackedentityinstanceid 
from trackedentityinstance  where organisationunitid in (
187,189);

delete from trackedentityattributevalue where trackedentityinstanceid in
( select trackedentityinstanceid from trackedentityinstance  where organisationunitid in (
187,189 );

delete from trackedentityinstance  where organisationunitid in (
187,189);

delete from userdatavieworgunits  where organisationunitid in (
187,189);

delete from usermembership  where organisationunitid in (
187,189);

delete from userteisearchorgunits  where organisationunitid in (
187,189);

delete from organisationunit  where organisationunitid in (
187,189);


select * from userrole where uid = 'MUNroCPg9tl' -- 7214
select * from userrolemembers where userroleid = 7214

select * from usergroup where uid = 'VfVrBMOl8tH'; -- 199359

select * from usergroupmembers where usergroupid = 199359;


select * from userrolemembers where userroleid = 7214 and userid 
in ( 605609,
605670);

select * from usergroupmembers where usergroupid = 199359 and userid 
in ( 605609,
605670,
605671);


SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where prg.uid = 'ffwRgqIfrj2' and  de.uid in('rpQi6D8L58H') and cast(data.value::json ->> 'value' AS VARCHAR) = '2025'
order by org.uid asc;








-- PMNP-IS -- 25/04/2025

-- 29/04/2025
SELECT tei.trackedentityinstanceid,
tei.uid as tei,  org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid

INNER JOIN program prg ON prg.programid = pi.programid

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid

WHERE prg.uid = 'oSNoNtcmLXL';

SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei,  org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid

INNER JOIN program prg ON prg.programid = pi.programid

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'oSNoNtcmLXL'
and teav.trackedentityattributeid in( select trackedentityattributeid from trackedentityattribute where uid = 'eMYBznRdn0t');

-- house_hold_ID attribute_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'oSNoNtcmLXL'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'IKOSsYJJZis');



-- house_hold_member attribute__house_hold_id_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'VVLirjoOGbj'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'RDQQ3t9oXw5 ');


-- house_hold_member attribute__Family Information UID_with_TEI
SELECT teav.value AS Household_UID , tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunit,org.code as org_code
from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'VVLirjoOGbj'
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid = 'gv9xX5w4kKt');

-- tei attributeValue not enroll in any program
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.name as orgName,
teav.value AS Household_UID from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance)
and teav.trackedentityattributeid in( select trackedentityattributeid 
from trackedentityattribute where uid in( 'b4UUhQPwlRH','hDE1WNqTTwF'));

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&A2&","&C2&",'2025-04-25','2025-04-25','"&D2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2025-04-25';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-04-25';	

update trackedentityattributevalue set created = now()::timestamp where created = '2025-04-29';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-04-29';	


-- 30/04/2025
-- event dataValue
SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.name as prg_name,ps.name as stage_name,psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid in('wrebGMGk0a2');

SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.uid as prg_uid, prg.name as prg_name, ps.name as stage_name, psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid in('qKRCwp6iYV7');

-- orgUnit details 04/05/2025

select * from organisationunit where uid in ( 
'TnrcliUXV5a','yzpQBw1bzh2','c9yQkn9meqL','xdjZobQ9rak', 'MZG9dvMzzeK');

select * from organisationunit where 
parentid in (92,93,96,94,244);

 -- 05/05/2025
select * from organisationunit where uid in ( 
'TnrcliUXV5a','yzpQBw1bzh2','c9yQkn9meqL','xdjZobQ9rak', 'MZG9dvMzzeK','ZQBdFVxYVGl','CmYCcxj9j2d');


select * from organisationunit where parentid  in ( select organisationunitid from
organisationunit where uid in ( 
'iaCYPDtHgcc','SPhZ5eP05iO','tNPqEBG2dJf','edqW5VXEPSc', 'Xp2gUoKsN8d',
'nkz7gwwXILI','q52zjp4ueMp','MKTGZkg5hIL','rofjmy09NSl'));


iaCYPDtHgcc


select * from organisationunit where uid = 'tjHB2d3o6LM';

select * from organisationunit where parentid in ( 608174 );

select count(*) from organisationunit;

select * from organisationunit order by lastupdated desc;

select count(*) from userinfo; -- 170

-- delete orgUnit

delete from trackedentitydatavalueaudit where programstageinstanceid in ( 
select programstageinstanceid from 
programstageinstance  where organisationunitid in ( 187,189 );

delete from programstageinstance  where organisationunitid in (
187,189);

delete from programinstance  where organisationunitid in (
187,189);

delete from trackedentityattributevalueaudit where trackedentityinstanceid in
( select trackedentityinstanceid from trackedentityinstance  where organisationunitid in (
187,189);

delete from trackedentityprogramowner where trackedentityinstanceid in 
( select trackedentityinstanceid 
from trackedentityinstance  where organisationunitid in (
187,189);

delete from trackedentityattributevalue where trackedentityinstanceid in
( select trackedentityinstanceid from trackedentityinstance  where organisationunitid in (
187,189 );

delete from trackedentityinstance  where organisationunitid in (
187,189);

delete from userdatavieworgunits  where organisationunitid in (
187,189);

delete from usermembership  where organisationunitid in (
187,189);

delete from userteisearchorgunits  where organisationunitid in (
187,189);

delete from organisationunit  where organisationunitid in (
187,189);


select * from userrole where uid = 'MUNroCPg9tl' -- 7214
select * from userrolemembers where userroleid = 7214

select * from usergroup where uid = 'VfVrBMOl8tH'; -- 199359

select * from usergroupmembers where usergroupid = 199359;

select * from userrolemembers where userroleid = 7214 and userid 
in ( 605609,605670);

select * from usergroupmembers where usergroupid = 199359 and userid 
in ( 605609,605670,605671);

-- 23/05/2025 

-- delete tracker and aggregated data
-- delete dataelements with aggregate and delete dataset

-- dataset

select * from dataset;

delete from datasetelement where datasetid = 603481; -- 22
delete from datasetsource where datasetid = 603481; -- 5
delete from dataset where datasetid = 603481; -- 1

-- delete dataelement

select * from dataelement where domaintype = 'AGGREGATE';

delete from visualization_datadimensionitems where datadimensionitemid
in (select datadimensionitemid from datadimensionitem where dataelementid in (
select dataelementid from dataelement where domaintype = 'AGGREGATE')); -- 35

delete from datadimensionitem where dataelementid in (
select dataelementid from dataelement where domaintype = 'AGGREGATE'); -- 35

delete from dataelementgroupmembers where dataelementid in (
select dataelementid from dataelement where domaintype = 'AGGREGATE'); -- 21

delete from dataelement where domaintype = 'AGGREGATE'; -- 22


-- 26/05/2025


select code,uid from organisationunit 
where code is not null;

select uid,organisationunitid,code from organisationunit;

select * from usergroup  where uid in ( 'EcTqBndpJRF','X76IjKG0XFz','VfVrBMOl8tH');

select count(*) from userinfo; -- 620 as on 26/05/2025



insert into userinfo ( userinfoid ,uid,lastupdated ,created, surname ,firstname ,lastupdatedby, creatoruserid ,username,  "password", disabled, externalauth, selfregistered ,invitation  ) values
="(nextval('hibernate_sequence'),'"&A2&"', '2025-07-24', '2025-07-24', '"&C2&"', '"&D2&"', 1, 1 ,'"&E2&"', '"&F2&"', 'false','false','false','false' ),"


update userinfo set created = now()::timestamp where created = '2025-07-24'; 
update userinfo set lastupdated = now()::timestamp where lastupdated = '2025-07-24';

insert into userdatavieworgunits ( userinfoid, organisationunitid ) values
="("&A2&","&K2&"),"

insert into usermembership ( organisationunitid, userinfoid ) values
="("&L2&","&K2&"),"

insert into userteisearchorgunits ( userinfoid, organisationunitid ) values
="("&K2&","&L2&"),"

insert into userrolemembers ( userroleid ,userid ) values
="("&D2&","&G2&"),"


select userroleid ,userid  from userrolemembers


insert into usergroupmembers (userid,usergroupid) values
="("&A2&","&B2&"),"



="update userinfo set email = '"&B2&"' where username = '"&A2&"';"
="update userinfo set phonenumber = '"&C2&"' where username = '"&A2&"';"



-- 11/06/2024 from production ln3 and links pilot

-- delete dataelements



delete from eventvisualization_dataelementdimensions
where trackedentitydataelementdimensionid in (
select trackedentitydataelementdimensionid from trackedentitydataelementdimension
where dataelementid in
(2016,2018,2021,2019,2020,2017,2024)); --2 

delete from trackedentitydataelementdimension
where dataelementid in
(2016,2018,2021,2019,2020,2017,2024); -- 2

delete from trackedentitydatavalueaudit
where dataelementid in
(2016,2018,2021,2019,2020,2017,2024); -- 1394462

delete from dataelement where dataelementid in
(2016,2018,2021,2019,2020,2017,2024); -- 7

select * from dataelement where dataelementid in
(2016,2018,2021,2019,2020,2017,2024);

select * from dataelement where uid 
in ( 'OiOvGqVEyY9','g276qF2fXHi','wxN2PuLymoY','CEF6Dkpe2jW',
'JjFcU1L7Ll1','Yp6gJAdu4yX','q0WEgMBwi0p');


update trackedentityattribute set uid = 'OiOvGqVEyY9' where uid = 'weJystLScys';
update trackedentityattribute set uid = 'g276qF2fXHi' where uid = 'AheMY64Uyba';
update trackedentityattribute set uid = 'wxN2PuLymoY' where uid = 'aISVscdEEOD';
update trackedentityattribute set uid = 'CEF6Dkpe2jW' where uid = 'mCfkDz8iXSB';
update trackedentityattribute set uid = 'JjFcU1L7Ll1' where uid = 'naxmhkGr88P';
update trackedentityattribute set uid = 'Yp6gJAdu4yX' where uid = 'EtLMkCaFwFb';
update trackedentityattribute set uid = 'q0WEgMBwi0p' where uid = 'Ypg1M8SAQSF';


SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.uid as prg_uid,prg.name as prg_name,ps.name as stage_name, de.uid as de_uid
psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid in('WdnS7uGEKJT');



SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.uid as prg_uid,prg.name as prg_name,ps.name as stage_name, data.key as de_uid,
psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where data.key in('OiOvGqVEyY9');

-- pmnp_pilot_v240 13/06/2025

select * from trackedentityattribute where uid = 'E3CP2bfqrOe';

select tei.uid as tei_uid, org.uid as org_uid, org.name as org_name, 
prg.uid as prg_uid, prg.name as prg_name, teav.trackedentityinstanceid, 
teav.trackedentityattributeid, teav.value,teav.storedby  from trackedentityattributevalue teav
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
inner join organisationunit org on org.organisationunitid = tei.organisationunitid
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join program prg on prg.programid = pi.programid
where trackedentityattributeid = 692615;


select tei.uid as tei_uid, 
prg.uid as prg_uid, prg.name as prg_name from trackedentityinstance tei
inner join programinstance pi on pi.trackedentityinstanceid = tei.trackedentityinstanceid
inner join program prg on prg.programid = pi.programid
where prg.uid = 'VVLirjoOGbj'; -- Household Member


select * from trackedentityattributevalue where trackedentityattributeid 
in ( 1996, 7289);

select * from trackedentityattribute where uid 


select * from trackedentityinstance;
in ( 'BbdQMKOObps', 'ZGPJg7g997n');

SELECT psi.uid as eventUID, org.uid AS orgUnitUID,org.name AS orgUnitName, 
prg.uid as prg_uid, prg.name as prg_name,ps.name as stage_name, de.uid as de_uid,
psi.executiondate::date, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid in('WdnS7uGEKJT');

select * from trackedentityinstance where trackedentityinstanceid 
not in ( select trackedentityinstanceid from programinstance );

select * from trackedentityinstance where trackedentityinstanceid in 
( 591625,591626,591627,591628,591629,591630,591631,591632);

delete from trackedentityinstance where trackedentityinstanceid in 
( 591625,591626,591627,591628,591629,591630,591631,591632); -- 8

delete from trackedentityattributevalue where trackedentityinstanceid in 
( 591625,591626,591627,591628,591629,591630,591631,591632); -- 56


-- delete user from UAT server 18/06/2025

delete from userkeyjsonvalue where userid in (
610199,604002,604045,602094,662477);



delete from userinfo where userinfoid in (
610199,604002,604045,602094,662477);

delete from userdatavieworgunits where userinfoid in (); -- 2537

delete from usergroupmembers where userid in (); -- 2970
delete from usergroupmembers where userid in (); -- 2970
delete from usermembership where userinfoid in (); -- 2537
delete from userrolemembers where userid in (); -- 2984
delete from userteisearchorgunits where userinfoid in (); -- 2536
delete from previouspasswords where userid in (); -- 2575
delete from usersetting where userinfoid in (); -- 312
delete from dashboard_items where dashboardid in (
select dashboardid from dashboard where userid in ()); -- 1079
delete from dashboard where userid in (); -- 351
delete from dashboard_items where dashboarditemid in (
select dashboarditemid 
from dashboarditem where eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ())); -- 1
delete from dashboarditem where eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ()); -- 85

update dashboarditem set eventvisualizationid = null; --  1054
update dashboarditem set eventreport = null; -- 1054
delete from eventvisualization_attributedimensions where eventvisualizationid
in ( select eventvisualizationid 
from eventvisualization where userid in ()); -- 25

delete from eventvisualization_columns where 
eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ()); -- 2007

delete from eventvisualization_dataelementdimensions where 
eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ()); -- 1533

delete from eventvisualization_filters where 
eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ()); -- 13

delete from eventvisualization_organisationunits where 
eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ()); -- 81

delete from eventvisualization_programindicatordimensions where 
eventvisualizationid in (
select eventvisualizationid from eventvisualization where userid in ()) -- 29

delete from eventvisualization where userid in (); -- 220

delete from dashboard_items where dashboarditemid in (
select dashboarditemid 
from dashboarditem where visualizationid in (
select visualizationid from visualization where userid in ()); -- 2

delete from dashboarditem where 
visualizationid in (
select visualizationid from visualization where userid in ()); -- 499

delete from visualization_columns where 
visualizationid in (
select visualizationid from visualization where userid in (); -- 761

delete from visualization_datadimensionitems where 
visualizationid in (
select visualizationid from visualization where userid in ()); -- 2350

delete from visualization_organisationunits where 
visualizationid in (
select visualizationid from visualization where userid in ()); -- 693

delete from visualization_rows where 
visualizationid in (
select visualizationid from visualization where userid in ()); -- 584

delete from visualization_filters where 
visualizationid in (
select visualizationid from visualization where userid in ()); -- 708

delete from visualization_periods where 
visualizationid in (
select visualizationid from visualization where userid in (); -- 521

delete from visualization_yearlyseries where 
visualizationid in (
select visualizationid from visualization where userid in (); -- 16

delete from visualization where userid in ( ); -- 686

update keyjsonvalue set lastupdatedby = 1

-- 24/06/2025
-- pilot
 -- household attribute value for members tei mapped
select teav.value, tei.uid as teiUID,tei.trackedentityinstanceid
from trackedentityattributevalue teav 
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
where teav.trackedentityattributeid = 692615;

-- 10/07/2025
select * from trackedentityattributevalue 
where value = '17051010090000001';

select teav.value, tei.uid as teiUID,tei.trackedentityinstanceid
from trackedentityattributevalue teav 
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
where teav.trackedentityattributeid = 692615;







-- pmnp_is_240 19/06/2025

-- prduction
-- https://dev.pmnpis.org.ph/pmnp_is/dhis-web-commons/security/login.action
-- admin / Hisp@2025

test_tgk_sv / Pmnp@2025
test_mlt / Pmnp@2025
test_mlt_sv / Pmnp@2025

select * from dataelement where uid in ( )

'OiOvGqVEyY9'
'g276qF2fXHi'
'wxN2PuLymoY'
'CEF6Dkpe2jW'
'JjFcU1L7Ll1'
'Yp6gJAdu4yX'
'q0WEgMBwi0p'

select count(*) from userinfo; -- 

select count(*) from userinfo;

select uid,userinfoid from userinfo where uid = 'xtMgoEwRa9Z';

select name,uid,code from organisationunit
where parentid in ( select organisationunitid from organisationunit 
where uid = 'l1bdUet5D8O');

select username,uid,userinfoid from userinfo 
where created::date = '2025-06-19';


select uid,userinfoid from userinfo where uid = 'xtMgoEwRa9Z';

select name,uid,code from organisationunit
where parentid in ( select organisationunitid from organisationunit 
where uid = 'vVmzE9088GI');


select code,uid,name from organisationunit;

select uid,organisationunitid, name from organisationunit;


insert into userdatavieworgunits ( userinfoid, organisationunitid ) values
="("&A2&","&K2&"),"

insert into usermembership ( organisationunitid, userinfoid ) values
="("&L2&","&K2&"),"

insert into userteisearchorgunits ( userinfoid, organisationunitid ) values
="("&K2&","&L2&"),"


="update usermembership set organisationunitid = "&D2&"  where userinfoid = "&E2&";"

="update userdatavieworgunits set organisationunitid = "&D2&"  where userinfoid = "&E2&";"

="update userteisearchorgunits set organisationunitid = "&D2&"  where userinfoid = "&E2&";"

-- tei list for move from pmnp pilot instance

SELECT tei.uid AS teiUID, pi.uid AS enrollmentUID,
psi.uid AS eventUID, psi.executiondate::date as event_date, prg.uid program_uid, prg.name AS programName,
ps.uid ps_uid, ps.name AS programStageName,
org.uid AS orgUID, org.name AS orgName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where org.organisationunitid in ( select organisationunitid from organisationunit where parentid 
in ( select organisationunitid from organisationunit 
where uid = 'vVmzE9088GI') );

-- 20/06/2025


select uid,trackedentityinstanceid from trackedentityinstance
where organisationunitid in ( select organisationunitid from organisationunit where parentid 
in ( select organisationunitid from organisationunit 
where uid = 'vVmzE9088GI') ); -- 4322 -- done

select uid,trackedentityinstanceid from trackedentityinstance
where organisationunitid in ( select organisationunitid from organisationunit where parentid 
in ( select organisationunitid from organisationunit 
where uid = 'l1bdUet5D8O') ); -- 96534 -- done

-- 21/06/2025


select count(*) from trackedentityinstance; -- 100856
select count(*) from trackedentityattributevalue; -- 1091738
select count(*) from programinstance; -- 99023
select count(*) from programstageinstance; -- 90329

delete from trackedentitydatavalueaudit; --567430
delete from programstageinstance; --90329

-- 26/06/2025




select uid,programstageinstanceid from programstageinstance
where executiondate::date = '2025-06-26';


insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&G2&"', '2025-06-26', '2025-06-26', '"&H2&"', '"&I2&"', "&B2&", "&F2&",'"&H2&"', "&D2&", 'false','admin' ),"

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&B2&", "&F2&",'2025-06-26','2025-06-26',"&D2&",'admin' ),"


update programinstance set created = now()::timestamp where created = '2025-06-26';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-06-26';	


update trackedentityprogramowner set created = now()::timestamp where created = '2025-06-26';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-06-26';

update trackedentityattributevalue set value = 'Submitted' where trackedentityattributeid = 598541
and trackedentityinstanceid in ( 693043)

select trackedentityinstanceid from programinstance where programid = 6124
and programinstanceid not in ( select programinstanceid from programstageinstance
where programstageid = 6141);

select * from trackedentityattribute where uid = 'CNqaoQva9S2';

select tei.trackedentityinstanceid,teav.value, tei.uid as teiUID
from trackedentityattributevalue teav 
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
where teav.trackedentityattributeid = 598541;

update programinstance set status = 'ACTIVE'
where programinstanceid in ( 691311,
691317);

-- 04/07/2025
select uid,trackedentityinstanceid from trackedentityinstance
where uid in ( );

select uid,programinstanceid from programinstance
where uid in ( 'UaWLQ7T7jp6',
'UaWLQ7T7jp6');

select uid,organisationunitid, name from organisationunit
where uid = 'QwgRgcWYVFY';

-- 08/07/2025

="update trackedentityattribute set uid  = '"&A2&"' where uid = '"&F2&"';"

-- 10/07/2025

select * from userinfo; -- 1135
select * from userinfo where username != 'admin'; -- 1134

update userinfo set username = 'hispdev' where username = 'hisp_dev';

update userinfo set disabled = true where 
username != 'admin'; -- 1134

-- tei not enrolled

select * from trackedentityinstance where trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance);

select count(*) from trackedentityinstance where trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance);


-- 12/07/2025
-- new UAT server for production meta data from dev instance

update userinfo set username = 'hispdev' where username = 'hisp_dev';

select * from userinfo; 

select * from userinfo; -- 3075
select * from userinfo where username != 'admin'; -- 3074

update userinfo set username = 'hispdev' where username = 'hisp_dev';

update userinfo set disabled = true where 
username != 'admin'; -- 3074

update userinfo set disabled = true where 
username not in ('admin','hispdev');-- 3073

-- meta data compare

select uid,trackedentityattributeid,name from trackedentityattribute;

select uid,dataelementid,name from dataelement;

select uid,optionvalueid,name,code,optionsetid
from optionvalue;


-- event dataValue
SELECT tei.trackedentityinstanceid as tei_id,tei.uid as tei_uid, psi.uid as eventUID, 
org.uid AS orgUnitUID, org.name AS orgUnitName, prg.name as prg_name, 
prg.uid as prg_uid, ps.name as stage_name,ps.uid as stage_uid,
psi.executiondate::date, de.name as dataelement_name,de.uid as dataelement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON  tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

where de.uid in('K37pq3b5Qra');

-- UAT details

select count(*) from trackedentityinstance where deleted = 'false'; -- 127301 ,6, 127295
select count(*) from trackedentityattributevalue; -- 1531022
select count(*) from programinstance where deleted = 'false'; -- 120639 ,6, 120633
select count(*) from programstageinstance where deleted = 'false'; -- 29424, 20, 29404

select * from trackedentityinstance where trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance); -- 6695

-- insert query

select * from trackedentityinstance where deleted = 'false'
and organisationunitid not in ( 760784,760785);

select * from organisationunit where organisationunitid = 760785;

select * from organisationunit where name ilike '%test%' 

insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid,storedby,lastupdatedby) values
="(nextval('hibernate_sequence'),'"&A2&"', '2025-07-12','2025-07-12', 'false','false','false', "&E2&", "&G2&",'admin',1 ),"


update trackedentityinstance set created = now()::timestamp where created = '2025-07-12'; -- 127244
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-12';	

-- enrollment list with tei

SELECT tei.uid as tei_uid,tei.trackedentityinstanceid as tei_id, pi.uid as enrollmentUID, 
prg.programid as prg_id,pi.enrollmentdate::date from programinstance pi

INNER JOIN trackedentityinstance tei ON  tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where pi.deleted = 'false';



insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2025-07-12', '2025-07-12', '"&H2&"', 'ACTIVE', "&C2&", "&G2&",'"&H2&"', "&E2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2025-07-12'; -- 120553 + 6691
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&C2&", "&G2&", '2025-07-12','2025-07-12',"&E2&",'admin' ),"


update trackedentityprogramowner set created = now()::timestamp where created = '2025-07-12'; -- 120553 + 6691
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-07-12';



="update trackedentityattributevalue set value  = '"&D2&"' where trackedentityinstanceid = "&A2&" and trackedentityattributeid = "&B2&";"



select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityattributeid in ( 7483,
544343,
544392);

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&D2&","&B2&",'2025-07-12','2025-07-12','"&C2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; -- 183213 + 1029525 + 317649 + 37241
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';

select count(*) from trackedentityinstance where deleted = 'false'; -- 127244 
select count(*) from trackedentityattributevalue; -- 1567628
select count(*) from programinstance where deleted = 'false'; -- 127244

-- event list for event to event post

SELECT tei.trackedentityinstanceid as tei_id,tei.uid as tei_uid, psi.uid as eventUID, 
org.uid AS orgUnitUID, org.name AS orgUnitName, prg.name as prg_name, 
prg.uid as prg_uid, ps.name as stage_name,ps.uid as stage_uid,
psi.executiondate::date, de.name as dataelement_name,de.uid as dataelement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value

FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 

INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON  tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key

-- event count
select * from programstageinstance
where organisationunitid not in ( 760784,760785); -- 29424, 29355

select count(*) from programstageinstance where 
deleted = 'false' and organisationunitid not in ( 760784,760785); -- 29335

-- 15/07/2025
-- tei move from pilot 

https://dohdev.pmnpis.org.ph/pmnp_is/dhis-web-commons/security/login.action
IP	10.185.50.31
port	2223
Username	PNMP_UAT_Admin1
password Auth	connect with PNMP_UAT_Admin1.ppk 
hispdev	357912


-- connect to database UAT with diffrent user
-- sudo -s
-- \l
-- \c
-- su postgres
 -- psql -U pmnp_dev -d pmnp_is_240_12072025 -h localhost -W
 
-- select /viwe access user list 
Prod DB user: pmnp_dev
Pro DB pass: V@RF#hJYYWer2e123!
Pro DB : pmnp_pro_v240

UAT DB user :  pmnp_dev
UAT DB pass: Efq@EFvWW2#E!df@
UAT DB : pmnp_is_240_12072025 
 
 

select * from organisationunit  where uid = 'v70IgUHgZYD';

select * from organisationunit  where uid = 'ROABO86LJAF'; 

select * from organisationunit  where uid = 'znR5iUoZ8Ql';  -- 82 

select * from organisationunit where parentid in ( 82 );  --  609922,610139


select * from organisationunit where parentid in ( 89);
select * from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ));


select * from trackedentityinstance where organisationunitid
in ( 89,613675);

-- tei list
select * from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))); -- 161,088


-- final tei list with type
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))) );



-- -- enrollment list
select * from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid 
from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 )))); -- 158,163


-- enrollment list with type for import in production
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,pi.uid as enrollmentUID,pi.programinstanceid,tet.trackedentitytypeid trackedentitytypeId,
tet.name AS trackedentitytypeName from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))) );

-- final enrollment for import in production
SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))) );



-- 613385,601447,613398

select * from trackedentityinstance where trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance); -- 10,128

select count(*) from trackedentityinstance; -- 2628484

select count(*) from programinstance; -- 2618356


SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,pi.uid as enrollmentUID,pi.programinstanceid,teav.value AS Household_UID,
tet.name AS trackedentitytypeName from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))) );


select * from trackedentityattribute where uid = 'NOKzq4dAKF7';

delete from trackedentityinstance where trackedentityinstanceid in (2160816) -- 7205 for ou 613385,601447,613398 16/07/2025

select * from trackedentityattributevalue where value Ilike '%PMNP%'
and trackedentityattributeid = 2002;

select * from trackedentityattributevalue where trackedentityattributeid = 2002
and trackedentityinstanceid in ( 2152414,
2153061,
2152433,
2151383,
2152408);


update trackedentityinstance set created = now()::timestamp where created = '2025-07-15'; -- 158163
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';


select trackedentityinstanceid from trackedentityinstance
order by trackedentityinstanceid desc; -- 1491712

select uid,trackedentityinstanceid
from trackedentityinstance where trackedentityinstanceid > 1491712

select * from programinstance
order by programinstanceid desc; -- 1078953

select uid,programinstanceid from programinstance where 
programinstanceid > 1326750;

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2025-07-15', '2025-07-15', '"&G2&"', 'ACTIVE', "&H2&", "&E2&",'"&G2&"', "&C2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2025-07-15'; -- 158163
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&H2&", "&E2&", '2025-07-15','2025-07-15',"&C2&",'admin' ),"

update trackedentityprogramowner set created = now()::timestamp where created = '2025-07-15'; -- 158163
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

-- tei attribute value
select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))) );


select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 613675 ))) )
and trackedentityattributeid in ( 2002 );


insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&D2&","&B2&",'2025-07-12','2025-07-12','"&C2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; -- 89270 + 82070 + 823980 + 454160
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';



-- program_wise_attribute_list
SELECT prg.name as prgName,prg.uid as prgUID,
tea.name teaName,tea.uid tea_Uid ,tea.trackedentityattributeid
FROM trackedentityattribute tea

INNER JOIN program_attributes pa ON pa.trackedentityattributeid = tea.trackedentityattributeid
INNER JOIN program prg ON prg.programid = pa.programid;

select * from trackedentityattribute



-- 16/07/2025

select * from organisationunit  where uid = 'znR5iUoZ8Ql'; 

select * from organisationunit where parentid in ( 82 ); -- 609922,610139

select * from organisationunit  where uid = 'P2cGU4ONQ4p'; 

select * from organisationunit where parentid in ( 80 );  601065,618727



SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 609922,610139 ))) )
and tei.deleted is false and tet.trackedentitytypeid = 6126; -- 190297, 236699

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601065,618727 ))) )
and tei.deleted is false and tet.trackedentitytypeid = 6126; -- 249354, 199545 + 49809





SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 609922,610139 ))) )
and pi.deleted is false and pi.programid = 6468; -- 190293, 236695


SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601065,618727 ))) )
and pi.deleted is false and pi.programid = 6468; -- 249342, 249354, 199545 + 49809








select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 609922,610139 ))) ) -- 3267167
and trackedentityattributeid in ( 2002 );


select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 609922,610139 ))) ) -- 3267167

select trackedentityinstanceid from trackedentityinstance
order by trackedentityinstanceid desc limit 1; -- 1916978

select uid,trackedentityinstanceid
from trackedentityinstance where trackedentityinstanceid > 1916978

update trackedentityinstance set created = now()::timestamp where created = '2025-07-15'; 
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update programinstance set created = now()::timestamp where created = '2025-07-15'; 
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update trackedentityprogramowner set created = now()::timestamp where created = '2025-07-15'; 
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-07-15';


update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; -- 190297 + 190295 + 939477 + 948496 + 696813 + 301789
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';

select uid,trackedentityinstanceid
from trackedentityinstance where trackedentityinstanceid > 1916978;


select * from trackedentityattributevalue where trackedentityattributeid = 2002
and trackedentityinstanceid in ( );

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601065,618727 ))) ) -- 3001176

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; -- 199545 + 199545 + 999779 + 993995 + 608312 == 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


select * from organisationunit  where uid = 'yf6NQpWFfWG'; 

select * from organisationunit where parentid in ( 83 ); -- 619027,619029

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 619027,619029 ))) )
and tei.deleted is false and tet.trackedentitytypeid = 6126; -- 167764, 131544

SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 619027,619029 ))) )
and pi.deleted is false and pi.programid = 6468; -- 167764 , 131544

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in (  619027,619029 ))) ) -- 2212063

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; -- 131544 + 919802 + 903174 + 257543 +  == 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


select * from organisationunit  where uid = 'WUaHfX4rTWE'; 

select * from organisationunit where parentid in ( 87 ); -- 601407,612779


SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601407,612779 ))) )
and tei.deleted is false and tet.trackedentitytypeid = 6126; -- 291352, 233147

SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601407,612779 ))) )
and pi.deleted is false and pi.programid = 6468; -- -- 291354, 233147

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in (  601407,612779 ))) ) -- 2212063

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; --  == 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


-- remove Malita
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance
where organisationunitid in ( select organisationunitid from organisationunit where 
parentid in (613931,612780,612986,613011,613254  ) ))
and tei.deleted is false and tet.trackedentitytypeid = 6126; -- 194820, 157023

SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where 
organisationunitid in ( select organisationunitid from organisationunit where 
parentid in (613931,612780,612986,613011,613254  )) )
and pi.deleted is false and pi.programid = 6468; -- 194822, 157023



select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where 
parentid in (613931,612780,612986,613011,613254  )) ) -- 2794020


select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in (  select organisationunitid from organisationunit where 
parentid in (613931,612780,612986,613011,613254  ) ) ) -- 3267167
and trackedentityattributeid in ( 2002 );


update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; -- 157023 +  == 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
(2404439,7483,'2025-07-12','2025-07-12','WRmatB33WTY','admin'),
(2378920,7483,'2025-07-12','2025-07-12','WRmatB33WTY','admin');

--- Region VII Central Visayas
select * from organisationunit  where uid = 'GBS2VLfCzaU'; 

select * from organisationunit where parentid in ( 84 ); -- 618877,618876


SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 618877,618876 ))) )
and tei.deleted is false and tet.trackedentitytypeid = 6126; -- 760416, 618882


SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 618877,618876 ))) )
and pi.deleted is false and pi.programid = 6468; -- -- 760410, 618882



select trackedentityinstanceid from trackedentityinstance
order by trackedentityinstanceid desc limit 1; -- 4392628

select uid,trackedentityinstanceid
from trackedentityinstance where trackedentityinstanceid > 4392628




-- 21/07/2025

-- 7483 -- Family Information UID
-- 2002 -- PMNP ID
-- 7082 -- Household UID
-- 601045 -- Data collector
-- house hold member with attribute value -- house hold
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid,org.code as orgunitCode, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS Household_UID
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601065,618727 ))) )
and tei.deleted is false and tet.trackedentitytypeid = 6126 and trackedentityattributeid in ( 7082 )
and tei.uid in ('MQHB5h30lNT','yZre0yyZZIY','MqoYOw8hzXu','RQPSINOSrC6');




-- -- house hold member list with attribute value Family Information UID
SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,org.code as orgunit_code,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date,teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where 
organisationunitid in ( select organisationunitid from organisationunit where 
parentid in (613931,612780,612986,613011,613254  )) )
and pi.deleted is false and tet.trackedentitytypeid = 6126 and trackedentityattributeid in ( 7483 );


-- house hold TEI list
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.deleted is false and tet.trackedentitytypeid = 6123;

-- house hold TEI list with attribute value
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6123
and trackedentityattributeid in ( 601045 );





select * from trackedentityattributevalue where trackedentityinstanceid=4237196
and trackedentityattributeid = 7483;


-- 22/07/2025

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in (  618877,618876 ))) ); --  11039298

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 618877,618876 ))) ) -- 618882
and trackedentityattributeid in ( 2002 );


select teav.value, tei.uid as teiUID,tei.trackedentityinstanceid
from trackedentityattributevalue teav 
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
 where teav.value in ( '07022240370000080');
 
 
 
 
 
 
 
-- 23/07/2025

--- Region X (Northern Mindanao)
select * from organisationunit  where uid = 'NEvFicY3NsS'; 

select * from organisationunit where parentid in ( 86 ); -- 608162,608039


SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 608162,608039 ))) )
and tei.deleted is false and tet.trackedentitytypeid != 6126; -- 327396, 264978, 62418


SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 608162,608039 ))) )
and pi.deleted is false and pi.programid != 6468; -- -- 327396, 264978,62418

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in (  608162,608039 ))) ); --  4546427

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 608162,608039 ))) ) -- 264978
and trackedentityattributeid in ( 2002 );

update trackedentityinstance set created = now()::timestamp where created = '2025-07-15'; 
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update programinstance set created = now()::timestamp where created = '2025-07-15'; 
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update trackedentityprogramowner set created = now()::timestamp where created = '2025-07-15'; 
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';

-- 25/07/2025

--- Region IV-A (Calabarzon)
select * from organisationunit  where uid = 'g6OKJ39e5pV'; 

select * from organisationunit where parentid in ( 79 ); -- 95

select * from organisationunit where parentid in ( 95 );

select * from organisationunit where parentid in 
( 188,193,197,198,199,214,215,218,220,221,226,190,
191,192,194,201,204,209,210,211,212,213,219 );

188,193,197,198,199,214,215,218,220,221,
226,190,191,192,194,201,204,209,210,211,212,213,219


SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid 
from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where 
parentid in ( 188,193,197,198,199,214,215,218,220,221,226,190,
191,192,194,201,204,209,210,211,212,213,219 )) )
and tei.deleted is false and tet.trackedentitytypeid != 6126; -- 268085, 175078, 93007

SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
188,193,197,198,199,214,215,218,220,221,226,190,191,192,194,201,204,209,210,211,212,213,219)) )
and pi.deleted is false and pi.programid != 6468; -- -- 268082, 175077, 93005


select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
188,193,197,198,199,214,215,218,220,221,226,190,
191,192,194,201,204,209,210,211,212,213,219)) ); --  3270611

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
188,193,197,198,199,214,215,218,220,221,226,190,
191,192,194,201,204,209,210,211,212,213,219)) ) -- 175078
and trackedentityattributeid in ( 2002 );





-- Region V (Bicol) -- kbhtXImEkFR
select * from organisationunit  where uid = 'kbhtXImEkFR'; 

select * from organisationunit where parentid in ( 78 ); -- 95

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 610231,610233,610234,608173 ))) )
and tei.deleted is false and tet.trackedentitytypeid != 6126; -- 225402, 0, 225402


SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 610231,610233,610234,608173 ))) )
and pi.deleted is false and pi.programid != 6468; -- -- 225400, 0,225400

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in (  610231,610233,610234,608173 ))) ); --  1641359

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 610231,610233,610234,608173 ))) ) -- 264978
and trackedentityattributeid in ( 2002 ); -- 0



-- Region VIII (Eastern Visayas) TjpdF3jzRCM
select * from organisationunit  where uid = 'TjpdF3jzRCM'; 

select * from organisationunit where parentid in ( 85 ); -- 85
601470,605658,605659,605660

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName 
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601470,605658,605659,605660 ))) )
and tei.deleted is false and tet.trackedentitytypeid != 6126; -- 286561, 10000, 276561


SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid
in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601470,605658,605659,605660 ))) )
and pi.deleted is false and pi.programid != 6468; -- -- 286559, 10000, 276559

select count(*)
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where 
parentid in (  601470,605658,605659,605660 ))) ); --  2091097

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 601470,605658,605659,605660 ))) ) -- 264978
and trackedentityattributeid in ( 2002,2001); -- 20000



insert into trackedentityinstance (trackedentityinstanceid,uid,created,lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid,storedby,lastupdatedby) values
="(nextval('hibernate_sequence'),'"&A2&"', '2025-07-15','2025-07-15', 'false','false','false', "&B2&", "&C2&",'admin',1 ),"

select trackedentityinstanceid from trackedentityinstance
order by trackedentityinstanceid desc limit 1; -- 9821850

select uid,trackedentityinstanceid
from trackedentityinstance where trackedentityinstanceid > 9821850


insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2025-07-15', '2025-07-15', '"&G2&"', 'ACTIVE', "&H2&", "&E2&",'"&G2&"', "&B2&", 'false','admin' ),"

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&H2&", "&E2&", '2025-07-15','2025-07-15',"&B2&",'admin' ),"

-- M!th!lesh@123

IP	10.185.50.31
port	2223
hispdev	357912
Username	PNMP_UAT_Admin1
password Auth	connect with PNMP_UAT_Admin1.ppk 



-- 30/07/2025

select code,organisationunitid,uid from organisationunit
where code is not null


select * from trackedentityattributevalue 
where value like '%0.%' and trackedentityattributeid = 2011;

delete from trackedentityattributevalue 
where value in( '0.6666','0.9166','0.25')
and trackedentityattributeid = 2011;

delete from trackedentityattributevalue 
where value like '%0.%' and 
trackedentityattributeid = 2011;

select uid,userinfoid from userinfo
order by userinfoid desc limit 1; -- 13221469

select uid,userinfoid,username from userinfo
where userinfoid > 13221469;









select teav.value, tei.uid as teiUID,tei.trackedentityinstanceid
from trackedentityattributevalue teav 
inner join trackedentityinstance tei on tei.trackedentityinstanceid = teav.trackedentityinstanceid
where teav.trackedentityattributeid = 692615;


=CONCAT("PMNP-",A3,"-",C3,"-",D3)



select * from program;

select trackedentityinstanceid from trackedentityinstance
order by trackedentityinstanceid desc limit 1; -- 13926658

select uid,trackedentityinstanceid
from trackedentityinstance where trackedentityinstanceid > 13926658;

update trackedentityinstance set created = now()::timestamp where created = '2025-07-15'; 
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update programinstance set created = now()::timestamp where created = '2025-07-15'; 
update programinstance set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update trackedentityprogramowner set created = now()::timestamp where created = '2025-07-15'; 
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2025-07-15';

update trackedentityattributevalue set created = now()::timestamp where created = '2025-07-12'; 
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2025-07-12';


-- new production details

--database IP 	10.185.50.241
--port	2223
--login with	PNMP_Prod_DB_Admin1
--Database username	pmnp_dhis
--Database password	921@ssad@sNT&#h|3n
-- url https://pmnpis.org.ph/app/dhis-web-commons/security/login.action?failed=true

-- Application server	
	
-- application IP 	10.185.50.10
-- port	2223
-- login with	PNMP_Prod_APP_Admin1

-- production restart
-- /opt/restart_tomcat_pmnp.sh

-- tail -f /data/dhis/tomcat-pmnp-pro/logs/catalina.out



-- middle name TEI HM list

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6126
and trackedentityattributeid in ( 2005 ); -- 3992116

-- Show Middle Name -- 12683113

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6126
and trackedentityattributeid in ( 12683113 ) and org.organisationunitid != 1333467; -- 3992114


-- total house hold member list
SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6126; -- 4165478


-- delete attribute value for wrong Extension Name

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6126
and trackedentityattributeid in ( 2007 ) and teav.value = '4'; 


select * from trackedentityattributevalue where 
trackedentityattributeid = 2007 and 
value in('1','2','3','4','5','5','6','7'); -- 545434

delete from trackedentityattributevalue
where trackedentityattributeid = 2007 and 
value in('1','2','3','4','5','5','6','7'); -- 545434


-- update dob

SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6126
and trackedentityattributeid in ( 2010 ) and teav.value = '30692';  -- like 33 -- 70367, like -- 22 -- 42498 -- 36 -- 51700

-- 41 -- 64201 42 -- 51994 43 -- 50335


SELECT tei.trackedentityinstanceid,
tei.uid as tei, org.uid as orgunitUid, org.organisationunitid as orgunitid,
org.name as orgName,tet.trackedentitytypeid trackedentitytypeId, tet.name AS trackedentitytypeName,
teav.value AS attribute_value
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6126
and trackedentityattributeid in ( 2010 ) and teav.value like '36%'; 


update trackedentityattributevalue set value = '1069-02-01'
where trackedentityattributeid in ( 2010 ) and value = '30692';

update trackedentityattributevalue set value = '2020-01-01'
where trackedentityattributeid in ( 2010 ) and trackedentityinstanceid in (

);

SELECT FORMAT(value, 'yyyy-MM-dd') 
FROM trackedentityattributevalue where trackedentityattributeid in ( 2010 )


select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue where
trackedentityattributeid in ( 2010 ) and LENGTH(value) = 10 -- dob length


-- find wrong date format

SELECT trackedentityinstanceid,trackedentityattributeid,value
FROM trackedentityattributevalue
WHERE trackedentityattributeid in ( 2010 )
and value NOT SIMILAR TO '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; 

-- extension name

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue
where trackedentityinstanceid in (select trackedentityinstanceid from trackedentityinstance 
where organisationunitid in ( select organisationunitid from organisationunit where parentid in (  
select organisationunitid from organisationunit where parentid in ( 608162,608039 ))) )
and trackedentityattributeid in ( 2007 );

select trackedentityinstanceid, trackedentityattributeid,value
from trackedentityattributevalue where
trackedentityattributeid in ( 2007 ) and LENGTH(value) > 3



-- 14/10/2025


select count(*)
from trackedentityattributevalue where
trackedentityattributeid in ( 2007 ); -- 469389

SELECT 
    trackedentityinstanceid, 
    trackedentityattributeid, 
    value
FROM 
    trackedentityattributevalue
WHERE 
    trackedentityattributeid = 2007
    AND value Not IN (
        'Jr / Junior',
        'I',
        'II',
        'III',
        'IV',
        'V',
        'VI',
        'Jr',
        'Sr',
        'Sr / Senior'
    ); -- 409900


IN -- 59484
-- 11/08/2025

select * from userinfo where 
userinfoid  not in ( select userinfoid from usermembership);

select count(*) from userinfo -- 30746
select count(*) from usermembership -- 32554

delete from trackedentityattributevalue where
trackedentityattributeid in ( 693557 ); -- 297668

-- tei_attribute vlaue

select teav.trackedentityinstanceid, teav.trackedentityattributeid,teav.value,
opv.code as option_code, opv.name as option_name
from trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN optionvalue opv ON opv.optionsetid = tea.optionsetid
where teav.trackedentityattributeid in ( 693557 );

-- optionset_with_option_value

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode, opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid = 'sTAXZIONOvg'
order by ops.name, opv.sort_order;


-- user orgUnit user list for 2.40
select 	ui.username, ui.firstname userFirstName, ui.surname userSurName, ui.disabled,
ui.userinfoid, org.organisationunitid userOrgID, org.uid userOrgUID, org.name userOrgUnitName, 
org.code userOrgUnitCode  from  usermembership um

INNER JOIN userinfo ui ON ui.userinfoid = um.userinfoid
INNER join organisationunit org ON org.organisationunitid = um.organisationunitid
where ui.disabled is true;


-- issue after user deleted 18/08/2025

select * from userinfo where creatoruserid in( 773728, 7076);

update userinfo set creatoruserid = 1 where 
creatoruserid  in( 773728, 7076);

-- 22/08/2025

-- duplicate find
SELECT tei.trackedentityinstanceid,
tei.uid as tei_uid, org.organisationunitid as orgunitid,
pi.uid as enrollmentUID,prg.programid as programID,prg.name as programName,
pi.status, pi.enrollmentdate::date,pi.created::date
from trackedentityinstance tei
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid

WHERE  tei.trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance
where organisationunitid in ( select organisationunitid from organisationunit where uid = 'tCt31YtK3sq' ) )
and pi.deleted is false and pi.programid = 6124;

select trackedentityinstanceid,trackedentityattributeid,
value from trackedentityattributevalue where trackedentityattributeid = 1992
and trackedentityinstanceid in ( 3751941,3861033,3815947);

select * from trackedentityinstance where 
trackedentityinstanceid in ( 3751941,3861033,3815947);


-- 

SELECT 
    userinfoid,
    uid,
    surname,
    firstname,
    username,
    lastlogin,
    AGE(current_date, lastlogin) AS time_since_lastlogin,  -- full interval
    EXTRACT(YEAR FROM AGE(current_date, lastlogin))::int AS years_since_lastlogin,
    EXTRACT(MONTH FROM AGE(current_date, lastlogin))::int AS months_since_lastlogin,
    EXTRACT(DAY FROM AGE(current_date, lastlogin))::int AS days_since_lastlogin,
    disabled
FROM userinfo order by AGE(current_date, lastlogin) asc;


SELECT last_value FROM trackedentityinstance_sequence; 

select trackedentityinstanceid,uid,lastupdated from trackedentityinstance
order by trackedentityinstanceid desc limit 100;


ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 22973201;



-- event_list
-- 29/08/2025
SELECT 
    tei.uid AS teiUID,
    pi.uid AS enrollmentUID,
    psi.uid AS eventUID,
    org.uid AS orgUnitUID,
    org.name AS orgUnitName,
    
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

WHERE prg.uid = 'VVLirjoOGbj' 
 
ORDER BY psi.executiondate::date DESC; 

-- 02/09/2025
-- delete dashboards from production

delete  from dashboard_items where dashboardid in 
(47015123,46998418,46998302,46921472,
46900702,46892950,46869201); -- 181

delete  from dashboard where dashboardid in 
(47015123,46998418,46998302,46921472,
46900702,46892950,46869201); -- 1063

delete from dashboard where dashboardid  in 
(47122615,47168219,47168227,
47268552,47290212,47302583,47076759); -- 7

select * from userrole where uid = 'MUNroCPg9tl';

select * from userroleauthorities
where userroleid = 7214;

select * from userroleauthorities where 
userroleid = 7214 and authority = 'F_DASHBOARD_PUBLIC_ADD';

delete from  userroleauthorities where 
userroleid = 7214 and authority = 'F_DASHBOARD_PUBLIC_ADD';


-- 26/09/2025 for userrole and userroleauthorities

select * from userrole where uid = 'MUNroCPg9tl'; -- 110220619

-- 'JjgMg5mkdPc'; -- 110220619

MUNroCPg9tl -- 7214

select * from userroleauthorities
where userroleid = 7214;

select * from userroleauthorities where 
userroleid = 7214 and authority = 'F_DASHBOARD_PUBLIC_ADD';

delete from  userroleauthorities where 
userroleid = 7214 and authority in ( 'F_PROGRAM_INDICATOR_PUBLIC_ADD',
'F_VISUALIZATION_PUBLIC_ADD',
'F_REPORT_PUBLIC_ADD',
'F_INDICATOR_PUBLIC_ADD',
'F_INDICATORGROUP_PUBLIC_ADD',
'F_EVENTREPORT_PUBLIC_ADD',
'F_EVENTCHART_PUBLIC_ADD',
'F_PROGRAM_INDICATOR_GROUP_PUBLIC_ADD',
'M_dhis-web-reports',
'F_USERGROUP_MANAGING_RELATIONSHIPS_VIEW',
'F_USER_ADD_WITHIN_MANAGED_GROUP',
'F_USER_ADD');



insert into userroleauthorities values ( 7214, 'M_dhis-web-cache-cleaner');
insert into userroleauthorities values ( 7214, 'F_DATAVALUE_DELETE');

insert into userroleauthorities values ( 7215, 'F_VIEW_EVENT_ANALYTICS');




insert into userroleauthorities (userroleid,authority) values
="("&A2&",'"&B2&"'),"


-- 03/09/2025

select uid,trackedentityinstanceid from trackedentityinstance
where uid in ( 'LqLjxLPF8Sn',
'LqLjxLPF8Sn',
'LqLjxLPF8Sn',
'LqLjxLPF8Sn');


select trackedentityinstanceid,uid  from programinstance
where trackedentityinstanceid in( select trackedentityinstanceid from 
trackedentityinstance where uid in ( 'LqLjxLPF8Sn',
'LqLjxLPF8Sn',
'LqLjxLPF8Sn',
'LqLjxLPF8Sn'));


-- https://links.hispindia.org/pmnpis_dev/api/programIndicators?fields=id,name,attributeValues&filter=attributeValues.attribute.id:eq:B4fJmq8OXtD&paging=false

-- https://links.hispindia.org/pmnpis_dev/api/analytics/dataValueSet.json?dimension=dx:qyGMqtUeUBz&dimension=pe:202501;202502;202503;202504;202505;202506;202507;202508;202509;202510;202511;202512&dimension=ou:spXTh9hs5dz&ouMode=ALL
-- https://links.hispindia.org/pmnpis_dev/api/organisationUnits.json?fields=id,name,code,level&filter:level=5&paging=false
-- https://links.hispindia.org/pmnpis_dev/api/organisationUnits.json?fields=id,name,code&filter=name:eq:Ratlam&level=2&paging=false
-- https://links.hispindia.org/pmnpis_dev/api/organisationUnits.json?fields=id,name,code&filter=name:eq:Region XIII (Caraga)&level=2&paging=false



-- https://pmnpis.org.ph/app/api/programIndicators?fields=id,name,attributeValues&filter=attributeValues.attribute.id:eq:B4fJmq8OXtD&paging=false

-- https://pmnpis.org.ph/app/api/analytics/dataValueSet.json?dimension=dx:qyGMqtUeUBz&dimension=pe:20250901;20250902;20250903&dimension=ou:spXTh9hs5dz&ouMode=ALL

-- https://pmnpis.org.ph/app/api/analytics/dataValueSet.json?dimension=dx:qyGMqtUeUBz;Uh7vWH7yf7y;ywlP51HyqTv;TDwyvUkokTH;WuKUD8eHQp7;KPVJ5nQ2k0s;QTIRbWU1hi5;TTx8a0Dsg8H;VPx2VFg6Akj;JNKLB6JEnte;lb7cawJfSO4;rwMKA7CJcTJ;KuwoiRpxMGl;FkzgUgkB0jc;eRlfzaC9asp;hUopyiw6Mwk;p8zDi9BCWfU;ewIzW61UnRy;XvQUigofqhy;VZBBcNI1iDw;HSEAH05VoFi;ENHXISQXS1n;SjPqnOurJMN;vZssvQZt8ex;VZHIZ1M2zP3;iSbEB04bhxQ;dOyst5W1SE4;ZucB3OuwYYd;zUG6N2IAKet;uHhwXO61Vh8;Kn4rwmuGcv3;WfHjnBSGNJf;jmMTwq8a3Mm;bTKZ6XDsC5z;E9oTGhUUf6x;OesvIru88Ro;V0sL4t6QbWt;gSMlcNq5P6V;qKQYrNV49GM;GKUP9ay7hdJ;BSqDSIpHhoT;T6ZVCjLVZKv;Pxb3QkLFpv1;SkSKseuTyGl;LcyLkMke5sq;lNLnEXvQA2Z;sZSMvX1cvUZ;lvpExMb0BVM;LFEsNuuPbHe;tysHAc0rocR;Gm8TIqWAkvq;jRyxotjMzJc;TttZ3onzGkq;puHvieDvsqq;UrdlhCguP6T;utBBIzARaVx;Uc8fVo7aJlz;M8d4dwmaXDZ;lSQl1piK8X1;bRzYx52cEdb;Hsgi04Wq1kx;Jg6OEgczhsu;fw1frT4arH8;wjHPdG9hnGj;UN3JcjzR1wx;fgfeI3Az7zv;v83pnTSU1aY;h4EDxUafIUB;V8IIc7AtbyZ;UgfivD6qGjy;FhGrjbnA8zj;LcMHBv2dCQK;vtlHXvkOe9z;SGfOoFJXNKz;RuNQhx8Kq68;BkmVDIx95lS;nOtAFkDmndu;J41C04PRTJY;WCxzJ1dCFDH;xGEbaj6o1uY;Nt7cI7qwwNe;LOMZy9q1euI;rQBycGaeLMX;qYHET4MkyYp;M14FqSaQu5Q;wiZlLaZYus3;ePaxQu8511O;OHXq7rbDo7b;tA7qHkYVf75;r5cHtnYeyXd;fxmvSiKfEpn;NLIeH5JjPOa;egST5Av3tJh;Lmh1EJ2UXBL;tolWqZp2mFA;WkJyXQUUnMz;pZ6aL4xnURC;SvcLbOJsyg9;xOIVpSE1CQh;h2BV5S1FHji;EHaHQCDqaI2;LJ4Wv8fUGPI;dDNZZROpOWV;ZkDVhSbzeRq;MBUlevGILyb;vEGKy6OBtb8;Cl9XC0HVp1B;XQpjBfqYdtR;WOLQ4DVzawM;KZHjiTe2JPz;IbiCPypWf9g;ndJ9B6TnV4y;gFRo52nqm2y;zuLha0kAXej;lgTNmJLRj0J;mwaZDkHbQsO;Dnki01bEwu5;RIJRkcd9wtN;Bm6XdfopHgR;GadhgFFLzXk;aCYHfQg8pjV;JaK2GU54M3W;az6w6rq81p1;ibpGfmm1q7u;aKm7O6hyML2;AwNeQj0UUT7;UF2psuxz6ds;nCxgv1uJhO1;AXdiCAKmKhU;qYKLyoHs2Qo;NdscuP8Ox78;uaHUSNFFJFi;scQimj05QeO;L7Jnc4aDzY8;KdVjv8PCls3;DnzN34KvZwC;Hv7kjKMWMTT;BuugSbrGBUw;FjOdo39bN3R;yCV2wf8MwaJ;F9QbbxGO7QO;TWRIhRMeeSs;HLX4mF14JZQ;zuFx0yT77TM;lBKyA6LBzzg;PIYhXPpou8b;qhhONwLI91M;XOq6eqAHZ48;jaj4WhR1Ts8;D5KUlu5yYlf;Lc3WXuBlZ2K;MIMDXKNNL3s;K4m2fhDRcCP;AUF2RUyNdTY&dimension=pe:20250830;20250831;20250901;20250902;20250903&dimension=ou:mkvLp2ySTPb;PEeV9zvOonq;BXHLhKL0Lr8;k0H02CCyAl6;ZhxwYDAEtNP;NUbbSjmfuhZ;gKNGsnBOE8S;yikQaEGswr7;a7jM35ZhAku;qZuyqcDv1c7;lRxxd2DZA4g;uZg58YzKrkt;hct7jA5BpoU;C9Uu0zq1W3U;prBPL5mEdoh;ub0GAio2zZz;FxiK0BSzj7g;vKfM8Zid0Qv;jkwBwyDf3S1;CfJboyub6Uw;F9SEIGZ28xU;VOMd2riZNkS;AO4FolO8JcH;zD8XvzZAr70;Jgg5jJqHwmM;ainQR4xhjTg;YJVCLxthEBg;mPyfS69nJlq;FOtXkeTjxzf;VV6Nlaa5qq7;UU9NtfAbrva;PduGn3I3bYH;C4FpbvfhucH;flr5LFKdFOP;Fvdd5BeNkbV;ejzoSvZzyM8;KcIG9IV02GK;FQTi0LxO8Zk;DjnkiokOial;fPEZJebMRpW;d9ezbr901zY;cmlrIwEpW9O;pjw6A9QGLJi;lgzod6PrDdw;ueI86GAeVmX;CvNX6hO40pr;wv26z18ozGE;KyrAzxjYhr0;t6xwJEnI7E9;AVTrKkzWqkF;vbqWblme4Lf

--https://pmnpis.org.ph/app/api/analytics/dataValueSet.json?dimension=dx:GKUP9ay7hdJ;BSqDSIpHhoT;T6ZVCjLVZKv;Pxb3QkLFpv1;SkSKseuTyGl;LcyLkMke5sq;lNLnEXvQA2Z;sZSMvX1cvUZ;lvpExMb0BVM;LFEsNuuPbHe;tysHAc0rocR;Gm8TIqWAkvq;jRyxotjMzJc;TttZ3onzGkq;puHvieDvsqq;UrdlhCguP6T;utBBIzARaVx;Uc8fVo7aJlz;M8d4dwmaXDZ;lSQl1piK8X1;bRzYx52cEdb;Hsgi04Wq1kx;Jg6OEgczhsu;fw1frT4arH8;wjHPdG9hnGj;UN3JcjzR1wx;fgfeI3Az7zv;v83pnTSU1aY;h4EDxUafIUB;V8IIc7AtbyZ;UgfivD6qGjy;FhGrjbnA8zj;LcMHBv2dCQK;vtlHXvkOe9z;SGfOoFJXNKz;RuNQhx8Kq68;BkmVDIx95lS;nOtAFkDmndu;J41C04PRTJY;WCxzJ1dCFDH;xGEbaj6o1uY;Nt7cI7qwwNe;LOMZy9q1euI;rQBycGaeLMX;qYHET4MkyYp;M14FqSaQu5Q;wiZlLaZYus3;ePaxQu8511O;OHXq7rbDo7b;tA7qHkYVf75;r5cHtnYeyXd;fxmvSiKfEpn;NLIeH5JjPOa;egST5Av3tJh;Lmh1EJ2UXBL;tolWqZp2mFA;WkJyXQUUnMz;pZ6aL4xnURC;SvcLbOJsyg9;xOIVpSE1CQh;h2BV5S1FHji;EHaHQCDqaI2;LJ4Wv8fUGPI;dDNZZROpOWV;ZkDVhSbzeRq;MBUlevGILyb;vEGKy6OBtb8;Cl9XC0HVp1B;XQpjBfqYdtR;WOLQ4DVzawM;KZHjiTe2JPz;IbiCPypWf9g;ndJ9B6TnV4y;gFRo52nqm2y;zuLha0kAXej;lgTNmJLRj0J;mwaZDkHbQsO;Dnki01bEwu5;RIJRkcd9wtN;Bm6XdfopHgR;GadhgFFLzXk;aCYHfQg8pjV;JaK2GU54M3W;az6w6rq81p1;ibpGfmm1q7u;aKm7O6hyML2;AwNeQj0UUT7;UF2psuxz6ds;nCxgv1uJhO1;AXdiCAKmKhU;qYKLyoHs2Qo;NdscuP8Ox78;uaHUSNFFJFi;scQimj05QeO;L7Jnc4aDzY8;KdVjv8PCls3;DnzN34KvZwC;Hv7kjKMWMTT;BuugSbrGBUw;FjOdo39bN3R;yCV2wf8MwaJ;F9QbbxGO7QO;TWRIhRMeeSs;HLX4mF14JZQ;zuFx0yT77TM;lBKyA6LBzzg;PIYhXPpou8b;qhhONwLI91M;XOq6eqAHZ48;jaj4WhR1Ts8;D5KUlu5yYlf;Lc3WXuBlZ2K;MIMDXKNNL3s;K4m2fhDRcCP;AUF2RUyNdTY&dimension=pe:TODAY;LAST_14_DAYS&dimension=ou:mkvLp2ySTPb;PEeV9zvOonq;BXHLhKL0Lr8;k0H02CCyAl6;ZhxwYDAEtNP;NUbbSjmfuhZ;gKNGsnBOE8S;yikQaEGswr7;a7jM35ZhAku;qZuyqcDv1c7;lRxxd2DZA4g;uZg58YzKrkt;hct7jA5BpoU;C9Uu0zq1W3U;prBPL5mEdoh;ub0GAio2zZz;FxiK0BSzj7g;vKfM8Zid0Qv;jkwBwyDf3S1;CfJboyub6Uw;F9SEIGZ28xU;VOMd2riZNkS;AO4FolO8JcH;zD8XvzZAr70;Jgg5jJqHwmM;ainQR4xhjTg;YJVCLxthEBg;mPyfS69nJlq;FOtXkeTjxzf;VV6Nlaa5qq7;UU9NtfAbrva;PduGn3I3bYH;C4FpbvfhucH;flr5LFKdFOP;Fvdd5BeNkbV;ejzoSvZzyM8;KcIG9IV02GK;FQTi0LxO8Zk;DjnkiokOial;fPEZJebMRpW


--https://links.hispindia.org/pmnpis_dev/api/analytics/dataValueSet.json?dimension=dx:GKUP9ay7hdJ;BSqDSIpHhoT;T6ZVCjLVZKv;Pxb3QkLFpv1;SkSKseuTyGl;LcyLkMke5sq;lNLnEXvQA2Z;sZSMvX1cvUZ;lvpExMb0BVM;LFEsNuuPbHe;tysHAc0rocR;Gm8TIqWAkvq;jRyxotjMzJc;TttZ3onzGkq;puHvieDvsqq;UrdlhCguP6T;utBBIzARaVx;Uc8fVo7aJlz;M8d4dwmaXDZ;lSQl1piK8X1;bRzYx52cEdb;Hsgi04Wq1kx;Jg6OEgczhsu;fw1frT4arH8;wjHPdG9hnGj;UN3JcjzR1wx;fgfeI3Az7zv;v83pnTSU1aY;h4EDxUafIUB;V8IIc7AtbyZ;UgfivD6qGjy;FhGrjbnA8zj;LcMHBv2dCQK;vtlHXvkOe9z;SGfOoFJXNKz;RuNQhx8Kq68;BkmVDIx95lS;nOtAFkDmndu;J41C04PRTJY;WCxzJ1dCFDH;xGEbaj6o1uY;Nt7cI7qwwNe;LOMZy9q1euI;rQBycGaeLMX;qYHET4MkyYp;M14FqSaQu5Q;wiZlLaZYus3;ePaxQu8511O;OHXq7rbDo7b;tA7qHkYVf75;r5cHtnYeyXd;fxmvSiKfEpn;NLIeH5JjPOa;egST5Av3tJh;Lmh1EJ2UXBL;tolWqZp2mFA;WkJyXQUUnMz;pZ6aL4xnURC;SvcLbOJsyg9;xOIVpSE1CQh;h2BV5S1FHji;EHaHQCDqaI2;LJ4Wv8fUGPI;dDNZZROpOWV;ZkDVhSbzeRq;MBUlevGILyb;vEGKy6OBtb8;Cl9XC0HVp1B;XQpjBfqYdtR;WOLQ4DVzawM;KZHjiTe2JPz;IbiCPypWf9g;ndJ9B6TnV4y;gFRo52nqm2y;zuLha0kAXej;lgTNmJLRj0J;mwaZDkHbQsO;Dnki01bEwu5;RIJRkcd9wtN;Bm6XdfopHgR;GadhgFFLzXk;aCYHfQg8pjV;JaK2GU54M3W;az6w6rq81p1;ibpGfmm1q7u;aKm7O6hyML2;AwNeQj0UUT7;UF2psuxz6ds;nCxgv1uJhO1;AXdiCAKmKhU;qYKLyoHs2Qo;NdscuP8Ox78;uaHUSNFFJFi;scQimj05QeO;L7Jnc4aDzY8;KdVjv8PCls3;DnzN34KvZwC;Hv7kjKMWMTT;BuugSbrGBUw;FjOdo39bN3R;yCV2wf8MwaJ;F9QbbxGO7QO;TWRIhRMeeSs;HLX4mF14JZQ;zuFx0yT77TM;lBKyA6LBzzg;PIYhXPpou8b;qhhONwLI91M;XOq6eqAHZ48;jaj4WhR1Ts8;D5KUlu5yYlf;Lc3WXuBlZ2K;MIMDXKNNL3s;K4m2fhDRcCP;AUF2RUyNdTY&dimension=pe:TODAY;LAST_14_DAYS&dimension=ou:mkvLp2ySTPb;PEeV9zvOonq;BXHLhKL0Lr8;k0H02CCyAl6;ZhxwYDAEtNP;NUbbSjmfuhZ;gKNGsnBOE8S;yikQaEGswr7;a7jM35ZhAku;qZuyqcDv1c7;lRxxd2DZA4g;uZg58YzKrkt;hct7jA5BpoU;C9Uu0zq1W3U;prBPL5mEdoh;ub0GAio2zZz;FxiK0BSzj7g;vKfM8Zid0Qv;jkwBwyDf3S1;CfJboyub6Uw;F9SEIGZ28xU;VOMd2riZNkS;AO4FolO8JcH;zD8XvzZAr70;Jgg5jJqHwmM;ainQR4xhjTg;YJVCLxthEBg;mPyfS69nJlq;FOtXkeTjxzf;VV6Nlaa5qq7;UU9NtfAbrva;PduGn3I3bYH;C4FpbvfhucH;flr5LFKdFOP;Fvdd5BeNkbV;ejzoSvZzyM8;KcIG9IV02GK;FQTi0LxO8Zk;DjnkiokOial;fPEZJebMRpW

https://pmnpis.org.ph/app/api/analytics/dataValueSet.json?dimension=dx:lb7cawJfSO4;qyGMqtUeUBz;Uh7vWH7yf7y;TDwyvUkokTH;KPVJ5nQ2k0s;QTIRbWU1hi5;TTx8a0Dsg8H;VPx2VFg6Akj;JNKLB6JEnte;WuKUD8eHQp7;rwMKA7CJcTJ;FkzgUgkB0jc;KuwoiRpxMGl;eRlfzaC9asp;hUopyiw6Mwk;p8zDi9BCWfU;ewIzW61UnRy;XvQUigofqhy;VZBBcNI1iDw;HSEAH05VoFi;ENHXISQXS1n;SjPqnOurJMN;vZssvQZt8ex;VZHIZ1M2zP3;iSbEB04bhxQ;WfHjnBSGNJf;jmMTwq8a3Mm;bTKZ6XDsC5z;E9oTGhUUf6x;ZucB3OuwYYd;zUG6N2IAKet;uHhwXO61Vh8;Kn4rwmuGcv3;dOyst5W1SE4;OesvIru88Ro;V0sL4t6QbWt;gSMlcNq5P6V;qKQYrNV49GM;GKUP9ay7hdJ;lvpExMb0BVM;LFEsNuuPbHe;tysHAc0rocR;jRyxotjMzJc;sZSMvX1cvUZ;Gm8TIqWAkvq;BSqDSIpHhoT;T6ZVCjLVZKv;Pxb3QkLFpv1;SkSKseuTyGl;LcyLkMke5sq;lNLnEXvQA2Z;TttZ3onzGkq;puHvieDvsqq;UrdlhCguP6T;utBBIzARaVx;Uc8fVo7aJlz;M8d4dwmaXDZ;lSQl1piK8X1;bRzYx52cEdb;Hsgi04Wq1kx;wjHPdG9hnGj;UN3JcjzR1wx;fgfeI3Az7zv;h4EDxUafIUB;v83pnTSU1aY;V8IIc7AtbyZ;LcMHBv2dCQK;vtlHXvkOe9z;SGfOoFJXNKz;RuNQhx8Kq68;BkmVDIx95lS;nOtAFkDmndu;J41C04PRTJY;UgfivD6qGjy;FhGrjbnA8zj;WCxzJ1dCFDH;xGEbaj6o1uY;Nt7cI7qwwNe;M14FqSaQu5Q;qYHET4MkyYp;wiZlLaZYus3;rQBycGaeLMX;ePaxQu8511O;OHXq7rbDo7b;tA7qHkYVf75;r5cHtnYeyXd;fxmvSiKfEpn;NLIeH5JjPOa;egST5Av3tJh;Lmh1EJ2UXBL;tolWqZp2mFA;WkJyXQUUnMz;EHaHQCDqaI2;LJ4Wv8fUGPI;dDNZZROpOWV;MBUlevGILyb;ZkDVhSbzeRq;Cl9XC0HVp1B;az6w6rq81p1;fw1frT4arH8;Jg6OEgczhsu;LOMZy9q1euI;pZ6aL4xnURC;SvcLbOJsyg9;xOIVpSE1CQh;h2BV5S1FHji;vEGKy6OBtb8;XQpjBfqYdtR;WOLQ4DVzawM;KZHjiTe2JPz;IbiCPypWf9g;ndJ9B6TnV4y;gFRo52nqm2y;zuLha0kAXej;lgTNmJLRj0J;mwaZDkHbQsO;GadhgFFLzXk;Dnki01bEwu5;RIJRkcd9wtN;Bm6XdfopHgR;aCYHfQg8pjV;JaK2GU54M3W;L7Jnc4aDzY8;KdVjv8PCls3;DnzN34KvZwC;Hv7kjKMWMTT;ibpGfmm1q7u;aKm7O6hyML2;AwNeQj0UUT7;UF2psuxz6ds;nCxgv1uJhO1;AXdiCAKmKhU;qYKLyoHs2Qo;NdscuP8Ox78;uaHUSNFFJFi;scQimj05QeO;BuugSbrGBUw;FjOdo39bN3R;yCV2wf8MwaJ;F9QbbxGO7QO;TWRIhRMeeSs;HLX4mF14JZQ;zuFx0yT77TM;lBKyA6LBzzg;PIYhXPpou8b;qhhONwLI91M;XOq6eqAHZ48;jaj4WhR1Ts8;D5KUlu5yYlf;Lc3WXuBlZ2K;MIMDXKNNL3s;K4m2fhDRcCP;AUF2RUyNdTY&dimension=pe:TODAY;LAST_14_DAYS&dimension=ou:fPEZJebMRpW;gKNGsnBOE8S;NUbbSjmfuhZ;hct7jA5BpoU;pjw6A9QGLJi;VOMd2riZNkS;VV6Nlaa5qq7;BXHLhKL0Lr8;KcIG9IV02GK;wv26z18ozGE;ainQR4xhjTg;ueI86GAeVmX;AO4FolO8JcH;Jgg5jJqHwmM;mPyfS69nJlq;d9ezbr901zY;C9Uu0zq1W3U;vKfM8Zid0Qv;mkvLp2ySTPb;DjnkiokOial;C4FpbvfhucH;cmlrIwEpW9O;jkwBwyDf3S1;FxiK0BSzj7g;YJVCLxthEBg;flr5LFKdFOP;FOtXkeTjxzf;t6xwJEnI7E9;FQTi0LxO8Zk;PEeV9zvOonq;zD8XvzZAr70;AVTrKkzWqkF;qZuyqcDv1c7;lRxxd2DZA4g;uZg58YzKrkt;Fvdd5BeNkbV;F9SEIGZ28xU;KyrAzxjYhr0;a7jM35ZhAku;UU9NtfAbrva;PduGn3I3bYH;prBPL5mEdoh;lgzod6PrDdw;CvNX6hO40pr;CfJboyub6Uw;ZhxwYDAEtNP;yikQaEGswr7;ejzoSvZzyM8;ub0GAio2zZz;k0H02CCyAl6;vbqWblme4Lf&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&completedOnly=false



https://links.hispindia.org/pmnpis_dev/api/analytics/dataValueSet.json?dimension=dx%3AywlP51HyqTv%3BlNLnEXvQA2Z&dimension=pe%3ATODAY%3BLAST_14_DAYS&dimension=ou%3AspXTh9hs5dz%3BOU_GROUP-iyr6jTIFaCX&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&completedOnly=false

https://links.hispindia.org/pmnpis_dev/api/analytics/dataValueSet.json?dimension=dx%3AywlP51HyqTv%3BlNLnEXvQA2Z&dimension=pe%3ATODAY%3BLAST_14_DAYS&dimension=ou%3AspXTh9hs5dz%3BOU_GROUP-iyr6jTIFaCX&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&completedOnly=false



// pmnp_is house hold member
https://links.hispindia.org/pmnpis_dev/api/trackedEntityInstances.json?ouMode=ALL&program=VVLirjoOGbj&filter=NOKzq4dAKF7:eq:1380100001-8265476-001
https://links.hispindia.org/pmnpis_dev/api/trackedEntityInstances/bOlVcTCxSsU.json?fields=*

https://links.hispindia.org/pmnpis_dev/api/trackedEntityInstances/TLn3WzUWOTg.json?ouMode=ALL&program=oSNoNtcmLXL&fields=*?
https://links.hispindia.org/pmnpis_dev/api/trackedEntityInstances/bOlVcTCxSsU.json?ouMode=ALL&program=oSNoNtcmLXL&fields=*?

// pmnp_is house hold
https://links.hispindia.org/pmnpis_dev/api/trackedEntityInstances.json?ouMode=ALL&program=oSNoNtcmLXL&filter=IKOSsYJJZis:eq:8265476
https://links.hispindia.org/pmnpis_dev/api/trackedEntityInstances/gyExbTF5amG.json?fields=*

SELECT org.name AS orgName,tei.uid AS teiUID,teav.value as PMNP_ID,psi.uid eventID,
psi.executiondate::date,psi.status,psi.completeddate::date,psi.completedby,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key

where prg.uid in ( 'VVLirjoOGbj') and ps.uid = 'QfXSvc9HtKN'
and teav.trackedentityattributeid =  2002 limit 1000;

-- tei list for attribute value
SELECT teav.value AS attribute_value,
tei.uid as tei, tei.trackedentityinstanceid
from trackedentityinstance tei

INNER JOIN trackedentitytype tet ON tet.trackedentitytypeid = tei.trackedentitytypeid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
WHERE  tei.deleted is false and tet.trackedentitytypeid = 6123
and trackedentityattributeid in ( 1992 )
and value in ( '3771485',
'7722918',
'4667100',
'9647398',




SELECT 
    psi.uid AS event_uid,
    de.uid AS dataelement_uid,
    de.name AS dataelement_name,
    org.uid AS org_uid,
    org.name AS org_name,psi.deleted,
    psi.created::date AS event_created_date,
    data.value::json ->> 'value' AS de_value
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
WHERE prg.uid = 'oSNoNtcmLXL'
  AND data.value::json ->> 'value' IN ('Completed')
ORDER BY psi.created DESC;


SELECT 
    tei.uid AS teiUID, 
    pi.uid AS enrollmentUID,
    psi.uid as eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name as prg_name,
    ps.name as stage_name,
    psi.executiondate::date, 

    cast(data1.value::json ->> 'value' AS VARCHAR) AS interview_result,
    cast(data2.value::json ->> 'value' AS VARCHAR) AS Approval_status


FROM programstageinstance psi

-- extract each required DE separately
INNER JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'K2ySLF5Qnri'
) data1 ON TRUE

INNER JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'JzxYzLgo0P9'
) data2 ON TRUE


INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

WHERE prg.uid = 'oSNoNtcmLXL' 
  AND ps.uid IN ('pzQalCsjr9F')
  AND cast(data1.value::json ->> 'value' AS VARCHAR) = 'Completed'
  and cast(data2.value::json ->> 'value' AS VARCHAR) = 'Approved'

ORDER BY psi.executiondate::date DESC;

-- event datavalue with attribute value

SELECT 
    tei.uid AS teiUID, tei.trackedentityinstanceid AS tei_id,
    pi.uid AS enrollmentUID,
    psi.uid as eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name as prg_name,
    ps.name as stage_name,
    psi.executiondate::date, 

    cast(data1.value::json ->> 'value' AS VARCHAR) AS interview_result,
    cast(data2.value::json ->> 'value' AS VARCHAR) AS Approval_status,
	teav.value as house_hold_status


FROM programstageinstance psi

-- extract each required DE separately
INNER JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'K2ySLF5Qnri'
) data1 ON TRUE

INNER JOIN LATERAL (
    SELECT value FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'JzxYzLgo0P9'
) data2 ON TRUE


INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid



WHERE prg.uid = 'oSNoNtcmLXL' 
  AND ps.uid IN ('pzQalCsjr9F')
  AND cast(data1.value::json ->> 'value' AS VARCHAR) = 'Completed'
  and cast(data2.value::json ->> 'value' AS VARCHAR) = 'Approved'
  and teav.trackedentityattributeid = 598541 and teav.value in ( 'Pending','Submitted','Ongoing')

ORDER BY psi.executiondate::date DESC;


--- filter query -- event datavalue with attribute value for update House hold status

SELECT 
    tei.uid AS teiUID,
    tei.trackedentityinstanceid AS tei_id,
    --pi.uid AS enrollmentUID,
    psi.uid AS eventUID, 
    --org.uid AS orgUnitUID,
    --org.name AS orgUnitName, 
    --prg.name AS prg_name,
    --ps.name AS stage_name,
    psi.executiondate::date AS event_date,

    interview.value::json ->> 'value' AS interview_result,
    approval.value::json ->> 'value' AS approval_status,
    teav.value AS house_hold_status

FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'K2ySLF5Qnri'
) interview ON TRUE

-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'JzxYzLgo0P9'
) approval ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
--INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

-- Filtered TEA join
INNER JOIN trackedentityattributevalue teav 
       ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
      AND teav.trackedentityattributeid = 598541
      AND teav.value IN ('Pending','Submitted','Ongoing')

WHERE prg.uid = 'oSNoNtcmLXL' 
  AND ps.uid = 'pzQalCsjr9F'
  AND interview.value::json ->> 'value' = 'Completed'
  AND approval.value::json ->> 'value' = 'Approved'

ORDER BY psi.executiondate::date DESC;


--- filter query -- event datavalue with attribute value for update House hold status
SELECT tei.uid AS teiUID,tei.trackedentityinstanceid AS tei_id,
psi.uid AS eventUID, psi.executiondate::date AS event_date,
psi.created::date AS created_date,
interview.value::json ->> 'value' AS interview_result,
approval.value::json ->> 'value' AS approval_status,
teav.value AS house_hold_status, teav.created::date AS teav_created_date
FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'K2ySLF5Qnri'
) interview ON TRUE

-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'JzxYzLgo0P9'
) approval ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid

INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

-- Filtered TEA join
INNER JOIN trackedentityattributevalue teav 
       ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
      AND teav.trackedentityattributeid = 598541
      AND teav.value IN ('Pending','Submitted','Ongoing')

WHERE prg.uid = 'oSNoNtcmLXL' AND ps.uid = 'pzQalCsjr9F'
AND interview.value::json ->> 'value' = 'Completed'
AND approval.value::json ->> 'value' = 'Approved'

ORDER BY psi.executiondate::date DESC;



-- PMNP duplicate attributeValue query

SELECT value, COUNT(*) AS duplicate_count
FROM trackedentityattributevalue
GROUP BY value
HAVING COUNT(*) > 1;

SELECT tea_value.*
FROM trackedentityattributevalue tea_value
JOIN (
    SELECT value
    FROM trackedentityattributevalue
    GROUP BY value
    HAVING COUNT(*) > 1
) dup ON tea_value.value = dup.value
where tea_value.trackedentityattributeid = 2002;


SELECT trackedentityinstanceid, value, COUNT(*) AS duplicate_count
FROM trackedentityattributevalue

where trackedentityattributeid = 2002
GROUP BY trackedentityinstanceid, value
HAVING COUNT(*) > 1;



SELECT trackedentityinstanceid, value
FROM trackedentityattributevalue

where trackedentityattributeid = 2002
and trackedentityinstanceid in ( );



-- delete duplcate value PMNP Id 16/09/2025 -- count 25749

-- attribute value -- 447517
-- trackedentityattributevalueaudit -- 82470
--  trackedentitydatavalueaudit -- 103763
-- programstageinstance -- 4670
-- programinstance -- 25176
-- trackedentityprogramowner --
-- trackedentityinstance -- 25176


### /root/pmnp-cacher/venv/bin/python /root/pmnp-cacher/refresh-cache.py






-- 2 event datavalue 
SELECT 
    
    psi.uid AS eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date AS event_date,

    interview.value::json ->> 'value' AS interview_date,
    int_id.value::json ->> 'value' AS interview_id
    

FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'oUi6zQUzT2S'
) interview ON TRUE

-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) int_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

where executiondate::date = '2025-03-01';


-- single event_dataValue

SELECT 
    
    psi.uid AS eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date AS event_date,

    --interview.value::json ->> 'value' AS interview_date,
    int_id.value::json ->> 'value' AS interview_id
    

FROM programstageinstance psi

-- Extract interview_result



-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) int_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

where psi.executiondate::date = '2025-03-01';




-- 2 dataElement event data value

SELECT  psi.uid AS eventUID, psi.executiondate::date AS event_date,
interview.value::json ->> 'value' AS interview_date,
int_id.value::json ->> 'value' AS interview_id

FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'oUi6zQUzT2S'
) interview ON TRUE

-- Extract interview ID
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) int_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
--INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
--INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

where executiondate::date = '2025-03-01' and ps.uid = 'KR9p7PHH0DV'


-- single event_dataValue

SELECT 
    
    psi.uid AS eventUID,
    org.uid AS orgUnitUID,
    org.name AS orgUnitName,
    --de1.name AS de_name,
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date,
    (psi.eventdatavalues::json -> 'RND5auPDknz' ->> 'value') AS de_value
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
--INNER JOIN dataelement de1 ON de1.uid = 'lsdeQnuiFDT'
WHERE 
ORDER BY psi.executiondate::date DESC;


--- 16/09/2025

-- final query for attribute value and dataelement value

SELECT 
    parent_org.name AS parent_name, 
    org.name AS org_name, 
    pi.enrollmentdate::date AS enrollment_date, 
    tei.uid AS tei_uid,

    -- TE attributes (pivoted)
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    -- Event DEs
    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum,
	CASE 
    	WHEN HHM_Postpartum_de.value::json ->> 'value' = 'true' THEN 'Yes'
    	WHEN HHM_Postpartum_de.value::json ->> 'value' = 'false' THEN 'No'
    	ELSE NULL
	END AS HHM_Postpartum_final

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN organisationunit parent_org 
    ON parent_org.organisationunitid = org.parentid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid

-- TE attributes once
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid

-- Event DEs (LEFT JOIN so missing values don’t drop rows)
LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE '%mkvLp2ySTPb%'
GROUP BY parent_org.name, org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;






SELECT 
    parent_org.name AS parent_name, 
    org.name AS org_name, 
    pi.enrollmentdate::date AS enrollment_date, 
    tei.uid AS tei_uid,

    -- TE attributes (pivoted)
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    -- Event DEs
    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN organisationunit parent_org 
    ON parent_org.organisationunitid = org.parentid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid

-- TE attributes once
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid

-- Event DEs (LEFT JOIN so missing values don’t drop rows)
LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE '%spXTh9hs5dz%'
GROUP BY parent_org.name, org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;


--- links sql view for report Municipality wise - Eligible HH list

https://links.hispindia.org/pmnpis_dev/api/sqlViews/NfVH8OoioBF/data?paging=false&var=orgunit:BWxQgke5tHf
https://pmnpis.org.ph/app/api/sqlViews/NfVH8OoioBF/data?paging=false&var=orgunit:BWxQgke5tHf

-- with unique tei_uid take latest event_uid sql query -- sql -- id NfVH8OoioBF


-- final query as on  18/09/2025 for option code to option name and male/female
WITH ranked_events AS (
    SELECT 
        tei.uid AS tei_uid,
        org.name AS org_name,
        psi.uid AS event_uid,
        psi.executiondate,
        psi.status,
        psi.eventdatavalues,

        -- TEA values (same across events for a TEI, so use windowed MAX)
        MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS PMNP_ID,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Last_name,
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS First_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Middle_name,
        MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Sex_Code,   -- store raw code here

        MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Date_of_Birth,

        ROW_NUMBER() OVER (
            PARTITION BY tei.uid 
            ORDER BY psi.executiondate DESC, psi.created DESC
        ) AS rn

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi 
        ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg 
        ON prg.programid = pi.programid
    INNER JOIN organisationunit org 
        ON org.organisationunitid = pi.organisationunitid
    INNER JOIN programstageinstance psi 
        ON psi.programinstanceid = pi.programinstanceid
    INNER JOIN programstage ps 
        ON ps.programstageid = psi.programstageid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE prg.uid = 'VVLirjoOGbj' 
      AND ps.uid = 'LRJrFeDNEdT' 
      AND org.path LIKE  '%${orgunit}%' 
)
SELECT 
    tei_uid,
    org_name,
    event_uid,
    executiondate::date AS event_date,
    status AS event_status,

    PMNP_ID, Last_name, First_name, Middle_name,
    
    CASE 
        WHEN Sex_Code = '1' THEN 'Female'
        WHEN Sex_Code = '2' THEN 'Male'
        
        ELSE NULL
    END AS Sex,
	Date_of_Birth,

	CASE 
        WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '000' THEN 'Currently part of the household'
        WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '001' THEN 'Deceased'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '002' THEN 'Not part of the household'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '003' THEN 'Formed a new household'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '004' THEN 'Migrated to non PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '005' THEN 'Migrated to PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '006' THEN 'Migrated from non PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '007' THEN 'Migrated from other PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '008' THEN 'Duplicate'
	END AS household_member_status,

	eventdatavalues::jsonb -> 'rvv5Hfyczyh' ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    
	CASE 
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '1' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '2' THEN 'No'
		WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '3' THEN 'I don''t know'
	END AS HHM_Pregnancy_status,
	
    CASE 
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'true' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'false' THEN 'No'
        ELSE NULL
    END AS HHM_Postpartum,
	
    eventdatavalues::jsonb -> 'Hc9Vgt4LXjb' ->> 'value' AS Age_in_years,
    eventdatavalues::jsonb -> 'RoSxLAB5cfo' ->> 'value' AS Age_in_months,
    eventdatavalues::jsonb -> 'Gds5wTiXoSK' ->> 'value' AS Age_in_weeks,
	eventdatavalues::jsonb -> 'ICbJBQoOsVt' ->> 'value' AS Age_in_days

FROM ranked_events
WHERE rn = 1;


-- as on 17/09/2025


WITH ranked_events AS (
    SELECT 
        tei.uid AS tei_uid,
        org.name AS org_name,
        psi.uid AS event_uid,
        psi.executiondate,
		psi.status,
        psi.eventdatavalues,

        -- TEA values (same across events for a TEI, so use windowed MAX)
        MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS PMNP_ID,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Last_name,
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS First_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Middle_name,
        MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Sex,
        MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Date_of_Birth,

        ROW_NUMBER() OVER (
            PARTITION BY tei.uid 
            ORDER BY psi.executiondate DESC, psi.created DESC
        ) AS rn

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi 
        ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg 
        ON prg.programid = pi.programid
    INNER JOIN organisationunit org 
        ON org.organisationunitid = pi.organisationunitid
    INNER JOIN programstageinstance psi 
        ON psi.programinstanceid = pi.programinstanceid
    INNER JOIN programstage ps 
        ON ps.programstageid = psi.programstageid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE prg.uid = 'VVLirjoOGbj' 
      AND ps.uid = 'LRJrFeDNEdT' 
     AND org.path LIKE  '%${orgunit}%'
)
SELECT 
    tei_uid,
    org_name,
    event_uid,
    executiondate::date AS event_date,
	status AS event_status,
	

    PMNP_ID, Last_name, First_name, Middle_name, Sex, Date_of_Birth,

    --eventdatavalues::jsonb ->> 'Rb0k4fOdysI' AS Household_Member_Status,
	eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' AS Household_Member_Status,
	eventdatavalues::jsonb -> 'rvv5Hfyczyh' ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    --eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' AS HHM_Pregnancy_status,
    
	CASE 
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '1' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '2' THEN 'No'
		WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '3' THEN 'I don''t know'
	END AS HHM_Pregnancy_status,
	
	--eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' AS HHM_Postpartum,
	

    CASE 
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'true' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'false' THEN 'No'
        ELSE NULL
    END AS HHM_Postpartum

FROM ranked_events
WHERE rn = 1;




-- with duplicate tei_uid multiple events uid sql query -- sql -- id NfVH8OoioBF 

SELECT org.name AS org_name, 
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid

INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid


LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid


LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE  '%${orgunit}%'
GROUP BY org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;
		 
		 


-- indicator calculation 

SELECT org.name AS org_name, count(tei.trackedentityinstanceid) AS tei_count
    
    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid

INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid


LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid


LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE  '%${orgunit}%'
GROUP BY org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;		


-- event list before 2025

select psi.uid,psi.created,psi.lastupdated,psi.executiondate::date,
prg.name as program_name,ps.name as program_stage_name

from programstageinstance psi
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = ps.programid

where psi.executiondate::date < '2025-01-01'
order by executiondate asc;		 

-- 17/09/2025

select pi.trackedentityinstanceid, psi.executiondate::date AS event_date,
psi.status from programstageinstance psi

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
where pi.programid = 6468 and psi.programstageid = 6512
and pi.trackedentityinstanceid in ( )

select * from programstage where programid = 6468;


delete from trackedentityinstance
where deleted = 'true';

-- 18/09/2025

-- duplicate events of TEI with attribute value and event data value

SELECT 
    tei.uid AS tei_uid,
    pi.uid AS enrollment_uid,
    psi.uid AS event_uid,
    org.uid AS orgunit_uid,
    org.name AS orgunit_name,
    prg.name AS program_name,
    ps.name AS program_stage_name,
    psi.executiondate::date AS event_date,
    psi.status AS event_status,

    -- Example TEA values (same for all events of a TEI)
    MAX(CASE WHEN tea.uid = 'CNqaoQva9S2' THEN teav.value END) 
        OVER (PARTITION BY tei.uid) AS hh_dtatus,
    MAX(CASE WHEN tea.uid = 'IKOSsYJJZis' THEN teav.value END) 
        OVER (PARTITION BY tei.uid) AS house_hold_id,
    MAX(CASE WHEN tea.uid = 'RDQQ3t9oXw5' THEN teav.value END) 
        OVER (PARTITION BY tei.uid) AS house_hold_uid,

    -- Example data elements from event
    eventdatavalues::jsonb -> 'RND5auPDknz' ->> 'value' AS interview_id,
    (eventdatavalues::jsonb -> 'oUi6zQUzT2S' ->> 'value')::date AS interview_date

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid

WHERE prg.uid = 'oSNoNtcmLXL'      -- your program HH
  AND ps.uid = 'KR9p7PHH0DV'       -- interview_details program stage (or remove this for ALL stages)
  --AND org.path LIKE '%BWxQgke5tHf%' -- orgunit filter

ORDER BY tei.uid, psi.executiondate DESC;


-- 19/09/2025 duplicate events
SELECT DISTINCT ON (tei.uid, psi.uid)
    tei.uid AS tei_uid,
    pi.uid AS enrollment_uid,
    psi.uid AS event_uid,
    org.uid AS orgunit_uid,
    org.name AS orgunit_name,
    prg.name AS program_name,
    ps.name AS program_stage_name,
    psi.executiondate::date AS event_date,
    psi.status AS event_status,

    -- TEA values (repeat across events for this TEI)
    MAX(CASE WHEN tea.uid = 'CNqaoQva9S2' THEN teav.value END) 
        OVER (PARTITION BY tei.uid) AS hh_status,
    MAX(CASE WHEN tea.uid = 'IKOSsYJJZis' THEN teav.value END) 
        OVER (PARTITION BY tei.uid) AS house_hold_id,

    -- Event data elements
    eventdatavalues::jsonb -> 'RND5auPDknz' ->> 'value' AS interview_id,
    (eventdatavalues::jsonb -> 'oUi6zQUzT2S' ->> 'value')::date AS interview_date

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid
WHERE prg.uid = 'oSNoNtcmLXL'
  AND ps.uid = 'KR9p7PHH0DV'
  AND org.path LIKE '%znR5iUoZ8Ql%'
ORDER BY tei.uid, psi.uid, psi.executiondate DESC;



-- interview_id to interview_result for duplicate events

SELECT interview_id.value::json ->> 'value' AS interview_id,
interview_result.value::json ->> 'value' AS interview_result,
psi.uid AS eventUID, psi.executiondate::date AS event_date

FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'K2ySLF5Qnri'
) interview_result ON TRUE

-- Extract interview ID
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) interview_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
-- JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
--INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

WHERE prg.uid = 'oSNoNtcmLXL' AND ps.uid = 'pzQalCsjr9F'
AND interview_id.value::json ->> 'value' in ( 'uEZSXJ4AjUo','YGnN2G4hCfm',
'xEhICu4PQUS','x9Q9bar1Ie3','oFiukMEPv4f','QMg3OKu53yK','gbKLz8IdVLd','iE7oGOt68pv')






-- duplicate events counts per tei

SELECT 
    tei.uid AS tei_uid,
    COUNT(psi.uid) AS event_count
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
WHERE prg.uid = 'oSNoNtcmLXL'      -- your program HH
  AND ps.uid = 'KR9p7PHH0DV'       -- interview_details program stage (or remove this for ALL stages)
  --AND org.path LIKE '%BWxQgke5tHf%' -- orgunit filter
GROUP BY tei.uid
HAVING COUNT(psi.uid) > 1
ORDER BY event_count DESC;



-- for delete events 23/09/2025

SELECT psi.uid AS eventUID,
(psi.eventdatavalues::json -> 'RND5auPDknz' ->> 'value') AS interview_id
FROM programstageinstance psi

WHERE psi.eventdatavalues::json -> 'RND5auPDknz' ->> 'value' in ( 'NIS2imzZrIT',
'KwbdM6p3XoG',
'RoYxdWCmWRr');

SELECT psi.uid AS eventUID,
(psi.eventdatavalues::json -> 'RND5auPDknz' ->> 'value') AS interview_id
FROM programstageinstance psi

WHERE psi.uid in ( 'NIS2imzZrIT',
'KwbdM6p3XoG',
'RoYxdWCmWRr');


-- 25/09/2025

-- tei list which have no some attribute value

SELECT COUNT(*) AS missing_attr_count
FROM trackedentityinstance tei
WHERE tei.trackedentitytypeid = 6126
  AND NOT EXISTS (
      SELECT 1
      FROM trackedentityattributevalue teav
      WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid
        AND teav.trackedentityattributeid = 2001
  );


SELECT count(trackedentityinstanceid)
FROM trackedentityinstance tei
WHERE tei.trackedentitytypeid = 6126
  AND NOT EXISTS (
      SELECT 1
      FROM trackedentityattributevalue teav
      WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid
        AND teav.trackedentityattributeid = 2001
  );



SELECT 
    grandparent.name AS grandparent_name,
    parent.name AS parent_name,
    tei.uid AS tei_uid,
    org.uid AS orgunit_uid,
    org.name AS orgunit_name,
    org.code AS orgunit_code
FROM trackedentityinstance tei
INNER JOIN organisationunit org 
    ON org.organisationunitid = tei.organisationunitid
LEFT JOIN organisationunit parent 
    ON parent.organisationunitid = org.parentid
LEFT JOIN organisationunit grandparent 
    ON grandparent.organisationunitid = parent.parentid
WHERE tei.trackedentitytypeid = 6126
  AND NOT EXISTS (
      SELECT 1
      FROM trackedentityattributevalue teav
      WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid
        AND teav.trackedentityattributeid = 2001
  );

SELECT 
	grandgrandparent.name AS region_name,
    grandparent.name AS municiplaity_name,
    parent.name AS parent_name,
	org.uid AS barangay_uid,
    org.name AS barangay_name,
    org.code AS barangay_code,
    tei.uid AS tei_uid,
	tei.trackedentityinstanceid AS trackedentityinstanceid
    
FROM trackedentityinstance tei
INNER JOIN organisationunit org 
    ON org.organisationunitid = tei.organisationunitid
LEFT JOIN organisationunit parent 
    ON parent.organisationunitid = org.parentid
LEFT JOIN organisationunit grandparent 
    ON grandparent.organisationunitid = parent.parentid
LEFT JOIN organisationunit grandgrandparent 
    ON grandgrandparent.organisationunitid = grandparent.parentid	
	
WHERE tei.trackedentitytypeid = 6126
  AND NOT EXISTS (
      SELECT 1
      FROM trackedentityattributevalue teav
      WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid
        AND teav.trackedentityattributeid = 2001
  );



-- delete events

begin;

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where uid in ( 'KS4ARz5hqfQ'));

delete from programstageinstance where uid in ( 'KS4ARz5hqfQ');

end;



-- 07/10/2025
-- from production downtime
-- house hold list with no household status
SELECT 
	grandgrandparent.name AS region_name,
    grandparent.name AS municiplaity_name,
    parent.name AS parent_name,
	org.uid AS barangay_uid,
    org.name AS barangay_name,
    org.code AS barangay_code,
    tei.uid AS tei_uid,
	tei.trackedentityinstanceid AS trackedentityinstanceid
    
FROM trackedentityinstance tei
INNER JOIN organisationunit org 
    ON org.organisationunitid = tei.organisationunitid
LEFT JOIN organisationunit parent 
    ON parent.organisationunitid = org.parentid
LEFT JOIN organisationunit grandparent 
    ON grandparent.organisationunitid = parent.parentid
LEFT JOIN organisationunit grandgrandparent 
    ON grandgrandparent.organisationunitid = grandparent.parentid	
	
WHERE tei.trackedentitytypeid = 6123
  AND NOT EXISTS (
      SELECT 1
      FROM trackedentityattributevalue teav
      WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid
        AND teav.trackedentityattributeid = 598541
  );

-- house hold list with household status for update to Synced
SELECT 
	
    tei.uid AS tei_uid,
	tei.trackedentityinstanceid AS trackedentityinstanceid
    
FROM trackedentityinstance tei

WHERE tei.trackedentitytypeid = 6123
  AND EXISTS(
      SELECT 1
      FROM trackedentityattributevalue teav
      WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid
        AND teav.trackedentityattributeid = 598541
  );



select teav.trackedentityinstanceid AS tei_id, teav.value
FROM trackedentityattributevalue teav

where teav.trackedentityattributeid = 598541 
and teav.trackedentityinstanceid in ( select 
trackedentityinstanceid from trackedentityinstance 
where trackedentitytypeid = 6123)
--and teav.value != 'Synced'

and teav.trackedentityinstanceid >= 25736889
order by teav.trackedentityinstanceid asc limit 300000

-- update script

update trackedentityattributevalue set value  = 'Synced' where trackedentityinstanceid = 25701935 and trackedentityattributeid = 598541;
update trackedentityattributevalue set value  = 'Synced' where trackedentityinstanceid = 25701961 and trackedentityattributeid = 598541;
update trackedentityattributevalue set value  = 'Synced' where trackedentityinstanceid = 25701944 and trackedentityattributeid = 598541;


-- event list which is active and update to COMPLETED
-- Postponed

SELECT psi.programstageinstanceid AS programstageinstance, psi.uid AS eventUID,
prg.name AS prg_name,prg.uid AS prg_uid,
(psi.eventdatavalues::json -> 'K2ySLF5Qnri' ->> 'value') AS de_value_interview_result
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid

INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

WHERE  ps.uid = 'pzQalCsjr9F' and psi.status = 'ACTIVE'
order by psi.programstageinstanceid asc limit 8;

-- and update the de_value_interview_result to Postponed which is active events and update events to COMPLETED


SELECT psi.programstageinstanceid AS programstageinstance, psi.uid AS eventUID,
prg.name AS prg_name,prg.uid AS prg_uid,
(psi.eventdatavalues::json -> 'K2ySLF5Qnri' ->> 'value') AS de_value_interview_result
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid

INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

WHERE  ps.uid = 'pzQalCsjr9F' and psi.status = 'ACTIVE'
and psi.programstageinstanceid > 8222267
order by psi.programstageinstanceid asc limit 500000;


select Count(*) from programstageinstance where 
status = 'ACTIVE';

update programstageinstance set status = 'COMPLETED'
where status = 'ACTIVE';


-- based on user group and user organisationunit

select 	ui.username, ui.firstname userFirstName, ui.surname userSurName, ui.userinfoid, 
org.organisationunitid userOrgID, org.uid userOrgUID, org.name userOrgUnitName, 
org.code userOrgUnitCode  from  usermembership um

INNER JOIN userinfo ui ON ui.userinfoid = um.userinfoid
INNER join organisationunit org ON org.organisationunitid = um.organisationunitid
inner join usergroupmembers ugm ON ui.userinfoid = ugm.userid
inner join usergroup urg ON urg.usergroupid = ugm.usergroupid
and org.uid = 'mkvLp2ySTPb' and urg.uid = 'VfVrBMOl8tH';

-- 
-- final soundex code generation query with extension_name null

-- Enable soundex support
-- 14/10/2025
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    sub.extension_name,

    CONCAT(
        soundex(sub.first_name),
        soundex(sub.middle_name),
        soundex(sub.last_name),
        soundex(sub.extension_name)
    ) AS soundex_temp,

    CONCAT(
        CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
        CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
        CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
        CASE WHEN sub.extension_name = '00' THEN '00' ELSE soundex(sub.extension_name) END
    ) AS full_name_soundex,

    LENGTH(
        CONCAT(
            CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
            CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
            CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
            CASE WHEN sub.extension_name = '00' THEN '00' ELSE soundex(sub.extension_name) END
        )
    ) AS code_len

FROM (
    SELECT 
        tei.trackedentityinstanceid,
        tei.uid AS tei_uid,

        COALESCE(MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS first_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS middle_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS last_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '00') AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE 
        tei.trackedentitytypeid = 6126 
        AND org.path LIKE '%g6OKJ39e5pV%'
    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub;


-- final query with extension name 14 digits code

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    sub.extension_name,

    CONCAT(
        CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
        CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
        CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
        CASE 
            WHEN sub.extension_name = 'Sr' THEN 'SR' 
            WHEN sub.extension_name = 'Jr' THEN 'JR'
            WHEN sub.extension_name = 'I' THEN '01'
            WHEN sub.extension_name = 'II' THEN '02'
            WHEN sub.extension_name = 'III' THEN '03'
            WHEN sub.extension_name = 'IV' THEN '04'
            WHEN sub.extension_name = 'V' THEN '05'
            WHEN sub.extension_name = '00' THEN '00'
        END
    ) AS full_name_soundex,

    LENGTH(
        CONCAT(
            CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
            CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
            CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
            CASE 
                WHEN sub.extension_name = 'Sr' THEN 'SR' 
                WHEN sub.extension_name = 'Jr' THEN 'JR'
                WHEN sub.extension_name = 'I' THEN '01'
                WHEN sub.extension_name = 'II' THEN '02'
                WHEN sub.extension_name = 'III' THEN '03'
                WHEN sub.extension_name = 'IV' THEN '04'
                WHEN sub.extension_name = 'V' THEN '05'
                WHEN sub.extension_name = '00' THEN '00'
            END
        )
    ) AS code_len

FROM (
    SELECT 
        tei.trackedentityinstanceid,
        tei.uid AS tei_uid,

        COALESCE(MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS first_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS middle_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS last_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN teav.value END), '00') AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE 
        tei.trackedentitytypeid = 6126 
        AND org.path LIKE '%spXTh9hs5dz%'
    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub
WHERE sub.first_name IS NOT NULL 
  AND sub.first_name <> ''
  AND sub.first_name <> '0000';
  
  
  
-- 15/10/2025

-- 15/10/2025
---Your SQL query is valid and logically consistent — it’s selecting tracked entity instances (TEIs) and their corresponding events (psi.uid) 
-- under specific DHIS2 programs and stages, 
--but only for TEIs that don’t have a value for a particular attribute (trackedentityattributeid = 2004).
-- list of TEI and its events which has no first name attribute value
SELECT 
    tei.uid AS tei_uid,
    psi.uid AS event_uid
FROM trackedentityinstance tei
JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
JOIN program prg ON prg.programid = pi.programid
JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
JOIN programstage ps ON ps.programstageid = psi.programstageid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    AND teav.trackedentityattributeid = 2004
WHERE prg.uid = 'VVLirjoOGbj'
  AND ps.uid = 'LRJrFeDNEdT'
  AND tei.trackedentitytypeid = 6126
  AND teav.trackedentityattributevalueid IS NULL;  
  
  
SELECT tei.uid AS tei_uid, psi.uid AS event_uid 
FROM trackedentityinstance tei 
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid 
INNER JOIN program prg ON prg.programid = pi.programid 
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid 
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid 
WHERE prg.uid = 'VVLirjoOGbj' and ps.uid = 'LRJrFeDNEdT' 
and tei.uid in (SELECT tei.uid FROM trackedentityinstance tei 
WHERE tei.trackedentitytypeid = 6126 
AND NOT EXISTS( 
SELECT 1 FROM trackedentityattributevalue teav 
WHERE teav.trackedentityinstanceid = tei.trackedentityinstanceid 
AND teav.trackedentityattributeid = 2004 ) );  

-- delete tei with limit
DELETE FROM trackedentityinstance
WHERE ctid IN (
  SELECT ctid
  FROM trackedentityinstance
  WHERE deleted = 'true'
  LIMIT 10000
);


