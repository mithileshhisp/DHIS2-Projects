
KAP-CBD-15
-- ANC -- lyV4xaK35cS,dKZsEnR8s9C,lyV4xaK35cS,nYxitbqPTef,GPnKb9raUcp,eabkOm49r3O,NWAbJmZi5ey,OSIhs30rFQK
-- fDUINIR160n,  value type numner to text

-- PNC -- uF84mQtvlmR,S289YKm0YVI,CLAR667oKdA -- yes/no to text,
-- dG5Lxn3OIVf,fXUJMeK0Y2T,XCVF4Od77tB,Z2KCGcpPyHB, -- value type numner to text

select * from trackedentityinstance where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityattributevalue where 
trackedentityattributeid = 3115052) and created::date = '2022-01-08';

select * from trackedentityattribute order by trackedentityattributeid desc;

select * from program where uid = 'EAY7CYYkrpi';

select * from programstage where programid = 2930728;

select * from programinstance where programid = 2930728;

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728);

select de.name,de.uid,de.code from programstagedataelement psde
inner join dataelement de ON de.dataelementid = psde.dataelementid
where psde.programstageid = 2930724;

select de.name,de.uid,de.code,de.valuetype from programstagedataelement psde
inner join dataelement de ON de.dataelementid = psde.dataelementid
where psde.programstageid = 2930727;

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930857 );

out - 2930857 -  ,his 2930724 -  anc - 2930725 mother-PNC 2930726 child-PNC 2930727


anc -- 

-- 30/11/2021 -- total tei -- 1044
-- events  history -- 1044 outcome -- 407

-- anc, mother pnc,child pnc
select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930726,2930727,2930725);

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid = 2930725;

update trackedentityattribute set uid = 'yDaWsAZcr8K' where uid = 'jrboI161yqv';


select  us.username user_name, usinf.firstname first_name, usinf.surname sur_name, 
org.uid as user_org_uid from  usermembership usm
INNER JOIN userinfo usinf ON usinf.userinfoid = usm.userinfoid
INNER JOIN users us ON us.userid = usinf.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
order by usinf.firstname;

select * from users;

select * from userinfo;

select * from userattributevalues;


-- create SQL-VIEW
-- user-attributevalue and 
SELECT usinf.firstname first_name, usinf.surname sur_name,
cast(userAttribute.value::json ->> 'value' AS VARCHAR) 
AS userAttribute_value, org.uid as user_org_uid FROM userinfo usinf
JOIN json_each_text(usinf.attributevalues::json) userAttribute ON TRUE 
INNER JOIN usermembership usm ON usinf.userinfoid = usm.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
INNER JOIN attribute attr ON attr.uid = userAttribute.key
WHERE attr.uid = 'FeCWLipdN3o';

-- create SQL-VIEW
-- tei list based on tea attribute uid
SELECT tei.uid AS tei_uid, pi.uid AS enrollment_uid, prg.uid AS program_uid,
org.uid AS orgUnit_uid,teav.value AS care_mother_id from trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid 
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
where tea.uid = 'yDaWsAZcr8K';



delete from programstageinstance where programstageid = 2930725;

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programstageid = 2930725);

delete from programstageinstance where programstageid in( 2930726,2930727);

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programstageid in( 2930726,2930727));


begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 2930728); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 2930728); 

-- 3) relationship
	update relationshipitem set trackedentityinstanceid = null where relationshipid in ( select relationshipid from 
	relationship where to_relationshipitemid in ( select relationshipitemid from 
	relationshipitem where trackedentityinstanceid in ( select trackedentityinstanceid from programinstance where programid = 2930728 )));
	
	
-- 4) trackedentitydatavalue


-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 2930728 )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 2930728 )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid = 2930728 );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid = 2930728 );

-- 9) programinstance 
      delete from programinstance where programid = 2930728; 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid = 2930728 ); 

end;