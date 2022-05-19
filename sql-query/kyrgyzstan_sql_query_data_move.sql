SELECT dataelementid, periodid, sourceid, categoryoptioncomboid, attributeoptioncomboid, value, storedby, created, lastupdated, comment, followup, deleted
	FROM public.datavalue;
	
	
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, dv.created, dv.lastupdated, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE org.uid = 'jRpetm8NsnC' and dv.periodid in (select periodid from period where startdate >= '2010-01-01' 
and enddate <= '2019-12-31' and periodtypeid = 8 ) and dv.value is not null and dv.deleted = false;	

select * from periodtype;  8 -- monthly 13 - yearly


SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, dv.created, dv.lastupdated, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE org.uid = 'KGA5P5tIwcJ' and dv.periodid in (select periodid from period where startdate >= '2010-01-01' 
and enddate <= '2019-12-31'  ) and dv.value is not null and dv.deleted = false;	


-- Move data from KGA5P5tIwcJ -- 6615 to ms22ejMq03B -- 18423 for period all months of 2010 - 2019
-- 1. Move data from KGA5P5tIwcJ to ms22ejMq03B for period all months of 2010 - 2019, and then delete KGA5P5tIwcJ
-- 2. Move data from vHTNAuhBlpf -- 6579 to jRpetm8NsnC -- 6592 for period all months of 2010 - 2019, and then delete vHTNAuhBlpf

select * from organisationunit where uid = 'ms22ejMq03B';

select pet.name, dv.* from datavalue dv 
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
where dv.sourceid = 18423 and dv.periodid in (select periodid from period where startdate >= '2010-01-01' 
and enddate <= '2019-12-31' and periodtypeid = 8 );

select pet.name, dv.* from datavalue dv 
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
where dv.sourceid = 6592 and dv.periodid in (select periodid from period where startdate >= '2010-01-01' 
and enddate <= '2019-12-31'); 

SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, dv.created, dv.lastupdated, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE org.uid = 'jRpetm8NsnC' and dv.periodid in (select periodid from period where startdate >= '2010-01-01' 
and enddate <= '2019-12-31'  ) and dv.value is not null and dv.deleted = false;	

select * from datavalue where sourceid = 6592 and periodid in 
(select periodid from period where startdate >= '2010-01-01' and enddate <= '2019-12-31');

-- run on production database 19/05/2022
delete from datavalue where sourceid = 6592 and periodid in 
(select periodid from period where startdate >= '2010-01-01' and enddate <= '2019-12-31');


update datavalue set sourceid = 18423 where sourceid = 6615 and periodid in (select periodid from period where startdate >= '2010-01-01' 
and enddate <= '2019-12-31' ); -- 980

update datavalue set sourceid = 6592 where sourceid = 6579 and periodid in 
(select periodid from period where startdate >= '2010-01-01' and enddate <= '2019-12-31' ); -- 1372



