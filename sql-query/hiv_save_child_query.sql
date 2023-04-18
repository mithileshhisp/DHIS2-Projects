
-- 14/03/2023
-- postgres SQL Query alter the database sequence id

SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

SELECT last_value FROM hibernate_sequence;

ALTER SEQUENCE hibernate_sequence RESTART WITH 4412;

ALTER SEQUENCE hibernate_sequence RESTART WITH 8394001;8393989


SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

-- run on HIV production as on 14/03/2023
SELECT last_value FROM programstageinstance_sequence;

ALTER SEQUENCE programstageinstance_sequence RESTART WITH 7779001;

-- 28/02/2023

update programinstance set geometry = null; -- empty co-ordinate of all enrollment



-- https://hivtracker.hispindia.org/hivtracker/dhis-web-dashboard/#/
-- new linode server created

-- startup command : sudo -u dhis /home/dhis/tomcat_hivtracker/bin/startup.sh

-- pg_dump -U dhis -d mannual_save_child_2_38 -T analytics* > /home/ubuntu/dbbackup.sql

-- upgrade from 2.34  to 2.37/2.38 

-- 1) from 2.34 to 2.35 run dhis2-stable-2.35.14.war
drop table color cascade;	
drop table colorset cascade;	

script -- 
delete from flyway_schema_history where installed_rank = 131 -- for color table;
drop table color cascade;	
drop table colorset cascade;		
	
delete from flyway_schema_history where installed_rank = 131;	

select * from jobconfiguration where jobtype = 'CUSTOM_SMS_TASK';	

delete from jobconfiguration where jobtype = 'CUSTOM_SMS_TASK';

update users set disabled = false where username = 'admin';

update users set disabled = false where username = 'hispdev';
	
-- from 2.35.1 - Add teav btree index to 2.35.46 -- Add index trackedentityprogramowner program orgunit

-- 2) from 2.35 to 2.36 run dhis2-stable-2.36.12.war -- no errors

-- from 2.36.1 - normalize program rule variable names for duplicates to 2.36.56 -- Add missing programinstance rows for programs without registration
	
	
-- 3) from 2.36 to 2.37 run dhis2-stable-2.37.7.1.war

--V2_37_17__Remove_Chart_and_ReportTable.sql
--drop table chart cascade;	
--drop table reporttable cascade; -- 2.37.17 Remove Chart and ReportTable	
--cannot drop table objecttranslation because other objects depend on it
--drop table objecttranslation cascade; -- 2.37.31 -- drop legacy translation table

--from 2.37.1 - Add Deferred Constraint to Interpretation Comments Table to 2.37.49 -- Rename Column in Visualization

-- 4) from 2.37 to 2.38 run dhis2-stable-2.38.1.1.war -- no errors

-- from 2.38.1 - Add column shortName to group sets to 2.38.46 -- Potential Duplicate Update ALL Status

	
-- 	-- for data insert in 2.34 from 2.38 14/12/2022

--trackedentityinstance
select * from trackedentityinstance order by trackedentityinstanceid desc;
select * from trackedentityinstance where trackedentityinstanceid > 4696613; -- -- 10314
	
-- 	trackedentityattributevalue
select tea.valuetype,teav.trackedentityinstanceid,teav.trackedentityattributeid,teav.value,
teav.created,teav.lastupdated,teav.storedby from trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
where teav.trackedentityinstanceid > 4696613; -- 186897

-- programinstance
select * from programinstance order by programinstanceid desc;
select * from programinstance  where programinstanceid > 4683891; -- 10261

--	programownershiphistory
select * from programownershiphistory order by programownershiphistoryid desc;
select * from programownershiphistory where programownershiphistoryid > 5574807; -- 89

SELECT programownershiphistoryid, programid, trackedentityinstanceid, startdate, enddate, createdby
FROM public.programownershiphistory where programownershiphistoryid > 5574807;
	
	
-- 	trackedentityprogramowner
select * from trackedentityprogramowner order by trackedentityprogramownerid desc;
select * from trackedentityprogramowner where trackedentityprogramownerid > 5574949; -- 10259

