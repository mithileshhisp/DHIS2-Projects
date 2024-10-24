
-- 29/01/2024


-- delete TEI query 
begin;
delete from trackedentityattributevalue where 
trackedentityinstanceid in ( 5184372,5184371 );

delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where 
trackedentityinstanceid in ( 5184372,5184371 )));

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where 
trackedentityinstanceid in ( 5184372,5184371 ));

delete from programinstance where 
trackedentityinstanceid in ( 5184372,5184371 );

delete from trackedentityprogramowner where 
trackedentityinstanceid in ( 5184372,5184371 );

delete from trackedentityinstance where 
trackedentityinstanceid in ( 5184372,5184371 );
end;


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

-- 31/05/2023

select pi.programindicatorid, pi.uid programindicatorUID,pi.name 
programindicatorName,pb.periodboundaryid, pb.uid, pb.created, 
pb.lastupdated, pb.boundarytarget, pb.analyticsperiodboundarytype from periodboundary pb
INNER JOIN programindicator pi ON pi.programindicatorid = pb.programindicatorid
order by pi.programindicatorid;

select prg.name prgName,prg.uid prgUID,pi.programindicatorid, 
pi.uid programindicatorUID,pi.name programindicatorName,
pi.expression,pi.filter,pi.aggregationtype,pi.analyticstype,
pb.periodboundaryid, pb.uid, pb.boundarytarget, 
pb.analyticsperiodboundarytype from periodboundary pb
INNER JOIN programindicator pi ON pi.programindicatorid = pb.programindicatorid
INNER JOIN program prg ON prg.programid = pi.programid
order by pi.programindicatorid;


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
 
 -- https://tracker.hivaids.gov.np/save-child-2.27/api/trackedEntityInstances/query.json?ouMode=ALL&attribute=uiOMHu4LtAP&attribute=UHoTGT1dtjj&program=L78QzNqadTV&skipPaging=true&includeAllAttributes=false


-- http://localhost:8091/hiv/api/trackedEntityInstances/query.json?ou=cCTQiGkKcTk&attribute=uiOMHu4LtAP&attribute=UHoTGT1dtjj&program=L78QzNqadTV&skipPaging=true&includeAllAttributes=false

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

-- ALL_TEI_DATA_URL
-- https://tracker.hivaids.gov.np/save-child-2.27/api/29/sqlViews/NHCQz7jhFzk/data.json?paging=false
-- for recognised finger-print query for all tei fingerprint-string and fingerprint-id for ALL_TEI_DATA_URL 

SELECT teav1.value fingerPrintString, teav2.value fingerPrintId 
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 28357  ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
WHERE teav1.trackedentityattributeid = 28358 order by teav1.trackedentityinstanceid desc;

-- latest tei count for biometric SQL-view 
-- https://tracker.hivaids.gov.np/save-child-2.27/api/sqlViews/qwqgxFygofx/data?paging=false

-- tei count based on SEX and risk-group
SELECT teav2.value sex , count( teav2.value)
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 2613 and value ilike 'Male' ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
WHERE teav1.trackedentityattributeid = 2619 and teav1.value ilike
'PWID'  and teav1.created::date
between '2022-01-01' and '2022-12-31' group by teav2.value;


SELECT teav2.value sex , count( teav2.value)
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue
WHERE trackedentityattributeid = 2613 and value ilike 'Male' ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
WHERE teav1.trackedentityattributeid = 2619 and teav1.value ilike
'PWID'  and teav1.created::date
between '2022-01-01' and '2022-12-31' and org.uid = 'tsNnfqj2ODf'
group by teav2.value;


SELECT teav2.value sex , count( teav2.value)
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue
WHERE trackedentityattributeid = 2613 and value ilike 'Male' ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
WHERE teav1.trackedentityattributeid = 2619 and teav1.value ilike
'PWID'  and teav1.created::date
between '2022-01-01' and '2022-12-31' and org.path like '%cCTQiGkKcTk%'
group by teav2.value;


SELECT teav2.value sex , teav1.created::date, count( teav2.value)
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 2613 and value ilike 'Male' ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
WHERE teav1.trackedentityattributeid = 2619 and teav1.value ilike
'PWID'  and teav1.created::date
between '2022-01-01' and '2022-12-31' and org.path like '%cCTQiGkKcTk%'
group by teav2.value,teav1.created::date;

-- ALL_TEI_DATA_URL
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

-- for viral load 
-- -- hiv-tracker eventdatavalues with dataelement value

-- hiv-tracker eventdatavalues with dataelement value and TEI and trackedentityattributevalue
SELECT tei.uid  as tei_uid,  psi.uid as event, psi.executiondate::date, 
eventdatavalues -> 'fVVUM6blNja' ->> 'value' as sample_collection_date,  
teav.value AS client_code FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE  prg.uid = 'L78QzNqadTV' and ps.uid = 'YRSdePjzzfs' and psi.deleted is false and 
eventdatavalues -> 'fVVUM6blNja' is not null and 
eventdatavalues -> 'fVVUM6blNja' ->> 'value' between '2022-01-01'
AND '2022-12-31' and teav.trackedentityattributeid = 2602 order by psi.created desc;


SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'aXquUzlrYYv' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null and 
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

-- HIV-tracker SMS program sms send details query 
SELECT prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.processeddate, prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,ur.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN users ur ON ur.userid = prgmsg.lastupdatedby;


SELECT prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.processeddate, prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,ur.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN userinfo ur ON ur.userinfoid= prgmsg.lastupdatedby;


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


-- 20/04/2023

select trackedentityinstanceid, pi.uid enrollment,pi.enrollmentdate::date,org.organisationunitid,
org.uid,org.name from programinstance pi 
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
where trackedentityinstanceid in ( 351056,182247,619422,527319 );

select * from trackedentityattributevalue where trackedentityattributeid in (
select trackedentityattributeid from trackedentityattribute where uid in 
( 'drKkLxaGFwv')) and trackedentityinstanceid in (351056,182247,619422);


select * from trackedentityinstance 
where organisationunitid = 5063210;

select * from programinstance 
where organisationunitid = 5063210
and programid = 2437;

select * from programstageinstance 
where organisationunitid = 5063210;

select * from trackedentityprogramowner
where organisationunitid = 5063210;


update trackedentityinstance set organisationunitid  = 5063225 where organisationunitid = 5063210;

update programinstance set organisationunitid  = 5063225 where organisationunitid = 5063210;

update programstageinstance set organisationunitid  = 5063225 where organisationunitid = 5063210;

update trackedentityprogramowner set organisationunitid  = 5063225 where organisationunitid = 5063210;


-- wrong hua hai ka solution
select * from programstage 
where uid in('WXPWqQYa9iW', 'goEnnJeZzyf'); from  == uyKpmKIrXqA to -- fGbVmsr4ESE

select * from organisationunit 
where organisationunitid in( 5063210,5063225);


select * from programstage 
where uid in('WXPWqQYa9iW', 'goEnnJeZzyf');

select * from programstageinstance where organisationunitid = 5063225
and programstageid in (4729067, 4729128);


SELECT psi.uid as eventUID, psi.programstageinstanceid, pi.programinstanceid, tei.uid as teiUID,
tei.trackedentityinstanceid from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.programstageid in (4729067, 4729128) and psi.organisationunitid in( 5063225);

="update trackedentityprogramowner set organisationunitid  = "&B2&" where trackedentityprogramownerid = "&A2&";"

="update programinstance set organisationunitid = "&B2&" where programinstanceid = "&A2&";"

="update trackedentityinstance set organisationunitid = "&B2&" where trackedentityinstanceid = "&A2&";"

="update programstageinstance set organisationunitid = "&G2&" where programstageinstanceid = "&B2&";"


select * from dataelement where uid in (
'iZh9grkk98m','wuAHX0gKS8l','cy6AxDBfWgm');

select * from datavalue where dataelementid in (
select dataelementid from dataelement where uid in (
'iZh9grkk98m','wuAHX0gKS8l','cy6AxDBfWgm'));

select * from datavalue where dataelementid in (
select dataelementid from dataelement where uid in (
'iZh9grkk98m','wuAHX0gKS8l','cy6AxDBfWgm','Nqz2LEa84pr'
,'whNGhkNYojJ','cv1wldOLAbg'));

delete from datavalue where dataelementid in (
select dataelementid from dataelement where uid in (
'iZh9grkk98m','wuAHX0gKS8l','cy6AxDBfWgm','Nqz2LEa84pr'
,'whNGhkNYojJ','cv1wldOLAbg'));

select 	visualizationid, uid, name, type, code from visualization
where name like '%Clients currently on ART Treatment%'
order by name;
 
 select * from datavalue where lastupdated::date = '2023-05-18';
select * from datavalue where created::date = '2023-05-18';


SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)
,split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod,pet.name AS periodType, pe.periodtypeid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and de.uid in ( 'iZh9grkk98m','wuAHX0gKS8l','cy6AxDBfWgm','Nqz2LEa84pr'
,'whNGhkNYojJ','cv1wldOLAbg','Ouk8sB3PCU6','htXIyKnPaQz',
'y47OoshMQng','HgSvEDaTyzq','n9pWTkiYULy','TOUZfqReUPu',
'Hn9cWLDKmr6','frUFQSXODIK','plrzgSRj7OA','M1tsYF0eHE5','vkZcRDkxasp',
'Dkkl36QPTWx','kc75U36i2Vj','gmopPGmd2rN',
'PnCOWMowhui',
'HhlIxx20SPl',
'MlY2pYIgm3D',
'P11699CuVkh',
'H4GU541AAef',
'BeeFuXaAjie',
'ZVmxGzlkFvN',
'FU49Pc9Tyaq',
'aLgLsdeu07e',
'bfh2WjGhQ08',
'xFYJU5CJmI6',
'jMlg8QSuAMh',
'RNDk8gWSraw',
'snwz8udE7as',
'gxWEr97IomA',
'bB7KjCqTYfY',
'qzbL7xYqKfo',
'N5S19sjLWZd',
'vEPjn9Eb7Gv',
'yO3ZplCAT3L',
'hX2T1IU7tiG',
'XJHbhXT9Zdi',
'pfnQc3jlat5',
'kiu4dvo7YbU',
'ph9YGz5tufO',
'FSWVz62latm',
'ODluoy202LX',
'TZ06VP24ycE',
'qDJ8JcLQFdc',
'dluJhxXrT8E',
'xWmGgza2rQj',
'xeh8vFeFpT0',
'gpiRO9euTAv',
'pUf592WXCNt',
'SFzpwTBWsq4',
'YJDoHAzzqAU',
'rtjtdfc0hcg',
'jb5ljM3gYYV',
'IUoS2RxSsBL',
'psxGf5KM96K',
'leD9CzK4lQw',
'u3ZSEq6ckU5',
'vn2pFlzAyEw',
'lyBBs3y92TB',
'Zzh65mXK9Xh',
'p2z7Ih7pp5n',
'RmMcljIsZBM',
'haeTTf4OmFk',
'zGfpU6KZKny',
'DfHaVJtzhCJ',
'tanSlcNaySO',
'zCvS6P0xh8w',
'Orb9owbvv1C',
'yMN9G0ZE7yw',
'OyIQwKOu630',
'udryvKHIOPK',
'QjCk0MD16Wm',
'dIggGgQtame',
'NwBqkr2vi6T',
'nukGVZA4awi',
'nKOct1wUuzr',
'WaudCFZzOTB',
'tNlYpDigS1N',
'JKxSg7tSHCy',
'dacshaWvdjs',
'mPyMOReCV1y',
'qMWFobcoUoD')


--https://links.hispindia.org/hivtracker/api/32/analytics/dataValueSet.json?di--mension=dx%3AVtMffWN7ZIM&dimension=ou%3AUSER_ORGUNIT_CHILDREN&dimension=pe%3ATHIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- http://127.0.0.1:8091/hiv/api/32/analytics/dataValueSet.json?dimension=dx:LJeA97Qxve6&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false



--- https://links.hispindia.org/hivtracker/api/32/analytics/dataValueSet.json?dimension=dx:LJeA97Qxve6&dimension=ou%3AUSER_ORGUNIT_CHILDREN&dimension=pe%3ATHIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- https://links.hispindia.org/hivtracker/api/32/analytics/dataValueSet.json?dimension=dx%3AVtMffWN7ZIM&dimension=ou%3AUSER_ORGUNIT_CHILDREN&dimension=pe%3ATHIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- https://docs.dhis2.org/archive/en/2.32/developer/html/webapi_predictors.html

-- http://202.63.242.59:13014/save-child-2.27/dhis-web-commons/security/login.action#/

-- Clients currently on ART Treatment (by sex)
-- /api/analytics/dataValueSet.json?dimension=dx:dyVaodqebsx;FT9oYMkFHQp;GmgNmZqqmQh&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- Clients currently on ART treatment  (Female) ---- dyVaodqebsx 
-- Clients currently on ART treatment (Male) -- FT9oYMkFHQp
-- Clients currently on ART treatment (Other sex) -- GmgNmZqqmQh

// 20230512152609


{
"httpStatus": "Conflict",
"httpStatusCode": 409,
"status": "ERROR",
"message": "Query failed because a referenced table does not exist. Please ensure analytics job was run (SqlState: 42P01)",
"devMessage": "SqlState: 42P01",
"errorCode": "E7144"
}

{
	"dataValues": [
	{
	"dataElement": "PFRK0hsXRDS",
	"period": "2024",
	"orgUnit": "cCTQiGkKcTk",
	"value": "109.0",
	"storedBy": "[aggregated]",
	"created": "2024-04-02",
	"lastUpdated": "2024-04-02",
	"comment": "[aggregated]",
	"followup": false
	}
  ]
}

{
	"dataValues": [
	{
	"dataElement": "dyVaodqebsx",
	"period": "202403",
	"orgUnit": "cCTQiGkKcTk",
	"value": "11806",
	"storedBy": "[aggregated]",
	"created": "2024-04-01",
	"lastUpdated": "2024-04-01",
	"comment": "[aggregated]"
	},
	{
	"dataElement": "FT9oYMkFHQp",
	"period": "202403",
	"orgUnit": "cCTQiGkKcTk",
	"value": "13361",
	"storedBy": "[aggregated]",
	"created": "2024-04-01",
	"lastUpdated": "2024-04-01",
	"comment": "[aggregated]"
	},
	{
	"dataElement": "GmgNmZqqmQh",
	"period": "202403",
	"orgUnit": "cCTQiGkKcTk",
	"value": "439.0",
	"storedBy": "[aggregated]",
	"created": "2024-04-01",
	"lastUpdated": "2024-04-01",
	"comment": "[aggregated]"
	}
  ]
}


// https://links.hispindia.org/hivtracker/api/32/analytics/dataValueSet.json?dimension=dx%3AdyVaodqebsx%3BFT9oYMkFHQp%3BGmgNmZqqmQh&dimension=ou%3AUSER_ORGUNIT&dimension=pe%3ATHIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

