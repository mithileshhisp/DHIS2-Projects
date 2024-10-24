


chown mithilesh:mithilesh /home/mithilesh/dhis-web-tracker-capture/ -R




sudo -u hmis /home/hisp/tomcat-nepalhmis/bin/startup.sh


pg_dump -U hisp  -d odk_v238 -T analytics* > /home/mithilesh/odk_v240_backup27May2024.sql


-- myanmar Maleria/MIS dev instance database and war fire update as 2.40 on 23/03/2024
pg_dump -U dhis  -d prodhis_myanmar_v240 -T analytics* > /home/dhisadmin/prodhis_myanmar_v240_22March2024.sql

pg_dump -U dhis  -d dev_myanmar_238 -T analytics* > /home/dhisadmin/dev_myanmar_238_backup_22March2024.sql

pg_dump -U dhis  -d ippf_co_240 -T analytics* > /home/mithilesh/ippf_co_240_backup_21Aug2024.sql

pg_dump -U renew  -d renew_v234 -T analytics* > /home/mithilesh/ippf_renew_234_backup_10Aug2024.sql

pg_dump -U hisp  -d nepalhmis_v240 -T analytics* > /home/hmis/nepalhmis_v40_28Aug2024.sql

dh15#202@4us3r123$
login to postgres

sudo -s
su postgres
then 
psql

\l ( for list of database )

create database dev_myanmar_240;
ALTER DATABASE dev_myanmar_240 owner to dhis;
sudo -u postgres psql -c "create extension postgis;" dev_myanmar_240
sudo -u postgres psql -c "create extension  btree_gin;" dev_myanmar_240
sudo -u postgres psql -c "create extension  pg_trgm;" dev_myanmar_240

psql -U dhis dev_myanmar_240 < /home/dhisadmin/prodhis_myanmar_v240_22March2024.sql


\q ( for exit )
exit



su postgres
create database ippf_afga_v34;
ALTER DATABASE ippf_afga_v34 owner to dhis;
// exit from postgres user then create extension
sudo -u postgres psql -c "create extension postgis;" ippf_afga_v34
psql -U dhis ippf_afga_v34 < /home/fpab/ippf_fpab_v34_10022021.sql

-- sudo /etc/init.d/postgresql restart
//post gis extension creation
-- create extension if not exists postgis;
-- create extension for database
sudo -u postgres psql -c "create extension postgis;" dhis2

sudo -u postgres psql -c "create extension postgis;" combat_amr_20jan22

for 2.38 -- add 2 new extension
sudo -u postgres psql -c "create extension  btree_gin;" hiv_tracker_238_26102022
sudo -u postgres psql -c "create extension  pg_trgm;" hiv_tracker_238_26102022 
 
 
pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_12Dec2023.sql 
 
pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_02Nov2023.sql 
 
 timor_v238
pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_02Nov2023.sql

pg_dump -U dhis -d timor_v238 -T analytics* > /home/mithilesh/timor_v238_16Nov2023.sql
pg_dump -U dhis -d prep_tracker_v238 -T analytics* > /home/mithilesh/prep_tracker_v238_29Aug2023.sql

pg_dump -U dhis -d unfpa_239 -T analytics*  > /home/mithilesh/unfpa_239_18Sept2023_backup.sql

pg_dump -U dhis -d unfpa_239 -T analytics*  > /home/mithilesh/unfpa_239_19Sept2023_backup.sql

pg_dump -U dhis -d malaria_timor_v236 -T analytics*  > /home/mithilesh/malaria_timor_v236_backup_16Nov2023.sql
 
 
pg_dump -U dhis  -d hiv_tracker_238_26102022 -t program_attribute_group > /home/mithilesh/program_attribute_group.sql

pg_dump -U dhis2-user  -d mizoramipa_238 -T analytics* > /home/dbadmin/mizoramipa_238_07Feb2024.sql

pg_dump -U dhis2-user  -d mizoramipa_238 -T analytics* > /home/dbadmin/mizoramipa_238_17June2024.sql





pg_dump -U dhis  -d prodhis_myanmar_v240 -T analytics* > /home/dhisadmin/prodhis_myanmar_v240_22March2024.sql

pg_dump -U dhis  -d dev_myanmar_238 -T analytics* > /home/dhisadmin/dev_myanmar_238_backup_22March2024.sql

-- amr new server testing instance/server
pg_dump -U amr_dhis  -d amr_jimma_v240 -T analytics* > /home/mithilesh/amr_jimma_v240_24June2024.sql


