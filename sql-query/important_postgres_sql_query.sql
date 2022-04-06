


 -- create user on poatgres
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