{
  "dataValues": [
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "cCTQiGkKcTk",
      "value": "11231",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "cCTQiGkKcTk",
      "value": "12658",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "cCTQiGkKcTk",
      "value": "410.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    }
  ]
}











-- /api/analytics/dataValueSet.json?dimension=dx:dyVaodqebsx;FT9oYMkFHQp;GmgNmZqqmQh&dimension=ou:USER_ORGUNIT_CHILDREN&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

// 20230512155336
// https://links.hispindia.org/hivtracker/api/32/analytics/dataValueSet.json?dimension=dx%3AdyVaodqebsx%3BFT9oYMkFHQp%3BGmgNmZqqmQh&dimension=ou%3AUSER_ORGUNIT_CHILDREN&dimension=pe%3ATHIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

{
  "dataValues": [
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "RVc3XoVoNRf",
      "value": "958",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "a6W190BanBu",
      "value": "1523",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "hi16ZuHEWaY",
      "value": "2711",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "GvgqqErqwFP",
      "value": "1375",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "Zx3boDXh1Q5",
      "value": "2293",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "fvN7GZvNAOB",
      "value": "344",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "wtU6v09Kbe0",
      "value": "2023",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "dyVaodqebsx",
      "period": "202305",
      "orgUnit": "J7GNAdygPV4",
      "value": "4",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "RVc3XoVoNRf",
      "value": "1266",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "a6W190BanBu",
      "value": "2268",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "hi16ZuHEWaY",
      "value": "3452",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "GvgqqErqwFP",
      "value": "1416",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "Zx3boDXh1Q5",
      "value": "2377",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "fvN7GZvNAOB",
      "value": "299",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "wtU6v09Kbe0",
      "value": "1567",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "FT9oYMkFHQp",
      "period": "202305",
      "orgUnit": "J7GNAdygPV4",
      "value": "13",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "RVc3XoVoNRf",
      "value": "41.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "a6W190BanBu",
      "value": "203.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "hi16ZuHEWaY",
      "value": "56.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "GvgqqErqwFP",
      "value": "8.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "Zx3boDXh1Q5",
      "value": "62.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "fvN7GZvNAOB",
      "value": "2.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "wtU6v09Kbe0",
      "value": "37.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "GmgNmZqqmQh",
      "period": "202305",
      "orgUnit": "J7GNAdygPV4",
      "value": "1.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-12",
      "lastUpdated": "2023-05-12",
      "comment": "[aggregated]"
    }
  ]
}


-- Clients currently on ART Treatment (by age)
-- /api/analytics/dataValueSet.json?dimension=dx:rcKdW3PTGEb;FmZpfzqE8rL&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- Clients currently on ART treatment 0-14 Yrs Total -- rcKdW3PTGEb
-- Clients currently on ART treatment 15+ yrs Total  -- FmZpfzqE8rL

-- /api/analytics/dataValueSet.json?dimension=dx:rcKdW3PTGEb;FmZpfzqE8rL&dimension=ou:USER_ORGUNIT_CHILDREN&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false




-- Clients currently on ART Treatment (by risk group)
-- /api/analytics/dataValueSet.json?dimension=dx:xt1SLd4ZRQ5;W9ZQbalepaj;TUmKWp2LRrk;JvLU38fLEqW;dvVvavpocYv;MMEYNfSWifO;qMvQsZMejyJ;FLn1VLKIgd8;LnEYG01WE7F;bEK1432OO9G;L2OlQdRnBLM&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false


-- Clients currently on ART (Sex workers) -- xt1SLd4ZRQ5
-- Clients currently on ART (MSM) -- W9ZQbalepaj
-- Clients currently on ART (Risk group TG) -- TUmKWp2LRrk
-- Clients currently on ART (Client sex worker) -- JvLU38fLEqW
-- Clients currently on ART (Migrants) -- dvVvavpocYv
-- Clients currently on ART (Spouse migrants) -- MMEYNfSWifO
-- Clients currently on ART (People who inject drug) -- qMvQsZMejyJ
-- Clients currently on ART (Blood organ Recipient) -- FLn1VLKIgd8
-- Clients currently on ART (Prison inmates) -- LnEYG01WE7F
-- Clients currently on ART (Vertical transmission) -- bEK1432OO9G
-- Clients currently on ART (Other risk group) -- L2OlQdRnBLM



-- /api/analytics/dataValueSet.json?dimension=dx:xt1SLd4ZRQ5;W9ZQbalepaj;TUmKWp2LRrk;JvLU38fLEqW;dvVvavpocYv;MMEYNfSWifO;qMvQsZMejyJ;FLn1VLKIgd8;LnEYG01WE7F;bEK1432OO9G;L2OlQdRnBLM&dimension=ou:USER_ORGUNIT_CHILDREN&dimension=pe%3ATHIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false



-- /api/analytics/dataValueSet.json?dimension=dx:zjmnw7ofdzG&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:zjmnw7ofdzG&dimension=ou:USER_ORGUNIT_CHILDREN&dimension=pe:THIS_MONTH&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false


-- Viral load test performed among PLHIV on ART at the end of reporting period

