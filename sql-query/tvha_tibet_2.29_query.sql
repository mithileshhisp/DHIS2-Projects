

select * from 	userkeyjsonvalue where uid = 'w4UBiJZHcGx';
select * from 	userkeyjsonvalue where userid = 914627; -- hispdev

select * from program where uid = 'w4UBiJZHcGx'
	
select * from userinfo where userinfoid in ( 12469071, 914627 )	;

select * from usersetting where name = 'keyTrackerDashboardLayout';
delete from usersetting where name = 'keyTrackerDashboardLayout';

select * from keyjsonvalue;
delete from keyjsonvalue;

select * from systemsetting where name  = 'keyTrackerDashboardDefaultLayout';	
delete from systemsetting where name  = 'keyTrackerDashboardDefaultLayout';	


-- tei custom id generation sql-view
-- tei count
SELECT COUNT(tei.trackedentityinstanceid) from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE orgUnit.uid = 'vIgNxEEW4po' and prg.uid = 'aMCrYXpdUaz' and tei.deleted is false

-- TEI_ID_VALIDATION

SELECT teav.value FROM trackedentityattributevalue teav
INNER JOIN programinstance pi on pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
where teav.trackedentityattributeid = 647 and org.uid = '${orgUnitUid}' and prg.uid = '${programUid}';

-- TEI_COUNT_ORGUNIT_PROGRAM_WISE

SELECT COUNT(tei.trackedentityinstanceid) from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE orgUnit.uid = '${orgUnitUid}' and prg.uid = '${programUid}' and tei.deleted is false;


-- sql-view api

-- https://ln2.hispindia.org/tibet_pro/api/sqlViews/NEPTW9j6eH8/data?var=orgUnitUid:bSoD5eVY3YB&var=programUid:aMCrYXpdUaz&paging=false
-- https://ln2.hispindia.org/tibet_pro/api/sqlViews/Nj2NWSprd89/data?var=orgUnitUid:bSoD5eVY3YB&var=programUid:aMCrYXpdUaz&paging=false

-- get TEI list with doh id 

-- split function
select trackedentityinstanceid, trackedentityattributeid,
value,TRIM(split_part(value, '-', 3)) from trackedentityattributevalue 
where trackedentityattributeid = 647;

="update trackedentityattributevalue set value  = '"&D2&"' where trackedentityinstanceid = "&B2&" and trackedentityattributeid = "&C2&";"

SELECT COUNT(tei.trackedentityinstanceid) from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE orgUnit.uid = 'bSoD5eVY3YB' and prg.uid = 'aMCrYXpdUaz' and tei.deleted is false

SELECT COUNT(pi.trackedentityinstanceid) from programinstance pi
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE orgUnit.uid = 'vIgNxEEW4po' and prg.uid = 'aMCrYXpdUaz' and pi.deleted is false


SELECT  org.organisationunitid,teav.trackedentityinstanceid, teav.value 
FROM trackedentityattributevalue teav
INNER JOIN programinstance pi on pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
where teav.trackedentityattributeid = 647 and 
org.uid = 'bSoD5eVY3YB' and prg.uid = 'aMCrYXpdUaz' and teav.trackedentityinstanceid = 4654718;

select * from trackedentityattributevalue where value = 'BIR-2022-001750';

select * from programinstance where trackedentityinstanceid = 13049154;

select * from trackedentityinstance where trackedentityinstanceid = 13049154;

update programinstance set organisationunitid = 57 where trackedentityinstanceid = 3530087;
update trackedentityinstance set organisationunitid = 57 where trackedentityinstanceid = 3530087;

update programinstance set organisationunitid = 70 where trackedentityinstanceid = 9146255;
update trackedentityinstance set organisationunitid = 70 where trackedentityinstanceid = 9146255;

SELECT  org.organisationunitid,teav.trackedentityinstanceid, teav.value 
FROM trackedentityattributevalue teav
INNER JOIN programinstance pi on pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
where teav.trackedentityattributeid = 647 and 
org.uid in( 'zStQ8malR6D') and prg.uid = 'aMCrYXpdUaz' and pi.status = 'ACTIVE';

zStQ8malR6D

pv5W69yfETB pv5W69yfETB vOUw5M3Cmmh

select * from organisationunit where parentid = 122;
select * from trackedentityattributevalue where value = 'undefined-2020-000001';

select * from programinstance where 
trackedentityinstanceid in( 3874046,6152379,8891837,8891837,
4759814,5183655,317994,9395247,1482285,
625248,5205620,725381,5183630,1625299,799456) 
and organisationunitid != 122 and programid = 4040;

update programinstance set organisationunitid = 122 where 
trackedentityinstanceid in( 3874046,6152379,8891837,8891837,
4759814,5183655,317994,9395247,1482285,
625248,5205620,725381,5183630,1625299,799456) and programid = 4040;

select * from trackedentityinstance where trackedentityinstanceid = 4575939;
3874046,6152379,8891837,8891837,
4759814,5183655,317994,9395247,1482285,
625248,5205620,725381,5183630,1625299,799456


-- dmc 15/09/2022

delete from systemsetting where name = 'keyTrackerDashboardDefaultLayout';
delete from usersetting where userinfoid in ( 536506,536509);	
delete from usersetting where userinfoid in ( 536506 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536506,536509);	

-- 22/11/2022

-- user harkrishanagar
-- password -- 

select * from users where username = 'harkrishanagar';

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536509 );	


-- delete from systemsetting where name = 'keyTrackerDashboardDefaultLayout';
delete from usersetting where userinfoid in ( 536509 );	
delete from usersetting where userinfoid in ( 536509 );	
delete from usersetting where userinfoid in ( 536509 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536509 );


-- as on 02/12/2022

select * from users where username = 'jagera';

select * from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536498 );

delete from programinstance where deleted is true;

delete from programinstanceaudit where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true));