SELECT trackedentityprogramownerid, trackedentityinstanceid, programid, created, 
lastupdated, organisationunitid, createdby
FROM public.trackedentityprogramowner;	
	
-- 	programstageinstance
select * from programstageinstance order by programstageinstanceid desc;
select * from programstageinstance where programstageinstanceid > 	5506085; -- 79429
-- eventdatavalues -- 75667 null -- 3762


select programstageinstanceid,uid, eventdatavalues from programstageinstance where uid in (
'qYVjBL0joDl','qWT7l3rcpdH' )and eventdatavalues != '{}';

select programstageinstanceid,uid,created,lastupdated,programinstanceid,programstageid,
duedate,organisationunitid,status,attributeoptioncomboid,storedby,deleted,lastsynchronized,
createdbyuserinfo,lastupdatedbyuserinfo from programstageinstance where programstageinstanceid > 5506085;

select programstageinstanceid,uid,created,lastupdated,programinstanceid,
programstageid,duedate,executiondate,organisationunitid,status,completeddate,
attributeoptioncomboid,storedby,completedby,deleted,code,createdatclient,
lastupdatedatclient,lastsynchronized,geometry,assigneduserid,longitude,latitude,
createdbyuserinfo,lastupdatedbyuserinfo from programstageinstance where 
programstageinstanceid > 5506085;
	
	
	
select * from trackedentityattributevalue where trackedentityattributeid = 28357
and trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where value = 'NCASC');

-- attribute_value
select tei.trackedentityinstanceid AS teiID,tei.uid AS teiUID,
tea.trackedentityattributeid AS teaID,tea.uid AS teaUID,
teav.value from trackedentityattributevalue teav 
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
where tea.uid in ( 'PWdxGAN3OCD')
and teav.created::date >= '2022-10-20'
and tei.uid in ( 'KgGdOh1XTaD');	

select tei.trackedentityinstanceid AS teiID,tei.uid AS teiUID,
tea.trackedentityattributeid AS teaID,tea.uid AS teaUID,
teav.value from trackedentityattributevalue teav 
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
where tea.uid in ( 'PWdxGAN3OCD')
and teav.created::date >= '2022-10-20' and org.organisationunitid in(
select organisationunitid from orgunitgroupmembers where orgunitgroupid =4742863);


select tei.trackedentityinstanceid AS teiID,tei.uid AS teiUID,
tea.trackedentityattributeid AS teaID,tea.uid AS teaUID,
teav.value from trackedentityattributevalue teav 
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
where tea.uid in ( 'PWdxGAN3OCD') and org.organisationunitid in(
select organisationunitid from orgunitgroupmembers where orgunitgroupid =4742863);


-- implementing agency -- PWdxGAN3OCD
-- client_code -- drKkLxaGFwv
	
-- 2.34 -- 		

select count(*) from datavalue; -- 2738


-- 2.38 -- 	
select count(*) from datavalue; -- 2827

	
	
-- for data insert in 2.34 from 2.38 01/12/2022


select * from trackedentityinstance where trackedentityinstanceid > 4669497;

select * from trackedentityattributevalue where trackedentityinstanceid > 4669497;

select tea.valuetype,teav.trackedentityinstanceid,teav.trackedentityattributeid,teav.value,
teav.created,teav.lastupdated,teav.storedby from trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
where teav.trackedentityinstanceid > 4669497;


-- hispdev -- 5560
insert into trackedentityinstance (trackedentityinstanceid,uid,created,lastupdated,organisationunitid,trackedentitytypeid,inactive,lastupdatedby,createdatclient,lastupdatedatclient,deleted,lastsynchronized,storedby) values
="(nextval('hibernate_sequence'),'"&B2&"', '"&C2&"','"&D2&"',"&E2&", "&F2&",'"&G2&"', "&H2&", '"&I2&"','"&J2&"','"&K2&"','"&L2&"','"&M2&"' ),"
	
insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,value,created,lastupdated,storedby) values
="("&C2&","&D2&",'"&E2&"','"&F2&"','"&G2&"','"&H2&"'),"	


insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, createdatclient,lastupdatedatclient, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&B2&"', '"&C2&"', '"&D2&"', '"&E2&"', '"&H2&"', "&J2&", "&K2&",'"&L2&"', "&M2&", '"&O2&"','"&P2&"','"&Q2&"','"&R2&"' ),"

="update programinstance set geometry  = '"&D2&"' where programinstanceid = "&B2&" and uid = '"&A2&"';"

insert into programstageinstance (programstageinstanceid,uid,created,lastupdated,programinstanceid,programstageid,duedate,organisationunitid,status,attributeoptioncomboid,storedby,deleted,lastsynchronized,createdbyuserinfo,lastupdatedbyuserinfo ) values
="(nextval('hibernate_sequence'),'"&B2&"', '"&C2&"', '"&D2&"', "&F2&", "&G2&",'"&H2&"', "&J2&", '"&K2&"', "&M2&", '"&N2&"','"&O2&"','"&R2&"' ,'"&T2&"' ,'"&U2&"'),"








select * from programinstance order by programinstanceid desc;

select * from programinstance  where programinstanceid > 4659040; -- 4659040 4668421

SELECT programownershiphistoryid, programid, trackedentityinstanceid, startdate, enddate, createdby
	FROM public.programownershiphistory order by programownershiphistoryid desc;
	
select * from programownershiphistory where programownershiphistoryid > 5479692;	


SELECT trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby
	FROM public.trackedentityprogramowner;
	
select * from trackedentityprogramowner where trackedentityprogramownerid > 5479697;

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&C2&", "&D2&",'"&E2&"','"&F2&"',"&G2&",'"&H2&"' ),"

-- trackedentityprogramowner -- 23724
	
-- programownershiphistory -- 139

insert into programownershiphistory (programownershiphistoryid, programid, trackedentityinstanceid, startdate, enddate, createdby) values
="(nextval('hibernate_sequence'),"&B2&", "&D2&",'"&E2&"','"&F2&"','"&G2&"' ),"
	
select count(*) from programstageinstance order by programstageinstanceid desc;	
select * from programstageinstance order by programstageinstanceid desc;
select * from programstageinstance where programstageinstanceid > 	5353800
	
	
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby,TEXT(dv.created::timestamp) ,dv.lastupdated::timestamp,  
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)
,split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod,pet.name AS periodType, 
pe.periodtypeid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and dv.created::date >= '2022-10-19';
	
	
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby,TEXT(dv.created::timestamp) ,dv.lastupdated::timestamp,  
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.startdate::TEXT,'-', 2)) 
as isoPeriod,pet.name AS periodType, pe.periodtypeid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and dv.created::date >= '2022-10-19';
	
	
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, dv.created, dv.lastupdated, pe.startdate,pe.enddate, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'ilJHhsHQ7sA' and dv.value is not null and dv.deleted is not true;	
	
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID, org.uid AS organisationunitUID, 
dv.value,  dv.created, dv.lastupdated, dv.storedby, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name, pe.startdate,pe.enddate FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'ilJHhsHQ7sA' and dv.value is not null and dv.deleted is not true;	
	
	
	
SELECT psi.uid as eventUID,de.uid as dataElementUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
WHERE psi.programstageinstanceid > 	5353800;

="update programstageinstance set eventdatavalues  = '"&B2&"' where uid = '"&A2&"';"
	
-- for mete-data and data-value/event/enromment/tei count	
select * from usergroup; -- 40
select count(*) from trackedentityinstance; -- 152927
select count(*) from trackedentityinstance where deleted is false; -- 152924

select count(*) from trackedentityinstance; -- 176729
select count(*) from trackedentityinstance where deleted is false; -- 176716 different -- 23792

select count(*) from trackedentityattributevalue;

select * from datavalue where created::date >= '2022-10-19' order by created desc;
select * from datavalue order by created desc;

