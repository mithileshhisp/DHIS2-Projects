
-- fpan 

select * from dataelement where uid = 'RdMXoQJeHPh';

select * from orgunitgroup where uid = 'GhuHmwRnPBs'

select * from orgunitgroupmembers where orgunitgroupid = 490;

de - 1689099

female	7731	7724	7732	7727	7713	7723	7722	7715	7739	7730
male	7717	7726	7729	7741	7716	7734	7740	7737	7712	7728

select * from period where startdate > '2020-01-01' and enddate <= '2021-01-31' and 
periodtypeid = 2;

and categoryoptioncomboid = 7731 

select * from periodtype;
wee - 2
monthly - 3

SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid = 'MIck76UldLx' and dv.periodid in (select periodid from period where startdate >= '2021-01-01' 
and enddate <= '2021-12-31' and periodtypeid = 3 )and dv.value is not null and dv.deleted = false;


select * from datavalue where dataelementid = 1689099 and categoryoptioncomboid in( 
7731,7724,7732,7727,7713,7723,7722,7715,7739,7730)
and periodid in (select periodid from period where startdate > '2020-01-01' 
and enddate <= '2020-12-31' ) and sourceid in (select organisationunitid 
from orgunitgroupmembers where orgunitgroupid = 490);

update datavalue set categoryoptioncomboid = 7728 where dataelementid = 1689099 
and categoryoptioncomboid = 7730 and periodid in (select periodid from period 
where startdate > '2019-01-01' and enddate <= '2019-12-31' ) 
and sourceid in (select organisationunitid 
from orgunitgroupmembers where orgunitgroupid = 490);

delete from datavalue where dataelementid = 1689099 and categoryoptioncomboid = 7715
and periodid in (select periodid from period where startdate > '2021-01-01' 
and enddate <= '2021-12-31' and periodtypeid = 3 ) and sourceid in (select organisationunitid 
from orgunitgroupmembers where orgunitgroupid = 490);


-- 04/02/2022 for update dataset attribite and expirydays and davalue to attributecomboid

update dataset set categorycomboid = 9435067 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);

update dataset set expirydays = 0 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);

select * from datavalue where dataelementid in ( select dataelementid from
datasetelement where datasetid = 9369165) and periodid in (select periodid 
from period where startdate >= '2021-01-01' and enddate <= '2021-12-31' and 
periodtypeid = 3) and sourceid in (select sourceid 
from datasetsource where datasetid = 9369165);

update datavalue set attributeoptioncomboid = 9435068 where dataelementid in ( select dataelementid from
datasetelement where datasetid = 9369165) and periodid in (select periodid 
from period where startdate >= '2021-01-01' and enddate <= '2021-12-31' and 
periodtypeid = 3) and sourceid in (select sourceid 
from datasetsource where datasetid = 9369165);

-- 08/02/2022 for rollbackup change done on 04/02/2022

select count(*) from datavalue where attributeoptioncomboid = 9435068; -- 522384

update dataset set categorycomboid = 14 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);

update dataset set expirydays = 30 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);


update datavalue set attributeoptioncomboid = 15 where dataelementid in ( select dataelementid from
datasetelement where datasetid in( 9369165,9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170 )) and periodid in (select periodid 
from period where startdate >= '2021-01-01' and enddate <= '2021-12-31' and 
periodtypeid = 3); -- 546991


delete from datavalue where attributeoptioncomboid = 9435068; -- 483 enter on date 08/02/2022

-- 10/02/2023  IPPF fpop Philippines delete query

delete from visualization_datadimensionitems where datadimensionitemid in (
select datadimensionitemid from datadimensionitem where datasetid in ( 5343,9369157) );

delete from datadimensionitem where datasetid in ( 5343,9369157);
delete from datainputperiod where datasetid in ( 5343,9369157);
delete from lockexception where datasetid in ( 5343,9369157);
delete from dataset where datasetid in ( 5343,9369157);

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';


-- ippf she_maldives upgrade from 2.34 to 2.38 03/03/2023

delete from audit;
delete from messageconversation_messages;	
delete from messageconversation_usermessages;
delete from usermessage;
delete from messageconversation;
delete from message;

-- upgrade from 2.34 to 2.38

-- direct run the war file of 2.38 not 2.34/2.35/2.36/2.37
-- run the following queries

-- and run the script in side file -- V2_37_17__Remove_Chart_and_ReportTable.sql
-- location of file is dhis-2\dhis-support\dhis-support-db-migration\src\main\resources\org\hisp\dhis\db\migration\2.37
DROP TABLE IF EXISTS  dashboarditem_reporttables;
delete from flyway_schema_history where installed_rank = 199;

update flyway_schema_history set checksum = 172668348
where installed_rank = 199; -- 2.37.17 V2_37_17__Remove_Chart_and_ReportTable.sql


-- ippf_Philippines_FPOP delete 30/03/2023

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';

-- tracker-data clean

-- aggregated data delete
   delete from datavalue;
   delete from datavalueaudit;
   delete from completedatasetregistration;
   
-- trcaker related meta data

select * from dataelement where domaintype = 'TRACKER';


delete from program_organisationunits;
delete from programstagedataelement;
delete from programstagesection;
delete from programstagesection_dataelements;

delete from mapview_columns where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_dataelementdimensions where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_filters where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_organisationunits where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapmapviews where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview where programstageid in (
select programstageid from programstage);

delete from programstage;
delete from program_userroles;
delete from programrule;
delete from programruleaction;
delete from programrulevariable;
delete from program_attributes;

delete from periodboundary where programindicatorid in (
select programindicatorid from programindicator where programid in (
select programid from program));

delete from programindicator;
delete from program;

delete from trackedentityattribute;

select * from dataelement where domaintype = 'TRACKER';

delete from trackedentitydataelementdimension where 
dataelementid in (select dataelementid from 
dataelement where domaintype = 'TRACKER');


delete from dataelement where domaintype = 'TRACKER';

-- https://www.pkbidhis.org/ippf-indonesia   delete 30/03/2023

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';

-- tracker-data clean

-- aggregated data delete
   delete from datavalue;
   delete from datavalueaudit;
   delete from completedatasetregistration;
   
-- trcaker related meta data

-- trcaker related meta data

select * from dataelement where domaintype = 'TRACKER';


delete from program_organisationunits;
delete from programstagedataelement;
delete from programstagesection;
delete from programstagesection_dataelements;

delete from mapview_columns where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_dataelementdimensions where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_filters where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_organisationunits where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapmapviews where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview where programstageid in (
select programstageid from programstage);

delete from programstage;
delete from program_userroles;
delete from programrule;
delete from programruleaction;
delete from programrulevariable;
delete from program_attributes;

delete from periodboundary where programindicatorid in (
select programindicatorid from programindicator where programid in (
select programid from program));

delete from programindicator;
delete from program;

delete from trackedentityattribute;

select * from dataelement where domaintype = 'TRACKER';

delete from trackedentitydataelementdimension where 
dataelementid in (select dataelementid from 
dataelement where domaintype = 'TRACKER');

-- fpanpro delete all ASR related dataelement and indicators 31/03/2023

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';