-- all tables list with sizes

SELECT pg_size_pretty( pg_database_size('dhis2_Training') );

-- table size 

SELECT pg_size_pretty (pg_total_relation_size (' programinstanceaudit '));
select pg_relation_size('dataelement');

select pg_relation_size('audit');
SELECT pg_size_pretty (pg_total_relation_size (' audit '));

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
 
 
select table_name from information_schema.tables 
where table_name like 'analytics%' and table_type = 'BASE TABLE' 
 
 
 
 
 
  
 
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

SELECT pg_size_pretty( pg_database_size('dhis2_Training') );

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


-- run for combat-amr jimma ethiopia 15/03/2024

select * from trackedentityinstance order by
trackedentityinstanceid desc;

select * from programinstance 
order by programinstanceid desc


select * from programstageinstance 
order by programstageinstanceid desc

SELECT last_value FROM hibernate_sequence;

select * from dataelement order by
dataelementid desc;



SELECT last_value FROM trackedentityinstance_sequence;
ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 250451;

SELECT last_value FROM programinstance_sequence;
ALTER SEQUENCE programinstance_sequence RESTART WITH 250451;

SELECT last_value FROM programstageinstance_sequence;
ALTER SEQUENCE programstageinstance_sequence RESTART WITH 250451;

SELECT last_value FROM trackedentitydatavalueaudit_sequence;
ALTER SEQUENCE trackedentitydatavalueaudit_sequence RESTART WITH 250451;

SELECT last_value FROM hibernate_sequence;
ALTER SEQUENCE hibernate_sequence RESTART WITH 250451;


select * from trackedentityprogramowner
order by trackedentityprogramownerid desc;




select * from trackedentitydatavalueaudit
order by trackedentitydatavalueauditid desc;

select * from trackedentitydatavalueaudit 
where trackedentitydatavalueauditid = 63775


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




-- nepal hmis user details

select userinfoid,uid,surname,firstname,username, 
lastlogin, EXTRACT(year FROM AGE(current_date,lastlogin::date))::int
from userinfo where lastlogin is not null 
and EXTRACT(year FROM AGE(current_date,lastlogin::date))::int <2; -- 2514

select userinfoid,uid,surname,firstname,username, 
lastlogin, EXTRACT(year FROM AGE(current_date,lastlogin::date))::int
from userinfo 
where EXTRACT(year FROM AGE(current_date,lastlogin::date))::int >=2; -- 566

select userinfoid,uid,surname,firstname,username, 
lastlogin, EXTRACT(year FROM AGE(current_date,lastlogin::date))::int
from userinfo where lastlogin is null; -- 9267

--where lastlogin is null;
--EXTRACT(year FROM AGE(current_date,lastlogin::date))::int

select * from userinfo; -- 12347


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

SELECT pg_size_pretty( pg_database_size('dhis2_Training') );

-- table size 

SELECT pg_size_pretty (pg_total_relation_size (' programinstanceaudit '));
select pg_relation_size('dataelement');

select pg_relation_size('audit');
SELECT pg_size_pretty (pg_total_relation_size (' audit '));

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


-- for nepal HMIS analytics issue 26/04/2024

-- for analytics issue resolved 26/04/2024

select * from periodtype where 
name = 'QuarterlyNov';

delete from periodtype where 
name = 'QuarterlyNov';

select psi.executiondate from programstageinstance psi where
(EXTRACT(year from psi.executiondate) < 1990 
 or EXTRACT(year from psi.executiondate) > 2029);
 
select * from programstageinstance where  
executiondate = '2073-04-27 00:00:00';

select * from programstageinstance
where programstageinstanceid = 49751;

delete from programstageinstance where  
executiondate = '2073-04-27 00:00:00';


select * from categorycombo where uid = 'NtPHEnijTbP';


select pe.*,pt.name from period pe
INNER JOIN periodtype pt ON pt.periodtypeid = pe.periodtypeid

where startdate = '2020-05-04'
and enddate = '2020-05-10'

select * from period where startdate = '2020-05-04'
and enddate = '2020-05-10'

select count(*) from datavalue where periodid
in ( 28285224, 8081577, 2335027  )

delete from period where periodid
in ( 28285224, 8081577, 2335027 );

select pe.*,pt.name from period pe
INNER JOIN periodtype pt ON pt.periodtypeid = pe.periodtypeid

