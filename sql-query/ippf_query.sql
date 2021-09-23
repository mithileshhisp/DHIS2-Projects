
-- run on fpab instance http://fpabmis.org.bd/fpab // 15/09/2021

select * from dataelement where uid = 'ihxsW8Cy2sp'	1329

select * from dataelement where uid = 'VEbx2JTQATX' 1330

select * from datavalue where dataelementid = 1329 and sourceid in ( select 
organisationunitid from orgunitgroupmembers where orgunitgroupid = 490 );

select * from orgunitgroup where uid = 'GhuHmwRnPBs'

select * from orgunitgroupmembers where orgunitgroupid = 490;

update datavalue set dataelementid = 1330 where dataelementid = 1329 and sourceid in ( select 
organisationunitid from orgunitgroupmembers where orgunitgroupid = 490 ); -- 610 records