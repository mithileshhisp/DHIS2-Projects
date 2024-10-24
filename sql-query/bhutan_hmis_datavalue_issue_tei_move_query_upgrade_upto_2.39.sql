-- 28/08/2024 bhutan hmis eventDataValue

SELECT psi.uid eventID,psi.executiondate::date, -- data.key as de_uid,
--cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,--de.name AS dataElementName, 
teav.value AS MCH_Number, 
org.uid AS orgUnitUID, org.name AS orgUnitName FROM programstageinstance psi 
--JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
--INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ZknH1Y5o3xA' and ps.uid = 'NtXvo6awGak' 
and teav.trackedentityattributeid = 140223;


SELECT psi.uid eventID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
--INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ZknH1Y5o3xA' and ps.uid = 'NtXvo6awGak' 
--and teav.trackedentityattributeid = 140223
and de.uid = 'lee2S6lyX83';


SELECT psi.uid eventID,psi.executiondate::date, -- data.key as de_uid,
--cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
ps.name AS stage_name,--de.name AS dataElementName, 
teav.value AS MCH_Number, 
org.uid AS orgUnitUID, org.name AS orgUnitName FROM programstageinstance psi 
--JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
--INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ZknH1Y5o3xA' and ps.uid = 'YklkL7cQ6DX' 
and teav.trackedentityattributeid = 140223;

SELECT psi.uid eventID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
de.name AS dataElementName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN dataelement de ON de.uid = data.key
--INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ZknH1Y5o3xA' and ps.uid = 'YklkL7cQ6DX' 
--and teav.trackedentityattributeid = 140223
and de.uid = 'AA2NhokDH60';










-- 16/11/2023 09/01/2023 production

--Bhutan - HMIS -- upgrade // 24/11/2023
--upgrade from 2.34 to 40.2.0
-- soft delete issue
delete from trackedentityinstance where deleted = true;

delete from trackedentityinstance where deleted = true;

delete from trackedentityprogramowner
where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where deleted = true);

delete from trackedentityattributevalueaudit
where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where deleted = true);

delete from programownershiphistory
where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where deleted = true);



delete from relationshipitem where
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where deleted = true);

select * from relationship where from_relationshipitemid in (
select relationshipitemid from relationshipitem where
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where deleted = true));

delete from relationship where from_relationshipitemid in (
select relationshipitemid from relationshipitem where
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where deleted = true));

select * from relationshipitem where relationshipid = 6140492

update relationshipitem set trackedentityinstanceid = null where relationshipid = 6140492


delete from audit;


-- option set load issues

="update optionvalue set sort_order  = "&C2&" where optionvalueid = "&A2&" and uid = '"&B2&"';"

="update optionvalue set sort_order  = "&F2&" where uid = '"&C2&"';"

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode, opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
order by ops.name, opv.sort_order;

select * from optionset where uid = 'NYukub0yItZ';	

select * from optionvalue where optionsetid in (
select optionsetid from optionset where uid = 'NYukub0yItZ');

update optionvalue set sort_order = 1 where optionvalueid = 3986708;
update optionvalue set sort_order = 2 where optionvalueid = 3986710;
update optionvalue set sort_order = 3 where optionvalueid = 3986881;


update optionvalue set sort_order = 1 where optionvalueid = 4033374;
update optionvalue set sort_order = 2 where optionvalueid = 4033373;
update optionvalue set sort_order = 3 where optionvalueid = 4033459;
update optionvalue set sort_order = 4 where optionvalueid = 4033462;
update optionvalue set sort_order = 5 where optionvalueid = 4033427;
update optionvalue set sort_order = 6 where optionvalueid = 4033452;

update optionvalue set sort_order = 1 where optionvalueid = 4105706;
update optionvalue set sort_order = 2 where optionvalueid = 4105707;
update optionvalue set sort_order = 3 where optionvalueid = 4105708;

select username, count( username ) from users
group by username having count( username ) > 1;