select pe.*,pt.name from period pe
INNER JOIN periodtype pt ON pt.periodtypeid = pe.periodtypeid
where pe.periodid in (
6054162,8081584,19486351,7148476,7306270,7430093,
9113203,9207255,9207256,9394669,11291776,11716854,
11858212,11968826,12539130,12817682,13294579,11830456,
19486344,13963452,14001456,14001459,14160575,11716863,
14429966,14432653,14438064,14582638,14735794,5677008,
14735825,14735829,14735832,14742863,14743679,8990502,
14744059,14768805,14806118,14806403,14823646,7711224,
14979267,15063608,15164127,15362848,15635082,5529311,
18800290,15757512,16007059,19486330,19486348,5527190,
16146250,16173043,16257771,19601118,16356870,5527189,
16389639,16390486,19757547,16492287,16492289,8081580,
16492290,16492291,16492292,16492293,16492294,8081542,
16492295,16492296,16492297,16492298,16492299,2335027,
16492300,16492301,16492302,16492303,16492304,16492306,
16492305,16492311,16492310,16492309,16492308,16492307,
16492317,16492316,16492315,16492314,16492313,16492312,
16492335,16492334,16492333,16492332,16492331,16492330,
16732836,16524494,16524465,16505199,16492337,16492336,
20928823,20217956,20086773,16935668,16835805,16776326,
25222511,24051820,21799450,21777947,21367010,21200138,
28264116,27588075,26833464,26751109,26330456,25812300,
28285224,28285042,28284692,28284438,28284246,28281289,
16492329,16492328,16492327,16492326,16492325,16492324,
16492323,16492322,16492321,16492320,16492319,16492318,
8081577);
--

delete from visualization_periods where periodid in (
6054162,8081584,19486351,7148476,7306270,7430093,
9113203,9207255,9207256,9394669,11291776,11716854,
11858212,11968826,12539130,12817682,13294579,11830456,
19486344,13963452,14001456,14001459,14160575,11716863,
14429966,14432653,14438064,14582638,14735794,5677008,
14735825,14735829,14735832,14742863,14743679,8990502,
14744059,14768805,14806118,14806403,14823646,7711224,
14979267,15063608,15164127,15362848,15635082,5529311,
18800290,15757512,16007059,19486330,19486348,5527190,
16146250,16173043,16257771,19601118,16356870,5527189,
16389639,16390486,19757547,16492287,16492289,8081580,
16492290,16492291,16492292,16492293,16492294,8081542,
16492295,16492296,16492297,16492298,16492299,2335027,
16492300,16492301,16492302,16492303,16492304,16492306,
16492305,16492311,16492310,16492309,16492308,16492307,
16492317,16492316,16492315,16492314,16492313,16492312,
16492335,16492334,16492333,16492332,16492331,16492330,
16732836,16524494,16524465,16505199,16492337,16492336,
20928823,20217956,20086773,16935668,16835805,16776326,
25222511,24051820,21799450,21777947,21367010,21200138,
28264116,27588075,26833464,26751109,26330456,25812300,
28285224,28285042,28284692,28284438,28284246,28281289,
16492329,16492328,16492327,16492326,16492325,16492324,
16492323,16492322,16492321,16492320,16492319,16492318,
8081577);

select * from visualization_periods
where periodid = 16492299;