select * from program;	 -- 2
select * from period;	 -- 1120
select * from map; -- 34
select * from orgunitgroup; -- 69
select * from dashboard order by dashboardid desc; 199
select * from dataelement order by dataelement desc; -- 2141
select * from indicator order by indicatorid desc; -- 827
select * from organisationunit order by organisationunitid desc; -- 16592
select * from dataset order by datasetid desc; -- 58
select * from programstageinstance order by programstageinstanceid desc; -- 932639
select * from dataelementgroup; -- 1
select * from indicatorgroup; -- 12
select * from indicatortype; -- 5
select count(*) from programinstance; -- 150270
select count(*) from programinstance where deleted is false; --150206

select count(*) from programinstance; -- 173919
select count(*) from programinstance where deleted is false; --173906 different -- 23700

select count(*) from programstageinstance; --   937207
select count(*) from programstageinstance where deleted is false; -- 937207

select count(*) from programstageinstance; -- 1087336
select count(*) from programstageinstance where deleted is false; -- 1087234 different -- 150,129
select count(*) from programstageinstance where created::date > '2022-10-20'; 

select count(*) from datavalue; -- 2739
select count(*) from datavalue where deleted is true; -- 1
select count(*) from users; -- 473
select count(*) from userinfo; -- 481
select count(*) from validationrule; -- 94
select count(*) from visualization; -- 642

select count(*) from eventvisualization; -- 221

-- up to 2.36 not from 2.37
select * from objecttranslation;	-- 0
select * from chart; -- 121
select * from reporttable; -- 131

select count(*)	 from audit; -- 1450509

-- latest tei count for biometric SQL-view 
-- https://tracker.hivaids.gov.np/save-child-2.27/api/sqlViews/qwqgxFygofx/data?paging=false

-- for find TEI based on client code
-- http://localhost:8091/hiv/api/trackedEntityInstances.json?program=L78QzNqadTV&ouMode=ALL&fields=trackedEntityInstance,attributes[*],orgUnit&filter=drKkLxaGFwv:EQ:FI030430864

-- for find TEI based on finger-print-id
-- http://localhost:8091/hiv/api/trackedEntityInstances.json?ouMode=ALL&program=L78QzNqadTV&fields=trackedEntityInstance,attributes[*],orgUnit&filter=UHoTGT1dtjj:EQ:22665

-- for finger print server-application URL
--https://tracker.hivaids.gov.np/save-child-2.27/api/trackedEntityInstances/query.json?ouMode=ALL&attribute=UHoTGT1dtjj&program=L78QzNqadTV

-- http://localhost:8091/hiv/api/trackedEntityInstances/query.json?ouMode=ALL&attribute=uiOMHu4LtAP&attribute=UHoTGT1dtjj&program=L78QzNqadTV&skipPaging=true

 -- http://localhost:8091/hiv/api/trackedEntityInstances/query.json?ouMode=ALL&attribute=uiOMHu4LtAP&attribute=UHoTGT1dtjj&program=L78QzNqadTV&skipPaging=true

select tei.trackedentityinstanceid ,teav.value from  trackedentityinstance tei
inner join trackedentityattributevalue teav 
on tei.trackedentityinstanceid= teav.trackedentityinstanceid inner join trackedentityattribute tea on tea.trackedentityattributeid= teav.trackedentityattributeid
Where tea.name='Fingerprint Id'
group by tei.trackedentityinstanceid,teav.value
order by cast(teav.value as Int ) DESC LIMIT 1

select tei.trackedentityinstanceid ,tei.uid,teav.value from  trackedentityinstance tei
inner join trackedentityattributevalue teav 
on tei.trackedentityinstanceid= teav.trackedentityinstanceid inner join trackedentityattribute tea on tea.trackedentityattributeid= teav.trackedentityattributeid
Where tea.name='Fingerprint Id'
group by tei.trackedentityinstanceid,teav.value
order by cast(teav.value as Int ) desc


-- for recognised finger-print query for all tei fingerprint-string and fingerprint-id for ALL_TEI_DATA_URL 

SELECT teav1.value fingerPrintString, teav2.value fingerPrintId 
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 28357  ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
WHERE teav1.trackedentityattributeid = 28358 order by teav1.trackedentityinstanceid desc;

-- https://tracker.hivaids.gov.np/save-child-2.27/api/29/sqlViews/NHCQz7jhFzk/data.json?paging=false


