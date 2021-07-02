#!/bin/sh
#
# Note this script is designed to be run from postgres crontab

#export PGPASSWORD='dhis@09$16'
#pg_dump -U dhis uphmis_230 |gzip -9  > /var/dhis/Backup/DB/uphmis_230_`date +%b-%d-%y`.sql.gz

DATE=$(date  +%b-%d-%y)
pg_dump -T "analytics_*" uphmis_225 -Fc  > /DATA/DHIS/Backup/DB/uphmis_$DATE.dump

