
-- links -- 172.105.47.164 96 4444
-- M!th!lesh@123
-- Dh!sUs3Rp@SS1
-- ln2  172.104.173.245  96 5454   Dh!$U$3R#p@SS
-- ln1  139.162.61.147   96  dhis@hisp 3333
-- https://amrhp.hispindia.org/dhis2 -- 172.105.47.158 -- 22 -- ict kenya -- 4646
-- 
 -- create user on poatgres
 
-- postgres restart
 -- sudo /etc/init.d/postgresql restart
 
 -- 9199990989
 
-- eventDataValue update dataElement-value
 
 

pg_dump -U dhis -d timor_v238 -T analytics* > /home/mithilesh/timor_v238_21Aug2023.sql
pg_dump -U dhis -d prep_tracker_v238 -T analytics* > /home/mithilesh/prep_tracker_v238_29Aug2023.sql

pg_dump -U dhis -d unfpa_239 -T analytics*  > /home/mithilesh/unfpa_239_18Sept2023_backup.sql

pg_dump -U dhis -d unfpa_239 -T analytics*  > /home/mithilesh/unfpa_239_19Sept2023_backup.sql
 
UPDATE programstageinstance SET 
eventdatavalues = jsonb_set(eventdatavalues,'{FmDPRFXrMaG, value}', '"2021-08-17T20:53:08.000Z"',true) 
WHERE programstageinstanceid = '123621';
 
 
CREATE USER fpaidbpro WITH PASSWORD fpaidbpro@9876; 
ALTER USER fpidbpro WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE fpaidb_pro to fpaidbpro;


CREATE USER fpidbpro WITH PASSWORD fpaidbpro@9876
ALTER USER fpidbpro WITH SUPERUSER;

GRANT ALL PRIVILEGES ON DATABASE fpaidb_pro to fpidbpro;


-- import database for plan
psql - p 5432  - h <host> - U <username > - d < database name >  - f <. sql file >
pg_restore -h <localhost> -d <databasename> < file_location.sql

-- database backup
pg_dump -p 5433  -h 192.168.105.130 -U hmis -d hmis_new_2 -T analytics* > /home/saurabh/hmis_new_2_v33_18102021.sql

 -- database import and backup commands
hiv_tracker_234_14_12_2021
psql  -U postgres -d hiv_tracker_234_14_12_2021 < 
pg_dump -U postgres -d hiv_tracker_234_14_12_2021 > "C:\Users\Mithilesh Thakur\Desktop\hiv_tracker_234_15122021.sql"

pg_dump -U postgres -d test_234_database > "C:\Users\Mithilesh Thakur\Desktop\test_234_15122021.sql"

pg_dump -U postgres -d hiv_tracker_234_14_12_2021  -t dataelement > "C:\Users\Mithilesh Thakur\Desktop\dataelement.sql"

Timestamp timestamp = new Timestamp(System.currentTimeMillis());
String created = timestamp.toString();
String lastUpdatedDate = timestamp.toString();

-- give permisson to postgres user like /dhis/hmis

nano /etc/postgressql/13/main/pg_hba.cong
add
local   all   hmis  md5openimisdemo_v233_09_04_2021

then ctrl + X then Y ( for saving )

then restart the postgres

and for database on another server add following in 
nano /etc/postgressql/13/main/pg_hba.cong

host all all all all

host    all  	    all  	xxx.xxx.xxx.xxx       md5
host    all  	    all  	all                   md5

And then restart the Service
connect to postgres through command line

psql -U postgres -h localhost
or go through to C:\Program Files\PostgreSQL\10\bin\psql.exe

list of database
\list or \l+
\d+ // for all tables for selected database
select version();
\! psql -V
// move to database

\connect dbname or \c dbname
\d+  // list of tables
and run the sql script as required

// connect on server linode

// login to postgres
sudo -s
su postgres 
psql
// to connect the database
\c dbname username
psql dbname username
 \c dmc dhis  or \connect dbname username

\d+  // list of tables
and run the sql script as required


-- change owner of database

ALTER DATABASE emro_v233 owner to dhis;

pg_dump -Fc -U postgres -T analytics_* dhis2_leb_main_3  > F:\BACKUP\"%bkupfilename%"

-- postgres restart

sudo /etc/init.d/postgresql restart
-- post gis extension creation
create extension if not exists postgis;
--create extension for database
sudo -u postgres psql -c "create extension postgis;" dhis2


select setting  from pg_settings where name= 'max_locks_per_transaction';
select setting,pending_restart from pg_settings where name= 'max_locks_per_transaction'; // set 200

select * from pg_settings

update pg_settings set setting = 100 where name= 'max_locks_per_transaction';

update pg_settings set setting = 200 where name= 'max_locks_per_transaction';

-- trim and split string QUERY in postgresSQL

SELECT optionsetid,uid,code,TRIM(split_part(code, '-', 1)) from optionset where code Ilike '%awc%';
SELECT split_part('ordno-#-orddt-#-ordamt', '-#-', 2);


-- split in postgres SQL
pe.startdate,split_part(pe.startdate::TEXT,'-', 1) as year
,pe.enddate, split_part(pe.enddate::TEXT,'-', 2) as month,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 

