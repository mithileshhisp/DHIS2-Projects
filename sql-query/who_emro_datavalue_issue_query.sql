
SELECT pg_size_pretty( pg_database_size('bhutan_hmis_234_02_06_2021') );

pg_dump -U hmis -d hmis_v234 -T analytics* > C:\Users\HISP\Desktop\msf_updated_db.sql

-- ="update organisationunit set uid = '"&F2&"' where uid = '"&B2&"';"

-- EMRO Production default coc : HllvX50cXC0

-- EMRO Development default coc : Unyz1kBrzFB
-- datasetid -- jiu1tOn9kTi
-- total record -- 9202

select distinct ( dv.periodid ),pe.startdate,split_part(pe.startdate::TEXT,'-', 1) as year
,pe.enddate, split_part(pe.enddate::TEXT,'-', 2) as month,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod, pe.periodtypeid from datavalue dv 
inner join period pe ON pe.periodid = dv.periodid
where attributeoptioncomboid = 3996518 order by pe.periodtypeid;


SELECT de.valuetype, de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, attcoc.uid AS attributeOptionComboUID,
org.uid AS organisationunitUID, dv.value, dv.storedby, split_part(pe.startdate::TEXT,'-', 1) as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
WHERE  ds.uid = 'jiu1tOn9kTi' and dv.value is not null;