INFO  2024-04-26T18:02:50,673 Generating resource table: '_periodstructure' (JdbcResourceTableStore.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,305 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,307 period, ignoring: start date 2020-05-04, end date: 2020-05-10, period ID: 8081577 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,407 Duplicate ISO date for period, ignoring: 2075July, ISO date: 2075July (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,408 period, ignoring: start date 2018-08-18, end date: 2019-08-17, period ID: 2335027 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,483 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,484 period, ignoring: start date 2020-05-25, end date: 2020-05-31, period ID: 8081542 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,504 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,504 period, ignoring: start date 2020-04-27, end date: 2020-05-03, period ID: 8081580 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,670 Duplicate ISO date for period, ignoring: 2075BiW2019, ISO date: 2075BiW2019 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,670 period, ignoring: start date 2019-03-16, end date: 2019-03-29, period ID: 5527189 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,671 Duplicate ISO date for period, ignoring: 2075BiW2019, ISO date: 2075BiW2019 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,671 period, ignoring: start date 2019-03-02, end date: 2019-03-15, period ID: 5527190 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,672 Duplicate ISO date for period, ignoring: 2076W2020, ISO date: 2076W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,672 period, ignoring: start date 2020-04-12, end date: 2020-04-18, period ID: 5529311 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,718 Duplicate ISO date for period, ignoring: 2076W2019, ISO date: 2076W2019 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,718 period, ignoring: start date 2019-06-09, end date: 2019-06-15, period ID: 5677008 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,742 Duplicate ISO date for period, ignoring: 2076SunW2020, ISO date: 2076SunW2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,742 period, ignoring: start date 2020-04-12, end date: 2020-04-18, period ID: 6054162 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,748 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,749 period, ignoring: start date 2020-04-20, end date: 2020-04-26, period ID: 8081584 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,750 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,751 period, ignoring: start date 2022-09-22, end date: 2022-09-28, period ID: 19486351 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,828 Duplicate ISO date for period, ignoring: 2075W2019, ISO date: 2075W2019 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,829 period, ignoring: start date 2019-04-06, end date: 2019-04-12, period ID: 7148476 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,863 Duplicate ISO date for period, ignoring: 2076W2020, ISO date: 2076W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,863 period, ignoring: start date 2020-03-29, end date: 2020-04-04, period ID: 7306270 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,891 Duplicate ISO date for period, ignoring: 2076W2020, ISO date: 2076W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,891 period, ignoring: start date 2020-03-08, end date: 2020-03-14, period ID: 7430093 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,917 Duplicate ISO date for period, ignoring: 2076BiW2020, ISO date: 2076BiW2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:51,918 period, ignoring: start date 2020-02-16, end date: 2020-02-29, period ID: 7711224 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,030 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,031 period, ignoring: start date 2020-09-21, end date: 2020-09-27, period ID: 8990502 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,071 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,071 period, ignoring: start date 2021-04-05, end date: 2021-04-11, period ID: 9113203 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,072 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,072 period, ignoring: start date 2020-09-14, end date: 2020-09-20, period ID: 9207255 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,072 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,072 period, ignoring: start date 2020-08-10, end date: 2020-08-16, period ID: 9207256 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,073 Duplicate ISO date for period, ignoring: 2077W2020, ISO date: 2077W2020 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,074 period, ignoring: start date 2020-10-12, end date: 2020-10-18, period ID: 9394669 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,220 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,221 period, ignoring: start date 2021-02-08, end date: 2021-02-14, period ID: 11291776 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,236 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,236 period, ignoring: start date 2021-02-22, end date: 2021-02-28, period ID: 11716854 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,237 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,237 period, ignoring: start date 2021-02-15, end date: 2021-02-21, period ID: 11716863 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,288 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,288 period, ignoring: start date 2021-03-15, end date: 2021-03-21, period ID: 11830456 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,303 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,304 period, ignoring: start date 2021-03-22, end date: 2021-03-28, period ID: 11858212 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,318 Duplicate ISO date for period, ignoring: 2077SunW2021, ISO date: 2077SunW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,318 period, ignoring: start date 2021-02-15, end date: 2021-02-21, period ID: 11968826 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,437 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,437 period, ignoring: start date 2021-04-28, end date: 2021-05-04, period ID: 12539130 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,464 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,465 period, ignoring: start date 2021-04-21, end date: 2021-04-27, period ID: 12817682 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,494 Duplicate ISO date for period, ignoring: 2077W2021, ISO date: 2077W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,495 period, ignoring: start date 2021-04-14, end date: 2021-04-20, period ID: 13294579 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,561 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,561 period, ignoring: start date 2022-09-08, end date: 2022-09-14, period ID: 19486344 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,585 Duplicate ISO date for period, ignoring: 2078ThuW2022, ISO date: 2078ThuW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,586 period, ignoring: start date 2022-01-05, end date: 2022-01-11, period ID: 13963452 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,618 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,619 period, ignoring: start date 2021-10-27, end date: 2021-11-02, period ID: 14001456 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,619 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,619 period, ignoring: start date 2021-10-06, end date: 2021-10-12, period ID: 14001459 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,642 Duplicate ISO date for period, ignoring: 2078BiW2021, ISO date: 2078BiW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,643 period, ignoring: start date 2021-09-15, end date: 2021-09-28, period ID: 14160575 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,682 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,683 period, ignoring: start date 2021-11-17, end date: 2021-11-23, period ID: 14429966 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,684 Duplicate ISO date for period, ignoring: 2078SunW2021, ISO date: 2078SunW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,684 period, ignoring: start date 2021-12-15, end date: 2021-12-21, period ID: 14432653 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,685 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,685 period, ignoring: start date 2021-12-01, end date: 2021-12-07, period ID: 14438064 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,686 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,686 period, ignoring: start date 2021-11-24, end date: 2021-11-30, period ID: 14582638 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,701 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,701 period, ignoring: start date 2022-01-05, end date: 2022-01-11, period ID: 14735794 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,702 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,703 period, ignoring: start date 2021-12-29, end date: 2022-01-04, period ID: 14735825 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,703 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,704 period, ignoring: start date 2022-01-12, end date: 2022-01-18, period ID: 14735829 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,704 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,705 period, ignoring: start date 2022-01-19, end date: 2022-01-25, period ID: 14735832 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,705 Duplicate ISO date for period, ignoring: 2078BiW2021, ISO date: 2078BiW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,706 period, ignoring: start date 2021-09-01, end date: 2021-09-14, period ID: 14742863 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,706 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,707 period, ignoring: start date 2021-07-21, end date: 2021-07-27, period ID: 14743679 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,708 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,708 period, ignoring: start date 2021-12-15, end date: 2021-12-21, period ID: 14744059 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,709 Duplicate ISO date for period, ignoring: 2078ThuW2022, ISO date: 2078ThuW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,709 period, ignoring: start date 2022-03-09, end date: 2022-03-15, period ID: 14768805 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,722 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,723 period, ignoring: start date 2022-01-19, end date: 2022-01-25, period ID: 14806118 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,723 Duplicate ISO date for period, ignoring: 2078BiW2022, ISO date: 2078BiW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,723 period, ignoring: start date 2022-01-19, end date: 2022-02-01, period ID: 14806403 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,729 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,729 period, ignoring: start date 2022-02-02, end date: 2022-02-08, period ID: 14823646 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,730 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,731 period, ignoring: start date 2022-02-16, end date: 2022-02-22, period ID: 14979267 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,734 Duplicate ISO date for period, ignoring: 2078BiW2022, ISO date: 2078BiW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,735 period, ignoring: start date 2022-02-02, end date: 2022-02-15, period ID: 15063608 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,735 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,735 period, ignoring: start date 2021-12-22, end date: 2021-12-28, period ID: 15164127 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,744 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,744 period, ignoring: start date 2022-03-09, end date: 2022-03-15, period ID: 15362848 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,748 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,748 period, ignoring: start date 2021-11-03, end date: 2021-11-09, period ID: 15635082 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,771 Duplicate ISO date for period, ignoring: 2079BiW2022, ISO date: 2079BiW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,772 period, ignoring: start date 2022-09-01, end date: 2022-09-14, period ID: 18800290 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,821 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,821 period, ignoring: start date 2022-03-30, end date: 2022-04-05, period ID: 15757512 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,867 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,868 period, ignoring: start date 2022-04-28, end date: 2022-05-04, period ID: 16007059 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,898 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,898 period, ignoring: start date 2022-08-25, end date: 2022-08-31, period ID: 19486330 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,899 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,899 period, ignoring: start date 2022-09-15, end date: 2022-09-21, period ID: 19486348 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,900 Duplicate ISO date for period, ignoring: 2078BiW2022, ISO date: 2078BiW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,900 period, ignoring: start date 2022-02-16, end date: 2022-03-01, period ID: 16146250 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,903 Duplicate ISO date for period, ignoring: 2079BiW2023, ISO date: 2079BiW2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,903 period, ignoring: start date 2023-03-30, end date: 2023-04-12, period ID: 16173043 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,918 Duplicate ISO date for period, ignoring: 2078BiW2021, ISO date: 2078BiW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,918 period, ignoring: start date 2021-07-07, end date: 2021-07-20, period ID: 16257771 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,929 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,930 period, ignoring: start date 2022-11-17, end date: 2022-11-23, period ID: 19601118 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,952 Duplicate ISO date for period, ignoring: 2079BiW2022, ISO date: 2079BiW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,952 period, ignoring: start date 2022-05-12, end date: 2022-05-25, period ID: 16356870 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,971 Duplicate ISO date for period, ignoring: 2078SatW2022, ISO date: 2078SatW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,972 period, ignoring: start date 2022-04-14, end date: 2022-04-20, period ID: 16389639 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,973 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,973 period, ignoring: start date 2022-04-21, end date: 2022-04-27, period ID: 16390486 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,974 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:52,974 period, ignoring: start date 2022-12-01, end date: 2022-12-07, period ID: 19757547 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,000 Duplicate ISO date for period, ignoring: 2077WedW2021, ISO date: 2077WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,000 period, ignoring: start date 2021-04-14, end date: 2021-04-20, period ID: 16492287 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,004 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,004 period, ignoring: start date 2021-04-28, end date: 2021-05-04, period ID: 16492289 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,004 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,005 period, ignoring: start date 2021-05-05, end date: 2021-05-11, period ID: 16492290 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,005 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,005 period, ignoring: start date 2021-05-12, end date: 2021-05-18, period ID: 16492291 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,006 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,006 period, ignoring: start date 2021-05-19, end date: 2021-05-25, period ID: 16492292 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,006 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,006 period, ignoring: start date 2021-05-26, end date: 2021-06-01, period ID: 16492293 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,007 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,007 period, ignoring: start date 2021-06-02, end date: 2021-06-08, period ID: 16492294 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,008 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,008 period, ignoring: start date 2021-06-09, end date: 2021-06-15, period ID: 16492295 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,008 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,008 period, ignoring: start date 2021-06-16, end date: 2021-06-22, period ID: 16492296 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,009 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,009 period, ignoring: start date 2021-06-23, end date: 2021-06-29, period ID: 16492297 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu



* WARN  2024-04-26T18:02:53,010 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,010 period, ignoring: start date 2021-06-30, end date: 2021-07-06, period ID: 16492298 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,010 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,010 period, ignoring: start date 2021-07-07, end date: 2021-07-13, period ID: 16492299 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,011 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,011 period, ignoring: start date 2021-07-14, end date: 2021-07-20, period ID: 16492300 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,011 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,012 period, ignoring: start date 2021-07-21, end date: 2021-07-27, period ID: 16492301 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,012 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,012 period, ignoring: start date 2021-07-28, end date: 2021-08-03, period ID: 16492302 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,013 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,013 period, ignoring: start date 2021-08-04, end date: 2021-08-10, period ID: 16492303 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,013 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,013 period, ignoring: start date 2021-08-11, end date: 2021-08-17, period ID: 16492304 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,014 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,014 period, ignoring: start date 2021-08-18, end date: 2021-08-24, period ID: 16492305 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,015 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu





* WARN  2024-04-26T18:02:53,015 period, ignoring: start date 2021-08-25, end date: 2021-08-31, period ID: 16492306 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,015 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,015 period, ignoring: start date 2021-09-01, end date: 2021-09-07, period ID: 16492307 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,016 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,016 period, ignoring: start date 2021-09-08, end date: 2021-09-14, period ID: 16492308 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,016 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,016 period, ignoring: start date 2021-09-15, end date: 2021-09-21, period ID: 16492309 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,017 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,017 period, ignoring: start date 2021-09-22, end date: 2021-09-28, period ID: 16492310 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,017 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,017 period, ignoring: start date 2021-09-29, end date: 2021-10-05, period ID: 16492311 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,018 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,018 period, ignoring: start date 2021-10-06, end date: 2021-10-12, period ID: 16492312 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,018 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,019 period, ignoring: start date 2021-10-13, end date: 2021-10-19, period ID: 16492313 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,019 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,019 period, ignoring: start date 2021-10-20, end date: 2021-10-26, period ID: 16492314 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,020 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,020 period, ignoring: start date 2021-10-27, end date: 2021-11-02, period ID: 16492315 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,020 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,020 period, ignoring: start date 2021-11-03, end date: 2021-11-09, period ID: 16492316 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,021 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,021 period, ignoring: start date 2021-11-10, end date: 2021-11-16, period ID: 16492317 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,021 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,021 period, ignoring: start date 2021-11-17, end date: 2021-11-23, period ID: 16492318 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,022 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,022 period, ignoring: start date 2021-11-24, end date: 2021-11-30, period ID: 16492319 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,022 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,023 period, ignoring: start date 2021-12-01, end date: 2021-12-07, period ID: 16492320 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,023 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,023 period, ignoring: start date 2021-12-08, end date: 2021-12-14, period ID: 16492321 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,024 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,024 period, ignoring: start date 2021-12-15, end date: 2021-12-21, period ID: 16492322 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,024 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,024 period, ignoring: start date 2021-12-22, end date: 2021-12-28, period ID: 16492323 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,025 Duplicate ISO date for period, ignoring: 2078WedW2021, ISO date: 2078WedW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,025 period, ignoring: start date 2021-12-29, end date: 2022-01-04, period ID: 16492324 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,025 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,025 period, ignoring: start date 2022-01-05, end date: 2022-01-11, period ID: 16492325 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,026 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,026 period, ignoring: start date 2022-01-12, end date: 2022-01-18, period ID: 16492326 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,026 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,027 period, ignoring: start date 2022-01-26, end date: 2022-02-01, period ID: 16492327 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,027 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,027 period, ignoring: start date 2022-02-02, end date: 2022-02-08, period ID: 16492328 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,028 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,028 period, ignoring: start date 2022-02-09, end date: 2022-02-15, period ID: 16492329 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,028 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,028 period, ignoring: start date 2022-02-16, end date: 2022-02-22, period ID: 16492330 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,029 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,029 period, ignoring: start date 2022-02-23, end date: 2022-03-01, period ID: 16492331 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,029 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,029 period, ignoring: start date 2022-03-02, end date: 2022-03-08, period ID: 16492332 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,030 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,030 period, ignoring: start date 2022-03-09, end date: 2022-03-15, period ID: 16492333 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,031 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,031 period, ignoring: start date 2022-03-16, end date: 2022-03-22, period ID: 16492334 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,031 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,031 period, ignoring: start date 2022-03-23, end date: 2022-03-29, period ID: 16492335 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,032 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,032 period, ignoring: start date 2022-03-30, end date: 2022-04-05, period ID: 16492336 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,032 Duplicate ISO date for period, ignoring: 2078WedW2022, ISO date: 2078WedW2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,032 period, ignoring: start date 2022-04-06, end date: 2022-04-12, period ID: 16492337 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,033 Duplicate ISO date for period, ignoring: 2078BiW2021, ISO date: 2078BiW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,033 period, ignoring: start date 2021-11-24, end date: 2021-12-07, period ID: 16505199 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,043 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,043 period, ignoring: start date 2022-05-12, end date: 2022-05-18, period ID: 16524465 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,043 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,043 period, ignoring: start date 2022-04-14, end date: 2022-04-20, period ID: 16524494 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,066 Duplicate ISO date for period, ignoring: 2078W2022, ISO date: 2078W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,066 period, ignoring: start date 2022-02-23, end date: 2022-03-01, period ID: 16732836 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,067 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,067 period, ignoring: start date 2022-06-09, end date: 2022-06-15, period ID: 16776326 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,067 Duplicate ISO date for period, ignoring: 2078W2021, ISO date: 2078W2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,068 period, ignoring: start date 2021-06-23, end date: 2021-06-29, period ID: 16835805 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,068 Duplicate ISO date for period, ignoring: 2077BiW2021, ISO date: 2077BiW2021 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,068 period, ignoring: start date 2021-03-29, end date: 2021-04-11, period ID: 16935668 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,076 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,076 period, ignoring: start date 2023-01-26, end date: 2023-02-01, period ID: 20086773 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,093 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,093 period, ignoring: start date 2023-04-06, end date: 2023-04-12, period ID: 20217956 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,151 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,151 period, ignoring: start date 2023-02-09, end date: 2023-02-15, period ID: 20928823 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,171 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu

* WARN  2024-04-26T18:02:53,171 period, ignoring: start date 2023-03-02, end date: 2023-03-08, period ID: 21200138 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,190 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,190 period, ignoring: start date 2023-03-09, end date: 2023-03-15, period ID: 21367010 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,237 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,237 period, ignoring: start date 2023-02-16, end date: 2023-02-22, period ID: 21777947 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,238 Duplicate ISO date for period, ignoring: 2079W2023, ISO date: 2079W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,238 period, ignoring: start date 2023-04-14, end date: 2023-04-20, period ID: 21799450 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,450 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,450 period, ignoring: start date 2023-05-26, end date: 2023-06-01, period ID: 24051820 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,529 Duplicate ISO date for period, ignoring: 2080W2024, ISO date: 2080W2024 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,530 period, ignoring: start date 2024-03-08, end date: 2024-03-14, period ID: 25222511 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,869 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,870 period, ignoring: start date 2023-08-11, end date: 2023-08-17, period ID: 25812300 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,902 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:53,902 period, ignoring: start date 2023-08-25, end date: 2023-08-31, period ID: 26330456 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,006 Duplicate ISO date for period, ignoring: 2079W2022, ISO date: 2079W2022 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,006 period, ignoring: start date 2022-12-15, end date: 2022-12-21, period ID: 26751109 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,052 Duplicate ISO date for period, ignoring: 2080WedW2023, ISO date: 2080WedW2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,052 period, ignoring: start date 2023-12-01, end date: 2023-12-07, period ID: 26833464 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,197 Duplicate ISO date for period, ignoring: 2080BiW2024, ISO date: 2080BiW2024 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,197 period, ignoring: start date 2024-03-15, end date: 2024-03-28, period ID: 27588075 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,252 Duplicate ISO date for period, ignoring: 2080SunW2023, ISO date: 2080SunW2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,253 period, ignoring: start date 2023-10-06, end date: 2023-10-12, period ID: 28264116 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,260 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,260 period, ignoring: start date 2023-12-15, end date: 2023-12-21, period ID: 28281289 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,261 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,261 period, ignoring: start date 2023-12-08, end date: 2023-12-14, period ID: 28284246 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,261 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,262 period, ignoring: start date 2023-12-01, end date: 2023-12-07, period ID: 28284438 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,262 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,262 period, ignoring: start date 2023-11-24, end date: 2023-11-30, period ID: 28284692 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,263 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,263 period, ignoring: start date 2023-11-17, end date: 2023-11-23, period ID: 28285042 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,263 Duplicate ISO date for period, ignoring: 2080W2023, ISO date: 2080W2023 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu
* WARN  2024-04-26T18:02:54,263 period, ignoring: start date 2023-11-03, end date: 2023-11-09, period ID: 28285224 (PeriodResourceTable.java [taskScheduler-16]) UID:BMNA1dYAAzu




-- A way to confirm the list of current existing years that are used during the Analytics Export process is running this query:
-- wrong period issue in run analytics
( select distinct (extract(year
from pe.startdate)) as datayear ,pe.periodid
from period pe )
union 
( select distinct (extract(year
from pe.enddate)) as datayear,pe.periodid
from period pe )

order by
datayear desc;

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


-- for myanmar event instance issue in add tracker-program -- 28/02/2024

-- 1) 
ALTER TABLE program_attributes
DROP CONSTRAINT programattributeid;

-- 2) 
ALTER TABLE program_attributes DROP constraint
fk_program_attributeid;