SELECT 	ui.userinfoid, us.userid, ui.firstname, ui.surname, us.username, 
us.uid, org.name from userinfo ui
INNER JOIN users us ON us.userid = ui.userinfoid
INNER JOIN usermembership um ON um.userinfoid = ui.userinfoid
inner join organisationunit org ON org.organisationunitid = um.organisationunitid



delete from userrolemembers where userid in (
select userid from users where username in('Tshering_LT',
'Shacha_LT','Sonam_LT','Tashi_LT','Ugyen_LT','Rinchen_LT',
'Sherub_LT','Pema_LT','Sangay_LT','Nima_LT','Nidup_LT',
'Karma_LT','Dechen_mm','klepcha_ph','Tshewang_LT','Dawa_LT'));

delete from previouspasswords where userid in (
select userid from users where username in('Tshering_LT',
'Shacha_LT','Sonam_LT','Tashi_LT','Ugyen_LT','Rinchen_LT',
'Sherub_LT','Pema_LT','Sangay_LT','Nima_LT','Nidup_LT',
'Karma_LT','Dechen_mm','klepcha_ph','Tshewang_LT','Dawa_LT'));

delete from users where username in ('Tshering_LT',
'Shacha_LT','Sonam_LT','Tashi_LT','Ugyen_LT','Rinchen_LT',
'Sherub_LT','Pema_LT','Sangay_LT','Nima_LT','Nidup_LT',
'Karma_LT','Dechen_mm','klepcha_ph','Tshewang_LT','Dawa_LT');


(
select
	distinct (extract(year
from
	pe.startdate)) as datayear
from
	period pe )
union (
select
distinct (extract(year
from
pe.enddate)) as datayear
from
period pe )
union (
select
distinct (extract(year
from
(case
when 'SCHEDULE' = psi.status then psi.duedate
else psi.executiondate
end))) as datayear
from
programstageinstance psi
where
(case
when 'SCHEDULE' = psi.status then psi.duedate
else psi.executiondate
end) is not null
and psi.deleted is false )
order by
datayear asc;


select psi.uid eventID,psi.programstageinstanceid, psi.executiondate::date,
psi.duedate::date from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1900 
or EXTRACT(year from psi.executiondate) > 2029) 
order by psi.executiondate;


select psi.uid eventID,psi.programstageinstanceid, psi.executiondate::date,
psi.duedate::date from programstageinstance psi where
(EXTRACT(year from psi.duedate) < 1900 
or EXTRACT(year from psi.duedate) > 2029) 
order by psi.executiondate;

-- delete 

delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1900 
or EXTRACT(year from psi.executiondate) > 2029)); -- 112

delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance psi where
(EXTRACT(year from psi.duedate) < 1900 
or EXTRACT(year from psi.duedate) > 2029)); -- 421

delete from programstageinstancecomments where programstageinstanceid
in ( select programstageinstanceid from programstageinstance psi where
(EXTRACT(year from psi.duedate) < 1900 
or EXTRACT(year from psi.duedate) > 2029)); --3 

delete from programstageinstancecomments where programstageinstanceid
in ( select programstageinstanceid from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1900 
or EXTRACT(year from psi.executiondate) > 2029)); --2

delete from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1900 
or EXTRACT(year from psi.executiondate) > 2029); --15

delete from programstageinstance psi where
(EXTRACT(year from psi.duedate) < 1900 
or EXTRACT(year from psi.duedate) > 2029); --39



select * from programownershiphistory;

select * from programownershiphistory;

select * from programinstance where 
trackedentityinstanceid = 3417731 and organisationunitid = 492;

organisationunitid = 492

update programownershiphistory set  organisationunitid = 492
where organisationunitid is null;

update programownershiphistory set  organisationunitid = null;



delete from periodtype where name = 'QuarterlyNov';

https://github.com/hispindia/dhis2-Core/blob/2.39/dhis-2/dhis-services/dhis-service-setting/src/main/java/org/hisp/dhis/setting/SettingKey.java

  /** The offset of years used during period generation during the analytics export process. */
  ANALYTICS_MAX_PERIOD_YEARS_OFFSET("keyAnalyticsPeriodYearsOffset", 150, Integer.class),