-- PI - zjmnw7ofdzG -- Viral load test performed among PLHIV on ART during the reporting period



-- Viral load test performed among PLHIV on ART at the end of reporting period (by sex)

-- -- /api/analytics/dataValueSet.json?dimension=dx:mdLbmu8dUpY;xjrwG3agtFO;p0wTMpztiqg&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:mdLbmu8dUpY;xjrwG3agtFO;p0wTMpztiqg&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- mdLbmu8dUpY -- Viral load test performed among PLHIV on ART at the end of reporting period (Male)
-- xjrwG3agtFO -- Viral load test performed among PLHIV on ART at the end of reporting period (Female)
-- p0wTMpztiqg -- Viral load test performed among PLHIV on ART at the end of reporting period (Other)


-- Viral load test performed among PLHIV on ART at the end of reporting period (by age)

-- /api/analytics/dataValueSet.json?dimension=dx:sPcUxHnZD5S;nY6dwGOr0Sy&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:sPcUxHnZD5S;nY6dwGOr0Sy&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false



-- sPcUxHnZD5S -- Viral load test performed among PLHIV on ART at the end of reporting period (0-14 years)
-- nY6dwGOr0Sy -- Viral load test performed among PLHIV on ART at the end of reporting period (> 15 years)

-- PLHIV on ART with Suppressed Viral Load during the reporting period SVL (by province)
-- PLHIV on ART with Suppressed Viral Load during the reporting period SVL

-- /api/analytics/dataValueSet.json?dimension=dx:wrGwqu0ybBh&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_YEAR&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:wrGwqu0ybBh&dimension=ou:USER_ORGUNIT_CHILDREN&dimension=pe:THIS_YEAR&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false


-- pi -- wrGwqu0ybBh -- PLHIV on ART with Suppressed Viral Load during the reporting period SVL

-- PLHIV on ART screened for TB

-- /api/analytics/dataValueSet.json?dimension=dx:A0eBDBqFBHR&dimension=pe:THIS_YEAR&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:A0eBDBqFBHR&dimension=pe:THIS_YEAR&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- A0eBDBqFBHR -- PLHIV on ART screened for TB

-- People living with HIV who started TB preventive therapy among total ART during the reporting Period

-- People living with HIV who started TB preventive therapy among total ART during the reporting Period (by province)
-- People living with HIV who started TB preventive therapy among total ART during the reporting Period

-- /api/analytics/dataValueSet.json?dimension=dx:PFRK0hsXRDS&dimension=pe:THIS_YEAR&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:PFRK0hsXRDS&dimension=pe:THIS_YEAR&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- PFRK0hsXRDS -- People living with HIV who started TB preventive therapy among total on ART during the reporting Period

-- HIV O-12 Percentage of people living with HIV and on ART who are virologically suppressed during the reporting period
-- /api/analytics/dataValueSet.json?dimension=dx:Q6yYYsXS4jB&dimension=ou:cCTQiGkKcTk;OU_GROUP-pW6owR4oRKb&dimension=pe:2022&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&completedOnly=false

-- Q6yYYsXS4jB -- HIV O-12 Percentage of people living with HIV and on ART who are virologically suppressed during the reporting period


