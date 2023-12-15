-- 11/09/2023

select * from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from 
trackedentityinstance where uid = 'UhQ5msIq9oz') and programid = 1268;

select * from programstageinstance 
where programinstanceid = 539676;

select * from trackedentitydatavalue 
where programstageinstanceid = 17280245;


select * from programstageinstancecomments where
programstageinstanceid in ( select programstageinstanceid from
programstageinstance where programinstanceid = 539676);

select * from trackedentitycomment where trackedentitycommentid in(
select trackedentitycommentid from programstageinstancecomments where
programstageinstanceid in ( select programstageinstanceid from
programstageinstance where programinstanceid = 539676));

select psi.programstageinstanceid,psi.uid, tec.commenttext, 
tec.createddate,tec.creator from  programstageinstance psi
INNER JOIN programstageinstancecomments psic ON psic.programstageinstanceid = psi.programstageinstanceid
INNER JOIN trackedentitycomment tec ON tec.trackedentitycommentid = psic.trackedentitycommentid
where psi.programstageinstanceid in ( select programstageinstanceid from
programstageinstance where programinstanceid = 539676);


select psi.programstageinstanceid,psi.uid,psic.sort_order,psic.trackedentitycommentid, 
tec.commenttext, tec.createddate,tec.creator from  programstageinstance psi
INNER JOIN programstageinstancecomments psic ON psic.programstageinstanceid = psi.programstageinstanceid
INNER JOIN trackedentitycomment tec ON tec.trackedentitycommentid = psic.trackedentitycommentid
where psi.programstageinstanceid in ( select programstageinstanceid from
programstageinstance where programinstanceid = 539676);


-- delete on testing instance on link
delete from programstageinstancecomments where programstageinstanceid in 
( select programstageinstanceid from
programstageinstance where programinstanceid = 539676);

-- delete on production instance on link 19/09/2023
delete from programstageinstancecomments where programstageinstanceid in 
( select programstageinstanceid from
programstageinstance where programinstanceid = 539676);






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

-- as on 02/05/2023

select * from users where username = 'jagera';

select * from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536498 );


-- as on 12/09/2023


select * from users where username in( 'preetnagar', 'azadnagar' ) ;

select * from usersetting where userinfoid in ( 536507,536508 );	
delete from usersetting where userinfoid in ( 536507,536508 );	

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536507,536508 );

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536507,536508 );



delete from programinstance where deleted is true;

delete from programinstanceaudit where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true));

-- 02/06/2023

select * from users where username = 'preetnagar';

select * from usersetting where userinfoid in ( 536507 );	
delete from usersetting where userinfoid in ( 536507 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536507 );

delete from programinstance where deleted is true;

delete from programinstanceaudit where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from programinstancecomments where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true));


-- as on 17/07/2023

select * from users where username = 'jagera';

select * from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from usersetting where userinfoid in ( 536498 );	
delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536498 );

-- 10/10/2023

select * from users where username in ( 'azadnagar', 'preetnagar') ;

select * from usersetting where userinfoid in ( 536507,536508 );
delete from usersetting where userinfoid in ( 536507,536508 );	

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536507,536508 );

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns' 
and userid in ( 536507,536508 );


-- 05/12/2023

select * from usersetting where userinfoid in ( select userid from users where username in 
( 'newggsnagar' ) );

delete from usersetting where userinfoid in ( select userid from users where username in 
( 'newggsnagar' ) );

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'newggsnagar'));

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username in ( 'newggsnagar'));


-- 12/12/2023

select * from usersetting where userinfoid in ( select userid from users where username in 
( 'newggsnagar','ggsnagar','harkrishanagar','preetnagar' ) );

delete from usersetting where userinfoid in ( select userid from users where username in 
( 'newggsnagar','ggsnagar','harkrishanagar','preetnagar' ) );

select * from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username 
in ('newggsnagar','ggsnagar','harkrishanagar','preetnagar'));

delete from userkeyjsonvalue where namespace = 'trackerCaptureGridColumns'
and userid in ( select userid from users where username 
in ('newggsnagar','ggsnagar','harkrishanagar','preetnagar'));


-- issue related to soft delete of TEI,enrollment,events
delete from programinstance where deleted is true;

delete from programinstanceaudit where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from programinstancecomments where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true);

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where deleted is true));

-- 06/10/2023

-- relationship query

select rels.relationshiptypeid,rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid	
where rel1.trackedentityinstanceid in (SELECT tei.trackedentityinstanceid
FROM trackedentityattributevalue teav
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid  = tei.trackedentityinstanceid 
INNER JOIN program prg ON prg.programid = pi.programid
WHERE tea.uid = 'KrCahWFMYYz' and prg.uid = 'BgTTdBNKHwc' and rel1.trackedentityinstanceid = 424355 )
order by rel1.trackedentityinstanceid ;


select rels.relationshiptypeid,rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid	
where rels.relationshiptypeid = 360319 and 
rel2.trackedentityinstanceid in ( 425649,425659,425660,425662 );

-- tei list with multiple TEA

SELECT tei.trackedentityinstanceid teiID, tei.uid teiUID, teav1.value as dob, 
EXTRACT(year FROM AGE(current_date,teav1.value::date))::int as age,
teav2.value, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 139 ) teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  138 
and prg.uid = 'TcaMMqHJxK5' and tei.created::date between
'2023-01-01' and '2023-09-30';

select * from trackedentityattributevalue
where trackedentityattributeid = 521331
and trackedentityinstanceid = 423856; -- SES

-- stage Socio-economic details program -- 1. Household Program
SELECT tei.trackedentityinstanceid, tei.uid AS teiUID, psi.uid AS eventUID, psi.executiondate::date as Event_date,
psi.duedate::date,data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE psi.programstageid in ( select programstageid from programstage where uid = 'FudWXWCAAM9')
and tei.trackedentityinstanceid in (421565) and de.uid = 'Jrax4JcLZK4';