SELECT pg_size_pretty( pg_database_size('bhutan_hmis_234_02_06_2021') );

pg_dump -U hmis -d hmis_v234 -T analytics* > C:\Users\HISP\Desktop\msf_updated_db.sql

-- 22/08/2022

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
WHERE dv.value is not null and de.dataelementid in(select dataelementid from datasetelement
where datasetid = 4012560);

SELECT tei.uid AS teiUID, org.name AS orgUnitName,prg.uid AS prgUID,
prg.name AS programName,teav.value , teav.lastupdated::date from programinstance pi
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where teav.value like '0%'
and teav.trackedentityattributeid = 3987326 order by teav.lastupdated desc;

select * from dataset where datasetid = 4012560	

select * from datavalue where deleted = false;

select count(*) from datavalue; -- 7416406


select * from trackedentityattribute where 
trackedentityattributeid = 3987326

select * from trackedentityattributevalue where value like '%0000-07-12%' and 
trackedentityattributeid = 3987326;

select * from trackedentityattributevalue where value like '0%'
and trackedentityattributeid = 3987326;



// 

select distinct ( dv.periodid ),pe.startdate,split_part(pe.startdate::TEXT,'-', 1) as year
,pe.enddate, split_part(pe.enddate::TEXT,'-', 2) as month,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod, pe.periodtypeid from datavalue dv 
inner join period pe ON pe.periodid = dv.periodid
where attributeoptioncomboid = 3996518 order by pe.periodtypeid;

// for datavalue

SELECT de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID, dv.value, 
dv.storedby,dv.periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.attributeoptioncomboid = 3996518 and dv.value is not null;	


old coc  -- DwpNKCL4Rfy
wrong coc -- HllvX50cXC0

// as on 02/06/2021 database
-- impCount - 70506 upCount - 5677 igCount - 0 conflictsDetails - undefined

SELECT de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID, dv.value, 
dv.storedby,dv.periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.attributeoptioncomboid = 3996518 and dv.periodid = 213223;	

select * from period where periodid in ( 3974457,3972094,213223 );


delete from datavalue where  attributeoptioncomboid = 3996518; 
delete from datavalueaudit where  attributeoptioncomboid = 3996518;


delete from categorycombos_optioncombos where categoryoptioncomboid = 3996518;
--delete from completedatasetregistration where attributeoptioncomboid = 3996518
update completedatasetregistration set attributeoptioncomboid = 15 where attributeoptioncomboid = 3996518;
delete from categoryoptioncombo where categoryoptioncomboid = 3996518;

select * from datavalueaudit where periodid in ( 3974457,3972094,213223 );



//

select distinct ( dv.periodid ), pe.startdate,pe.enddate, pe.periodtypeid from datavalue dv
inner join period pe ON pe.periodid = dv.periodid
where attributeoptioncomboid = 3996518
order by pe.periodtypeid;

select * from categoryoptioncombo where categoryoptioncomboid = 15; 

select * from categoryoptioncombo where name = 'default';

--delete from categoryoptioncombo where categoryoptioncomboid = 3996518; 

--delete from completedatasetregistration where attributeoptioncomboid = 3996518

delete from datavalue where  attributeoptioncomboid = 3996518; 
and periodid = 3974457 and value is not null;

select * from datavalue where  categoryoptioncomboid = 3996518;
--update  datavalue set attributeoptioncomboid = 15 where  attributeoptioncomboid = 3996518;

select * from datavalue where dataelementid = 1209 and periodid = 3974457
and sourceid = 491 and attributeoptioncomboid = 15 and categoryoptioncomboid = 15;

select * from datavalue where dataelementid = 1209 and periodid = 3974457
and sourceid = 491 and attributeoptioncomboid = 3996518;

--update from datavalueaudit set attributeoptioncomboid = 15 where  attributeoptioncomboid = 3996518;

select * from datavalueaudit where dataelementid in( 156641,156663) and organisationunitid = 496
and periodid in( 3974456,3974126 );