-- all analytics tables query
select table_name from information_schema.tables where table_name like 'analytics%' and table_type = 'BASE TABLE'
select table_name from information_schema.tables where table_name like 'analytics%' and table_type = 'BASE TABLE'
select table_name from information_schema.tables where table_name like 'analytics_enrollment%' and table_type = 'BASE TABLE'


// binary data read query in systemseeting table
// https://www.postgresql.org/docs/9.4/functions-binarystring.html
select systemsettingid, name, encode(value::bytea, 'escape') from systemsetting;

select systemsettingid, name, encode(value::bytea, 'escape') from systemsetting
where systemsettingid in (1577570,1092872, 1092873 );

-- table name for sequential number counter for tracked entity attribute sequentialnumbercounter
-- owneruid( means trackedentityattribute UID)
SELECT id, owneruid, key, counter
	FROM public.sequentialnumbercounter;
	
-- postgres database size query
SELECT pg_size_pretty( pg_database_size('mh_227_30_01_2021') );
SELECT pg_size_pretty( pg_database_size('myanmar_hmis_20_05_2021') );
SELECT pg_size_pretty( pg_database_size('hiv_tracker_234_18_06_2021') );

SELECT pg_size_pretty( pg_database_size('ippf_234_fpan_22_06_2021') );

SELECT pg_size_pretty( pg_database_size('icmr_nikushta_v228_23062021') ); // 1063 in 2.28

-- table size 

SELECT pg_size_pretty (pg_total_relation_size (' programinstanceaudit '));
select pg_relation_size('dataelement');

select pg_relation_size('audit');
SELECT pg_size_pretty (pg_total_relation_size (' audit '));

-- postgres idle user count and kill
select count (*) from pg_stat_activity where state='idle';

select * from pg_stat_activity where state='idle'

select * from pg_stat_activity where state='idle' and pid = 54916;

select pg_terminate_backend(54916);

// -- postgres SQL Query alter the database sequence id

SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

SELECT last_value FROM hibernate_sequence;

ALTER SEQUENCE hibernate_sequence RESTART WITH 4412;

ALTER SEQUENCE hibernate_sequence RESTART WITH 8394001;8393989


SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

-- run on HIV production as on 14/03/2023
SELECT last_value FROM programstageinstance_sequence;

ALTER SEQUENCE programstageinstance_sequence RESTART WITH 7779001;


SELECT EXTRACT(year FROM age(current_date,'2014-01-01')) :: int as age 

SELECT age(timestamp '2014-01-01');

select extract (epoch from (t1.logout_date - t1.login_date))::integer/60

select extract 
(epoch from (timestamp '2014-04-25 09:44:21' - timestamp '2014-04-25 08:32:21'))::integer/60

SELECT psi.uid, psi.created,psi.lastupdated,de.uid,de.name,
age(psi.lastupdated,psi.created) as diffrence,
extract (epoch from (psi.lastupdated - psi.created))::integer/86400 as dayDiffrence
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid in ( 'ClQvB8MujQx','fXJHjkEcmqI','UaL6A0omgMc','UBi3kSHgRus'
'TmadZ2ohtdd','EGZc2y8f8bf','WrP1BUHvpr9','JqZhUuUaLIm');



SELECT tei.uid teiUID, teav1.value as dob, 
EXTRACT(year FROM AGE(current_date,teav1.value::date))::int as age ,
org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 139 AND value = 'Female') teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  138 
and EXTRACT(year FROM AGE(current_date,teav1.value::date))::int between 12 and 19 
and prg.uid = 'TcaMMqHJxK5';


-- prep_tracker send e-mail for miss appointment
select * from programstageinstance;

SELECT psi.uid,psi.programstageinstanceid, psi.executiondate,
psi.duedate,psi.completeddate,
extract (epoch from (CURRENT_DATE - psi.duedate))::integer/86400 as dayDiffrence
from programstageinstance psi

WHERE psi.programstageid in ( select programstageid from programstage where uid = 'BrZ8MF97cDH')
and psi.duedate <= CURRENT_DATE - interval '7 day';



SELECT tei.uid AS teiUID, psi.uid AS eventUID, teav1.value as Client_ID, 
org.uid AS orgUID,org.name AS orgName, psi.executiondate::date as Event_date,
psi.duedate AS due_date,extract (epoch from (CURRENT_DATE - psi.duedate))::integer/86400 as dayDiffrence
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid = 'P3Spi0kT92n') and org.uid = 'Cc2ntGA27wX'
AND psi.programstageid in ( select programstageid from programstage where uid = 'BrZ8MF97cDH')
and psi.duedate <= CURRENT_DATE - interval '7 day';



INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid in ( select trackedentityattributeid from 
trackedentityattribute where uid = 'n2gG7cdigPc') ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid

--P3Spi0kT92n -- Client ID
-- n2gG7cdigPc -- PrEP ID Number

select organisationunitid,uid,name,email from organisationunit where email is not null
and organisationunitid in ( select organisationunitid
from program_organisationunits);



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

