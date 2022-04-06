
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