select * from datavalue where dataelementid in( 156641,156663) and sourceid = 496
and periodid in( 3974456,3974126 );

select * from datavalue where attributeoptioncomboid = 3996518;

select * from datavalue where categoryoptioncomboid = 15 and attributeoptioncomboid = 3996518;

select * from dataset where uid = 'UlwndvXiZzv'

select * from datasetelement where datasetid = 156740 and 
dataelementid in( 156641,156663)
update datasetelement set categorycomboid = null where datasetid = 156740 and 
dataelementid in( 156641,156663) 
delete from datavalueaudit where  attributeoptioncomboid = 3996518;
select * from dataelement;


-- update tei/enrollment/event organisationunitid 28/02/2022


select * from trackedentityinstance where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance where organisationunitid in (1826554 )
and programid = 4104966 );

update trackedentityinstance set organisationunitid = 466 where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance where organisationunitid in (1826554 )
and programid = 4104966 );


select * from trackedentityinstance where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance where organisationunitid in ( 661 )
and programid in(4105553,4105808) );

update trackedentityinstance set organisationunitid = 482 where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance where organisationunitid in (661 )
and programid in(4105553,4105808) ); -- 205

select trackedentityinstanceid, uid,organisationunitid from trackedentityinstance where uid in ();

="update trackedentityinstance set organisationunitid  = "&G2&" where trackedentityinstanceid = "&A2&" and organisationunitid = "&F2&";"

="update trackedentityinstance set organisationunitid  = "&D2&" where uid = '"&A2&"' and trackedentityinstanceid = "&B2&";"

select * from programinstance where organisationunitid in (1826554 )
and programid = 4104966;

select * from programinstance where organisationunitid in (661 )
and programid in(4105553,4105808);

update programinstance set organisationunitid = 466 where organisationunitid in (1826554 )
and programid = 4104966; -- 1447

update programinstance set organisationunitid = 482 where organisationunitid in (661 )
and programid  in(4105553,4105808); -- 323

="update programinstance set organisationunitid  = "&G2&" where uid = '"&C2&"' and programinstanceid = "&B2&" and programid = "&I2&" and organisationunitid = "&F2&";"

="update programinstance set organisationunitid  = "&E2&" where programinstanceid = "&A2&" and trackedentityinstanceid = "&C2&" and programid = "&D2&" and organisationunitid = "&B2&";"



select * from programstageinstance where organisationunitid in (1826554 )
and programstageid in (select programstageid from programstage where programid = 4104966 );


update programstageinstance set organisationunitid = 466 where organisationunitid in (1826554 )
and programstageid in (select programstageid from programstage where programid = 4104966 ); -- 5882

update programstageinstance set organisationunitid = 482 where organisationunitid in (661 )
and programstageid in (select programstageid from programstage where programid in(4105553,4105808) ); -- 323

="update programstageinstance set organisationunitid  = "&G2&" where uid = '"&E2&"' and programstageinstanceid = "&D2&" and programinstanceid = "&B2&" and organisationunitid = "&F2&";"

="update programstageinstance set organisationunitid  = "&D2&" where programstageinstanceid = "&A2&" and programinstanceid = "&B2&" and organisationunitid = "&C2&";"

="update programstageinstance set organisationunitid  = "&E2&" where uid = '"&B2&"' and programstageinstanceid = "&A2&";"

select * from trackedentityprogramowner where trackedentityinstanceid = 3933747 
and programid = 4104966 and organisationunitid = 56768;

select * from trackedentityprogramowner where  organisationunitid in (1826554 )
and programid = 4104966;

update trackedentityprogramowner set organisationunitid = 466 where  organisationunitid in (1826554 )
and programid = 4104966;


select * from trackedentityprogramowner where  organisationunitid in (661 )
and programid in(4105553,4105808);

update trackedentityprogramowner set organisationunitid = 482 where  organisationunitid in (661 )
and programid in(4105553,4105808); -- 326