SELECT uid eventUID,geometry,
ST_X(ST_SetSRID  (geometry, 4326)) AS "Longitude",
ST_Y(ST_SetSRID  (geometry, 4326)) AS "Latitude"
FROM programstageinstance where programstageid in 
( 2537, 2485, 9682, 2697, 2577, 2439, 4729067) 
and geometry is not null;

SELECT organisationunitid,uid,name,geometry,
ST_x(geom)(ST_Transform (geometry, 4326)) AS "Longitude",
ST_Y(ST_Transform (geometry, 4326)) AS "Latitude"
FROM organisationunit where uid = 'HT3cF55xVpN';


SELECT organisationunitid,uid,name,hierarchylevel,geometry
FROM organisationunit where hierarchylevel = 3;


SELECT 
  ST_AsGeoJSON(geometry) :: json->'geometry' AS coordinates
FROM
  organisationunit where uid = 'HT3cF55xVpN';
  
-- for polygon  
SELECT ST_AsText(geometry) AS coordinates,ST_ASTEXT(geometry) AS XY
FROM organisationunit where uid = 'HT3cF55xVpN';  
  
  
SELECT ST_ASTEXT(ST_TRANSFORM(geometry,4674)) AS LongLat
FROM organisationunit where uid = 'HT3cF55xVpN'; 


ST_ASTEXT(ST_TRANSFORM(table.geometry,4674)) AS LongLat

ST_AsText(the_geom) FROM table2; 




-- all tables list with sizes

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


// create user on poatgres
CREATE USER fpaidbpro WITH PASSWORD fpaidbpro@9876; 
ALTER USER fpidbpro WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE fpaidb_pro to fpaidbpro;


CREATE USER fpidbpro WITH PASSWORD fpaidbpro@9876
ALTER USER fpidbpro WITH SUPERUSER;

GRANT ALL PRIVILEGES ON DATABASE fpaidb_pro to fpidbpro;

// give permisson to postgres user like /dhis/hmis

nano /etc/postgressql/13/main/pg_hba.cong
add
local   all   hmis  md5openimisdemo_v233_09_04_2021

then ctrl + X then Y ( for saving )

then restart the postgres

and for database on another server add following in 
nano /etc/postgressql/13/main/pg_hba.cong

host all all all all

host    all  	    all  	xxx.xxx.xxx.xxx       md5
host    all  	    all  	all                   md5

And then restart the Service
connect to postgres through command line

psql -U postgres -h localhost
or go through to C:\Program Files\PostgreSQL\10\bin\psql.exe

list of database
\list or \l+
\d+ // for all tables for selected database
select version();
\! psql -V
// move to database

\connect dbname or \c dbname
\d+  // list of tables
and run the sql script as required

// connect on server linode

// login to postgres
sudo -s
su postgres 
psql
// to connect the database
\c dbname username
psql dbname username
 \c dmc dhis  or \connect dbname username

\d+  // list of tables
and run the sql script as required

// postgres JIT enable
https://docs.aiven.io/docs/products/postgresql/howto/enable-jit

1)Enable JIT for a specific database

psql PG_CONNECTION_URI
alter database mytestdb set jit=on;

show jit;

2) Enable JIT for a specific user

psql PG_CONNECTION_URI
alter role mytestrole set jit=on;
show jit;
jit
-----
 on
(1 row)



















-- AMR HP - Pilot as on 15/08/2022
delete from audit; -- 1259 MB
select * from trackedentityinstanceaudit;
delete from trackedentityinstanceaudit; -- 96 GB

select count(*) from trackedentityinstanceaudit; --996913473

delete from audit;
delete from messageconversation_messages;	
delete from messageconversation_usermessages;
delete from usermessage;
delete from messageconversation;
delete from message;

-- A way to confirm the list of current existing years that are used during the Analytics Export process is running this query:

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


-- Based on start/end years supported, find the invalid executiondate in events.
select psi.executiondate from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1990 
 or EXTRACT(year from psi.executiondate) > 2029);


-- Based on start/end years supported, find the invalid duedate in events.
select psi.uid, psi.code, psi.duedate from programstageinstance psi where
(EXTRACT(year from psi.duedate) < 1990 or EXTRACT(year from psi.duedate) > 2029);


select psi.uid eventID,psi.programstageinstanceid, psi.executiondate::date,
psi.duedate::date from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1990 
or EXTRACT(year from psi.executiondate) > 2029) 
order by psi.executiondate;


select psi.uid eventID,psi.programstageinstanceid, psi.executiondate::date,
psi.duedate::date,org.uid orgUID,org.name orgName,data.key as dataElement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS ADMISSION_NUMBER from programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where de.uid = 'VxScEPPSjq8' and 
(EXTRACT(year from psi.executiondate) < 1990 
or EXTRACT(year from psi.executiondate) > 2029) 
order by psi.executiondate;


delete from programstageinstance  where 
uid = 'mzj0ZW3DOTX' and programstageinstanceid = 14830837;

delete from trackedentitydatavalueaudit where 
programstageinstanceid = 14830837;

select table_name from information_schema.tables 
where table_name like 'analytics%' and table_type = 'BASE TABLE'; 