{
  "dataValues": [
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "mIZ7UfitSfF",
      "value": "26.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "mrjraHkF3r7",
      "value": "68.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "Bm39oMfSNir",
      "value": "31.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "vNpX4nuwSQ4",
      "value": "73.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "J6GqvSHE3ql",
      "value": "77.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "RkDkH6DBxHZ",
      "value": "80.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "mL4Cbzwq1T7",
      "value": "45.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "gyF1IWxbNdU",
      "value": "69.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "YZEW9zco5wp",
      "value": "0.93",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "SlJVRDSnSs7",
      "value": "61.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "Jyk5lg7lSJE",
      "value": "49.2",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "YoKkWEKk8Vs",
      "value": "61.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "StYGSnQkGYd",
      "value": "66.2",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "PPy8McaEWmP",
      "value": "71.1",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "Hip7Iiwe0Zw",
      "value": "85.4",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "wW6BjmcZPTE",
      "value": "59.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "DEV82n2a57B",
      "value": "41.4",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "cLAmxlnT75s",
      "value": "54.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "PaPESMnNmGS",
      "value": "47.5",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "mPO6LgjseUd",
      "value": "3.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "UcFtqIBF6dF",
      "value": "47.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "Eps9XCDyPWJ",
      "value": "73.5",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "sp7Kp98AgiY",
      "value": "59.1",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "xQ9yCoUNMvb",
      "value": "64.5",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "ZBkM8lmhvSR",
      "value": "74.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "RiNRNy2QrbG",
      "value": "57.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "EySK9sIwopW",
      "value": "76.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "vcjdAdENK6U",
      "value": "65.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "mkjer41pShd",
      "value": "4.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "bZ0QNxepVDm",
      "value": "16.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "PJdV5nECQnS",
      "value": "15.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "igUB7D4ujIp",
      "value": "42.4",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "pLGBXoHij8l",
      "value": "85.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "M0h4xQCnr5Q",
      "value": "5.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "TXvMmNVpTbV",
      "value": "22.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "iAqA94CYN5T",
      "value": "54.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "X1XpOXDu4i1",
      "value": "56.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "sTpP9XtNNIq",
      "value": "80.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "fZcTJkUmgnD",
      "value": "45.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "vZ2BOsyGD6k",
      "value": "78.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "FfqjUkvHaq2",
      "value": "75.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "NMZDc62VkUu",
      "value": "79.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "u11K0KqXoo4",
      "value": "55.2",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "qf1SFbsoO5U",
      "value": "75.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "OZGBcyvt0Eq",
      "value": "67.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "uhP4XuZMhmP",
      "value": "81.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "V4Mdjx4dLU6",
      "value": "73.1",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "GR1K45ToRLP",
      "value": "73.4",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "popAWkAUmV7",
      "value": "52.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "ICouwFuLi6e",
      "value": "70.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "HII00nHXHSr",
      "value": "61.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "DYcRiFnkTeh",
      "value": "89.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "gYWUCbDn7W9",
      "value": "65.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "NbSwp2REKl2",
      "value": "47.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "eEJjlb96A9S",
      "value": "73.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "z4jth5bBeTQ",
      "value": "75.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "t0fTpHGj4pA",
      "value": "55.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "kenJxBny3sm",
      "value": "55.5",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "E7KRzq0nI80",
      "value": "80.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "FSMALlcEMN1",
      "value": "67.1",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "e8msu3rYPr7",
      "value": "65.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "TG9xwiyOzFy",
      "value": "69.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "kDfTb2xmcJq",
      "value": "68.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "pKR0mkabc8U",
      "value": "81.8",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "kgYQV9tV9Ep",
      "value": "82.2",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "k2gEfAppdDa",
      "value": "0.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "gmBf8LmHER8",
      "value": "38.1",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "Bqbp4RSh59F",
      "value": "61.4",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "hOBq8ofsGIA",
      "value": "38.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "enCNn7DBvEe",
      "value": "87.4",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "bJprtQeaalg",
      "value": "67.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "ZWwcPbXbh7A",
      "value": "78.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "WLBxL2ClHIC",
      "value": "41.9",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "CZSqk9wH36L",
      "value": "70.1",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "nPv9ZSw7DU3",
      "value": "52.0",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "EoD53fBetjK",
      "value": "71.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "aXquUzlrYYv",
      "value": "84.7",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "Put4ZMYsdZf",
      "value": "80.6",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "BiBfVGxLkLE",
      "value": "54.3",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "WaY0NFhl8Y3",
      "value": "64.2",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    },
    {
      "dataElement": "Q6yYYsXS4jB",
      "period": "2022",
      "orgUnit": "yIw4RH3Pdwi",
      "value": "32.2",
      "storedBy": "[aggregated]",
      "created": "2023-05-17",
      "lastUpdated": "2023-05-17",
      "comment": "[aggregated]"
    }
  ]
}

-- PLHIV on ART with Suppressed Viral Load during the reporting period SVL (by Sex)

-- /api/analytics/dataValueSet.json?dimension=dx:tHEAHM2JGDr;DjQzl4fes17;nkbQbqUuons&dimension=ou:USER_ORGUNIT&dimension=pe:THIS_YEAR&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:tHEAHM2JGDr;DjQzl4fes17;nkbQbqUuons&dimension=ou:USER_ORGUNIT_CHILDREN&dimension=pe:THIS_YEAR&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- tHEAHM2JGDr -- PLHIV on ART with Suppressed Viral Load during the reporting period SVL (Female)
-- DjQzl4fes17 -- PLHIV on ART with Suppressed Viral Load during the reporting period SVL (Male)
-- nkbQbqUuons -- PLHIV on ART with Suppressed Viral Load during the reporting period SVL (Other sex)


-- ART treatment initiated during reporting period
-- /api/analytics/dataValueSet.json?dimension=dx:ikyD4ElBnY6&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- /api/analytics/dataValueSet.json?dimension=dx:ikyD4ElBnY6&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- ikyD4ElBnY6 -- ART treatment initiated during reporting period


-- ART treatment initiated during reporting period (by risk group)

-- /api/analytics/dataValueSet.json?dimension=dx:SeqGBOy7Wh6;KvigUWjoSvM;I6ZMnMP684A;Xi9xEomUGBZ;uPfF4Kat1oG;ULbXn4nJYYt;A0jVfNZUW5f;T2OpeejXpuL&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:SeqGBOy7Wh6;KvigUWjoSvM;I6ZMnMP684A;Xi9xEomUGBZ;uPfF4Kat1oG;ULbXn4nJYYt;A0jVfNZUW5f;T2OpeejXpuL&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false


-- SeqGBOy7Wh6 -- ART treatment initiated during reporting period (Blood organ Recipient)
-- KvigUWjoSvM -- ART treatment initiated during reporting period (Client sex worker)
-- I6ZMnMP684A -- ART treatment initiated during reporting period (Prison inmates)
-- Xi9xEomUGBZ -- ART treatment initiated during reporting period (Risk Group Other)
-- uPfF4Kat1oG -- ART treatment initiated during reporting period (Spouse migrants)
-- ULbXn4nJYYt -- ART treatment initiated during reporting period (Vertical transmission)
-- A0jVfNZUW5f -- ART treatment initiated during reporting period (tg)
-- T2OpeejXpuL -- ART treatment initiated (MSM/TG) during reporting period