="update trackedentityprogramowner set organisationunitid  = "&G2&" where trackedentityinstanceid = "&A2&" and programid = "&I2&" and organisationunitid = "&F2&";"

="update trackedentityprogramowner set organisationunitid  = "&B2&" where trackedentityinstanceid = "&A2&" and programid = "&C2&";"

-- 16/06/2022


select * from programinstance where programid = 4104966 and 
trackedentityinstanceid in (3987324,3987324,39873240);

select * from programstageinstance where programinstanceid in (select programinstanceid from 
programinstance where programid = 4104966 and trackedentityinstanceid in (3987324,3987324,39873240));

select * from programstageinstance where organisationunitid = 604  
and programinstanceid in (select programinstanceid from 
programinstance where programid = 4104966 and trackedentityinstanceid in (3987324,3987324,39873240 ));



SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number, 
org.uid AS orgUnitUID, org.name AS orgUnitName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'SuvMxhyPK5l' and teav.trackedentityattributeid = 3987324;


-- 06/05/2022

-- bhutan Gastric Cancer Management data list with CID attribute
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'SuvMxhyPK5l' and teav.trackedentityattributeid = 3987324;

-- bhutan Gastric Cancer Management data list with CID attribute
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number, 
org.uid AS orgUnitUID, org.name AS orgUnitName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'SuvMxhyPK5l' and teav.trackedentityattributeid = 3987324;

-- bhutan Gastric Cancer Management data list with CID attribute with orgUnit name and uid
SELECT psi.uid eventID, org.uid AS orgUnitUID, org.name AS orgUnitName, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, prg.uid AS prgUID, 
de.name AS dataElementName, teav.value AS CID_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where tea.uid = 'cae0w7Dh8q2' and de.uid = 't1BdYeCTz8Y' and prg.uid = 'VuoSamZ3qrE';


SELECT psi.uid eventID,psi.executiondate::date as eventdate, org.uid AS orgUnitUID, org.name AS orgUnitName, 
data.key as de_uid, cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, prg.uid AS prgUID, 
de.name AS dataElementName, teav.value AS CID_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where tea.uid = 'cae0w7Dh8q2' and de.uid = 'pi92syhlS8p' and prg.uid = 'VuoSamZ3qrE';

select * from trackedentityattributevalue where value = '0000-04-04';

update trackedentityattributevalue set value = '1990-04-04' where value = '0000-04-04';

select * from trackedentityattributevalue where value like '%0000-%';
update trackedentityattributevalue set value = '1990-04-04' where value like '%0000-%';


SELECT teav1.trackedentityinstanceid, teav2.value as name ,teav1.value as dateValue, 
teav3.value AS CID_number,org.uid AS orgUID,org.name AS orgName FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 140561 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3987324 ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
WHERE teav1.trackedentityattributeid =  3987326 AND teav1.value ILIKE '%0000-%';

select * from flyway_schema_history where installed_rank = 115;	

delete from flyway_schema_history where installed_rank = 115;	


SELECT teav1.trackedentityinstanceid, teav2.value as name ,teav1.value as dateValue, 
teav3.value AS CID_number,org.uid AS orgUID,org.name AS orgName FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 140561 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3987324 ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
WHERE teav1.trackedentityattributeid =  3987326 AND teav1.value ILIKE '%0000-%';

SELECT teav1.trackedentityinstanceid, teav2.value as name,teav1.value as dateValue, 
teav3.value AS CID_number,org.uid AS orgUID,org.name AS orgName, teav1.storedby
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 140561 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3987324 ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  3987326 and teav1.value ILIKE '0%' and prg.uid = 'SuvMxhyPK5l';


select * from trackedentityattribute where trackedentityattributeid = 3987326;

select * from programstageinstance where programstageid in 
(select programstageid from programstage where programid = 4104966 )
and programinstanceid in (select programinstanceid from 
programinstance where programid = 4104966 and trackedentityinstanceid in (3933747,3933748));

select psi.programstageinstanceid, psi.uid AS eventUID, psi.organisationunitid AS eventOrgID,
tei.trackedentityinstanceid AS teiID from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE pi.programid = 4104966 and 
tei.trackedentityinstanceid in (3933747,3933748,3933749);


