
SELECT pg_size_pretty( pg_database_size('bhutan_hmis_234_02_06_2021') );

pg_dump -U hmis -d hmis_v234 -T analytics* > C:\Users\HISP\Desktop\msf_updated_db.sql



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
WHERE dv.attributeoptioncomboid = 3996518 and dv.deleted = false and dv.value is not null;	


select * from datavalue where attributeoptioncomboid = 3996518
and deleted = true and value is null;


-- 05/06/2021 production database 
datavalue -- attributeoptioncomboid = 3996518 -- 94846   --- impCount - 93128 upCount - 1693 igCount - 25
-- total datavalue count -- 6610025  6608329

select * from completedatasetregistration  where attributeoptioncomboid = 3996518; -- 2113

old coc  -- DwpNKCL4Rfy
wrong coc -- HllvX50cXC0

// as on 02/06/2021 database
impCount - 70506 upCount - 5677 igCount - 0 conflictsDetails - undefined

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

select * from datavalue where  categoryoptioncomboid = 15 and attributeoptioncomboid = 3996518;
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