-- all 
select * from trackedentityattributevalue where 
trackedentityattributeid in (select trackedentityattributeid
from trackedentityattribute where uid = 'uiOMHu4LtAP');

select * from trackedentityattributevalue where 
trackedentityattributeid in (select trackedentityattributeid
from trackedentityattribute where uid = 'UHoTGT1dtjj');






-- count as on 16/12/2021 on production
select count(*) from trackedentityinstance; -- 36664 21/12/2021 -- 36712
select count(*) from programinstance; -- 35850 21/12/2021 -- 35877
select count(*) from programstageinstance; -- 353877 21/12/2021 -- 354810
select count(*) from trackedentityattributevalue; -- 651333 21/12/2021 -- 652468
select count(*) from trackedentityattributevalueaudit; -- 282388 21/12/2021 -- 282527
select count(*) from trackedentitydatavalueaudit; -- 16334864 21/12/2021 -- 16422085
select count(*) from datavalue; -- 1883 21/12/2021 -- 1898
select count(*) from audit; -- 9732866 21/12/2021 -- 8

SELECT
    relname AS "tables",
    pg_size_pretty (
        pg_total_relation_size (X .oid)
    ) AS "size"
FROM
    pg_class X
LEFT JOIN pg_namespace Y ON (Y.oid = X .relnamespace)
WHERE
    nspname NOT IN (
        'pg_catalog',
        'information_schema'
    )
AND X .relkind <> 'i'
AND nspname !~ '^pg_toast'
ORDER BY
    pg_total_relation_size (X .oid) desc
LIMIT 10;


-- update Query to shift the profile and events on different organization unit
source -- 'LOSotbIZxiU' -- 4629953

select * from organisationunit where uid = 'LOSotbIZxiU';

-- destination  - 'nPv9ZSw7DU3'
-- source -- 'LOSotbIZxiU' -- 4629953
select * from organisationunit where uid = 'LOSotbIZxiU';
select count(*) from trackedentityinstance where organisationunitid = 4629953;
select count(*) from programinstance where organisationunitid = 4629953;
select count(*) from programstageinstance where organisationunitid = 4629953;
select count(*) from trackedentityprogramowner where organisationunitid = 4629953;

-- destination  - 'nPv9ZSw7DU3' -- 44844
select * from organisationunit where uid = 'nPv9ZSw7DU3';
select count(*) from trackedentityinstance where organisationunitid = 44844;
select count(*) from programinstance where organisationunitid = 44844;
select count(*) from programstageinstance where organisationunitid = 44844;
select count(*) from trackedentityprogramowner where organisationunitid = 44844;


update trackedentityinstance set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 77
update programinstance set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 77
update programstageinstance set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 389
update trackedentityprogramowner set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 77


-- remove coordinate from organisationunit

select * from organisationunit where uid = 'hasbXH0dTqM';

select geometry,featuretype from organisationunit where uid = 'hasbXH0dTqM';

select * from organisationunit where 
uid in( 'hasbXH0dTqM','LnJ8MTOmgGa','uHEl9oRZm8L','Wep3D4POB3H','eW2b8SUYRWt',
'eW2b8SUYRWt','grMJpaDdSrD');

update organisationunit set geometry = null, featuretype = null where 
uid in( 'hasbXH0dTqM','LnJ8MTOmgGa','uHEl9oRZm8L','Wep3D4POB3H','eW2b8SUYRWt',
'eW2b8SUYRWt','grMJpaDdSrD');


select count(*) from programstageinstance where geometry is  null; -- 56694
select count(*) from programstageinstance where geometry is not null;  -- 340075
select count(*) from programstageinstance where longitude is  null;  -- 396769
select count(*) from programstageinstance where latitude is  null;  -- 396769

update programstageinstance set geometry = null, longitude = null, latitude = null;


-- 03-08-2022  move tei/enrollment/event/trackedentityprogramowner from one orgUnit to other orgUnit

="update trackedentityinstance set organisationunitid  = "&D2&" where uid = '"&A2&"' and trackedentityinstanceid = "&C2&" and organisationunitid = "&B2&";"
="update programinstance set organisationunitid  = "&F2&" where uid = '"&A2&"' and programinstanceid = "&B2&" and trackedentityinstanceid = "&C2&" and programid = "&D2&" and organisationunitid = "&E2&";"



