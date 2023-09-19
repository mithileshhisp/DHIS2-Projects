

 -- yearly datavalue
 
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('xl4EXfRMBrK','evXyDr6c7eu','evXyDr6c7eu') 
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;


-- include datavalue comment and datavalue NULL
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value,dv.comment dataValueComment, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('xl4EXfRMBrK','evXyDr6c7eu','evXyDr6c7eu') 
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and  dv.deleted = false order by pe.startdate;


-- with coc
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in( 'EnQPW5xZDPX') and coc.uid in ('Ei6fwK40fzN','grw5pufOjWU')
and dv.value is not null and dv.deleted = false;



SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE ds.uid in ('m4Hy2QZbW9p', 'c8Q3QiX5He3') and org.uid = 'eNKiuyk8bOB'
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;

SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.comment, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('evXyDr6c7eu','EnQPW5xZDPX','bLR7YvL1f5O') and org.uid = 'WwFCWM75uGn'
and pe.startdate >= '2019-01-01' and pe.enddate <= '2019-12-31'
and dv.deleted = false order by pe.startdate;


-- Countries with Zero Foreign born new cases
select ous.namelevel2, ous.namelevel3, sum(dv.value::int) from datavalue dv
inner join _orgunitstructure ous on ous.organisationunitid = dv.sourceid
where dv.dataelementid in (144) and dv.periodid = 58530
group by ous.namelevel2, ous.namelevel3
order by sum, ous.namelevel2, ous.namelevel3


-- Zero_data_value_New cases_GLP_indicator -- 07/08/2023

select ous.namelevel2, ous.namelevel3, sum(dv.value::int) from datavalue dv
inner join _orgunitstructure ous on ous.organisationunitid = dv.sourceid
where dv.dataelementid in (select dataelementid from dataelement where uid in (
'evXyDr6c7eu','gVmFx873rdZ','IQgrP2W9gTV','liZaznYiWwp')) 
and dv.periodid in ( select periodid from period 
where startdate = '2022-01-01' and enddate = '2023-12-31')
group by ous.namelevel2, ous.namelevel3
order by sum, ous.namelevel2, ous.namelevel3;


select ous.namelevel2, ous.namelevel3, sum(dv.value::int) from datavalue dv
inner join _orgunitstructure ous on ous.organisationunitid = dv.sourceid
where dv.dataelementid in (select dataelementid from dataelement where uid in (
'evXyDr6c7eu','gVmFx873rdZ','IQgrP2W9gTV','liZaznYiWwp')) 
and dv.periodid in ( select periodid from period 
where startdate = '2022-01-01' and enddate = '2022-12-31') 
group by ous.namelevel2, ous.namelevel3 having sum(dv.value::int) = 0
order by sum, ous.namelevel2, ous.namelevel3;

-- New cases - Children_GLP Zero_data_value_New cases - Children_GLP_indicator
select ous.namelevel2, ous.namelevel3, sum(dv.value::int) from datavalue dv
inner join _orgunitstructure ous on ous.organisationunitid = dv.sourceid
where dv.dataelementid in (select dataelementid from dataelement where uid in (
'evXyDr6c7eu','gVmFx873rdZ','IQgrP2W9gTV' )) and dv.categoryoptioncomboid in (
select categoryoptioncomboid from categoryoptioncombo where uid = 'ZZFiCRpT37i')
and dv.periodid in ( select periodid from period 
where startdate = '2022-01-01' and enddate = '2022-12-31') 
group by ous.namelevel2, ous.namelevel3 having sum(dv.value::int) = 0
order by sum, ous.namelevel2, ous.namelevel3;