-- 3) 
ALTER TABLE program_attributes DROP constraint
program_attributes_pkey CASCADE;

-- 4) 
ALTER TABLE program_attributes add constraint
program_attributes_pkey primary key(programtrackedentityattributeid);

-- 5) 
ALTER TABLE program_attributes
ADD CONSTRAINT fk_program_attributeid
FOREIGN KEY (trackedentityattributeid) 
REFERENCES trackedentityattribute (trackedentityattributeid);

-- 6) 
ALTER TABLE programtrackedentityattributegroupmembers
ADD CONSTRAINT fk_programtrackedentityattributegroupmembers_attributeid
FOREIGN KEY (programtrackedentityattributeid) 
REFERENCES program_attributes (programtrackedentityattributeid);


SELECT dataelement.dataelementid,dataelement.uid,
dataelement.name, de_translation.value,de_translation.locale,de_translation.property
FROM dataelement, jsonb_to_recordset(dataelement.translations) 
AS de_translation(value TEXT, locale TEXT, property TEXT)
WHERE de_translation.locale = 'my' and de_translation.property = 'NAME';


SELECT dataelement.dataelementid,dataelement.uid,
dataelement.name, de_translation.value,de_translation.locale,de_translation.property
FROM dataelement, jsonb_to_recordset(dataelement.translations) 
AS de_translation(value TEXT, locale TEXT, property TEXT)
WHERE de_translation.locale = 'my' and de_translation.property in( 'NAME','FORM_NAME','SHORT_NAME','DESCRIPTION');

SELECT dataelement.dataelementid,dataelement.uid,
dataelement.name, de_translation.value,de_translation.locale,de_translation.property
FROM dataelement, jsonb_to_recordset(dataelement.translations) 
AS de_translation(value TEXT, locale TEXT, property TEXT)
WHERE de_translation.property in( 'NAME','FORM_NAME','SHORT_NAME','DESCRIPTION');


SELECT *
FROM 
  dataelement, 
  jsonb_to_recordset(dataelement.translations) AS specs(value TEXT, locale TEXT,property TEXT)
WHERE 
  specs.locale = 'my'
  
SELECT * from jsonb_array_elements('[{"a":"apple", "b":"biscuit"}]');



select messageconversationid, count(messageconversationid)
from messageconversation group by messageconversationid
having count(messageconversationid) = 1
order by messageconversationid;
