
-- eventDataValue qiery

SELECT tei.uid as tei_uid,org.uid as org_uid,
psi.uid as event, psi.executiondate::date, psi.status, psi.eventdatavalues 
FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'Kj26Tqc9NS5' and psi.deleted is false and org.path like '%nwteZrAvcBB%'
and teav.value = 'PHC' ORDER BY psi.executiondate desc;

SELECT psi.uid as event, org.uid, psi.executiondate::date, psi.status, psi.eventdatavalues 
FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE prg.uid = 'Kj26Tqc9NS5' and psi.deleted is false 
and teav.value = 'PHC' and tei.uid = 'rQ1gmI4U4lW'
ORDER BY psi.executiondate desc LIMIT 1;


insert into organisationunit (organisationunitid,uid,name,shortname,code,parentid,openingdate,created,lastupdated,hierarchylevel) values
="(nextval('hibernate_sequence'),'"&C2&"','"&F2&"','"&F2&"','"&E2&"',"&G2&",'1990-01-01','2024-05-28','2024-05-28',"&H2&"),"

select uid, organisationunitid from organisationunit where hierarchylevel =3; -- 751

select count(*) from organisationunit where hierarchylevel in( 1,2,3 ); -- 791
 
delete from organisationunit where hierarchylevel in( 4,5); -- 247333


select uid,organisationunitid from organisationunit where hierarchylevel = 4;

select uid,organisationunitid,path from organisationunit where hierarchylevel = 4; -- 7748

select uid,organisationunitid,path from organisationunit where hierarchylevel = 4; -- 239302

select uid,organisationunitid,path from organisationunit where hierarchylevel = 5; -- 239302

select * from organisationunit where hierarchylevel < 3;

select count(*) from organisationunit where hierarchylevel in( 1,2,3 );

SELECT organisationunitid,uid,name,code,hierarchylevel,path
FROM organisationunit where hierarchylevel = 5;


update organisationunit set created = now()::timestamp where created ='2024-05-30';
update organisationunit set lastupdated = now()::timestamp where lastupdated ='2024-05-30';


delete from eventvisualization_organisationunits where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);

delete from program_organisationunits where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);

delete from userdatavieworgunits where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);



delete from usermembership where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);

delete from userteisearchorgunits where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);



delete from orgunitgroupmembers where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);

delete from orgunitgroupmembers where 
organisationunitid in ( select organisationunitid from
organisationunit where hierarchylevel > 2);



delete from organisationunit where hierarchylevel > 2;


-- 14/08/2024
INSERT INTO programindicator(programindicatorid, uid, created, lastupdated, name, shortname, programid, expression, filter, aggregationtype, analyticstype) VALUES
="(nextval('hibernate_sequence'),'"&A2&"','2023-03-10','2023-03-10','"&D2&"','"&E2&"',"&C2&",'"&H2&"','"&I2&"','"&F2&"','"&G2&"'),"

select * from program;

select * from programindicator order by programindicatorid desc;
select * from programindicator where programindicatorid > 258713;

update programindicator  set created = now()::timestamp where created ='2023-03-10';
update programindicator  set lastupdated = now()::timestamp where lastupdated ='2023-03-10';


select * from periodboundary order by periodboundaryid desc;
select * from periodboundary where periodboundaryid > 259287;


INSERT INTO periodboundary(periodboundaryid, uid, created, lastupdated, boundarytarget, analyticsperiodboundarytype, programindicatorid ) VALUES
="(nextval('hibernate_sequence'),'"&A2&"','2023-03-10','2023-03-10','"&C2&"','"&D2&"',"&B2&"),"

update periodboundary  set created = now()::timestamp where created ='2023-03-10';
update periodboundary  set lastupdated = now()::timestamp where lastupdated ='2023-03-10';