#!/bin/sh
hostname=`hostname`
export PGPASSWORD='B$120$#89'
##########################################
## DHIS2 Database Backup
## Backup databases: hmisdb
##########################################

# Dump DBs
for db in hmis_new_v234
do
  date=`date +"%Y%m%d_%H%M"`
  filename="/data/dhis/DBBACKUP/DB/${hostname}_${db}_${date}.sql"
  pg_dump -h 127.0.0.1 -U hmis -E UTF-8 -p 5432 -F p -b -f $filename $db
  gzip $filename
done
find /data/dhis/DBBACKUP/DB/* -mtime +120 -exec rm {} \;
exit 0
