#!/bin/sh
#

export PGPASSWORD="dhis@hisp"
pg_dump -U dhis mwmis_odhisa_24112017 |gzip -9  > /home/akash/dbbackup/MWMIS_Odhisa/mwmis_odhisa_24112017_`date +%b-%d-%y`.sql.gz

