
SELECT pg_size_pretty( pg_database_size('myanmar_hmis_233_21_09_2021') );

pg_dump -U hmis -d hmis_v234 -T analytics* > C:\Users\HISP\Desktop\msf_updated_db.sql


select * from categoryoptioncombo where name = 'default';	

select * from users where userid = 14037672

select count(*) from datavalue where categoryoptioncomboid = 14778061 -- 194

select count(*) from datavalue where attributeoptioncomboid = 14778061 -- 18820

select count(*) from datavalue -- 31072051

select count(*) from datavalue where categoryoptioncomboid = 15 -- 19994953

select count(*) from datavalue where attributeoptioncomboid = 15 -- 26738972

select count(*) from datavalueaudit where categoryoptioncomboid = 14778061 -- 83

select count(*) from datavalueaudit where attributeoptioncomboid = 14778061 -- 547

-- update datavalue set categoryoptioncomboid = 15 where categoryoptioncomboid = 14778061;

-- update datavalue set attributeoptioncomboid = 15 where attributeoptioncomboid = 14778061;



select * from  completedatasetregistration where attributeoptioncomboid =  14778061 -- 2823;


SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE coc.uid = 'HllvX50cXC0' and dv.value is not null and dv.deleted = false;



SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2),split_part(pe.enddate::TEXT,'-', 3)) 
as isoPeriod, pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid 
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE coc.uid = 'HllvX50cXC0' and dv.value is not null and dv.deleted = false;





SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE attcoc.uid = 'HllvX50cXC0' and dv.value is not null and dv.deleted = false;


SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2),split_part(pe.enddate::TEXT,'-', 3)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE attcoc.uid = 'HllvX50cXC0' and dv.value is not null and dv.deleted = false;



SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE coc.uid = 'HllvX50cXC0' and dv.value is not null and dv.deleted = false;

--  completedatasetregistration

SELECT ds.uid as dataSetUID, org.uid AS organisationunitUID,comr.*, pety.name,
attcoc.uid AS attributeOptionComboUID,CONCAT (split_part(pe.startdate::TEXT,'-', 1), 
split_part(pe.enddate::TEXT,'-', 2), split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod 
from completedatasetregistration comr
INNER JOIN organisationunit org ON org.organisationunitid = comr.sourceid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = comr.attributeoptioncomboid
INNER JOIN dataset ds ON ds.datasetid = comr.datasetid
INNER JOIN period pe ON pe.periodid = comr.periodid
INNER JOIN periodtype pety ON pety.periodtypeid = pe.periodtypeid 
where attcoc.uid = 'HllvX50cXC0';



select count(*) from datavalue; -- 31053037
new -- 31063019 -- 9982


select * from datavalue where periodid = 14609225 and sourceid in(
select organisationunitid from organisationunit where uid = 'V1zSudSlP4l');


delete from datavalue where attributeoptioncomboid = 14778061;
delete from datavalue where categoryoptioncomboid = 14778061;

delete from datavalueaudit where categoryoptioncomboid = 14778061;
delete from datavalueaudit where attributeoptioncomboid = 14778061;


delete from categorycombos_optioncombos where categoryoptioncomboid in  ( 14778061 );
delete from completedatasetregistration where attributeoptioncomboid in  ( 14778061 );
update predictor set generatoroutputcombo = 15 where generatoroutputcombo = 14778061;
delete from categoryoptioncombo where categoryoptioncomboid in  ( 14778061 );

delete from categorycombos_optioncombos where categoryoptioncomboid in ();
delete from categoryoptioncombos_categoryoptions where categoryoptioncomboid in ();
delete from categoryoptioncombo where categoryoptioncomboid in  ( 14778061 );