-- ART treatment initiated during reporting period (by sex)
-- /api/analytics/dataValueSet.json?dimension=dx:GpiKTSMr9cT;ks2XmKnTumm;NgYO0OJ1oAG&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false
-- /api/analytics/dataValueSet.json?dimension=dx:GpiKTSMr9cT;ks2XmKnTumm;NgYO0OJ1oAG&dimension=pe:THIS_MONTH&dimension=ou:USER_ORGUNIT_CHILDREN&showHierarchy=false&hierarchyMeta=false&includeMetadataDetails=true&includeNumDen=true&skipRounding=false&aggregationType=LAST&completedOnly=false

-- GpiKTSMr9cT -- ART treatment initiated (female) during reporting period
-- ks2XmKnTumm -- ART treatment initiated (male) during reporting period
-- NgYO0OJ1oAG -- ART treatment initiated (other sex) during reporting period



-- query for lost_to_follow_up new event creation through schedular 15/05/2024

select * from programstage where uid = 'YRSdePjzzfs'

SELECT tei.uid  as tei_uid,  psi.uid as event, psi.executiondate::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status,
extract (epoch from (CURRENT_DATE - cast(psi.executiondate AS timestamp)))::integer/86400 
as dayDiffrence FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'L78QzNqadTV' and psi.deleted is false and psi.programstageid = 2537 and
eventdatavalues -> 'WpBa1L6xxPC' is not null  and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'lost_to_follow_up' 
AND cast(psi.executiondate AS DATE) < CURRENT_DATE - interval '90 day' 
order by psi.executiondate desc;


SELECT tei.uid  as tei_uid,  psi.uid as event, psi.executiondate::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status
FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'L78QzNqadTV' and psi.deleted is false and psi.programstageid = 2537 and
eventdatavalues -> 'WpBa1L6xxPC' is not null  and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'missing' 
order by psi.executiondate desc;

-- distinct tei list with ART Follow-up stage and art_status value entered
SELECT distinct(tei.uid ) as tei_uid
FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'L78QzNqadTV' and psi.deleted is false and psi.programstageid in (
select programstageid from programstage where uid = 'YRSdePjzzfs') 
AND psi.eventdatavalues -> 'WpBa1L6xxPC' is not null


-- tei latest event with ART Follow-up stage and art_status value entered
SELECT tei.uid as tei_uid,  psi.uid as event, psi.executiondate::date,  psi.status,
psi.eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status,org.uid as orgUnitUID,pi.uid as enrollment,
extract (epoch from (CURRENT_DATE - cast(psi.executiondate AS timestamp)))::integer/86400 as dayDiffrence 
FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'L78QzNqadTV' and psi.deleted is false and psi.programstageid in (
select programstageid from programstage where uid = 'YRSdePjzzfs') 
AND psi.eventdatavalues -> 'WpBa1L6xxPC' is not null
-- and eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'lost_to_follow_up' 
-- and cast(psi.executiondate AS DATE) < CURRENT_DATE - interval '90 day' 
and tei.uid = 'A05NyiJjsdI'
ORDER BY psi.executiondate desc LIMIT 1;

-- if dayDiffrence > 90 and art_status = 'lost_to_follow_up' then create new event with date event_date+ 90 days and value 'missing'

select * from programstageinstance 
order by created desc limit 100;


CUSTOM_SMS_TASK:d.Z.t("Scheduled Custom SMS"),PUSH_TO_AGGREGATE_DATAELEMENT:d.Z.t("Push To Aggregate DataElement"),CREATE_MISSING_EVENT:d.Z.t("Create Missing ART Follow-up stage Event")
"PUSH_TO_AGGREGATE_DATAELEMENT","CREATE_MISSING_EVENT",


select *  from jobconfiguration where name in ('Custom SMS Task', 'Scheduled Custom SMS');
select * from jobconfiguration where name = 'Push to Agg DataElement';
select * from jobconfiguration where name = 'Create Missing ART Follow-up stage Event';

-- v40 nepal_biometric server war file ( with server application )  local machine for testing finger-print dhis.config
{"host":"localhost","port":8091,"dhisUrl":"http://localhost:8091/hiv","sqlViewID":"qwqgxFygofx","fingerprintStringAttribute":"uiOMHu4LtAP","fidAttribute":"UHoTGT1dtjj","program_hiv":"L78QzNqadTV","biometric_user_name":"admin","biometric_user_password":"District@1"}


-- v40 nepal_biometric server war file ( with server application )  production machine finger-print dhis.config
{"host":"tracker.hivaids.gov.np","port":443,"dhisUrl":"https://tracker.hivaids.gov.np/save-child-2.27","sqlViewID":"qwqgxFygofx","fingerprintStringAttribute":"uiOMHu4LtAP","fidAttribute":"UHoTGT1dtjj","program_hiv":"L78QzNqadTV","biometric_user_name":"admin","biometric_user_password":"District@1"}