="update programinstance set organisationunitid  = "&F2&" where uid = '"&C2&"' and programinstanceid = "&D2&" and trackedentityinstanceid = "&B2&";"
="update trackedentityprogramowner set organisationunitid  = "&F2&" where trackedentityinstanceid = "&B2&" and programid = "&G2&";"

="update trackedentityprogramowner set organisationunitid  = "&D2&" where trackedentityinstanceid = "&A2&" and programid = "&B2&" and organisationunitid = "&C2&";"
="update programstageinstance set organisationunitid  = "&E2&" where uid = '"&A2&"' and programstageinstanceid = "&B2&" and programinstanceid = "&C2&" and organisationunitid = "&D2&";"

-- 18/10/2022

delete enrollment and event based on trackedentityattributevalue

SELECT psi.uid eventID,pi.programinstanceid,teav.value,
teav.trackedentityattributeid FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where teav.value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and teav.trackedentityattributeid = 2602;


SELECT pi.programinstanceid,teav.value, teav.trackedentityattributeid FROM programinstance pi
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where teav.value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and teav.trackedentityattributeid = 2602;

select * FROM programstageinstance where  programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602) );

select * from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602);




delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where  programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602) ));

delete from programstageinstancecomments where programstageinstanceid in (
select programstageinstanceid from programstageinstance where  programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602) ));

delete FROM programstageinstance where  programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602) );

delete from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602);


select pi.programindicatorid, pi.uid,pi.name,pi.analyticstype,pb.boundarytarget,
pb.analyticsperiodboundarytype from programindicator pi
INNER JOIN periodboundary pb ON pb.programindicatorid = pi.programindicatorid 
where pi.analyticstype = 'ENROLLMENT' and pb.boundarytarget = 'EVENT_DATE'
order by pi.programindicatorid;
				 
				 
select pi.programindicatorid, pi.uid,pi.name,pi.analyticstype,pb.boundarytarget,
pb.analyticsperiodboundarytype from programindicator pi
INNER JOIN periodboundary pb ON pb.programindicatorid = pi.programindicatorid 
where pb.boundarytarget = 'ENROLLMENT_DATE'
order by pi.programindicatorid;

update periodboundary set created = now()::timestamp where created ='2021-11-13';
update periodboundary set lastupdated = now()::timestamp where lastupdated ='2021-11-13';


update periodboundary set created = now()::timestamp where created ='2021-11-11';
update periodboundary set lastupdated = now()::timestamp where lastupdated ='2021-11-11';

-- for data-move attribute to event-dataelement

select * from trackedentityattributevalue where trackedentityattributeid in (
select trackedentityattributeid from trackedentityattribute where uid in 
( 'okYFdrn1fGD','Usl9OzVV46v','TN7r3ws7IG9','kHXVrFZmmU5','zGggSXr9jUF',
 'ZY1aSERJY7U','drKkLxaGFwv','gVGIL7DJp4b'));
 
select tei.trackedentityinstanceid AS teiID,tei.uid AS teiUID,
tea.trackedentityattributeid AS teaID,tea.uid AS teaUID,
teav.value from trackedentityattributevalue teav 
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
where tea.uid in ( 'okYFdrn1fGD','Usl9OzVV46v','TN7r3ws7IG9','kHXVrFZmmU5','zGggSXr9jUF',
 'ZY1aSERJY7U','drKkLxaGFwv','gVGIL7DJp4b' );
 
SELECT psi.uid as eventUID, psi.programstageinstanceid, tei.uid as teiUID,
tei.trackedentityinstanceid from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate::date between '2022-06-01' and '2022-11-30'
and psi.programstageid = 4728570; 
 
 
 नमस्ते , तपाई सफलतापूर्वक यस V{org_unit_name} को  सेवामा भर्ना हुनु भएको छ। V{enrollment_date}. तपाइको ID A{drKkLxaGFwv}.
 
 
 -- for soft delete tei enrollment,event
 
 select * from programinstance where deleted is true;