select * from trackedentityattribute where uid = 'G493m4FEXf1';

="update sequentialnumbercounter set counter = "&D2&" where id = "&A2&";"
="update sequentialnumbercounter set counter = "&D2&" where key = '"&C2&"';"

update trackedentityattributevalue set created = now()::timestamp where created = '2022-06-30';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2022-06-30';

select * from sequentialnumbercounter where id = 4219910;

update sequentialnumbercounter set counter = 122501 where
id = 4219910 and key = 'BC_SEQUENTIAL(#######)';


update sequentialnumbercounter set counter = 122501 where
id = 4219910 and key = 'BC_SEQUENTIAL(#######)';

select * from trackedentityattribute where uid = 'FsS0is04ZjF';

select * from trackedentityattributevalue where trackedentityattributeid = 4105473
and trackedentityinstanceid = 4017641;

select * from sequentialnumbercounter where id = 4219839;

select * from trackedentityattributevalue where trackedentityattributeid = 4104926
and trackedentityinstanceid in(3882571,4024046);

update sequentialnumbercounter set counter = 156105 where
id = 4219839 and key = 'CC_SEQUENTIAL(#######)';

-- update on date 11/07/2022
update sequentialnumbercounter set counter = 394181 where
id = 4188236 and key = 'GC_SEQUENTIAL(#######)';

update trackedentityattributevalue set created = now()::timestamp where created = '2022-07-11';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2022-07-11';



-- 02/02/2023 update TEI registration and enrollment organisationunit

select * from trackedentityinstance where uid = 'WNt8bwgeGUc'; -- 4335240
select * from trackedentityinstance where uid = 'ZuR1412sfSo';  -- 4018142

select * from trackedentityinstance where uid = 'HcAE9eG7ogy'; -- 4231465

update trackedentityinstance set organisationunitid = 1826511
where uid = 'HcAE9eG7ogy';

select * from programinstance where trackedentityinstanceid = 4231465
and programid = 138448

update programinstance set organisationunitid = 1826511
where trackedentityinstanceid = 4231465 and programid = 138448

-- Gelegphu HISC. -- n55w7zTh8hR -- 1826473

--368-TP-15-26/05/14 -  phuntsholing HISC. -- Ur5UyDTV3Yz -- 1826511

select * from organisationunit where uid = 'NGEI6rFwznX';
select * from program where uid = 'sa5481ZXKW2'; -- 138448


-- tei=WNt8bwgeGUc&program=sa5481ZXKW2&ou=NGEI6rFwznX&fromAudit


-- 24/08/2023 bhutan HMIS Maternal Health Program 
--- trackerCaptureGridColumns issue multiple widget shows


select * from users where username = 'YoeseltseBHU';

select * from usersetting where userinfoid in ( 1655246 );	
delete from usersetting where userinfoid in ( 1655246 );	
delete from usersetting where userinfoid in ( 1655246 );	
delete from usersetting where userinfoid in ( 1655246 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 1655246 );

select * from usersetting where userinfoid in ( select userid from users where username in 
( ) );

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( ))

select * from usersetting where userinfoid in ( select userid from users where username in 
( 'newggsnagar' ) );

delete from usersetting where userinfoid in ( select userid from users where username in 
( 'newggsnagar' ) );

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'newggsnagar'));

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'newggsnagar'));

-- 06/12/2023 run on production

select * from usersetting where userinfoid in ( select userid from users where username in 
( 'PantangBHU' ) );

delete from usersetting where userinfoid in ( select userid from users where username in 
( 'PantangBHU' ) );

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'PantangBHU'));

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'PantangBHU'));


-- 21/12/2023 run on production

select * from usersetting where userinfoid in ( select userid from users where username in 
( 'GhishingmaSP' ) );

delete from usersetting where userinfoid in ( select userid from users where username in 
( 'GhishingmaSP' ) );

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'GhishingmaSP'));

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'GhishingmaSP'));