-- v40 nepal_biometric client-application for client local machine finger-print cdhis.config
{"dhisUrl":"https://tracker.hivaids.gov.np/save-child-2.27","fingerprintUrl":"http://localhost:8080/NepalFingerprintServer","host":"tracker.hivaids.gov.np","port":443,"attribute_fid":"UHoTGT1dtjj","attribute_fid_code":"fingerprint_id","attribute_template":"uiOMHu4LtAP","attribute_template_code":"fingerprint_str","attrubute_client_code":"drKkLxaGFwv","program_hiv":"L78QzNqadTV"}

-- v40 nepal_biometric client-application for client personal testing finger-print cdhis.config
{"dhisUrl":"http://localhost:8091/hiv","fingerprintUrl":"http://localhost:8091/NepalFingerprintServer","host":"localhost","port":8091,"attribute_fid":"UHoTGT1dtjj","attribute_fid_code":"fingerprint_id","attribute_template":"uiOMHu4LtAP","attribute_template_code":"fingerprint_str","attrubute_client_code":"drKkLxaGFwv","program_hiv":"L78QzNqadTV"}


-- run query on production 14/06/2024

select * from optionset where uid = 'n4l2MwOLWL4';

select * from optionvalue where optionsetid = 4726768 
order by name;

update optionvalue set sort_order = 1 where optionvalueid = 4726369;
update optionvalue set sort_order = 2 where optionvalueid = 4726704;

update optionvalue set sort_order = 1 where optionvalueid = 4725452;
update optionvalue set sort_order = 2 where optionvalueid = 4725488;

update optionvalue set sort_order = 1 where optionvalueid = 4725123;
update optionvalue set sort_order = 2 where optionvalueid = 4726188;

update optionvalue set sort_order = 1 where optionvalueid = 4726419;
update optionvalue set sort_order = 2 where optionvalueid = 4726415;
update optionvalue set sort_order = 3 where optionvalueid = 4726386;
update optionvalue set sort_order = 4 where optionvalueid = 4725474;

-- run query on production 18/06/2024
update optionvalue set sort_order = 1 where optionvalueid = 4725252;
update optionvalue set sort_order = 2 where optionvalueid = 4726365;

update optionvalue set sort_order = 1 where optionvalueid = 4725125;
update optionvalue set sort_order = 2 where optionvalueid = 4726422;

update optionvalue set sort_order = 1 where optionvalueid = 4725472;
update optionvalue set sort_order = 2 where optionvalueid = 4726372;

update optionvalue set sort_order = 1 where optionvalueid = 4726362;
update optionvalue set sort_order = 2 where optionvalueid = 4726366;
update optionvalue set sort_order = 3 where optionvalueid = 4726448;
update optionvalue set sort_order = 4 where optionvalueid = 4726692;


-- multiple registration with same client-code -- 16/06/2024

-- 20/06/2024

update optionvalue set sort_order = 1 where optionvalueid = 4724905;
update optionvalue set sort_order = 2 where optionvalueid = 4725310;


select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode, opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
order by ops.name, opv.sort_order;

select * from trackedentityattributevalue where trackedentityattributeid in (
select trackedentityattributeid from trackedentityattribute where uid in 
( 'drKkLxaGFwv')) and value = 'SA001000730671';

select * from programinstance where trackedentityinstanceid 
in (5221452,5221453);

-- delete duplicate TEI -- 18/06/2024

delete from trackedentityattributevalue where trackedentityinstanceid 
in (5221453);

delete from trackedentityinstance where trackedentityinstanceid 
in (5221453);

delete from programinstance where trackedentityinstanceid 
in (5221453);


-- 19/06/2024 SMS program 2.40 
-- HIV-tracker SMS program sms send details query 


SELECT prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.processeddate, prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,urinfo.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN userinfo urinfo ON urinfo.userinfoid= prgmsg.lastupdatedby
ORDER by prgmsg.created desc;


select programmessagephonenumberid, phonenumber from 
programmessage_phonenumbers;



-- programMSG in HIV tracker sending SMS 

select prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,ur.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN userinfo ur ON ur.userinfoid = prgmsg.lastupdatedby
where prgmsg.processeddate::date between  '2021-01-12' and '2024-07-14' order by prgmsg.processeddate desc ;


-- programMSG -- uXmR9vhlX6A
select prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,ur.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN userinfo ur ON ur.userinfoid = prgmsg.lastupdatedby;



-- hiv_tracker tei_list_5_yea less event_date from today date 22/10/2024

SELECT tei.uid as tei_uid,org.uid AS orgUnit_uid, 
psi.uid as event, psi.executiondate::date AS event_date
FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'L78QzNqadTV' and psi.deleted is false and psi.programstageid in (
select programstageid from programstage where uid = 'zRUw1avYEvI') 
AND psi.executiondate is not null and org.path like '%aXquUzlrYYv%'
AND cast(psi.executiondate AS DATE) >= cast('2024-10-24' AS DATE) - interval '5 year';