update programinstance set deleted = 'false' where deleted is true;

select * from trackedentityinstance where deleted is true and uid = 'BFqDGXToffI';

update trackedentityinstance set deleted = 'false' where deleted is true and uid = 'BFqDGXToffI';

select * from programinstance where deleted is true and trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true and uid = 'BFqDGXToffI');

update programinstance set deleted = 'false' where deleted is true and trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true and uid = 'BFqDGXToffI');


select * from programstageinstance where deleted is true and programinstanceid in (
select programinstanceid from programinstance where deleted is true and trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true and uid = 'BFqDGXToffI'));


update programstageinstance set deleted = 'false' 

update programstageinstance set deleted = 'false' where deleted is true and programinstanceid in (
select programinstanceid from programinstance where deleted is true and trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true and uid = 'BFqDGXToffI'));

select * from trackedentityattributevalue where value = ''



-- HIV-tracker SMS program sms send details query 
SELECT prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.processeddate, prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,ur.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN users ur ON ur.userid = prgmsg.lastupdatedby;


select programmessagephonenumberid, phonenumber from 
programmessage_phonenumbers;

-- 13/04/2023
-- convert gemotery to Longitude, Latitude

SELECT organisationunitid,uid,name,geometry,
ST_X(ST_Transform (geometry, 4326)) AS "Longitude",
ST_Y(ST_Transform (geometry, 4326)) AS "Latitude"
FROM organisationunit where uid = 'WLBxL2ClHIC';

SELECT organisationunitid,uid,name,geometry,
ST_X(ST_Transform (geometry, 4326)) AS "Longitude",
ST_Y(ST_Transform (geometry, 4326)) AS "Latitude"
FROM organisationunit where organisationunitid in (
select organisationunitid from orgunitgroupmembers where orgunitgroupid in (
select orgunitgroupid from orgunitgroup where uid ='pW6owR4oRKb'));

SELECT organisationunitid,uid,name,geometry,
ST_X(ST_SetSRID (geometry, 4326)) AS "Longitude",
ST_Y(ST_SetSRID (geometry, 4326)) AS "Latitude"
FROM organisationunit where organisationunitid in (
select organisationunitid from orgunitgroupmembers where orgunitgroupid in (
select orgunitgroupid from orgunitgroup where uid ='pW6owR4oRKb'));

select * from trackedentityattributevalue where 
trackedentityattributeid in (select trackedentityattributeid
from trackedentityattribute where uid = 'uiOMHu4LtAP');

select * from trackedentityattributevalue where 
trackedentityattributeid in (select trackedentityattributeid
from trackedentityattribute where uid = 'UHoTGT1dtjj');

-- 18/04/2023


select count(*) from programstageinstance where 
programstageid in ( 2537, 2485, 9682, 2697, 2577 ) 
and geometry is null;


select count(*) from programstageinstance where 
programstageid in ( 2537, 2485, 9682, 2697, 2577 ) 
and geometry is  not null;


select * from programstageinstance where 
programstageid in ( 2537, 2485, 9682, 2697, 2577 ) 
and geometry is  not null;

SELECT uid eventUID,geometry,
ST_X(ST_Transform (geometry, 4326)) AS "Longitude",
ST_Y(ST_Transform (geometry, 4326)) AS "Latitude"
FROM programstageinstance where programstageid in 
( 2537, 2485, 9682, 2697, 2577 ) and geometry is not null;

SELECT uid eventUID,geometry,
ST_X(ST_SetSRID  (geometry, 4326)) AS "Longitude",
ST_Y(ST_SetSRID  (geometry, 4326)) AS "Latitude"
FROM programstageinstance where programstageid in 
( 2537, 2485, 9682, 2697, 2577, 2439, 4729067) 
and geometry is not null;

SELECT uid eventUID,programstageinstanceid,programstageid,geometry,
ST_X(ST_SetSRID  (geometry, 4326)) AS "Longitude",
ST_Y(ST_SetSRID  (geometry, 4326)) AS "Latitude"
FROM programstageinstance where geometry is  not null;