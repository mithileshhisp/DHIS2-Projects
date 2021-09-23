
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
WHERE dv.value is not null and dv.deleted = false;



select * from categoryoptioncombo -- 218444

select * from categoryoptioncombo where categoryoptioncomboid not in (
select categoryoptioncomboid from datavalue); -- 218283 -- delete

select * from categoryoptioncombo where categoryoptioncomboid in (
select categoryoptioncomboid from datavalue); -- 161 -- not delete


select * from categoryoptioncombo where categoryoptioncomboid not in (
select attributeoptioncomboid from datavalue); -- 218296

select * from categoryoptioncombo where categoryoptioncomboid in (
select attributeoptioncomboid from datavalue); -- 148

select * from categorycombo where uid not in ( 'PvoQryFqDr1', 'YnmmieglDIV'); -- 12

select * from dataelementcategory where uid not in 
( 'lE9LfDeCSGa', 'BB34TO1MsbB', 'uoGPDb7NKXC', 'o3f27RemB0u', 'OeTywbgqYtV');

select * from categories_categoryoptions where 	categoryid not in(
21743420,21743418,21744405,21744401,21743419,18); -- 881


select * from categories_categoryoptions where 	categoryid in(
21743420,21743418,21744405,21744401,21743419,18); -- 189

select * from dataelementcategoryoption where categoryoptionid in
(select categoryoptionid from categories_categoryoptions where categoryid in
( select categoryid from dataelementcategory where uid  in 
( 'lE9LfDeCSGa', 'BB34TO1MsbB', 'uoGPDb7NKXC', 'o3f27RemB0u', 'OeTywbgqYtV','GLevLNI9wkl')));

select * from dataelementcategoryoption; -- 478 116 + delete -- 362 

select * from categoryoptiongroup where uid in
( 'nOCKwu6CrWi', 'fmErXlxWNJe', 'rsM7PcWW6at', 'Z8WLvfVppGO', 'MFQMoYwwUWU', 'TnI52tKWlV3'); --6

select * from categoryoptiongroup where uid not in
( 'nOCKwu6CrWi', 'fmErXlxWNJe', 'rsM7PcWW6at', 'Z8WLvfVppGO', 'MFQMoYwwUWU', 'TnI52tKWlV3'); -- 131

select * from categoryoptiongroupset where uid  in ( 'AapI9odDnk2'); -- 1
select * from categoryoptiongroupset where uid  not in ( 'AapI9odDnk2'); -- 9


select * from dataelementgroup where uid in ('Ie0FX4fnJ8s', 'GVbZBVW6Az2'); --2 

select * from dataelementgroup where uid not in ('Ie0FX4fnJ8s', 'GVbZBVW6Az2'); --11

select * from dataset where  uid in ('fqDBu4H2xRX', 'TZAFADC2vK0'); --2 
select * from dataset where  uid not in ('fqDBu4H2xRX', 'TZAFADC2vK0'); --17


select * from dataelement; -- 808 -- delete 231 rest -- 577
select * from dataelement where domaintype = 'AGGREGATE' and dataelementid in (); -- 231 -- deleted
select * from dataelement where domaintype = 'AGGREGATE' and dataelementid not in (); -- 230 -- not deleted

