
-- for data move/delete from 2.24 to 2.35

-- for programstage usergropu access we have to delete programstage attributevalues then maintenance module work

select * from programstageinstance order by created desc; 

select count(*) from programstageinstance; -- 5943 -- 6414

select count(*) from programinstance; -- 12684 -- 13381

select count(*) from trackedentityinstance; -- 12688 -- 13386

select count(*) from trackedentityattributevalue; -- 149849 --158721



-- for 2.35

-- License status and Expiry Date  update through scheduling

-- TE ATTRIBUTE Current License Expiry Date -- edTbYj3fk12, 1085 , Current license status -- LqYf0osGEQi , 2376

select * from trackedentityattribute where uid in( 'edTbYj3fk12', 'LqYf0osGEQi');

SELECT trackedentityinstanceid,trackedentityattributeid,value  FROM trackedentityattributevalue
WHERE CURRENT_DATE > value::date and trackedentityattributeid = 1085;


-- dataelement  

-- 2609	"nPcT1HabdNa" License validity date, 3430	"AWprRTJ8phx" License status

select * from trackedentityattribute where uid in( 'edTbYj3fk12', 'LqYf0osGEQi');

select * from dataelement where dataelementid in ( 2609, 3430 );

select * from programstageinstance order by programstageinstanceid desc;

select count(*) from programstageinstance order by programstageinstanceid desc;

select * from programstageinstance where executiondate::date = '2022-12-31';

update programstageinstance set attributeoptioncomboid = 16 where executiondate::date = '2022-12-31';

delete from programstageinstance where executiondate::date = '2022-12-31';

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where executiondate::date = '2022-12-31');




SELECT psi.programstageinstanceid, psi.uid eventID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'nPcT1HabdNa' ->> 'value' < '2022-12-31'
and de.uid = 'nPcT1HabdNa' order by psi.programstageinstanceid;

SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'nPcT1HabdNa' ->> 'value' < '2022-12-31'
and de.uid = 'nPcT1HabdNa' order by psi.programstageinstanceid;

SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'AWprRTJ8phx' ->> 'value' != '2'
and de.uid = 'AWprRTJ8phx' order by psi.programstageinstanceid;

SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'AWprRTJ8phx' ->> 'value' != '2'
and psi.executiondate::date between '2021-01-01' and '2021-12-31'
and de.uid = 'AWprRTJ8phx' order by psi.programstageinstanceid;

SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, prgs.uid as prgSUID,psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'AWprRTJ8phx' ->> 'value' != '2'
and de.uid = 'AWprRTJ8phx' order by psi.programstageinstanceid;


SELECT psi.programstageinstanceid FROM programstageinstance psi 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid 
INNER JOIN ( SELECT programstageinstanceid
FROM programstageinstance where eventdatavalues -> 'oYNscX4WRDk' ->> 'value' ILIKE '2'  )
evdatavalue1 on evdatavalue1.programstageinstanceid = psi.programstageinstanceid;


SELECT eventdatavalues -> 'oYNscX4WRDk' ->> 'value' as amrid
FROM programstageinstance where eventdatavalues -> 'oYNscX4WRDk' is not null 

SELECT eventdatavalues -> 'oYNscX4WRDk' ->> 'value' as amrid
FROM programstageinstance where eventdatavalues -> 'oYNscX4WRDk' is not null 

SELECT psi.programstageinstanceid FROM programstageinstance psi 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid 
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid 
INNER JOIN (SELECT programstageinstanceid FROM programstageinstance 
WHERE eventdatavalues -> 'oYNscX4WRDk' ->> 'value'  ILIKE '2' ) evdatavalue1 
on evdatavalue1.programstageinstanceid = psi.programstageinstanceid  
WHERE ps.name ILIKE 'Escalation'

-- user related query delete userroles

delete from userrolemembers where userroleid 
in ( 360,9961,9962,14984,14985,14990);

select * from users where userid not in ( select userid from 
usergroupmembers);	

select * from userinfo where userinfoid in (
select userid from users where userid not in ( select userid from 
usergroupmembers));

select usr.username, usrinfo.surname, usrinfo.firstname from users usr
LEFT JOIN userinfo usrinfo ON usrinfo.userinfoid = usr.userid
where usr.userid not in ( select userid from 
usergroupmembers);