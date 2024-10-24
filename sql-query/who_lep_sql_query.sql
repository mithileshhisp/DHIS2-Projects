

-- 05/04/2023

--delete program satge from leprosy_pilot( tracker )

delete from programruleaction where programstagesectionid in
( select programstagesectionid from programstagesection where programstageid 
in ( 14316, 14918 ));

delete from programstagesection_dataelements where programstagesectionid in
( select programstagesectionid from programstagesection where programstageid 
in ( 14316, 14918 ));

delete from programstagesection where programstageid 
in ( 14316, 14918 );

delete from programstagedataelement where programstageid 
in ( 14316, 14918 );

delete from trackedentitydatavalueaudit where programstageinstanceid in
( select programstageinstanceid from programstageinstance where programstageid 
in ( 14316, 14918 ));

delete from programstageinstance where programstageid 
in ( 14316, 14918 );






-- as on 01/04/2024

select name,uid from document;


-- 2022 population data
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('d1d6EWQZJGB') 
and pe.startdate >= '2022-01-01' and pe.enddate <= '2022-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;	

-- 2022 child-population data
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('EnQPW5xZDPX') 
and pe.startdate >= '2022-01-01' and pe.enddate <= '2022-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;

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


-- 12/08/2024
-- New_cases_GHO_PB_Cases_GLP_MB_Cases_GLP_Unclassified_Cases_GLP_zeroValue -- bsUzDq9cjXB
select ous.namelevel2, ous.namelevel3, sum(dv.value::int) from datavalue dv
inner join _orgunitstructure ous on ous.organisationunitid = dv.sourceid
where dv.dataelementid in (select dataelementid from dataelement where uid in (
'evXyDr6c7eu','gVmFx873rdZ','IQgrP2W9gTV','liZaznYiWwp' )) 
and dv.periodid in ( select periodid from period 
where startdate = '2019-01-01' and enddate = '2019-12-31') 
group by ous.namelevel2, ous.namelevel3 having sum(dv.value::int) = 0
order by sum, ous.namelevel2, ous.namelevel3;


-- New_child_cases_GHO_PB_Cases_GLP_MB_Cases_GLP_Unclassified_Cases_GLP_zeroValue -- MUqYJP3HR3w
select ous.namelevel2, ous.namelevel3, sum(dv.value::int) from datavalue dv
inner join _orgunitstructure ous on ous.organisationunitid = dv.sourceid
where dv.dataelementid in (select dataelementid from dataelement where uid in (
'evXyDr6c7eu','gVmFx873rdZ','IQgrP2W9gTV','TBTHguhWty1' )) and dv.categoryoptioncomboid in (
select categoryoptioncomboid from categoryoptioncombo where uid = 'ZZFiCRpT37i')
and dv.periodid in ( select periodid from period 
where startdate = '2019-01-01' and enddate = '2019-12-31') 
group by ous.namelevel2, ous.namelevel3 having sum(dv.value::int) = 0
order by sum, ous.namelevel2, ous.namelevel3;

-- end 12/08/2024


-- country_list
SELECT os.organisationunitid,ou.name AS Global,ou1.name AS Region,ou2.name AS Country
FROM  _orgunitstructure os
INNER JOIN organisationunit ou ON ou.organisationunitid = os.organisationunitid
INNER JOIN organisationunit ou1 ON ou1.organisationunitid = os.idlevel2
INNER JOIN organisationunit ou2 ON ou2.organisationunitid = os.idlevel3
ORDER BY Region,Country



-- who new server setup 17/11/2023

postgres sql binary setup -- 

https://www.enterprisedb.com/download-postgresql-binaries

set path in Env varaible

initdb -D D:\PostgreSQL\pgsql\data -U postgres -E utf8 -W -A scram-sha-256


pg_ctl -D C:\PostgreSQL\pgsql\data -l logfile start
pg_ctl -D C:\PostgreSQL\pgsql\data -l logfile stop

create extension if not exists postgis;
enable port 5432 in side data/postgres.conf file and create new-server on pgadmin with same port 5432 and user and password

help file - https://www.geeksforgeeks.org/postgresql-installing-postgresql-without-admin-rights-on-windows/
post-gis --  instalation https://www.postgresql.org/ftp/postgis/pg13/v3.4.0/win64/
post-gis -- https://ftp.postgresql.org/pub/postgis/pg14/v3.4.0/win64/postgis-bundle-pg14x64-setup-3.4.0-1.exe

pg_ctl.exe register -N "PostgreSQL" -U "NT AUTHORITY\NetworkService" -D "C:\PostgreSQL\pgsql\data" -w
C:/PostgreSQL/pgsql/bin/pg_ctl.exe start -N "postgresql-13" -D "C:\PostgreSQL\pgsql\data" -w


// schedular in window database backup

https://www.sharepointdiary.com/2013/03/create-scheduled-task-for-powershell-script.html
// symbol come in Maintenanace page bad characters
https://community.dhis2.org/t/maintenanace-page-bad-characters/37061
If that is set to windows-1252 (or anything except UTF-8/UTF8) then doing this in tomcat/bin/setenv.bat should do the trick:
set "JAVA_OPTS=%JAVA_OPTS% -Dfile.encoding=UTF8"

-- 14/08/2024 dataValueAudit
select * from datavalueaudit
where created::date between '2023-08-01' and '2024-08-31';

select de.name,org.name,audit.* from datavalueaudit audit
INNER JOIN dataelement de ON de.dataelementid = audit.dataelementid
inner JOIN organisationunit org ON org.organisationunitid = audit.organisationunitid
where audit.created::date between '2023-08-01' and '2024-08-31'
and audit.periodid =58530;