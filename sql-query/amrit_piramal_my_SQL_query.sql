
-- M!th!lesh@123 links -- 172.105.47.164 96 4444
-- push orgUnit to dhis2 lvel 2 and 3 ( state and district )

-- take database backup before delete all tracker/aggregated data and import with new query
-- Dh!sUs3Rp@SS1
-- pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_08Dec2023_with104_Program.sql

-- pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_08Dec2023_with_out_dataValue.sql


-- piramal new client server details 20/03/2024

-- vpn OpenVPN password -- H!$pad77^)
-- IP -- 192.168.45.170
-- port -- 22
-- username - psmri
-- password -- P$mr1@2023$
-- location -- /var/dhis/tomcat-amrit$
-- dhis2-home -- /var/dhis/tomcat-amrit/dhis2
-- production link -- http://14.97.12.103/amrit/dhis-web-commons/security/login.action
-- UAT Application -- https://dashboards.piramalswasthya.org/ 


-- check event exist
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=vyQPQ07JB9M&orgUnit=ntx3ysqOWAT&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:9439502&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?fields=event&program=vyQPQ07JB9M&orgUnit=ntx3ysqOWAT&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:9439502&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=vyQPQ07JB9M&programStage=ISSSjurI0kD&orgUnit=ntx3ysqOWAT&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:9439502&skipPaging=true
-- check TEI exist
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:7393430


https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:OZW5netBBfD&level=3&paging=false

-- 104 orgUnit list

-- district list
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=3&paging=false
-- sub district list
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=4&paging=false

https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=4&paging=false&filter=attributeValues.value:eq:619
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=4&paging=false
-- 104 TEI validation
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:7393430

-- 104 event list count

https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:4

https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:3

-- 06/03/2024 
-- ou list


-- APL TM Van ID organisationUnits list API through orgUnit attributeValue
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:IYabhGYdx3F&level=3&paging=false
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:IYabhGYdx3F&level=3&paging=false&filter=attributeValues.value:eq:22

-- for APL TM ( APL MMU facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) as APL_TM_ID
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'IYabhGYdx3F' and orgunit.hierarchylevel = 3;

-- APL TM registration count
select count (*)from trackedentityinstance
where organisationunitid in ( 9765161,
9765162,9765160,9765159,9765158 );

-- APL TM registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'hQUeRtU70wj' )) 
and organisationunitid in ( 9765161,
9765162,9765160,9765159,9765158 ));

-- TM-- hQUeRtU70wj -- 7294
-- MMU-- NMGbY2nXCKu -- 7220


-- APL MMU Van ID organisationUnits list API through orgUnit attributeValue
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:SF0xYCVCiTq&level=3&paging=false
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:SF0xYCVCiTq&level=3&paging=false&filter=attributeValues.value:eq:22

-- for APL MMU ( APL MMU facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) as APL_MMU_ID
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'SF0xYCVCiTq' and orgunit.hierarchylevel = 3;

-- APL MMU registration count
select count (*)from trackedentityinstance
where organisationunitid in ( 9765151 );

-- APL MMU registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in ( 9765151 ));

delete from trackedentityinstance
where organisationunitid in ( 9765151 );

delete from programinstance where 
programid in ( select programid from program where uid = 'NMGbY2nXCKu' )
and organisationunitid in ( 9765151 );

delete from trackedentityprogramowner  where programid =7220
and organisationunitid in ( 9765151 );


-- JH MMU Van ID organisationUnits list API through orgUnit attributeValue
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:FA0FFjw3TOX&level=3&paging=false
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:FA0FFjw3TOX&level=3&paging=false&filter=attributeValues.value:eq:34

-- 
https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=NMGbY2nXCKu&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

-- JH MMU tei enrollment check API
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:732644501

-- for JH MMU ( JH MMU facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) as JH_MMU_ID
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'FA0FFjw3TOX' and orgunit.hierarchylevel = 3;

-- JH MMU registration count
select count (*)from trackedentityinstance
where organisationunitid in ( 9765212,
9765210,9765213,9765211,9765209,9765214,
9765208,9765207,9765206,9765205);

-- JH MMU registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in ( 9765212,
9765210,9765213,9765211,9765209,9765214,
9765208,9765207,9765206,9765205 ));



-- 04/04/2024

-- Digwal MMU Van ID organisationUnits list API through orgUnit attributeValue
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:oI6vsOz8ocO&level=3&paging=false
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:oI6vsOz8ocO&level=3&paging=false&filter=attributeValues.value:eq:34

-- 
https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=NMGbY2nXCKu&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

-- Digwal MMU tei enrollment check API
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:732644501

-- for Digwal MMU ( Digwal MMU facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) as Digwal_MMU_ID
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'oI6vsOz8ocO' and orgunit.hierarchylevel = 3;

-- Digwal MMU registration count
select count (*)from trackedentityinstance
where organisationunitid in ( 9765149 );

-- Digwal MMU registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in ( 9765149 ));


-- Sehat OK Van ID organisationUnits list API through orgUnit attributeValue
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:fsSeHWU07zY&level=4&paging=false
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:fsSeHWU07zY&level=4&paging=false&filter=attributeValues.value:eq:65
-- 

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=NMGbY2nXCKu&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

-- Sehat OK tei enrollment check API
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:290122

-- for Sehat OK ( Sehat OK facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) as SehatOK_ID
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'fsSeHWU07zY' and orgunit.hierarchylevel = 4;

-- Sehat OK registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in (7774507,7774509,7774519,7774512,7774531,7774508,
7774481,7774510,7774516,7774511,7774527,7774513,
7774514,7774518,7774515,7774517,7774520,7774524,7774530,
7774521,7774522,7774523,7774525,7774528,7774526,7774529);
 

-- Sehat OK registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in (7774507,7774509,7774519,7774512,7774531,7774508,
7774481,7774510,7774516,7774511,7774527,7774513,
7774514,7774518,7774515,7774517,7774520,7774524,7774530,
7774521,7774522,7774523,7774525,7774528,7774526,7774529));

-- 
select teav.value benregid,tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 -- MappingBenRegId
AND pi.organisationunitid in ( 7774507,7774509,7774519,7774512,7774531,7774508,
7774481,7774510,7774516,7774511,7774527,7774513,
7774514,7774518,7774515,7774517,7774520,7774524,7774530,
7774521,7774522,7774523,7774525,7774528,7774526,7774529 );



-- end



-- stfc Van ID organisationUnits list API through orgUnit attributeValue
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:dxsfy49ePQY&level=3&paging=false

-- stfc Van ID organisationUnits list API through orgUnit attributeValue and level
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:dxsfy49ePQY&level=4&paging=false&filter=attributeValues.value:eq:65
-- 

https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=NMGbY2nXCKu&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

-- stfc tei enrollment check API
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=Gjmru6TZHHh&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:265238


-- for stfc ( stfc facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) as SehatOK_ID
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'dxsfy49ePQY' and orgunit.hierarchylevel = 4;


-- stfc registration/enrollment count
select count (*)from trackedentityinstance
where organisationunitid in (7774555,7774550,7774558,7774560,7774551,7774554,
7774548,7774549,7774553,7774556,7774552,7774557,7774559,7774561,7774547);
 

-- stfc registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in (7774555,7774550,7774558,7774560,7774551,7774554,
7774548,7774549,7774553,7774556,7774552,7774557,7774559,7774561,7774547)); -- 268835




-- HWC/Id Van ID orgUnit api
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&level=5&paging=false
-- HWC registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI'));

select * from program;

-- HWC registration/enrollment count
select count(*) from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI');

-- for HWC ID ( HWC facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'v0l6GSGw7TS' and orgunit.hierarchylevel = 5;


-- HWC registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI'));

select * from program;

-- HWC TEI attributeValue -- BeneficiaryRegID
SELECT teav.value,tei.uid tei_uid,org.uid org_uid
FROM programinstance pi
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'PTubSEvAvVI' and teav.trackedentityattributeid = 7210;


-- HWC registration/enrollment count
select count(*) from programinstance 
where programid in (select programid from program
where uid = 'PTubSEvAvVI');

-- HWC event count
select count(*) from programstageinstance 
where programstageid in (select programstageid
from programstage where uid = 'JL0TyD11MnW');

select * from trackedentitydatavalueaudit where programstageinstanceid in(
select programstageinstanceid from programstageinstance 
where programstageid in (select programstageid
from programstage where uid = 'JL0TyD11MnW'))

-- bayer registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid = 7294 ) and organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641 );

select count(*) from programinstance 
where programid = 7294 and organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641 );



-- bayer event count
select count(*) from programstageinstance 
where programstageid = 146164 and organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641 );

-- 1097 prefered language attribute

select value,count(value) from trackedentityattributevalue where 
trackedentityattributeid = 6900511 group by value;

-- 1097 TEI attributeValue

SELECT teav.value,tei.uid tei_uid,org.uid org_uid
FROM programinstance pi
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ggbtdN2DyfR' and teav.trackedentityattributeid = 7210;

-- 1097 age on visit

SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int,psi.created
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ggbtdN2DyfR' and teav.trackedentityattributeid = 7206
order by psi.created desc;

select count(*) from programstageinstance psi 
where programstageid = 6900528;

select * from programstageinstance 
where programstageid = 6900528 order by created desc;

select uid,programstageinstanceid,created from programstageinstance 
where programstageid = 6900528 order by programstageinstanceid desc;


select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid = 'MQzM9kXQuxk'
order by opv.name;


-- 1097 registration/enrollment count
select count (*)from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid = 6345158 );

select count(*) from programinstance 
where programid = 6345158

-- 1097 event count

select count(*) from programstageinstance psi 
where programstageid = 6900528;

-- 1097 event count based on dataElementValue
SELECT count(psi.uid) 
FROM programstageinstance psi
left JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
where prg.uid = 'ggbtdN2DyfR' and ps.uid = 'kjSBCEmnHbG' 
and de.uid = 'N0NgFzBLwnV' 
and cast(data.value::json ->> 'value' AS VARCHAR) = 'Others';


SELECT psi.uid AS eventUID,psi.eventdatavalues
from programstageinstance psi where programstageid = 7391
and  psi.eventdatavalues is null;

select count(*) from programstageinstance psi 
where programstageid = 7391;

select programstageinstanceid,uid from programstageinstance psi 
where programstageid = 7391 order by programstageinstanceid desc limit 1;

SELECT psi.uid AS eventUID,psi.executiondate::date
from programstageinstance psi where programstageid = 7391
and  psi.eventdatavalues -> 'hsbXpo83f4I' is not null;

select count(*) from programstageinstance psi 
where programstageid = 7391 -- 254866;

select count(*) from programstageinstance psi 
where programstageid = 7391 and 
psi.eventdatavalues -> 'hsbXpo83f4I' is null; -- 145688

SELECT psi.uid AS eventUID,psi.executiondate::date
from programstageinstance psi where programstageid = 7391
and  psi.eventdatavalues -> 'hsbXpo83f4I' is null;


select count(*) from programstageinstance psi 
where programstageid = 7391 and 
psi.eventdatavalues -> 'hsbXpo83f4I' is not null; -- 109178


SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where teav.trackedentityattributeid = 7206;


-- TM event list with BenVisitID and BeneficiaryRegID

SELECT psi.uid eventID,psi.executiondate::date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS BenVisitID,
teav.value as BeneficiaryRegID
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' and de.uid = 'Q7aA5HvvV7L'
and teav.trackedentityattributeid = 7210;


SELECT psi.uid eventID,psi.executiondate::date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS BenVisitID
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'hQUeRtU70wj' and de.uid = 'Q7aA5HvvV7L';	



-- 104 BenCallID event-dataValue query

SELECT psi.uid eventID,psi.executiondate::date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'vyQPQ07JB9M'
and de.uid = 'hsbXpo83f4I';

-- 104 received role name based based event count

SELECT count(psi.uid) 
FROM programstageinstance psi
left JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
where prg.uid = 'vyQPQ07JB9M' and ps.uid = 'ISSSjurI0kD' 
and de.uid = 'hUDunUrmF14' 
and cast(data.value::json ->> 'value' AS VARCHAR) ilike '%hao%';


-- piramal event list with age on visit( diffrence of age from event-date to date-of-birth)
SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' and teav.trackedentityattributeid = 7206;

-- for TM program event list with age on visit( diffrence of age from event-date to date-of-birth)
SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' and teav.trackedentityattributeid = 7206;


-- for MMU program event list with age on visit( diffrence of age from event-date to date-of-birth)

SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' and teav.trackedentityattributeid = 7206;


SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' and teav.trackedentityattributeid = 7206
and de.uid = 'Q7aA5HvvV7L' and psi.executiondate::date between '2023-01-01' and '2023-12-31';


SELECT psi.uid eventID,psi.executiondate::date, teav.value::date 
AS date_of_birth, EXTRACT(year FROM AGE(psi.executiondate,teav.value::date))::int
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' and teav.trackedentityattributeid = 7206
and psi.executiondate::date 
between '2023-01-01' and '2023-12-31';


select count(*) from programstageinstance
where programstageid in ( select programstageid
from programstage where programid in ( select 
programid from program where uid = 'NMGbY2nXCKu') );


-- event dataValue -- age on visist for TM program

SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'P5a5E6m8llj' and psi.programstageid in (
select programstageid from programstage where programid 
in ( select programid from program where uid = 'hQUeRtU70wj'));

-- event dataValue -- whith dataelement value == Beneficiary Call ID_104
SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'hsbXpo83f4I';

-- event dataValue
SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'ZTNtr3RK0kh';

SELECT psi.uid AS eventUID, psi.executiondate::date as Event_date,
data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'ioNKjuWD3s9' 
order by psi.programstageinstanceid desc;

-- https://links.hispindia.org/timor/api/system/id.csv?limit=10000

insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid) values
="(nextval('hibernate_sequence'),'"&B2&"', '2023-11-02','2023-11-02', '"&E2&"','"&E2&"','"&E2&"', "&C2&", "&D2&" ),"


update trackedentityinstance set created = now()::timestamp where created = '2024-05-23';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

update trackedentityinstance set lastupdatedby = 1,storedby = 'admin';

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&C2&","&E2&",'2023-11-02','2023-11-02','"&D2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2024-05-23';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&B2&","&J2&",'2023-12-09','2023-12-09','"&A2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2023-12-09';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2023-12-09';


update trackedentityattributevalue set created = now()::timestamp where created = '2023-12-12';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2023-12-12';

insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid) values
="(nextval('hibernate_sequence'),'"&B2&"', '2023-12-08','2023-12-08', 'false','false','false', "&C2&", 7214 ),"

delete from trackedentityinstance where created::date = '2024-03-25';

delete from trackedentityprogramowner where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance where created::date = '2024-03-25');

select * from trackedentityattribute where uid = 'CskR1IOiZxg'

select * from trackedentityinstance where created::date = '2024-03-24';

select * from trackedentityprogramowner where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance where created::date = '2024-03-24');

select * from trackedentityinstance where created::date = '2024-03-24';


update trackedentityinstance set created = now()::timestamp where created = '2023-12-08';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2023-12-08';

update trackedentityinstance set created = now()::timestamp where created = '2024-02-17';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-02-17';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-02-17';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-02-17';

update programinstance set created = now()::timestamp where created = '2024-05-23';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

select * from programinstance where created::date = '2024-02-17';

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&B2&"', '2023-11-02', '2023-11-02', '"&D2&"', 'ACTIVE', "&C2&", 7295,'"&D2&"', "&E2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2023-11-02';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&C2&"', '2023-12-08', '2023-12-08', '"&E2&"', 'ACTIVE', "&B2&", 7295,'"&E2&"', "&D2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2023-12-08';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2023-12-08';

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&C2&", 7295,'2023-11-02','2023-11-02',"&E2&",'admin' ),"

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-23';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

update trackedentityprogramowner set created = now()::timestamp where created = '2023-12-08';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2023-12-08';

insert into programstageinstance (programstageinstanceid, uid, created, lastupdated, programinstanceid, programstageid, attributeoptioncomboid, storedby,  executiondate, organisationunitid, status, deleted ) values
="(nextval('hibernate_sequence'),'"&C2&"', '2023-11-02', '2023-11-02', "&E2&", 7391, 24, 'admin','"&F2&"',"&D2&", 'ACTIVE','false'),"

select * programstageinstance  where created::date = '2023-12-27';

update programstageinstance set created = now()::timestamp where created = '2023-12-27';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2023-12-27';

update programstageinstance set created = now()::timestamp where created = '2023-11-02';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';



update programstageinstance set created = now()::timestamp where created = '2023-11-02';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2023-11-02';



-- MMU event insert query

insert into programstageinstance (programstageinstanceid, uid, created, lastupdated, programinstanceid, programstageid, attributeoptioncomboid, storedby, executiondate, organisationunitid, status, deleted ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2024-01-17', '2024-01-17', "&F2&", 7226, 24, 'admin','"&E2&"',"&G2&", 'ACTIVE','false'),"
 
-- 734978 + 334318 + 672290 = 1741586
update programstageinstance set created = now()::timestamp where created = '2024-01-17';
update programstageinstance set lastupdated = now()::timestamp where lastupdated = '2024-01-17';

-- 

select * from organisationunit; 788 ( 36 + 751 + 1)

delete from organisationunit where hierarchylevel in(2,3);

select * from organisationunit where hierarchylevel = 2;
select * from organisationunit where hierarchylevel = 3;

-- 26/10/2023

delete from organisationunit where hierarchylevel in(2,3,4);
delete from program_organisationunits;
delete from programinstance;
delete from programstageinstance;
delete from trackedentityinstance;
delete from trackedentityprogramowner;
delete from trackedentityattributevalue;


select * from trackedentityinstance;
select * from programinstance;
select * from programstageinstance;

select count(*) from trackedentityinstance where created::date = '2023-11-01';
select count(*) from programinstance where created::date = '2023-11-01';
select count(*) from programstageinstance where created::date = '2023-11-01';





-- TEI delete based on created date


delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance where created::date = '2023-11-01');

delete from programstageinstance where created::date = '2023-11-01';

delete from programinstance where created::date = '2023-11-01';

delete from trackedentityattributevalue where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance 
where created::date = '2023-11-01');

delete from trackedentityprogramowner where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance 
where created::date = '2023-11-01');

delete from trackedentityinstance where created::date = '2023-11-01';



delete from programstageinstance 
where programinstanceid in (select programinstanceid from 
programinstance where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr'));

delete from trackedentityattributevalue where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr')

delete from programinstance where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr');

delete from trackedentityprogramowner where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'ojfxSpZqSCr');

delete from trackedentityinstance where uid = 'ojfxSpZqSCr';

delete from programstageinstance 
where programinstanceid in (select programinstanceid from 
programinstance where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE'));




delete from trackedentityattributevalue where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE')

delete from programinstance where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE');

delete from trackedentityprogramowner where 
trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance where uid = 'tfwT5NFaesE');

delete from trackedentityinstance where uid = 'tfwT5NFaesE';



-- level 2
SELECT StateID, StateName, StateCode,GovtStateID Language FROM m_state; -- 36

-- level --3 
SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID -- 710

-- level - 4

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID,
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID -- 6447;


select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.optionvalueid optionvalueID, opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid = 'ZE69SPZUlBr' order by ops.name;

-- optionValue with attribueValue

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.optionvalueid optionvalueID, opv.sort_order,cast(optionAttribute.value::json ->> 'value' AS VARCHAR) 
AS villageID from optionvalue opv 
JOIN json_each_text(opv.attributevalues::json) optionAttribute ON TRUE 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
INNER JOIN attribute attr ON attr.uid = optionAttribute.key
where ops.uid = 'p6fHp8sI0gA' and attr.uid = 'RDZKbFFn7EL' order by ops.name;



-- optionValue with attribueValue

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.optionvalueid optionvalueID, opv.sort_order,cast(optionAttribute.value::json ->> 'value' AS VARCHAR) 
AS villageID from optionvalue opv 
JOIN json_each_text(opv.attributevalues::json) optionAttribute ON TRUE 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
INNER JOIN attribute attr ON attr.uid = optionAttribute.key
where ops.uid = 'p6fHp8sI0gA' and attr.uid = 'RDZKbFFn7EL' order by ops.name;

-- organisationunit with attribueValue
select cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR)
AS BayerVanID,orgunit.organisationunitid, orgunit.uid,orgunit.name
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'OZW5netBBfD';


-- organisationunit with attribueValue
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'l38VgCtdLFD' and orgunit.hierarchylevel = 4;

select orgunit.organisationunitid, orgunit.uid,orgunit.name,
orgunit.parentid, parent.uid parentUID,
parent.organisationunitid parentID ,parent.name as parentname, concat(orgunit.uid,'-',parent.uid),
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
left join organisationunit parent on parent.organisationunitid = orgunit.parentid
where attr.uid = 'l38VgCtdLFD' and orgunit.hierarchylevel = 3
and orgunit.name = 'Not Disclosed';

SELECT orgGrpMember.organisationunitid,orgunitgrp.orgunitgroupid, 
orgunitgrp.uid,orgunitgrp.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from orgunitgroup orgunitgrp 
JOIN json_each_text(orgunitgrp.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
INNER JOIN orgunitgroupmembers orgGrpMember ON orggrpmember.orgunitgroupid = orgunitgrp.orgunitgroupid
where attr.code = 'XMLName';

-- for VanID
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'EnxzhgiA5ra' and orgunit.hierarchylevel = 4;


-- for HWC ID ( HWC facility )
select orgunit.organisationunitid, orgunit.uid,orgunit.name,
cast(orgUnitAttribute.value::json ->> 'value' AS VARCHAR) 
from organisationunit orgunit 
JOIN json_each_text(orgunit.attributevalues::json) orgUnitAttribute ON TRUE 
INNER JOIN attribute attr ON attr.uid = orgUnitAttribute.key
where attr.uid = 'v0l6GSGw7TS' and orgunit.hierarchylevel = 5;

-- API
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&paging=false

-- // MY-sql installer
--https://dev.mysql.com/downloads/installer/
--https://downloads.mysql.com/archives/community/


-- My-SQL
SELECT VERSION();

SELECT USER(), CURRENT_USER;

SHOW GRANTS;

SHOW TABLE STATUS FROM db_iemr;


172.104.206.140 3306
hisp_web
GRgfW1@GRWg

hisp
GRgfW1@GRWg

Server IP : 172.104.206.140
User: piramal_dev
Pass: gWRE!@Fq1e$G
mysql root pass: @gWRE!Fq1e@$G#
Ye hai sir detail

CREATE USER 'hisp'@'%' IDENTIFIED BY 'GRgfW1G@RWg';
GRANT ALL PRIVILEGES ON *.*TO 'hisp'@'%';

-- 31/08/2023
-- from database name shared by client -- iemr

SHOW VARIABLES WHERE variable_name = 'port';
SELECT VERSION();

SELECT USER(), CURRENT_USER;

SHOW GRANTS;

SHOW TABLE STATUS FROM db_iemr;

SELECT USER FROM mysql.user;



-- 13/09/2023

 select * from `m_district`
 
 select * from `m_districtblock`;
 
 select * from `m_state`;
 
select VisitNo,CreatedDate,VisitCode from t_benvisitdetail;

SELECT * FROM t_benvisitdetail;  30002100000003
 
select * from `m_van`

SELECT * FROM `m_facility`

select * from `m_chiefcomplaint`;

select * from `t_benchiefcomplaint`


select * from `m_vantype`;

select * from `m_bloodgroup`;

`db_iemr`


-- master data -- 14/09/2023
select * from m_visitreason;
select * from m_visitcategory; 
select * from m_subvisitcategory;
select * from t_prescription;
select * from m_diagnosisprovided; SELECT * FROM t_diagnosisprovided; -- not present
select * from m_procedurename;  SELECT * FROM m_procedure;
select * from t_lab_testorder;
select * from m_highriskstatus; SELECT * FROM t_highriskstatus; SELECT * FROM m_highriskstatus; -- NOT present
select * from m_highriskcondition; -- not present
select * from t_benreferdetails;

SELECT * FROM `m_chiefcomplaint`;

SELECT * FROM t_benreferdetails;


SELECT * FROM `t_benreferdetails`;

SELECT * FROM i_ben_flow_outreach;
 
SELECT * FROM t_benvisitdetail;
 
SELECT DISTINCT(beneficiary_id) FROM i_ben_flow_outreach;

SELECT DISTINCT(*) FROM i_ben_flow_outreach;
 
 
 SELECT * FROM t_ancdiagnosis;
 
 SELECT * FROM `m_gender`;
 
 SELECT * FROM `m_procedure`;
 
 SELECT * FROM `m_referralreason`;
 
 SELECT * FROM t_phy_vitals;
 
 SELECT * FROM `m_labtests`;
 
https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:4
https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:3

-- for attributeValue
https://links.hispindia.org/amrit/api/trackedEntityAttributes.json?fields=id,displayName,code&paging=false
https://links.hispindia.org/amrit/api/optionSets/p6fHp8sI0gA.json?fields=id,displayName,code,options[id,name,code,attributeValues[attribute[id,displayName,code],value]]

https://links.hispindia.org/amrit/api/trackedEntityAttributes.json?fields=id,displayName,code&paging=false



https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=HExrvaAcDEB&trackedEntityInstance=aDtGTyYTUqx&paging=false&fields=trackedEntityInstance,orgUnit,enrollment,enrollmentDate,incidentDate,status

https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=HExrvaAcDEB&fields=trackedEntityInstance,orgUnit,enrollment,enrollmentDate,incidentDate,status,&trackedEntityInstance=aDtGTyYTUqx&skipPaging=true

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=oeJ39c39Uy1&ouMode=DESCENDANTS&program=vyQPQ07JB9M&attribute=HKw3ToP2354:EQ:396361&paging=false

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=vyQPQ07JB9M&attribute=HKw3ToP2354&skipPaging=true

https://links.hispindia.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=vyQPQ07JB9M&&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

&filter=attributeValues.attribute.id:eq:

&filter=attributeValues.attribute.id:eq:HKw3ToP2354

https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS
https://links.hispindia.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&paging=false

https://links.hispindia.org/amrit/api/trackedEntityInstances/KyZ2a02rtsN.json

-- enrollment list
https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=GDInuuoYIQw&paging=false&ouMode=DESCENDANTS

-- event list
https://links.hispindia.org/amrit/api/events.json?program=vyQPQ07JB9M&skipPaging=true

-- orgUnit post to dhis2 query

-- teli list
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?program=vyQPQ07JB9M&ou=NQjElqVFZTm&ouMode=DESCENDANTS
https://links.hispindia.org/amrit/api/enrollments.json?program=vyQPQ07JB9M&ou=GDInuuoYIQw&ouMode=DESCENDANTS&paging=false

-- dhis 2 url -- https://links.hispindia.org/amrit/dhis-web-commons/security/login.action
-- version -- 2.40.0.1
-- database name -- piramal_240

-- level - 2
SELECT StateID, StateName, StateCode,GovtStateID Language FROM m_state;

-- level - 3

SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID


SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID where md.GovtDistrictID is null;

select * from `m_districtblock`

-- level - 4

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID

SELECT mdb.BlockID , mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where md.GovtDistrictID is null;

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.DistrictName,md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where md.DistrictName = 'Biswanath';


SELECT mdb.BlockID , mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where mdb.GovSubDistrictID is null;


SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID


 
 
 


SELECT * FROM i_beneficiaryaccount;

SELECT IsOutbound FROM t_bencall;

SELECT  ReceivedRoleName, CZcallStartTime, CZcallEndTime,
isCallAnswered,isCallDisconnected,IsOutbound,CreatedDate FROM t_bencall;

SELECT * FROM i_beneficiaryaddress;

SELECT * FROM t_outboundcallrequest;

SELECT * FROM t_104benmedhistory;

SELECT DiseaseSummaryID,DiseaseSummary FROM t_104benmedhistory;

SELECT * FROM t_104benmedhistory;

SELECT DiseaseSummaryID,DiseaseSummary FROM t_104benmedhistory;

SELECT * FROM i_beneficiaryaddress;

SELECT * FROM m_104diseasesummary;

SELECT * FROM t_feedback;

SELECT * FROM m_agegroup;

SELECT * FROM t_feedback;

SELECT * FROM t_104benmedhistory;

SELECT DISTINCT beneficiary_reg_id,beneficiary_id,ben_name,date(ben_dob),ben_gender  
FROM i_ben_flow_outreach;

SELECT DISTINCT beneficiary_reg_id,beneficiary_id,ben_name,date(ben_dob),ben_gender,
districtID, date(created_date) FROM i_ben_flow_outreach;


-- 11/10/2023

select count(*) from i_beneficiarydetails; -- 4673109

SELECT * FROM i_beneficiarydetails limit 10000;  


beneficiary_reg_id

SELECT COUNT(DISTINCT BeneficiaryDetailsId ) FROM i_beneficiarydetails;  -- 4673109
SELECT COUNT(DISTINCT BeneficiaryRegID ) FROM i_beneficiarydetails;  -- 119718

select * from i_beneficiarydetails where 
BeneficiaryRegID != '(NULL)';

SELECT * FROM i_beneficiarydetails WHERE 
BeneficiaryRegID IS not NULL;

select * from i_beneficiarydetails where CreatedDate
between '2023-10-01 12:00:00' and '2023-10-01 23:30:00';

select * from i_beneficiarydetails where cast(CreatedDate AS DATE)
between '2023-10-01' and '2023-10-01';

select * from i_beneficiarydetails 
where BeneficiaryRegID = 265244;


356916757841

between DATE('2023-10-01') and DATE('2023-10-01');

SELECT * FROM i_beneficiarydetails WHERE 
BeneficiaryRegID is null;

select * from i_beneficiarydetails where 
BeneficiaryRegID = 265244;



SELECT * FROM `m_blocksubcentermapping`;

SELECT * FROM `m_providerservicemapping`;

SELECT * FROM `m_serviceprovider`;

SELECT * FROM `m_servicemaster`;

-- 12/10/2023 after call


-- db_identity
select *  from i_beneficiarymapping limit 1;

select *  from i_beneficiarydetails;



-- db_iemr
select *  from t_benvisitdetail;

select *  from t_bencall;

select * from m_districtbranchmapping;




--- 17/10/2023
select *  from i_beneficiarymapping where BenRegId 
in ( 265244,265245,265248) -- and BenAddressId ; 

select *  from i_beneficiaryaddress where BenAddressID 
in(2394,2395,2398 );

details  regID  address
2406	265244  2394
2407	265245  2395 
2410	265248  2398 

2394
2395
2398


select *  from i_beneficiaryaddress where BenAddressID 
in(2394,2395,2398 );


-- final
select *  from i_beneficiaryaddress where BenAddressID 
in( select BenAddressId from i_beneficiarymapping where BenRegId 
in ( select BeneficiaryRegID from i_beneficiarydetails WHERE 
BeneficiaryRegID in ( 265244,265245,265248 ) ) );

-- visit

select * from t_benvisitdetail where BeneficiaryRegID 
in ( 265244,265245,265248);

SELECT * FROM m_providerservicemapping where 
ProviderServiceMapID = 18;

SELECT * FROM m_serviceprovider where ServiceProviderID in (
select 12 );

SELECT * FROM m_serviceprovider where ServiceProviderID in (
select ServiceProviderID from m_providerservicemapping where
ProviderServiceMapID in ( select ProviderServiceMapID from t_benvisitdetail
where BeneficiaryRegID in ( 265244,265245,265248)));

select * from m_facility mf; 

select *  from t_benvisitdetail limit 10;

select * from m_van; 
where ProviderServiceMapID = 18;

select * from m_facility mf

select count(*) from m_districtbranchmapping; -- village -- 659790

select count(*) from m_districtblock ; -- block 6459 

select count(*) from m_district; -- 710

select count(*) from m_state; -- 36


-- 18/10/2023

select BenAddressID,PermVillageId ,PermVillage   
from i_beneficiaryaddress where VanID = 3 and BenAddressID
in( select BenAddressId from i_beneficiarymapping where BenRegId 
in ( select BeneficiaryRegID from i_beneficiarydetails WHERE 
BeneficiaryRegID != 'null')) and PermStateId = 5;

SELECT * FROM i_beneficiarydetails WHERE VanID = 2 LIMIT 1000;
BeneficiaryRegID in ( 265244,265245,265248 );

-- visit

select count(*) from t_bencall -- 2887837;
where BeneficiaryRegID in ( 265244,265245,265248)
limit 100


select * from t_bencall where BeneficiaryRegID
is not null limit 10000; -- 739947

select * from m_calltype mc 


-- 19/10/2023

select * from t_bencall where BeneficiaryRegID
is not null and TypeOfComplaint is not null limit 10000; -- 739947

select * from t_bencall where BeneficiaryRegID
is not null and TypeOfComplaint is not null limit 10000; -- 739947


select * from t_bencall where Category is not null 
and SubCategory is not null;

select * from t_bencall where Category is not null 
and SubCategory is not null;

select * from t_bencall where
SubCategory is not null;

select * from m_calltype mc 

select * from m_category mc ;

select * from m_subcategory ms; 

select * from m_serviceprovider ms 

select * from m_diseasetype md  mc 

select * from m_chiefcomplaint mc 


-- 01/11/2023

select * from db_iemr.m_van; 

SELECT COUNT(*) FROM db_identity.i_beneficiarydetails where 
VanID = 3; -- 3386136

SELECT COUNT(*) FROM i_beneficiarydetails WHERE 
BeneficiaryRegID IS  NULL; -- 4553391

select count(*) from i_beneficiarydetails where 
BeneficiaryRegID is not null; -- 119718


-- 20/10/2023
-- final query for 104 program registration details


SELECT * FROM i_beneficiarydetails 
WHERE BeneficiaryRegID IS NOT NULL;

i_beneficiarydetails -- `LastName`,`Gender`,`MiddleName`,`FirstName`,`BeneficiaryRegID`,`DOB`,`VanID``CreatedDate` -- enrollmentDate

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate
FROM i_beneficiarydetails i_ben_details 

WHERE i_ben_details.BeneficiaryRegID IS NOT NULL;


SELECT *  FROM i_beneficiaryaddress WHERE BenAddressID 
IN( SELECT BenAddressId FROM i_beneficiarymapping WHERE BenRegId 
IN ( SELECT BeneficiaryRegID FROM i_beneficiarydetails WHERE 
BeneficiaryRegID IN ( 265244,265245,265248 ) ) );

i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage

SELECT i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage FROM i_beneficiaryaddress i_ben_address




SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL;

-- 26/10/2023

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL;

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 10;

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 10;

-- event data call list

SELECT db_iemr.t_bencall.CallTypeID,db_iemr.t_bencall.Category, mct.CallType FROM db_iemr.t_bencall 
INNER JOIN db_iemr.m_calltype mct ON mct.CallTypeID = db_iemr.t_bencall.CallTypeID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 937838 );

SELECT db_iemr.t_bencall.* FROM db_iemr.t_bencall WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( SELECT db_identity.i_beneficiarydetails.BeneficiaryRegID
 FROM db_identity.i_beneficiarydetails )
LIMIT 1000;

SELECT db_iemr.t_bencall.CallTypeID, mct.CallType FROM db_iemr.t_bencall 
INNER JOIN db_iemr.m_calltype mct ON mct.CallTypeID = db_iemr.t_bencall.CallTypeID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 937838 );

INNER JOIN db_iemr.t_104benmedhistory benhistory ON benhistory.BeneficiaryRegID = db_iemr.t_bencall.BeneficiaryRegID 
,benhistory.DiseaseSummary
select * from db_iemr.m_category mc ;

select * from db_iemr.m_subcategory ms; 

select * from db_iemr.m_diseasetype md  mc 


select * from db_iemr.t_bencall where Category is not null 
and SubCategory is not null;

select * from db_iemr.t_bencall where Category is not null 
and SubCategory is not null;

select * from db_iemr.t_104benmedhistory; 

select * from db_iemr.m_diseasetype md  mc 

select * from db_iemr.m_104diseasesummary order by DiseaseName md 

select * from db_iemr.m_calltype order by CallType;


-- MMU -- registration -- 01/11/2023

SELECT * FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 3; -- TM

SELECT * FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 1; -- MMU

-- MMU registration data
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.Gender ,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_details.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 1 ) -- 11691-- MMU

-- mmu event -- -- 01/11/2023
SELECT * FROM db_iemr.t_benvisitdetail WHERE BeneficiaryRegID IN ( 5090720,
5090969,5278131,5330794,5337246);

-- MMU events
-- stage -- 1
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.VisitReason,
db_iemr.t_benvisitdetail.VisitCategory,db_iemr.t_benvisitdetail.SubVisitCategory,
db_iemr.t_benvisitdetail.RCHID,db_iemr.t_benvisitdetail.CreatedDate FROM db_iemr.t_benvisitdetail
where db_iemr.t_benvisitdetail.BeneficiaryRegID in ( select i_ben_details.BeneficiaryRegID from
i_beneficiarydetails i_ben_details where i_ben_details.VanID IN 
( SELECT VanID FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 1 )) -- 82001 MMU events -- Beneficiary MMU Visit Details;

-- stage -- 2
select db_iemr.t_phy_vitals.BeneficiaryRegID,

db_iemr.t_phy_vitals.SystolicBP_1stReading,
db_iemr.t_phy_vitals.DiastolicBP_1stReading,
db_iemr.t_phy_vitals.CreatedDate from db_iemr.t_phy_vitals -- MMU stage blood pressure

-- stage -- 3
select PrescriptionID,count( PrescriptionID ) 
from db_iemr.t_prescribeddrug group by  PrescriptionID;

SELECT * FROM db_iemr.t_prescribeddrug where 
PrescriptionID = 1 and BeneficiaryRegID in( ) -- MMU  query 

-- stage -- 4
select db_iemr.t_benreferdetails.BeneficiaryRegID,
db_iemr.t_benreferdetails.referredToInstituteID,
db_iemr.t_benreferdetails.referredToInstituteName 
from db_iemr.t_benreferdetails where db_iemr.t_benreferdetails.referredToInstituteID
is not null -- mmu referal details limit 1000;


-- stage -- 5 lab test
select db_iemr.t_lab_testorder.BeneficiaryRegID,db_iemr.t_lab_testorder.BenVisitID,
db_iemr.t_lab_testorder.ProcedureID, db_iemr.t_lab_testorder.ProcedureName,proname.ProcedureType,
db_iemr.t_lab_testorder.CreatedDate from db_iemr.t_lab_testorder 
INNER JOIN db_iemr.m_procedure proname ON proname.ProcedureID = db_iemr.t_lab_testorder.ProcedureID 
limit 1000; -- MMU test



-- TM 
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.Gender ,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_details.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE db_iemr.m_van.VanTypeID = 3 ) -- TM;


-- mmu event -- -- 01/11/2023
SELECT * FROM db_iemr.t_benvisitdetail WHERE BeneficiaryRegID IN ( 5090720,
5090969,5278131,5330794,5337246);

select count(*) from t_benvisitdetail -- 2036512;


-- 104 final registration Query


SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 1000;
-- final event query


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound,db_iemr.t_bencall.CallTime,db_iemr.t_bencall.CallEndTime,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds,
db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.TypeOfComplaint
,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;


AND db_iemr.t_bencall.BeneficiaryRegID IN ( 265244,
265245,265248,265252,265253,265262,265271,265276,265279,265280 );

111102 + 1000
112103

-- for 104 program event data data for category type/sub type/Diasease

-- 24/11/2023 query send by client team

select t.BenCallID,t.BeneficiaryRegID,t.CallID,t.PhoneNo,t.CallTypeID,
t.is1097,c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
t.IsOutbound,t.CallTime,t.CallEndTime,t.ReceivedRoleName,
t.CreatedDate,t.TypeOfComplaint,m.CallType from db_iemr.t_bencall t

inner join db_iemr.t_104benmedhistory b on b.BenCallID=t.BenCallID
inner join db_iemr.m_calltype m on m.CallTypeID=t.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID;


WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 265244,
265245,265248,265252,265253,265262,265271,265276,265279,265280 );


-- 104 final event query as on 08/12/2023

SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;




-- 31/10/2023-- limit 1000;  -- 265244 to 940214
-- 01/11/2023-- limit 10000; -- 940539 to 4696159

and i_ben_details.BeneficiaryRegID  > 940214

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
AND i_ben_details.BeneficiaryRegID  > 2826563 and i_ben_details.BeneficiaryRegID  <= 4696159 
order by i_ben_details.BeneficiaryRegID;



SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
AND i_ben_details.BeneficiaryRegID  > 2929052 and i_ben_details.BeneficiaryRegID  <= 4696159 



-- 02/11/2023

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,i_ben_details.DOB,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
AND i_ben_details.BeneficiaryRegID  > 3502979 ORDER BY i_ben_details.BeneficiaryRegID; -- 105713



-- event -- 310343


SELECT DISTINCT (db_iemr.t_bencall.BenCallID),db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.CallID, db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097,db_iemr.t_bencall.Category,db_iemr.t_bencall.SubCategory,
db_iemr.t_bencall.IsOutbound,db_iemr.t_bencall.CallTime,db_iemr.t_bencall.CallEndTime,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS DifferenceInSeconds,
db_iemr.t_bencall.ReceivedRoleName,CAST(db_iemr.t_bencall.CreatedDate AS DATE),db_iemr.t_bencall.TypeOfComplaint
,mct.CallType  FROM db_iemr.t_bencall 
INNER JOIN db_iemr.m_calltype mct ON mct.CallTypeID = db_iemr.t_bencall.CallTypeID
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.BeneficiaryRegID IN ( 2826563);



select DISTINCT (db_iemr.t_bencall.ReceivedRoleName) from db_iemr.t_bencall 


-- final query  for MMU -- 07/11/2023

select * from db_iemr.m_van;

select * from db_iemr.m_servicemaster ms ;

SELECT * FROM db_iemr.m_serviceprovider;

SELECT * FROM db_iemr.m_servicemaster;

select *  from db_iemr.m_van
where ProviderServiceMapID in (6,7,9,10,11,18); -- MMU 

select *  from db_iemr.m_van
where ProviderServiceMapID in (12,13,14,15,16,17,19,21); -- TM 

select *  from db_iemr.m_serviceprovider
where ServiceProviderID in (3,4,5,6,12); -- MMU service provider

select *  from db_iemr.m_servicemaster;

select *  from db_iemr.m_serviceprovider
where ServiceProviderID = 12; 

select * from db_iemr.m_providerservicemapping
where ServiceID = 2; -- MMU

select * from db_iemr.m_providerservicemapping
where ServiceID = 4; -- TM


select * from db_iemr.m_providerservicemapping
where ServiceID = 8; -- HWC

-- final query  for MMU -- 07/11/2023

-- MMU -- registration -- 11691 
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.DOB,i_ben_details.Gender ,i_ben_details.VanID, i_ben_details.CreatedDate,
i_ben_address.PermStateId,i_ben_address.PermState,i_ben_address.PermDistrictId
,i_ben_address.PermDistrict,i_ben_address.PermSubDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_details.VanID IN ( SELECT VanID FROM db_iemr.m_van where ProviderServiceMapID in (6,7,9,10,11,18) ) 
-- 11691 -- MMU


SELECT * FROM db_iemr.m_van where ProviderServiceMapID in (6,7,9,10,11,18 );

select *  from db_iemr.m_servicemaster;
select * from db_iemr.m_providerservicemapping
where ServiceID = 2; -- MMU

select *  from db_iemr.m_serviceprovider
where ServiceProviderID in (3,4,5,6,12); 

select *  from db_iemr.m_serviceprovider
where ServiceProviderID in (3,4,5,6,12); -- MMU orgUnit list -- 5


-- MMU stage data
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.VisitReason,
db_iemr.t_benvisitdetail.VisitCategory,db_iemr.t_benvisitdetail.SubVisitCategory,
db_iemr.t_benvisitdetail.RCHID,db_iemr.t_benvisitdetail.CreatedDate FROM db_iemr.t_benvisitdetail
where db_iemr.t_benvisitdetail.BeneficiaryRegID in ( select i_ben_details.BeneficiaryRegID from
i_beneficiarydetails i_ben_details where i_ben_details.VanID IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ));



-- call on 28/11/2023 for update 104 registration query 
 -- correct query i_ben_mapping table is main table in which 
 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3
LIMIT 10000;


 
-- 29/11/2023 with venkat

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID =  3; -- 3383561 -- 104 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID !=  3; -- 1275832 -- other 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ); -- 1135046 -- MMU

SELECT *  FROM db_iemr.m_servicemaster;
-- TM
SELECT * FROM db_iemr.m_providerservicemapping
WHERE ServiceID = 4; -- TM 

SELECT * FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21); -- TM


SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID =  3; -- 3383561 -- 104 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID !=  3; -- 1275832 -- other 

SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ); -- 1135046 -- MMU


SELECT COUNT(*) FROM i_beneficiarymapping WHERE 
VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21) ); -- 137537 -- TM 

SELECT COUNT(*) FROM i_beneficiarymapping; -- 4659393

SELECT * FROM db_iemr.m_providerservicemapping
WHERE ServiceID = 2; -- FLW 

SELECT * FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21); -- TM


-- TM - 137537
-- MMU -- 1135046
-- 104 -- 3383561

-- total - 137537 + 1135046 + 3383561 + 3249 == 4,659,393
-- TM - 137537
-- MMU -- 1135046
-- 104 -- 3383561
-- 1097 -- 0
-- HWC -- 0
-- others -- 3249
-- VanID -- 0 -- 2536
-- VanID -- 6 -- 38 -- MCTS
-- VanID -- 10 -- 675 -- Reserved for future

-- 104 -- registration
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3
LIMIT 1000;

-- -- 104 -- registration 2022-2023
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3 AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2024-01-01 00:00:00'; -- 257857



-- MMU 

SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE)
, i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) )
LIMIT 1000;

select * from i_beneficiarydetails where BeneficiaryRegID = 276026; -- created date diffrent 
select * from i_beneficiarymapping where BenRegId  = 276026; -- -- created date diffrent
--- 29/11/2023 end

-- MMU update on 30/11/2023 

SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE)
, i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId
AND i_ben_details.VanID = i_ben_mapping.VanID 

INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.VanSerialNo = i_ben_mapping.BenAddressId
AND i_ben_address.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ) -- 1135085
LIMIT 10000;





-- MMU Registration 2022 to 2023

SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE)
, i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 

INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId
AND i_ben_details.VanID = i_ben_mapping.VanID 

INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.VanSerialNo = i_ben_mapping.BenAddressId
AND i_ben_address.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) ) AND i_ben_mapping.CreatedDate 
between '2022-01-01 00:00:00' and '2024-01-01 00:00:00'; -- 986836


--  MMU all Stage data
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName
FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID


where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ));


select * from db_iemr.t_prescription tp 
limit 1000

-- update MMU all stage data with DiagnosisProvided

SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ))
limit 100000;


-- TM -- 04/12/2023
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL

AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (12,13,14,15,16,17,19,21) )
LIMIT 10000;


SELECT * FROM db_iemr.m_van WHERE -- VanName = 'PSMRI MMU Majuli'
ProviderServiceMapID IN (6,7,9,10,11,18); -- MMU -- orgUnit

SELECT * FROM db_iemr.m_van WHERE -- VanName = 'PSMRI MMU Majuli'
ProviderServiceMapID IN (12,13,14,15,16,17,19,21); -- TM orgUNit

-- TM registration data from 2022 to 2023

-- TM 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,
i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN ( 12,13,14,15,16,17,19,21 ) ) 
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2023-01-01 00:00:00';

-- AND  CAST(i_ben_mapping.CreatedDate AS DATE) between '2022-01-01' and '2022-12-31';

-- LIMIT 10000; -- 108046

-- TM registration final 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,
i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN ( 12,13,14,15,16,17,19,21 ) ) 
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2024-01-01 00:00:00'; --- 121778

-- AND  CAST(i_ben_mapping.CreatedDate AS DATE) between '2022-01-01' and '2022-12-31';

-- LIMIT 10000; -- 2023 -- 13732 total -- 121778

--  event data TM Stage -1 
SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.VisitReason,
db_iemr.t_benvisitdetail.VisitCategory,db_iemr.t_benvisitdetail.SubVisitCategory,
db_iemr.t_benvisitdetail.RCHID,db_iemr.t_benvisitdetail.CreatedDate FROM db_iemr.t_benvisitdetail
where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (12,13,14,15,16,17,19,21) ));


--
select * from db_iemr.m_visitcategory;
select * from db_iemr.m_subvisitcategory;

--

-- TM stage data
select * from db_iemr.t_ncddiagnosis tn; 
select NCD_Condition, from 
db_iemr.t_ncddiagnosis limit 1000; 

select * from db_iemr.t_pncdiagnosis tp;
select ProvisionalDiagnosis from 
db_iemr.t_pncdiagnosis limit 1000;

select * from db_iemr.t_ancdiagnosis ta;
select HighRiskCondition,ComplicationOfCurrentPregnancy  
from db_iemr.t_ancdiagnosis limit 10000;

select SystolicBP_1stReading,DiastolicBP_1stReading  
from db_iemr.t_phy_vitals tpv limit 1000; 


select * from db_iemr.t_tmrequest limit 1000;


select PrescriptionID  from db_iemr.t_patientissue limit 1000;

select PrescriptionID  from db_iemr.t_prescribeddrug limit 1000;

select * from db_iemr.t_tmrequest limit 1000;

select PrescriptionID  from db_iemr.t_patientissue limit 1000;

select PrescriptionID  from db_iemr.t_prescribeddrug limit 1000;

select referredToInstituteName  from db_iemr.t_benreferdetails limit 1000;

select ProcedureName  from db_iemr.t_lab_testorder limit 1000;

SELECT *  FROM db_iemr.t_prescription LIMIT 1000; -- 2139823

-- master table list 06/12/2023
select * from db_iemr.m_ncdscreeningcondition mn 

select * from db_iemr.m_status ms 

select * from db_iemr.m_complication mc 

select count(*) from db_iemr.t_prescription limit
10000; -- 2139823

select * from db_iemr.t_prescription limit
10000; 

-- TM all stage events data


SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (12,13,14,15,16,17,19,21) ));


-- 13/12/2023

-- db_iemr.m_institution details with hierarchy
SELECT ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,institution.InstitutionID 
from db_iemr.m_institution institution
INNER JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
INNER JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
INNER JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID; 


-- TM all stage events data db_iemr.m_institution details with hierarchy
SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (12,13,14,15,16,17,19,21) ));



-- MMU all stage events data db_iemr.m_institution details with hierarchy

SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.CreatedDate between '2022-01-01 00:00:00' and '2023-01-01 00:00:00'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) )); -- 851707



SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.CreatedDate between '2023-01-01 00:00:00' and '2023-06-30 00:00:00'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) )); -- 728701 -- 1086941


SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where db_iemr.t_benvisitdetail.CreatedDate between '2023-06-30 00:00:01' and '2024-01-01 00:00:00'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) )); -- 358240 + 728701 -- 1086941



--


SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
-- AND i_ben_mapping.createddate between '2019-01-01 00:00:00' and '2019-12-31 23:59:59' 
LIMIT 1000; 


 
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarymapping i_ben_mapping 
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL 

AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
LIMIT 1000;

4659393 - 4451507 -- 4454108
 
 
 
SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details 
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenRegId = i_ben_details.BeneficiaryRegID
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL 
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL 
LIMIT 1000;


SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM i_beneficiarydetails i_ben_details
INNER JOIN i_beneficiarymapping i_ben_mapping ON i_ben_mapping.BenDetailsId = i_ben_details.BeneficiaryDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
LIMIT 1000;


-- from t_bencall BeneficiaryRegID

SELECT i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_details.VanID, i_ben_details.CreatedDate,
CAST(i_ben_details.CreatedDate AS DATE),
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage
FROM db_iemr.t_bencall t
left join i_beneficiarymapping i_ben_mapping ON i_ben_mapping.benregid = t.beneficiaryregid
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_details.BeneficiaryRegID IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
LIMIT 1000;


db_identity.i_beneficiarydetails == BeneficiaryRegID
db_identity.i_beneficiarymapping  = BenRegId


SELECT * FROM i_beneficiarydetails WHERE 
BeneficiaryDetailsId = 3294768;

select * from db_identity.i_beneficiarymapping 
where BenRegId=5773338;

select count(*) from db_identity.i_beneficiarymapping  --4659393

select count(*) from db_identity.i_beneficiarymapping 
where BenRegId is not null; --4659393

where BenRegId=5773338;



-- 02/01/2023

select * from db_iemr.m_104diseasesummary md; 
select * from db_iemr.t_ncddiagnosis tn; 

select DISTINCT (NCD_Condition) from 
db_iemr.t_ncddiagnosis where NCD_Condition is not null;

select * from db_iemr.m_ncdscreeningcondition;

select * from db_iemr.t_ancdiagnosis ta limit 1000 

-- MMU month wise all stage events data db_iemr.m_institution details with hierarchy

SELECT DISTINCT ( db_iemr.t_benvisitdetail.BenVisitID), db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.SubVisitCategory,db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, referal.referredToInstituteName,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,

testorder.ProcedureName,
prescription.DiagnosisProvided FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID


where CAST(db_iemr.t_benvisitdetail.CreatedDate AS DATE ) between '2022-01-01' and '2022-02-28'
AND db_iemr.t_benvisitdetail.BeneficiaryRegID in (select i_ben_mapping.BenRegId from
db_identity.i_beneficiarymapping i_ben_mapping where i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (6,7,9,10,11,18) ));


-- Drug Prescription ID
-- Procedure Name
-- Diagnosis provided
-- Complication of current pregnancy
-- High risk condition
-- Provisional Diagnosis
-- Visit Sub-Category


-- jan 2022 -- 12923
-- feb 2022 -- 13164


select * from program;

select * from programstage where 
programid = 7220

select * from programstageinstance where 
programstageid = 7226;


-- 11/01/2024 new indicators relatd queries

select * from db_iemr.t_nhmagentrealtimedata limit 1000; -- 25


select * from db_iemr.t_104prescription; -- 62921

select * from db_iemr.t_104benmedhistory limit 1000; -- 322279


select * from db_iemr.t_detailedcallreport 
limit 1000; -- 863611

select db_iemr.t_detailedcallreport.AgentName,db_iemr.t_detailedcallreport.Campaign_Name,
db_iemr.t_detailedcallreport.AgentID, db_iemr.t_detailedcallreport.Call_Start_Time,
db_iemr.t_detailedcallreport.Call_End_Time,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_detailedcallreport.Call_End_Time,
db_iemr.t_detailedcallreport.Call_Start_Time)) AS duration_second
from db_iemr.t_detailedcallreport 
limit 1000;


select db_iemr.t_detailedcallreport.Campaign_Name,
db_iemr.t_detailedcallreport.Call_Start_Time,
db_iemr.t_detailedcallreport.Call_End_Time,
TIME_TO_SEC(TIMEDIFF(db_iemr.t_detailedcallreport.Call_End_Time,
db_iemr.t_detailedcallreport.Call_Start_Time)) AS duration_second
from db_iemr.t_detailedcallreport 
limit 1000;


-- 12/01/2024 for 104 shared by client

SELECT Count(distinct case when db_iemr.t_bencall.ReceivedRoleName like '%HAO%' and
db_iemr.t_bencall.IsOutbound is false
then db_iemr.t_bencall.BenCallID end) As Total_Calls,
count(distinct db_iemr.t_bencall.BeneficiaryRegID) As Unique_beneficiary,
count(distinct case when (db_iemr.t_bencall.ReceivedRoleName like '%HAO%' 
and db_iemr.t_bencall.IsOutbound is false) then db_iemr.t_bencall.CallID end) As Unique_Calls,
count(c.CategoryName) As Category,count(s.SubCategoryName) As Subcategory,count(b.SelecteDiagnosis) As Diasease
FROM db_iemr.t_bencall
 
inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
 
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;



-- 17/01/2024

SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.t_bencall.CallTypeID,
db_iemr.t_bencall.is1097, 
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType FROM db_iemr.t_bencall

inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL 
and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) 
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

inner join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID 

inner join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL 
and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;



select * from db_iemr.t_104prescription; 62921 -- join with BenCallID



-- 18/01/2024

-- 104 query shared by venkat

SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,
db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,
db_iemr.t_bencall.TypeOfComplaint,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall
left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;





SELECT distinct db_iemr.t_bencall.CallID, 
p.PrescriptionID,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;

















-- 19/01/2024
-- 104 query shared by venkat
SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

and db_iemr.t_bencall.BeneficiaryRegID  = 7999563;


SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL and 
AND db_iemr.t_bencall.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59';



-- 104 final query as on 08/02/2024
SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType
FROM db_iemr.t_bencall

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
left join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

AND db_iemr.t_bencall.CreatedDate between '2022-01-01 00:00:00' and '2023-12-31 23:59:59';





SELECT count(distinct db_iemr.t_bencall.BenCallID),db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,detcallreport.Queue_time FROM db_iemr.t_bencall

left join db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = db_iemr.t_bencall.CallID
left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL and 
AND db_iemr.t_bencall.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59';


SELECT db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
db_iemr.t_bencall.PhoneNo,db_iemr.mct.CallTypeID,
db_iemr.t_bencall.is1097, c.CategoryName,s.SubCategoryName,b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm,
p.PrescriptionID,db_iemr.t_bencall.IsOutbound, TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, db_iemr.t_bencall.ReceivedRoleName,db_iemr.t_bencall.CreatedDate,db_iemr.t_bencall.CallTime,
db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType
FROM db_iemr.t_bencall

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
left join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID


WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL;

SELECT count(*) from  db_iemr.t_bencall; -- 2887837

-- agent query for add new program Agent
select CampaignName,Loggedin,CreatedDate,LastModDate,Incall,
HOLD,AWT,NotReady,Free,Aux  from db_iemr.t_nhmagentrealtimedata; -- 25

select db_iemr.t_detailedcallreport.SessionID,
db_iemr.t_detailedcallreport.Queue_time, from db_iemr.t_detailedcallreport
where db_iemr.t_detailedcallreport.SessionID in ( );


-- SessionID duplicate

select db_iemr.t_detailedcallreport.SessionID,
db_iemr.t_detailedcallreport.Queue_time from db_iemr.t_detailedcallreport
where db_iemr.t_detailedcallreport.SessionID in ( 1696267902.8164000000,
1687632180.3517000000);

select db_iemr.t_104prescription.BenCallID, db_iemr.t_104prescription.PrescriptionID
from db_iemr.t_104prescription
where db_iemr.t_104prescription.BenCallID in ( );


-- 08/02/2024

-- Queue_time for indicators -- table t_detailedcallreport 
-- agent registration 
select date(Call_Start_Time), AgentID as AgentID ,
Campaign_Name  As Campaign_Name,avg(Queue_time) 
from db_iemr.t_detailedcallreport 
group by date(Call_Start_Time), Campaign_Name,AgentID;

select date(Call_Start_Time), avg(Queue_time) 
from db_iemr.t_detailedcallreport group by date(Call_Start_Time);

select  *  from db_iemr.t_detailedcallreport limit 1000;


-- agent update indicator count query

select date(CreatedDate) As Date,
(case when CampaignName in ('H_104_Hybrid_CO','H_104_CO','H_104_PD_MH') then 'CO' 
when CampaignName in ('H_104_Hybrid_HAO','H_104_HAO','ECD_ASSOCIATE','ECD_OUTBOUND_ANM') then 'HAO'
when CampaignName in ('H_104_Hybrid_MO','H_104_MO','ECD_OUTBOUND_MO') then 'MO' end) As Campaign_Name,
sum(Loggedin) As Agents_loggedin,
(sum(Incall)+sum(Hold)) As Agents_Incall,
sum(AWT) As Agents_Closure,
(sum(Free)+Sum(NotReady)+sum(Aux)) As Agents_Idle
from db_iemr.t_nhmagentrealtimedata
where CampaignName in ('H_104_Hybrid_CO','H_104_Hybrid_HAO','H_104_Hybrid_MO','H_104_CO','H_104_MO',
'H_104_HAO','ECD_ASSOCIATE','H_104_PD_MH','ECD_OUTBOUND_ANM','ECD_OUTBOUND_MO')
group by Date,Campaign_name;




-- -- 1097 registration query  13/02/2024

-- 1097 registration query 

SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_details.preferredLanguage 

FROM 1097_db_1097_identity.i_beneficiarymapping i_ben_mapping 
left JOIN 1097_db_1097_identity.i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN 1097_db_1097_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL;


SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict

FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL 
-- and i_ben_address.PermStateId = 19 and i_ben_address.PermDistrictId = 332
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 

-- AND i_ben_address.PermSubDistrictId IS NOT NULL
-- AND i_ben_mapping.VanID = 1
LIMIT 10000; -- 187864




-- 1097 registration query final

SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_details.preferredLanguage 

FROM 1097_db_1097_identity.i_beneficiarymapping i_ben_mapping 
left JOIN 1097_db_1097_identity.i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN 1097_db_1097_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL;




SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, 
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,
i_ben_details.Gender,YEAR(i_ben_details.DOB),
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_details.SexualOrientationType,i_ben_address.PermDistrictId, i_ben_address.PermDistrict

FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
WHERE i_ben_mapping.BenRegId IS NOT NULL 
-- and i_ben_address.PermStateId = 19 and i_ben_address.PermDistrictId = 332
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 
order by i_ben_mapping.BenRegId ASC; -- till 6828 done


SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_details.preferredLanguage 
FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_mapping.BenRegId > 6828
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2023-12-31 23:59:59';



SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_details.preferredLanguage 
FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
and i_ben_address.PermDistrict = 'Not Disclosed'




select * from i_beneficiarydetails limit 1000;

select count(*) from 1097_db_1097_identity.i_beneficiarymapping;
-- master table

select * from 1097_db_iemr.m_sexualorientation ms;


-- 1097 event query 
select count(*) from 1097_db_iemr.t_bencall;


-- 19/02/2024 ServiceProviderName ServiceProviderName As Project_Name
select m.ProviderServiceMapID,p.ServiceProviderName  As Project_Name,s.ServiceName from m_providerservicemapping m
inner join m_serviceprovider p on p.ServiceProviderID=m.ServiceProviderID
inner join m_servicemaster s on s.ServiceID=m.ServiceID;


-- 1097 event query

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 1097_db_iemr.t_bencall.BeneficiaryRegID,
1097_db_iemr.t_bencall.PhoneNo,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,
1097_db_iemr.t_bencall.CreatedDate
 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL

and 1097_db_iemr.t_bencall.BeneficiaryRegID  = 7110;


-- mysql query for age calculation

select CURDATE();
select NOW();
year(curdate())-year(1097_db_iemr.t_bencall.CreatedDate) as StudentAge from AgeDemo;
SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),'2010-11-25')), '%Y')+0 AS Age;
-- 1097 event query with ageOnVisit

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType

 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL -- 594241



-- 2nd query for age on visit
SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,1097_db_iemr.t_bencall.CreatedDate,

year(1097_db_iemr.t_bencall.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(1097_db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(1097_db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') As IsOutbound,
1097_db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 

1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType

FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL limit 1000

-- 26/02/2024 1097 event query

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,1097_db_iemr.t_bencall.Category
 ,servicesmapping.InstituteDirMapID,servicesmapping.FeedbackID

 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

left join 1097_db_iemr.m_bencall1097servicesmapping servicesmapping ON 
servicesmapping.BenCallID = 1097_db_iemr.t_bencall.BenCallID


-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL


--- 1097 event query

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID, 
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound, 
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,1097_db_iemr.t_bencall.Category
 -- ,cate.CategoryName,
 
 ,feedback.FeedbackID

 -- mct.CallType -- ,detcallreport.Queue_time 
FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

left join 1097_db_iemr.t_feedback feedback ON 
feedback.BenCallID = 1097_db_iemr.t_bencall.BenCallID

-- left join 1097_db_iemr.m_category cate on cate.CategoryID=servicesmapping.CategoryID


-- left join 1097_db_iemr.t_detailedcallreport detcallreport ON detcallreport.SessionID = 1097_db_iemr.t_bencall.CallID
-- left join 1097_db_iemr.t_104benmedhistory b on b.BenCallID = 1097_db_iemr.t_bencall.BenCallID
-- inner join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
-- left join 1097_db_iemr.m_category c on c.CategoryID=b.CategoryID
-- left join 1097_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID
WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL


-- --- 1097 event query provide by venkat

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID,
1097_db_iemr.t_bencall.BeneficiaryRegID,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - year(DOB) as AgeOnVisit,
1097_db_iemr.t_bencall.is1097, 1097_db_iemr.t_bencall.IsOutbound,
TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, 1097_db_iemr.t_bencall.ReceivedRoleName,
1097_db_iemr.t_bencall.CallTypeID,mct.CallType,mct.CallGroupType,feedback.FeedbackID,
ftype.FeedbackTypeName,inst.InstitutionName,inst.InstitutionID
FROM 1097_db_iemr.t_bencall
left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID
left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left join 1097_db_iemr.m_calltype mct on mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID
left join 1097_db_iemr.t_feedback feedback ON
feedback.BenCallID = 1097_db_iemr.t_bencall.BenCallID
 
left join 1097_db_iemr.m_feedbacktype ftype on ftype.FeedbackTypeID=feedback.FeedbackTypeID
 
left join 1097_db_iemr.m_institution inst on inst.InstitutionID=feedback.InstitutionID

WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL -- total records -- 594250

-- feedback master
select * from 1097_db_iemr.m_feedbacktype;

-- institution master
select * from 1097_db_iemr.m_institution;


select * from 1097_db_iemr.m_bencall1097servicesmapping;

select * from 1097_db_iemr.m_category;

select * from 1097_db_iemr.m_calltype mc 
select * from 1097_db_iemr.t_feedback tf 


-- t_bencall, db_iemr.m_bencall1097servicesmapping

select * from 1097_db_iemr.m_bencall1097servicesmapping;

-- CallID and InstituteDirMapID,FeedbackID

select * from 1097_db_iemr.m_category mc

select * from 1097_db_iemr.t_bencall tb limit 1000

-- pyton script 1097 event query 28/02/2023

SELECT distinct 1097_db_iemr.t_bencall.BenCallID,1097_db_iemr.t_bencall.CallID,
1097_db_iemr.t_bencall.BeneficiaryRegID,1097_db_iemr.t_bencall.CreatedDate,
year(1097_db_iemr.t_bencall.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
IF(1097_db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(1097_db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') As IsOutbound,
1097_db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(1097_db_iemr.t_bencall.CallEndTime,1097_db_iemr.t_bencall.CallTime))
AS CallDurationInSeconds, mct.CallType,mct.CallGroupType,

feedback.FeedbackID,ftype.FeedbackTypeName,inst.InstitutionID, inst.InstitutionName

FROM 1097_db_iemr.t_bencall

left join  1097_db_1097_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = 1097_db_iemr.t_bencall.BeneficiaryRegID

left join  1097_db_1097_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join 1097_db_iemr.m_calltype mct ON mct.CallTypeID=1097_db_iemr.t_bencall.CallTypeID

left join 1097_db_iemr.t_feedback feedback ON
feedback.BenCallID = 1097_db_iemr.t_bencall.BenCallID

left join 1097_db_iemr.m_feedbacktype ftype on ftype.FeedbackTypeID=feedback.FeedbackTypeID
left join 1097_db_iemr.m_institution inst on inst.InstitutionID=feedback.InstitutionID

WHERE 1097_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
order by 1097_db_iemr.t_bencall.BenCallID ASC;


-- 1) 1097_db_iemr.t_bencall.BenCallID BETWEEN 1 AND 10000 -- 1776 -- done
-- 2) 1097_db_iemr.t_bencall.BenCallID BETWEEN 10001 AND 20000 -- 1677 -- done















--- bayer

SELECT i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE),i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType,i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,i_ben_address.PermSubDistrictId,
i_ben_address.PermSubDistrict
FROM i_beneficiarymapping i_ben_mapping 
left JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_address.PermSubDistrictId IS NOT NULL -- -- 98009




--- bayer final query -- 29/02/2024
SELECT bayer_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId, bayer_db_identity.i_ben_details.BeneficiaryRegID, 
CAST(bayer_db_identity.i_ben_mapping.CreatedDate AS DATE),
bayer_db_identity.i_ben_details.FirstName,
bayer_db_identity.i_ben_details.MiddleName,
bayer_db_identity.i_ben_details.LastName,bayer_db_identity.i_ben_details.Gender,

IF(bayer_db_identity.i_ben_details.DOB IS NOT NULL, DATE_FORMAT(bayer_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

bayer_db_identity.i_ben_mapping.VanID,
bayer_db_identity.i_ben_address.PermStateId,bayer_db_identity.i_ben_address.PermState,
bayer_db_identity.i_ben_address.PermDistrictId,
bayer_db_identity.i_ben_address.PermDistrict,
bayer_db_identity.i_ben_address.PermSubDistrictId,
bayer_db_identity.i_ben_address.PermSubDistrict,
sp.ServiceProviderName As Project,mp.ProviderServiceMapID,
bayerVan.VanID,bayerVan.VanName,bayerFacility.FacilityName

FROM bayer_db_identity.i_beneficiarymapping i_ben_mapping

left JOIN bayer_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
left JOIN bayer_db_identity.i_beneficiaryaddress i_ben_address 
ON bayer_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

inner join bayer_db_iemr.m_van bayerVan ON  bayerVan.VanID = bayer_db_identity.i_ben_mapping.VanID
inner join bayer_db_iemr.m_facility bayerFacility on bayerVan.FacilityID = bayerFacility.FacilityID
inner join bayer_db_iemr.m_providerservicemapping mp on mp.ProviderServiceMapID = bayerVan.ProviderServiceMapID
inner join bayer_db_iemr.m_serviceprovider sp on mp.ServiceProviderID = sp.ServiceProviderID


WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_address.PermSubDistrictId IS NOT NULL
AND bayerVan.ProviderServiceMapID = 1; -- 98007


--- bayer final query -- 29/02/2024 for DHIS2 TEA registration
SELECT bayer_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
bayer_db_identity.i_ben_details.BeneficiaryRegID, 
CAST(bayer_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
bayer_db_identity.i_ben_details.FirstName,bayer_db_identity.i_ben_details.MiddleName,
bayer_db_identity.i_ben_details.LastName,bayer_db_identity.i_ben_details.Gender,
IF(bayer_db_identity.i_ben_details.DOB IS NOT NULL, 
DATE_FORMAT(bayer_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
bayerVan.VanID

FROM bayer_db_identity.i_beneficiarymapping i_ben_mapping

LEFT JOIN bayer_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN bayer_db_iemr.m_van bayerVan ON  bayerVan.VanID = bayer_db_identity.i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND bayerVan.ProviderServiceMapID = 1
ORDER by MappingBenRegId ASC; -- 98007


select sp.ServiceProviderName As Project,mp.ProviderServiceMapID,m.VanID,m.VanName,f.FacilityName from m_van m
inner join m_facility f on m.FacilityID=f.FacilityID
inner join m_providerservicemapping mp on mp.ProviderServiceMapID=m.ProviderServiceMapID
inner join m_serviceprovider sp on mp.ServiceProviderID=sp.ServiceProviderID
where m.ProviderServiceMapID = 1



-- bayer final event / TRANSACTION query -- 01/03/2024 for DHIS2 Event

SELECT bayer_db_iemr.t_benvisitdetail.BenVisitID, bayer_db_iemr.t_benvisitdetail.BeneficiaryRegID,
bayer_db_iemr.t_benvisitdetail.VisitNo,
CAST(bayer_db_iemr.t_benvisitdetail.CreatedDate AS DATE) AS CreatedDate, bayer_db_iemr.t_benvisitdetail.VanID ,
year(bayer_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

bayer_db_iemr.t_benvisitdetail.VisitReason,bayer_db_iemr.t_benvisitdetail.VisitCategory,

bayer_db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,

prescription.DiagnosisProvided FROM bayer_db_iemr.t_benvisitdetail

LEFT JOIN  bayer_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = bayer_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  bayer_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN bayer_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_phy_vitals phy on phy.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_tmrequest tm on tm.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_patientissue patient on patient.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN bayer_db_iemr.t_benreferdetails referal ON referal.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN bayer_db_iemr.t_prescription prescription ON prescription.BenVisitID=bayer_db_iemr.t_benvisitdetail.BenVisitID

WHERE i_ben_mapping.VanID  IN 
( SELECT VanID FROM bayer_db_iemr.m_van WHERE ProviderServiceMapID in (1));




-- HWC registration data -- 05/03/2024 for DHIS2 TEI and enrollment
SELECT gok_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
gok_db_identity.i_ben_details.BeneficiaryRegID, 
CAST(gok_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
gok_db_identity.i_ben_details.FirstName,gok_db_identity.i_ben_details.MiddleName,
gok_db_identity.i_ben_details.LastName,gok_db_identity.i_ben_details.Gender,

IF(gok_db_identity.i_ben_details.DOB IS NOT NULL, 
DATE_FORMAT(gok_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

gok_db_identity.i_ben_mapping.VanID,gok_db_identity.i_ben_address.PermStateId,
gok_db_identity.i_ben_address.PermState,gok_db_identity.i_ben_address.PermDistrictId,
gok_db_identity.i_ben_address.PermDistrict,gok_db_identity.i_ben_address.PermSubDistrictId,
gok_db_identity.i_ben_address.PermSubDistrict,i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM gok_db_identity.i_beneficiarymapping i_ben_mapping

LEFT JOIN gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_identity.i_beneficiaryaddress i_ben_address 
ON gok_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
ORDER by MappingBenRegId ASC; 



-- HWC event / TRANSACTION query -- 05/03/2024 for DHIS2 Event

select count(*) from gok_db_iemr.t_benvisitdetail; -- 4347

SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

 year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
 year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

gok_db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
order by BenVisitID asc; -- 4760


-- HWC registration data shared by venkat 06/03/2024
SELECT beneficiaryregidmapping.BeneficiaryID,gok_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
gok_db_identity.i_ben_details.BeneficiaryRegID,
CAST(gok_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
gok_db_identity.i_ben_details.FirstName,
gok_db_identity.i_ben_details.MiddleName,
gok_db_identity.i_ben_details.LastName,
gok_db_identity.i_ben_details.Gender,
IF(gok_db_identity.i_ben_details.DOB IS NOT NULL,
DATE_FORMAT(gok_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
gok_db_identity.i_ben_mapping.VanID,gok_db_identity.i_ben_address.PermStateId,
gok_db_identity.i_ben_address.PermState,gok_db_identity.i_ben_address.PermDistrictId,
gok_db_identity.i_ben_address.PermDistrict,gok_db_identity.i_ben_address.PermSubDistrictId,
gok_db_identity.i_ben_address.PermSubDistrict,
dm.DistrictBranchID AS registration_facility_id, dm.VillageName AS registration_facility

-- i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM gok_db_identity.i_beneficiarymapping i_ben_mapping

left join gok_db_identity.m_beneficiaryregidmapping beneficiaryregidmapping  ON
beneficiaryregidmapping.BenRegId = i_ben_mapping.BenRegId

LEFT JOIN gok_db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_identity.i_beneficiaryaddress i_ben_address
ON gok_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
left join gok_db_iemr.m_user m on i_ben_mapping.CreatedBy=m.UserName
left join gok_db_iemr.t_usermastervillagemapping mv on mv.user_id=m.UserID
left join gok_db_iemr.m_districtbranchmapping dm on dm.DistrictBranchID=mv.masterVillage_id
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
ORDER by MappingBenRegId ASC;


-- HWC event data 07/03/2024
SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

 year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
 year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

-- gok_db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy, pnc.ProvisionalDiagnosis,ncd.NCD_Condition,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,

patient.PrescriptionID,referal.referredToInstituteName,testorder.ProcedureName,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
order by BenVisitID asc; -- 4760

select * from gok_db_iemr.t_infantbirthdetails ti limit 1000; -- no records
select * from gok_db_iemr.t_femaleobstetrichistory tf limit 1000; -- no records
select * from gok_db_iemr.t_ancdiagnosis ta; -- no records
select * from gok_db_iemr.t_phy_vitals tpv -- 4324


-- HWC event data 11/03/2024 updated by venkat as on 11-12 /03/2024

SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

 year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
 year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

-- gok_db_iemr.t_benvisitdetail.RCHID,
-- anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,
pnc.ProvisionalDiagnosis,
ncd.NCD_Condition,phyanthropometry.BMI,phy.rbs nurse_rbs, phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
patient.PrescriptionID, -- prescribeddrug.GenericDrugName, -- prescribeddrug2.GenericDrugName,
-- referal.referredToInstituteName,

testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_lab_testresult testresult ON ( testresult.BenVisitID = testorder.BenVisitID
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

-- LEFT JOIN gok_db_iemr.t_prescribeddrug prescribeddrug ON prescribeddrug.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID


-- INNER JOIN gok_db_iemr.t_prescribeddrug prescribeddrug2 ON  prescribeddrug2.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
-- where gok_db_iemr.t_benvisitdetail.BeneficiaryRegID = 266038

order by BenVisitID,gok_db_iemr.t_benvisitdetail.BeneficiaryRegID asc; -- 4760 -- 5278

where prescription.DiagnosisProvided like '%diarr%'

select distinct ProcedureID,ProcedureName from gok_db_iemr.t_lab_testorder
where ProcedureID = 115;

select * from gok_db_iemr.t_lab_testresult tlt 
select * from gok_db_iemr.t_lab_testorder tlt 

select * from gok_db_iemr.t_phy_anthropometry tpa 

-- ProcedureName master
select distinct ProcedureName from gok_db_iemr.m_procedure 
where ProcedureName like '%Hemoglobin%'

-- master t_prescribeddrug



-- Final HWC event data python query push to DHIS2 11/03/2024 updated by venkat as on 11-12 /03/2024

SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,ncd.NCD_Condition,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,patient.PrescriptionID,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_lab_testresult testresult ON ( testresult.BenVisitID = testorder.BenVisitID
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

order by BenVisitID asc; 

-- end  


-- STFC registration/demographic query shared by venkat as on 07/03/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,
YEAR(i_ben_details.DOB),IF(i_ben_details.DOB IS NOT NULL,
DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_mapping.CreatedDate,CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,
i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM stfc_db_identity.i_beneficiarymapping i_ben_mapping

INNER join stfc_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN stfc_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN stfc_db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 
AND i_ben_address.PermSubDistrictId IS NOT NULL; -- 717,782


-- STFC registration/demographic query shared by venkat as on 12/03/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,
YEAR(i_ben_details.DOB),
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_details.occupation,
i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,
i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,
i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM stfc_db_identity.i_beneficiarymapping i_ben_mapping

INNER join stfc_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN stfc_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN stfc_db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN stfc_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN stfc_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2024-12-31 23:59:59'; -- 268835;
-- AND i_ben_address.PermSubDistrictId IS NOT NULL 
-- and i_ben_mapping.VanID = 36
limit 10000;  -- 717,782


SELECT * FROM stfc_db_iemr.m_van

--STFC:  

select f.FacilityName,m.VanName,m.VanID from m_van m
inner join m_facility f on m.FacilityID=f.FacilityID

-- STFC DHIS2 registration query 25/03/2024 for python from '2021-01-01 00:00:00' to '2024-12-31 23:59:59'

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, 
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_mapping.VanID,i_ben_address.PermDistrict,
i_ben_details.occupation

FROM stfc_db_identity.i_beneficiarymapping i_ben_mapping

INNER join stfc_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN stfc_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN stfc_db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN stfc_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN stfc_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2024-12-31 23:59:59'
ORDER by MappingBenRegId ASC; -- 268835

-- 1) STFC TMC event / TRANSACTION query -- query -- 09/04/2024 updated by venkat
-- STFC Transactional query
SELECT distinct(stfc_db_iemr.t_benvisitdetail.Visitcode),stfc_db_iemr.t_benvisitdetail.BenVisitID, stfc_db_iemr.t_benvisitdetail.BeneficiaryRegID,stfc_db_iemr.t_benvisitdetail.vanid,
stfc_db_iemr.t_benvisitdetail.VisitNo,stfc_db_iemr.t_benvisitdetail.CreatedDate,

year(stfc_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

stfc_db_iemr.t_benvisitdetail.VisitReason,stfc_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM stfc_db_iemr.t_benvisitdetail

LEFT JOIN  stfc_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = stfc_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  stfc_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN stfc_db_iemr.t_ancdiagnosis anc on anc.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN stfc_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN stfc_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN stfc_db_iemr.t_phy_vitals phy on phy.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN stfc_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN stfc_db_iemr.t_patientissue patient on patient.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN stfc_db_iemr.t_benreferdetails referal ON referal.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN stfc_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN stfc_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN stfc_db_iemr.t_prescription As prescription ON prescription.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN stfc_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=stfc_db_iemr.t_benvisitdetail.Visitcode

WHERE  stfc_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by stfc_db_iemr.t_benvisitdetail.Visitcode ASC; -- 272110


-- STFC final event / TRANSACTION query -- 28/03/2024 for DHIS2 Event

SELECT stfc_db_iemr.t_benvisitdetail.BenVisitID, stfc_db_iemr.t_benvisitdetail.BeneficiaryRegID,
stfc_db_iemr.t_benvisitdetail.VisitNo,stfc_db_iemr.t_benvisitdetail.CreatedDate,

year(stfc_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

stfc_db_iemr.t_benvisitdetail.VisitReason,stfc_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,ncd.NCD_Condition,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,patient.PrescriptionID,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,

prescription.DiagnosisProvided FROM stfc_db_iemr.t_benvisitdetail

LEFT JOIN  stfc_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = stfc_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  stfc_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN stfc_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN stfc_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN stfc_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN stfc_db_iemr.t_phy_vitals phy on phy.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN stfc_db_iemr.t_tmrequest tm on tm.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN stfc_db_iemr.t_patientissue patient on patient.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN stfc_db_iemr.t_benreferdetails referal ON referal.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN stfc_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN stfc_db_iemr.t_lab_testresult testresult ON ( testresult.BenVisitID = testorder.BenVisitID
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN stfc_db_iemr.t_prescription prescription ON prescription.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN stfc_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.BenVisitID=stfc_db_iemr.t_benvisitdetail.BenVisitID


AND i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2024-12-31 23:59:59'
order by stfc_db_iemr.t_benvisitdetail.BenVisitID ASC;



-- sehatok_db_identity registration query 12/03/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,
i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId

FROM sehatok_db_identity.i_beneficiarymapping i_ben_mapping

INNER join sehatok_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN sehatok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN sehatok_db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN sehatok_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN sehatok_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 
and vanmaster.ProviderServiceMapID = 3; -- 304,168 ( registration all data )

limit 10000; -- 304,168 -- 368,395




-- Sehat
select f.FacilityName,m.VanName,m.VanID from m_van m
inner join m_facility f on m.FacilityID=f.FacilityID order by m.VanID asc;

select f.FacilityName,m.VanName,m.VanID from m_van m
inner join m_facility f on m.FacilityID=f.FacilityID 
where m.ProviderServiceMapID=3
order by m.VanID asc;

-- sehatok_db_identity DHIS2 registration query 24/03/2024 for python
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_address.PermDistrict

FROM sehatok_db_identity.i_beneficiarymapping i_ben_mapping

INNER join sehatok_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN sehatok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN sehatok_db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN sehatok_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN sehatok_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL 
and vanmaster.ProviderServiceMapID = 3 ORDER by MappingBenRegId ASC
limit 100; -- 304,168


-- sehatok final event / TRANSACTION query -- 28/03/2024 for DHIS2 Event

SELECT sehatok_db_iemr.t_benvisitdetail.BenVisitID, sehatok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
sehatok_db_iemr.t_benvisitdetail.VisitNo,sehatok_db_iemr.t_benvisitdetail.CreatedDate,

year(sehatok_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

sehatok_db_iemr.t_benvisitdetail.VisitReason,sehatok_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,ncd.NCD_Condition,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,patient.PrescriptionID,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,

prescription.DiagnosisProvided FROM sehatok_db_iemr.t_benvisitdetail

LEFT JOIN  sehatok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = sehatok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  sehatok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN sehatok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN sehatok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN sehatok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN sehatok_db_iemr.t_phy_vitals phy on phy.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN sehatok_db_iemr.t_tmrequest tm on tm.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN sehatok_db_iemr.t_patientissue patient on patient.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN sehatok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN sehatok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN sehatok_db_iemr.t_lab_testresult testresult ON ( testresult.BenVisitID = testorder.BenVisitID
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN sehatok_db_iemr.t_prescription prescription ON prescription.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN sehatok_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.BenVisitID=sehatok_db_iemr.t_benvisitdetail.BenVisitID

order by sehatok_db_iemr.t_benvisitdetail.BenVisitID ASC;


-- 1) sehatok TMC event / TRANSACTION query -- query -- 09/04/2024 updated by venkat
-- Sehat Ok  Transactional query
-- Sehat Ok please Transactional data query
SELECT distinct(sehatok_db_iemr.t_benvisitdetail.Visitcode),sehatok_db_iemr.t_benvisitdetail.BenVisitID, sehatok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
sehatok_db_iemr.t_benvisitdetail.VisitNo,sehatok_db_iemr.t_benvisitdetail.CreatedDate,sehatok_db_iemr.t_benvisitdetail.vanid,

year(sehatok_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

sehatok_db_iemr.t_benvisitdetail.VisitReason,sehatok_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM sehatok_db_iemr.t_benvisitdetail

LEFT JOIN  sehatok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = sehatok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  sehatok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN sehatok_db_iemr.t_ancdiagnosis anc on anc.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN sehatok_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN sehatok_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN sehatok_db_iemr.t_phy_vitals phy on phy.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN sehatok_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN sehatok_db_iemr.t_patientissue patient on patient.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN sehatok_db_iemr.t_benreferdetails referal ON referal.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN sehatok_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN sehatok_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN sehatok_db_iemr.t_prescription As prescription ON prescription.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN sehatok_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=sehatok_db_iemr.t_benvisitdetail.Visitcode
where sehatok_db_iemr.t_benvisitdetail.ProviderServiceMapID=3
AND sehatok_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by sehatok_db_iemr.t_benvisitdetail.Visitcode ASC limit 1000; -- 833552

SELECT count(distinct(sehatok_db_iemr.t_benvisitdetail.Visitcode)) from 
sehatok_db_iemr.t_benvisitdetail

-- Hypertension admin: [monitoring] or [clinic]



-- 26/03/2024

-- digwal_db_identity registration/demographic query updated by venkat 28/03/2024

-- 1) Digwal TMC Demographic query: -- 16/05/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_details.occupation,

i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,

CAST(i_ben_mapping.CreatedDate AS DATE),

i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,

i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,

i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM digwal_db_identity.i_beneficiarymapping i_ben_mapping

INNER join digwal_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN digwal_db_identity.i_beneficiarydetails i_ben_details ON

i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN digwal_db_identity.i_beneficiaryaddress i_ben_address ON

i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN digwal_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN digwal_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID = 3; -- no records


-- 01/07/2024
-- Digwal TMC event count eventDataValue UNIQUE visitCode count
SELECT count(distinct(cast(data.value::json ->> 'value' AS VARCHAR)))
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'QRE1IBSOKdE' and ps.uid = 'gpZJwMDObuC'
AND org.organisationunitid in (9765148 );

SELECT count(distinct(cast(data.value::json ->> 'value' AS VARCHAR)))
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'X8UNYvbZ9wV' and ps.uid = 'gpZJwMDObuC'
AND org.organisationunitid in (9765148 );


















-- 16/05/2024




-- 1) Digwal TMC event / TRANSACTION query -- query -- 09/04/2024 updated by venkat
SELECT distinct(digwal_db_iemr.t_benvisitdetail.Visitcode),digwal_db_iemr.t_benvisitdetail.BenVisitID, digwal_db_iemr.t_benvisitdetail.BeneficiaryRegID,
digwal_db_iemr.t_benvisitdetail.VisitNo,digwal_db_iemr.t_benvisitdetail.CreatedDate,digwal_db_iemr.t_benvisitdetail.vanid,

year(digwal_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

digwal_db_iemr.t_benvisitdetail.VisitReason,digwal_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM digwal_db_iemr.t_benvisitdetail

LEFT JOIN  digwal_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = digwal_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  digwal_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN digwal_db_iemr.t_ancdiagnosis anc on anc.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_phy_vitals phy on phy.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_patientissue patient on patient.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN digwal_db_iemr.t_benreferdetails referal ON referal.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN digwal_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN digwal_db_iemr.t_prescription As prescription ON prescription.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN digwal_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
where digwal_db_iemr.t_benvisitdetail.providerservicemapid=3
AND digwal_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by digwal_db_iemr.t_benvisitdetail.Visitcode ASC; -- 38994


-- 2) Digwal MMU Demographic query digwal_db_identity DHIS2 registration query 04/04/2024 for python
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_address.PermDistrict,i_ben_details.occupation

FROM digwal_db_identity.i_beneficiarymapping i_ben_mapping

INNER join digwal_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN digwal_db_identity.i_beneficiarydetails i_ben_details ON
(i_ben_details.Vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.VanID=i_ben_mapping.VanID)

INNER JOIN digwal_db_identity.i_beneficiaryaddress i_ben_address ON
(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.vanid)

INNER JOIN digwal_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN digwal_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND vanmaster.ProviderServiceMapID in (4,5,6,7)
ORDER BY  i_ben_mapping.BenRegId ASC; -- 308 records done


-- 2) Digwal MMU Demographic query: updated by venkat 28/03/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_details.occupation,

i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,

CAST(i_ben_mapping.CreatedDate AS DATE),

i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,

i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,

i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM digwal_db_identity.i_beneficiarymapping i_ben_mapping

INNER join digwal_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN digwal_db_identity.i_beneficiarydetails i_ben_details ON

(i_ben_details.Vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.VanID=i_ben_mapping.VanID)

INNER JOIN digwal_db_identity.i_beneficiaryaddress i_ben_address ON

(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.vanid)

INNER JOIN digwal_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN digwal_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID in (4); -- 308

-- SJVN MMU 16/05/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_details.occupation,

i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,

CAST(i_ben_mapping.CreatedDate AS DATE),

i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,

i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,

i_ben_address.PermVillageId,i_ben_address.PermVillage

 
FROM digwal_db_identity.i_beneficiarymapping i_ben_mapping

INNER join digwal_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN digwal_db_identity.i_beneficiarydetails i_ben_details ON

(i_ben_details.Vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.VanID=i_ben_mapping.VanID)

INNER JOIN digwal_db_identity.i_beneficiaryaddress i_ben_address ON

(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.vanid)

INNER JOIN digwal_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN digwal_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID in (5,6,7);










-- 2) Digwal MMU event / TRANSACTION query -- query -- 09/04/2024 updated by venkat
   -- digwal MMU 
SELECT distinct(digwal_db_iemr.t_benvisitdetail.Visitcode),digwal_db_iemr.t_benvisitdetail.BenVisitID, digwal_db_iemr.t_benvisitdetail.BeneficiaryRegID,
digwal_db_iemr.t_benvisitdetail.VisitNo,digwal_db_iemr.t_benvisitdetail.CreatedDate,digwal_db_iemr.t_benvisitdetail.vanid,

year(digwal_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

digwal_db_iemr.t_benvisitdetail.VisitReason,digwal_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
            
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM digwal_db_iemr.t_benvisitdetail

LEFT JOIN  digwal_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = digwal_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  digwal_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN digwal_db_iemr.t_ancdiagnosis anc on anc.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_phy_vitals phy on phy.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_patientissue patient on patient.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN digwal_db_iemr.t_benreferdetails referal ON referal.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN digwal_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN digwal_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN digwal_db_iemr.t_prescription As prescription ON prescription.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN digwal_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=digwal_db_iemr.t_benvisitdetail.Visitcode
where digwal_db_iemr.t_benvisitdetail.providerservicemapid in (4,5,6,7)
AND digwal_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by digwal_db_iemr.t_benvisitdetail.Visitcode ASC; -- 46636

-- order by digwal_db_iemr.t_benvisitdetail.BenVisitID ASC limit 1000;

select * from digwal_db_iemr.m_van
where ProviderServiceMapID in (4,5,6,7);


-- apl_db_identity registration/demographic updated by venkat 28/03/2024

-- 1) APL MMU demographic query: updated by venkat 28/03/2024
 
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_details.occupation,

i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,

CAST(i_ben_mapping.CreatedDate AS DATE),

i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,

i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,

i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM apl_db_identity.i_beneficiarymapping i_ben_mapping

INNER join apl_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN apl_db_identity.i_beneficiarydetails i_ben_details ON

(i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

INNER JOIN apl_db_identity.i_beneficiaryaddress i_ben_address ON

(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.vanid=i_ben_mapping.VanID)

INNER JOIN apl_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN apl_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID=10; -- 23951 ( not import due to duplicate BeneficiaryID )


-- 1) APL MMU demographic query: apl_db_identity DHIS2 registration query 05/04/2024 for python
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_mapping.VanID,i_ben_address.PermDistrict,i_ben_details.occupation

FROM apl_db_identity.i_beneficiarymapping i_ben_mapping

INNER join apl_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN apl_db_identity.i_beneficiarydetails i_ben_details ON

(i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

INNER JOIN apl_db_identity.i_beneficiaryaddress i_ben_address ON

(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.vanid=i_ben_mapping.VanID)

INNER JOIN apl_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN apl_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID=10; -- 23951


-- 1) APL MMU event / TRANSACTION query -- query -- 09/04/2024 updated by venkat
   -- APL MMU
-- APL MMU
SELECT distinct(apl_db_iemr.t_benvisitdetail.Visitcode),apl_db_iemr.t_benvisitdetail.BenVisitID, 
apl_db_iemr.t_benvisitdetail.BeneficiaryRegID,apl_db_iemr.t_benvisitdetail.VisitNo,
apl_db_iemr.t_benvisitdetail.CreatedDate,apl_db_iemr.t_benvisitdetail.vanid,

year(apl_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) AS  AgeOnVisit,

apl_db_iemr.t_benvisitdetail.VisitReason,
apl_db_iemr.t_benvisitdetail.VisitCategory,
pnc.ProvisionalDiagnosis,
phyanthropometry.BMI AS phyanthropometry_bmi,
phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,
phy.DiastolicBP_1stReading,
tm.ComorbidCondition,
patient.PrescriptionID As Drug_Dispensed,
prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, 
testorder.ProcedureName,
testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,
testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,
patient.Visitcode As Drug_Dispensecode,

SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM apl_db_iemr.t_benvisitdetail

LEFT JOIN  apl_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = apl_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  apl_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN apl_db_iemr.t_ancdiagnosis anc on anc.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_phy_vitals phy on phy.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_patientissue patient on patient.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN apl_db_iemr.t_benreferdetails referal ON referal.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN apl_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN apl_db_iemr.t_prescription As prescription ON prescription.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN apl_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

where apl_db_iemr.t_benvisitdetail.providerservicemapid=10
AND apl_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by apl_db_iemr.t_benvisitdetail.Visitcode ASC; -- 85442


-- 1) APL TMC Demographic query: updated by venkat 28/03/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_details.occupation,

i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,

CAST(i_ben_mapping.CreatedDate AS DATE),

i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,

i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,

i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM apl_db_identity.i_beneficiarymapping i_ben_mapping

INNER join apl_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN apl_db_identity.i_beneficiarydetails i_ben_details ON

i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN apl_db_identity.i_beneficiaryaddress i_ben_address ON

i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN apl_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN apl_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID in (1,2,3,4,5); -- 94957

-- 1) a) APL TM demographic query: apl_db_identity DHIS2 registration query 05/04/2024 for python
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_mapping.VanID,i_ben_address.PermDistrict,i_ben_details.occupation

FROM apl_db_identity.i_beneficiarymapping i_ben_mapping

INNER join apl_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN apl_db_identity.i_beneficiarydetails i_ben_details ON

i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN apl_db_identity.i_beneficiaryaddress i_ben_address ON

i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN apl_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN apl_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL

and vanmaster.ProviderServiceMapID in (1,2,3,4,5);

-- 2) APL TMC event / TRANSACTION query -- query -- 09/04/2024 updated by venkat
-- APL TMC

SELECT distinct(apl_db_iemr.t_benvisitdetail.Visitcode),apl_db_iemr.t_benvisitdetail.BenVisitID, apl_db_iemr.t_benvisitdetail.BeneficiaryRegID,
apl_db_iemr.t_benvisitdetail.VisitNo,apl_db_iemr.t_benvisitdetail.CreatedDate,apl_db_iemr.t_benvisitdetail.vanid,

year(apl_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

apl_db_iemr.t_benvisitdetail.VisitReason,apl_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
			
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM apl_db_iemr.t_benvisitdetail

LEFT JOIN  apl_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = apl_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  apl_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN apl_db_iemr.t_ancdiagnosis anc on anc.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_phy_vitals phy on phy.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_patientissue patient on patient.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN apl_db_iemr.t_benreferdetails referal ON referal.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN apl_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN apl_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN apl_db_iemr.t_prescription As prescription ON prescription.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN apl_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=apl_db_iemr.t_benvisitdetail.Visitcode

where apl_db_iemr.t_benvisitdetail.providerservicemapid in (1,2,3,4,5)
AND apl_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by apl_db_iemr.t_benvisitdetail.Visitcode ASC; -- 702487


-- Jharkhand MMU Demographic query: updated by venkat 28/03/2024
SELECT distinct mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_details.occupation,

i_ben_mapping.VanID, vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,

CAST(i_ben_mapping.CreatedDate AS DATE),

i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,

i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId,

i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM jh_db_identity.i_beneficiarymapping i_ben_mapping

INNER join jh_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN jh_db_identity.i_beneficiarydetails i_ben_details ON

(i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.VanID)


INNER JOIN jh_db_identity.i_beneficiaryaddress i_ben_address ON

(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.VanID)

INNER JOIN jh_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN jh_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL; -- 74423


-- Jharkhand MMU Demographic query query jh_db_identity DHIS2 registration query 04/04/2024 for python
SELECT distinct mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_mapping.VanID,i_ben_address.PermDistrict,i_ben_details.occupation

FROM jh_db_identity.i_beneficiarymapping i_ben_mapping

INNER join jh_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN jh_db_identity.i_beneficiarydetails i_ben_details ON
(i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.VanID)

INNER JOIN jh_db_identity.i_beneficiaryaddress i_ben_address ON
(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.VanID)

INNER JOIN jh_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

INNER JOIN jh_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_address.PermStateId IS NOT NULL

AND i_ben_address.PermDistrictId IS NOT NULL;



-- 2) Jharkhand MMU MMU event / TRANSACTION query jh_db_iemr query: as on 09/04/2024

-- JH MMU
SELECT distinct(jh_db_iemr.t_benvisitdetail.Visitcode),jh_db_iemr.t_benvisitdetail.BenVisitID, jh_db_iemr.t_benvisitdetail.BeneficiaryRegID,
jh_db_iemr.t_benvisitdetail.VisitNo,jh_db_iemr.t_benvisitdetail.CreatedDate,jh_db_iemr.t_benvisitdetail.vanid,

year(jh_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

jh_db_iemr.t_benvisitdetail.VisitReason,jh_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,

SUBSTRING_INDEX(SUBSTRING_INDEX(diagnosisprovided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5  ,
            SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
            END AS NCD_Condition2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
            END AS NCD_Condition3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
            END AS NCD_Condition4
            
FROM jh_db_iemr.t_benvisitdetail

LEFT JOIN  jh_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = jh_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  jh_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN jh_db_iemr.t_ancdiagnosis anc on anc.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN jh_db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN jh_db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN jh_db_iemr.t_phy_vitals phy on phy.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN jh_db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN jh_db_iemr.t_patientissue patient on patient.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN jh_db_iemr.t_benreferdetails referal ON referal.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN jh_db_iemr.t_lab_testorder testorder ON testorder.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN jh_db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN jh_db_iemr.t_prescription As prescription ON prescription.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN jh_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=jh_db_iemr.t_benvisitdetail.Visitcode

where jh_db_iemr.t_benvisitdetail.Visitcode IS NOT NULL 
order by jh_db_iemr.t_benvisitdetail.Visitcode ASC; -- 119509


-- 2) Aasam MMU MMU event / TRANSACTION query jh_db_iemr query: as on 09/04/2024

select * from
(SELECT DISTINCT  db_iemr.t_benvisitdetail.visitcode As Visitcode, db_iemr.t_benvisitdetail.BeneficiaryRegID,db_iemr.t_benvisitdetail.benvisitid,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,
db_iemr.t_benvisitdetail.RCHID,
anc.HighRiskCondition,anc.ComplicationOfCurrentPregnancy,pnc.ProvisionalDiagnosis,com.ComorbidCondition,
ncd.NCD_Condition,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,phy.rbs As Nurse_RBS,
 referal.referredToInstituteName,mv.vanname,
ms.StateName,md.DistrictName,mdb.BlockName,
institution.InstitutionName,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1) AS DiagnosisProvided1,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
            END AS DiagnosisProvided2,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
            END AS DiagnosisProvided3,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
            END AS DiagnosisProvided4,
            CASE
                WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
            END AS DiagnosisProvided5
 FROM db_iemr.t_benvisitdetail

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.visitcode=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.visitcode=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.visitcode=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_phy_vitals phy on phy.visitcode=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_benreferdetails referal ON referal.visitcode=db_iemr.t_benvisitdetail.visitcode
left join db_iemr.t_bencomorbiditycondition com	on com.visitcode=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.visitcode=db_iemr.t_benvisitdetail.visitcode
left join db_iemr.t_lab_testresult testresult on testresult.visitcode=testorder.visitcode and testresult.ProcedureID=testorder.ProcedureID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.visitcode=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_patientissue patient on patient.visitcode=db_iemr.t_benvisitdetail.visitcode

LEFT JOIN db_iemr.m_institution institution ON institution.InstitutionID = referal.referredToInstituteID
LEFT JOIN db_iemr.m_state ms ON ms.StateID = institution.StateID
LEFT JOIN db_iemr.m_district md ON md.DistrictID = institution.DistrictID
LEFT JOIN db_iemr.m_districtblock mdb ON mdb.BlockID = institution.BlockID
left join db_iemr.m_van mv on mv.vanid=db_iemr.t_benvisitdetail.vanid


where CAST(db_iemr.t_benvisitdetail.CreatedDate AS DATE ) between '2023-01-01' and '2023-02-28'
and db_iemr.t_benvisitdetail.providerservicemapid in (6,7,9,10,11,18)) As Vital
left join 
(select tr.visitcode As Visitcode,tr.BeneficiaryRegID As Benregid,group_concat(tr.ProcedureName) As Procedurename,group_concat(rr.TestResultValue) As Testresultvalue from db_iemr.t_lab_testorder tr
inner join db_iemr.t_lab_testresult rr on (rr.visitcode=tr.visitcode and rr.procedureid=tr.procedureid)
group by tr.visitcode,tr.BeneficiaryRegID
) As Test on Test.visitcode=Vital.Visitcode
left join
(SELECT 
        temp.Visitcode,
            temp.BeneficiaryRegID,
                        CASE
                WHEN suspected LIKE '%Epilepsy%' THEN 'Yes'
                ELSE NULL
            END AS Epilepsy_suspected,
            CASE
                WHEN suspected LIKE '%Asthma%' THEN 'Yes'
                ELSE NULL
            END AS Asthma_suspected,
            CASE
                WHEN suspected LIKE '%Vision%' THEN 'Yes'
                ELSE NULL
            END AS Vision_suspected,
            CASE
                WHEN suspected LIKE '%Tuberculosis%' THEN 'Yes'
                ELSE NULL
            END AS Tuberculosis_suspected,
            CASE
                WHEN suspected LIKE '%Malaria%' THEN 'Yes'
                ELSE NULL
            END AS Malaria_suspected,
            CASE
                WHEN suspected LIKE '%Diabetes%' THEN 'Yes'
                ELSE NULL
            END AS Diabetes_suspected,
            CASE
                WHEN suspected LIKE '%Hypertension%' THEN 'Yes'
                ELSE NULL
            END AS Hypertension_suspected,
            CASE
                WHEN confirmed LIKE '%Epilepsy%' THEN 'Yes'
                ELSE NULL
            END AS Epilepsy_confirmed,
            CASE
                WHEN confirmed LIKE '%Asthma%' THEN 'Yes'
                ELSE NULL
            END AS Asthma_confirmed,
            CASE
                WHEN confirmed LIKE '%Vision%' THEN 'Yes'
                ELSE NULL
            END AS Vision_confirmed,
            CASE
                WHEN confirmed LIKE '%Tuberculosis%' THEN 'Yes'
                ELSE NULL
            END AS Tuberculosis_confirmed,
            CASE
                WHEN confirmed LIKE '%Malaria%' THEN 'Yes'
                ELSE NULL
            END AS Malaria_confirmed,
            CASE
                WHEN confirmed LIKE '%Diabetes%' THEN 'Yes'
                ELSE NULL
            END AS Diabetes_confirmed,
            CASE
                WHEN confirmed LIKE '%Hypertension%' THEN 'Yes'
                ELSE NULL
            END AS Hypertension_confirmed
    FROM
        (SELECT 
        Visitcode,
            BeneficiaryRegID,
            GROUP_CONCAT(DISTINCT SuspectedDiseases) AS suspected,
            GROUP_CONCAT(DISTINCT ConfirmedDiseases) AS confirmed
    FROM
        db_iemr.t_idrsdetails idr
    WHERE
        idr.ProviderServiceMapID in (6,7,9,10,11,18) and date(idr.createddate) between '2023-01-01' and '2023-02-28'
    GROUP BY Visitcode,BeneficiaryRegID) AS temp) idrs ON idrs.Visitcode = Vital.Visitcode; -- -- 249165
   

-- bihar_db_identity TMC Registration / Enrollment query as on 10/04/2024
-- bihar_db_identity TMC Registration / Enrollment query as on 11/04/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,
i_ben_address.PermStateId,i_ben_address.PermState,
i_ben_address.PermDistrictId,i_ben_address.PermDistrict,
i_ben_address.PermSubDistrictId,i_ben_address.PermSubDistrict

FROM bihar_db_identity.i_beneficiarymapping i_ben_mapping

INNER join bihar_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN bihar_db_identity.i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN bihar_db_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3 and
i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59'
order by i_ben_mapping.BenRegId ASC;



-- bihar_db_iemr TMC event / TRANSACTION query as on 04/10/2024

SELECT distinct bihar_db_iemr.t_bencall.BenCallID,bihar_db_iemr.t_bencall.CallID, 
bihar_db_iemr.t_bencall.BeneficiaryRegID,

CAST(bihar_db_iemr.t_bencall.Calltime AS DATE) As CreatedDate,
year(bihar_db_iemr.t_bencall.CreatedDate) -
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(bihar_db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(bihar_db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') AS IsOutbound,

c.CategoryName,s.SubCategoryName, p.PrescriptionID, bihar_db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(bihar_db_iemr.t_bencall.CallEndTime,bihar_db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds,
mct.CallType,mct.CallGroupType,
b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm

FROM bihar_db_iemr.t_bencall

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON
i_ben_mapping.BenRegId = bihar_db_iemr.t_bencall.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join bihar_db_iemr.t_104benmedhistory b on b.BenCallID = bihar_db_iemr.t_bencall.BenCallID
left join bihar_db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join bihar_db_iemr.m_calltype mct on mct.CallTypeID=bihar_db_iemr.t_bencall.CallTypeID
left join bihar_db_iemr.m_category c on c.CategoryID=b.CategoryID
left join bihar_db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE bihar_db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
and bihar_db_iemr.t_bencall.BeneficiaryRegID in ( select BenRegId
from bihar_db_identity.i_beneficiarymapping where 
CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59')
AND bihar_db_iemr.t_bencall.Calltime between '2024-01-01 00:00:00' and '2024-03-31 23:59:59' 
ORDER BY BeneficiaryRegID ASC; -- 138919, 91886



-- drug name count query shared by venkat 12/03/2024

(SELECT a.BenVisitID,
                    cnt AS Total_drug,
                    CASE
                        WHEN cnt > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt), ',', - 1)
                    END AS drug_1,
                    CASE
                        WHEN cnt > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt), ',', - 1)
                    END AS drug1_Qty,
                    CASE
                        WHEN cnt - 1 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 1), ',', - 1)
                    END AS drug_2,
                    CASE
                        WHEN cnt - 1 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 1), ',', - 1)
                    END AS drug2_Qty,
                    CASE
                        WHEN cnt - 2 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 2), ',', - 1)
                    END AS drug_3,
                    CASE
                        WHEN cnt - 2 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 2), ',', - 1)
                    END AS drug3_Qty,
                    CASE
                        WHEN cnt - 3 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 3), ',', - 1)
                    END AS drug_4,
                    CASE
                        WHEN cnt - 3 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 3), ',', - 1)
                    END AS drug4_Qty,
                    CASE
                        WHEN cnt - 4 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 4), ',', - 1)
                    END AS drug_5,
                    CASE
                        WHEN cnt - 4 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 4), ',', - 1)
                    END AS drug5_Qty,
                    CASE
                        WHEN cnt - 5 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 5), ',', - 1)
                    END AS drug_6,
                    CASE
                        WHEN cnt - 5 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 5), ',', - 1)
                    END AS drug6_Qty,
                    CASE
                        WHEN cnt - 6 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 6), ',', - 1)
                    END AS drug_7,
                    CASE
                        WHEN cnt - 6 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 6), ',', - 1)
                    END AS drug7_Qty,
                    CASE
                        WHEN cnt - 7 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 7), ',', - 1)
                    END AS drug_8,
                    CASE
                        WHEN cnt - 7 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 7), ',', - 1)
                    END AS drug8_Qty,
                    CASE
                        WHEN cnt - 8 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 8), ',', - 1)
                    END AS drug_9,
                    CASE
                        WHEN cnt - 8 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 8), ',', - 1)
                    END AS drug9_Qty,
                    CASE
                        WHEN cnt - 9 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.GenericDrugName, ',', cnt - 9), ',', - 1)
                    END AS drug_10,
                    CASE
                        WHEN cnt - 9 > 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(a.QtyPrescribed, ',', cnt - 9), ',', - 1)
                    END AS drug10_Qty
            FROM
                (SELECT 
                BenVisitID,
                    GROUP_CONCAT(GenericDrugName) GenericDrugName,
                    GROUP_CONCAT(QtyPrescribed) QtyPrescribed,
                    COUNT(*) AS cnt
            FROM
                db_iemr.t_prescribeddrug
            GROUP BY 1) a ) ;
			
			
			
			
-- MMU event query shared by venkat as on 16/03/2024

-- aasam MMU registration query final shared by venkat 16/03/2024
SELECT i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,YEAR(i_ben_details.DOB),i_ben_mapping.VanID, i_ben_mapping.CreatedDate,
CAST(i_ben_mapping.CreatedDate AS DATE), i_ben_address.permstateid,i_ben_address.permstate,
i_ben_address.PermDistrictId,
i_ben_address.permdistrict,
i_ben_address.PermSubDistrictId,i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM db_identity.i_beneficiarymapping i_ben_mapping 

INNER JOIN db_identity.i_beneficiarydetails i_ben_details ON i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId
AND i_ben_details.VanID = i_ben_mapping.VanID 

INNER JOIN db_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.VanSerialNo = i_ben_mapping.BenAddressId
AND i_ben_address.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND  db_identity.i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN (6,7,9,10,11,18) );

-- as on 26/03/2024
-- piramal new client server details 20/03/2024

-- vpn OpenVPN password -- H!$pad77^)
-- IP -- 192.168.45.170
-- port -- 22
-- username - psmri
-- password -- P$mr1@2023$
-- location -- /var/dhis/tomcat-amrit$
-- dhis2-home -- /var/dhis/tomcat-amrit/dhis2
-- production link -- http://14.97.12.103/amrit/dhis-web-commons/security/login.action

-- database name -- amrit_v240 port -- 0001
-- database userName -- dhis
-- database userPassword -- P$mr1@2024$

-- MY-Sql production server details	
-- Database Server -- 	db_identity
-- bihar 104 -- Host	192.168.20.7
-- Username	db_amrit_dhis2
-- Password	Dhis_DB@2024$
	
Table	Table View
i_beneficiaryaddress	i_beneficiaryaddress_vtbl
i_beneficiarycontacts	i_beneficiarycontacts_vtbl
i_beneficiarydetails	i_beneficiarydetails_vtbl
i_beneficiaryidentity	i_beneficiaryidentity_vtbl
i_beneficiaryimage	i_beneficiaryimage_vtbl
m_beneficiaryregidmapping	m_beneficiaryregidmapping_vtbl
i_ben_flow_outreach	i_ben_flow_outreach_vtbl



-- 104 final for production push from 2024 jan to till date as on 26/03/2024

-- 104 a) ( for bihar )Registration/Enrollment Query for python script production server as on 12/04/2024

-- bihar db_identity 104 Registration / Enrollment query as on 12/04/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_address.PermDistrictId

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_mapping.VanID = 3 AND
i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59'
ORDER BY i_ben_mapping.BenRegId ASC; -- 62915 -- 07 15 * * * /bin/bash /python.sh >> /home/psmri/cronlogs.txt 2>&1
-- production registration count -- 65664

-- -- 104 bihar production registration/enrollment count 
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program where uid = 'vyQPQ07JB9M')));


-- missing TEI 01/05/2024

select teav.value benregid, enrollmentdate::date, pi.programinstanceid,
tei.trackedentityinstanceid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid
=pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where programid in (select programid from program where uid = 'vyQPQ07JB9M')
and trackedentityattributeid = 7210;

select * from trackedentityattribute
where uid = 'HKw3ToP2354'

select * from trackedentityattributevalue where value in (
'1256743','1256727','1239983','1224448','1224412','1224200','1224091',
'1223718','1223606','1223541','1223412','1223316','1206418');

--

https://samiksha.piramalswasthya.org/amrit/dhis-web-dashboard/
http://14.97.12.103/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=3&paging=false
http://14.97.12.103/amrit/api/29/sqlViews/RMDdYT6FFTa/data?paging=false
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/RMDdYT6FFTa/data?paging=false
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/DnhCpTpQ61r/data?paging=false

-- check event exist
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=vyQPQ07JB9M&orgUnit=ntx3ysqOWAT&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:9439502&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?fields=event&program=vyQPQ07JB9M&orgUnit=ntx3ysqOWAT&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:9439502&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=vyQPQ07JB9M&programStage=ISSSjurI0kD&orgUnit=ntx3ysqOWAT&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:9439502&skipPaging=true
-- check TEI exist
https://links.hispindia.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:7393430
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=HExrvaAcDEB&ouMode=SELECTED&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:7393430

select count(*) from programstageinstance 
where programstageid = 7391;

delete from programstageinstance 
where programstageid = 7391;

delete from trackedentitydatavalueaudit;

select * from trackedentitydatavalueaudit;

select * from programstage where uid = 'ISSSjurI0kD'


-- update bihar 104 production registration query for Emergency org unit for which district and state is null as on 16/04/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,
-- i_ben_address.PermStateId,i_ben_address.PermState,
-- i_ben_address.PermDistrictId,i_ben_address.PermDistrict,

IF(i_ben_address.PermDistrictId IS NOT NULL , i_ben_address.PermDistrictId, 'EMR001') AS PermDistrictId

-- i_ben_address.PermSubDistrictId,i_ben_address.PermSubDistrict

FROM bihar_db_identity.i_beneficiarymapping i_ben_mapping

INNER join bihar_db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN bihar_db_identity.i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN bihar_db_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_mapping.VanID = 3 
-- AND i_ben_address.PermStateId IS NOT NULL
-- AND i_ben_address.PermDistrictId IS NOT NULL
-- and i_ben_mapping.BenRegId = 1205834 
AND i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59'
-- and i_ben_address.PermDistrictId is null
order by i_ben_mapping.BenRegId ASC;  -- 63217 AND i_ben_mapping.BenRegId > 47306 -- 256069 <= -- 47306


-- i_ben_mapping.CreatedDate between '2019-01-01 00:00:00' and '2019-12-31 23:59:59'; -- 12790 -- 
-- i_ben_mapping.CreatedDate between '2019-01-01 00:00:00' and '2020-12-31 23:59:59'; -- 303375 --  start 30 00 * * * (15/05/2024) 256069 done on 17/05/2024
-- i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2021-12-31 23:59:59'; -- 409551 -- start 33 00 * * * (21/05/2024) >= AND i_ben_mapping.BenRegId >= 543590 done as on 23/04/2024
-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 193226
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'; -- 163295 -- start 55 14 * * * (25/05/2024) 
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59'; -- 65968 done
-- i_ben_mapping.CreatedDate between '2024-04-01 00:00:00' and '2024-12-31 23:59:59'; --  not done
-- done = 65968 + 303375 = 369343 + 409551 = 778,894 + 10725(2023) ( last id 1042557 ) = 789,619 + 345796 = 1,135,415
-- i_ben_mapping.CreatedDate between '2024-04-01 00:00:00' and '2024-12-31 23:59:59' 20530 + 1,135,415 = 1,155,945

-- 104 ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=3&paging=false
-- TEI enrollment list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/RMDdYT6FFTa/data?paging=false
-- check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:1
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=LeX8Wnax2HV&ouMode=SELECTED&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:543589
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=JDUOPo4SMDe&ouMode=DESCENDANTS&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:543589
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=JDUOPo4SMDe&ouMode=DESCENDANTS&ouLevel=3&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:543589






https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:1114669


-- check event exist
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=vyQPQ07JB9M&orgUnit=jyxnG0zcpDd&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:7725842&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=vyQPQ07JB9M&programStage=ISSSjurI0kD&orgUnit=jyxnG0zcpDd&ouMode=SELECTED&status=ACTIVE&filter=hsbXpo83f4I:eq:7725842&skipPaging=true



-- Bihar 104 TEI list with MappingBenRegId teiUID and ouUID 03/09/2024
select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in ( select organisationunitid from organisationunit 
where parentid = 11762 );

-- find TEI based on attributeValue

select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid
from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in ( select organisationunitid from organisationunit 
where parentid = 11762 ) and teav.value = '543589';


-- bihar 104 enrollment count 
-- https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/RMDdYT6FFTa/data?paging=false
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program where uid = 'vyQPQ07JB9M'))
) and organisationunitid in ( select organisationunitid from organisationunit 
where parentid = 11762 );


-- bihar 104 event count 
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/k6ozEBSNJej/data?paging=false
-- bihar 104 event count 03/09/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid = 11762 );


https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/jm87omtbLiy/data?paging=false
-- bihar 104 event-2 count 20/09/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'CIGe4o10jyQ') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid = 11762 );

-- 312445 pushing event2 start . 2024-09-26 12:25:02 file -- bihar_104_event_2_2019_10_01_to_2020_06_01_312445.xlsx 






delete from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'CIGe4o10jyQ') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid = 11762 );


-- bihar 104 event count 11/09/2024 date wise
SELECT count(*) FROM programstageinstance psi
-- JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
--INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
-- INNER JOIN dataelement de ON de.uid = data.key
where  psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid = 11762)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') and 
psi.created::date in( '2024-09-11','2024-09-12');




SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID,
psi.uid as eventUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'hsbXpo83f4I' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid = 11762)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') and 
psi.created::date = '2024-09-10';


-- find events based on eventDataValue
SELECT psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'hsbXpo83f4I' and org.uid = 'jyxnG0zcpDd'
and  psi.programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') and 
cast(data.value::json ->> 'value' AS VARCHAR) = '7725842';













-- 121117 -- done file -- bihar_104_event_data2019_2020_March_03Sept2024_final.xlsx -- done
-- 71056 -- 121117 + 71056 = 192,173 bihar_event_2020_04_01_to_2020_04_31_71056.xlsx -- done
-- 117076 + 192,173 = 309,249 -- bihar_104_event_2020_05_01_to_2020_05_31_117076.xlsx -- done -- done

-- 35573 + 309,249 =  344,822 -- bihar_event_104_2020_06_01_to_2020_06_31_35573.xlsx -- done
-- 118627 + 344,822 = 463,449 -- bihar_event_104_2020_07_01_to_2020_08_31_118627.xlsx -- done 
-- 134316 + 463,449 = 597,765 -- bihar_event_104_2020_09_01_to_2020_12_31_134316.xlsx -- done
-- 105128 + 597,765 = 702,893 -- bihar_event_104_2021_01_01_to_2021_03_31_105128.xlsx -- done
-- 123114 + 702,893 = 826,007 -- bihar_event_104_2021_04_01_to_2021_04_31_123114.xlsx -- done
-- 140633 + 826,007 = 966,640 -- bihar_event_104_2021_05_01_to_2021_05_31_140633.xlsx -- done

-- 275380 + 966,640 = 1,242,020 --  bihar_event_104_2021_06_01_to_2021_08_31_275380.xlsx -- done
-- 232574 + 1,242,020 = 1,474,594 bihar_event_104_2021_09_01_to_2021_12_31_232574.xlsx -- done

-- 435921 + 1,474,594 = 1,910,515 bihar_event_104_2022_01_01_to_2022_09_30_435921.xlsx -- done
-- 294295 + 1,910,515 = 2,204,810 bihar_event_104_2022_10_01_to_2023_06_30_294295.xlsx -- done

-- 2,204,810 - 1726956 = 477,854

-- 435921 + 294295 - 252,362 = 477,854 -- bihar_event_104_missing_07Sept2024_477854.xlsx -- done

-- 46427 + 2,204,810 = 2,251,237 bihar_104_missing_begregID_with_events_46427.xlsx -- done all done

-- missing -- 477 + 2,251,237 = 2,251,714

-- 315451 - 101630 = 213821 bihar_event_104_2024_02_01_to_2024-08-31_315451.xlsx
-- 286716 - 3790 = 282926 bihar_event_104_2023_07_01_to_2024_01_31_286716.xlsx

-- 315451 + 286716 = 602,167 - 101630 - 3790(105,420) = 496,747

-- 496747 + 2251237 = 2,747,984 -- bihar_event_104_2023_07_01_to_2024_08_31_496747.xlsx -- done

-- 105,420 - 1,401 = 104019( final missing )

-- 104019 + 2,747,984 = 2,852,003 bihar_104_missing_begregID_event_2023_july_2024_aug_104019.xlsx done

-- 1877 + 2,852,003 = 2,853,880 bihar_104_event_missing_begregID_1878.xlsx missing -- BeneficiaryRegID -- 1114669 registration 104 - vishakapatnam 




 AND i_ben_mapping.CreatedDate between '{oneDayBeforeTodayStartDate}' and '{oneDayBeforeTodayEndDate}'
 
 AND i_ben_mapping.CreatedDate between '2024-05-31 00:00:00' and '2024-06-06 23:59:59'

-- TRANSACTION query 104 bihar as on server prodution as on 18/04/2024

SELECT distinct db_iemr.t_bencall_vtbl.BenCallID, db_iemr.t_bencall_vtbl.CallID, 
    db_iemr.t_bencall_vtbl.BeneficiaryRegID,

    CAST(db_iemr.t_bencall_vtbl.Calltime AS DATE) As CreatedDate,
    year(db_iemr.t_bencall_vtbl.CreatedDate) -
    year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

    IF(db_iemr.t_bencall_vtbl.IsOutbound = 1, 'true', 'false') AS IsOutbound,

    c.CategoryName,s.SubCategoryName, p.PrescriptionID, db_iemr.t_bencall_vtbl.ReceivedRoleName,

    TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall_vtbl.CallEndTime,db_iemr.t_bencall_vtbl.CallTime)) AS CallDurationInSeconds,
    mct.CallType, mct.CallGroupType, b.SelecteDiagnosis As Diasease

    FROM db_iemr.t_bencall_vtbl

    LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON
    i_ben_mapping.BenRegId = db_iemr.t_bencall_vtbl.BeneficiaryRegID

    LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON
    i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

    left join db_iemr.t_104benmedhistory_vtbl b on b.BenCallID = db_iemr.t_bencall_vtbl.BenCallID
    left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
    inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall_vtbl.CallTypeID
    left join db_iemr.m_category c on c.CategoryID=b.CategoryID
    left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

    WHERE db_iemr.t_bencall_vtbl.BeneficiaryRegID IS NOT NULL
    and db_iemr.t_bencall_vtbl.BeneficiaryRegID in ( select BenRegId
    from db_identity.i_beneficiarymapping where 
    CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59') 
    ORDER BY BeneficiaryRegID ASC;

-- 104 bihar query with BeneficiaryRegID


SELECT teav.value,tei.uid tei_uid,org.uid org_uid
FROM programinstance pi
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' and teav.trackedentityattributeid = 7210
AND pi.organisationunitid in ( select organisationunitid from
organisationunit where parentid in(11762) );


-- 104 aasam production issue
-- aasam server details IP -- 192.168.5.7
-- '2019-07-01 00:00:00' and '2019-12-31 23:59:59'


-- Aasam db_identity 104 Registration / Enrollment query as on 04/05/2024 for production
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,
IF(i_ben_address.PermDistrictId IS NOT NULL, i_ben_address.PermDistrictId, 'EMR001') AS DistrictId

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_mapping.VanID = 3 AND
i_ben_mapping.CreatedDate between '2019-07-01 00:00:00' and '2019-12-31 23:59:59'
ORDER BY i_ben_mapping.BenRegId ASC;


i_ben_mapping.CreatedDate between '2019-07-01 00:00:00' and '2020-12-31 23:59:59' -- 1156647 + 462618( deleted as on 03/06/2024 ) = 1619555 -- tea-value -- 3640154
i_ben_mapping.CreatedDate between '2021-07-01 00:00:00' and '2022-12-31 23:59:59' -- 1619555 + 340302 ( deleted as on 04/06/2024 ) = 1,959,857 -- tea-value -- 2715093
i_ben_mapping.CreatedDate between '2023-07-01 00:00:00' and '2024-05-26 23:59:59' -- 1,959,857 + 160600 = 2,120,457 -- tea-value -- 1144524

-- total assam Registration / Enrollment count -- 462618 + 340302 + 160600 == 963,520
-- Aasam 104 Registration / Enrollment count query



-- 104 ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=3&paging=false
-- TEI enrollment list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/RMDdYT6FFTa/data?paging=false
-- check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:1
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=LeX8Wnax2HV&ouMode=SELECTED&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:543589

https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=vyQPQ07JB9M&filter=HKw3ToP2354:eq:265243


https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/rjjg3RxpakM/data?paging=false

-- Assam 104 TEI list with MappingBenRegId teiUID and ouUID 03/09/2024 08/10/2024

select teav.value AS MappingBenRegId, tei.uid tei_uid,
org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in ( select organisationunitid from organisationunit 
where parentid in(11761,11759,11760) );


select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'vyQPQ07JB9M' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in ( select organisationunitid from organisationunit 
where parentid in(11761,11759,11760) );


-- Assam 104 enrollment count 

select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program where uid = 'vyQPQ07JB9M'))
) and organisationunitid in ( select organisationunitid from organisationunit 
where parentid in(11761,11759,11760) );


-- Assam 104 event count 
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/GAZNqwHIftw/data?paging=false

-- Assam 104 event count 11/09/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid in(11761,11759,11760) );


SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID,
psi.uid as eventUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'hsbXpo83f4I' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid in(11761,11759,11760))
and  psi.programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') and 
psi.created::date = '2024-09-10';


 
-- for event 2 data BenCallID 08/10/2024
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/noJ69jUopCb/data?paging=false

select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'CIGe4o10jyQ') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid in(11761,11759,11760) );

SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID,
psi.uid as eventUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'hsbXpo83f4I' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid in(11761,11759,11760))
and  psi.programstageid in ( select programstageid
from programstage where uid = 'CIGe4o10jyQ') and 
psi.created::date = '2024-10-08';

select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'CIGe4o10jyQ') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid in(11761,11759,11760) ) 
and created::date = '2024-10-08';

-- 82916 + 13479 (missing) -- 96,395 -- assam_104_event_2019_01_01_to_2019_11_31_82916.xlsx done

82931

-- 83965 -- missing -- 1122 assam_event2_2024_08_01_to_2024_10_01_85087.xlsx












--





select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program where uid = 'vyQPQ07JB9M')))
and organisationunitid in ( select organisationunitid from
organisationunit where parentid in(11761,11759,11760));


select organisationunitid from
organisationunit where uid = 'GDInuuoYIQw' -- Assam -- 11761



delete from programinstance where trackedentityinstanceid in ();

update organisationunit set geometry = null where uid in(
)

update trackedentityinstance set created = now()::timestamp where created = '2024-05-30';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update programinstance set created = now()::timestamp where created = '2024-05-30';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-30';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityattributevalue set created = now()::timestamp where created = '2024-05-30';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-05-30';


https://samiksha.piramalswasthya.org/amrit/api/system/id.json?limit=100000

="update trackedentityinstance set organisationunitid  = "&B2&" where trackedentityinstanceid = "&A2&";"
="update programinstance set organisationunitid  = "&B2&" where trackedentityinstanceid = "&A2&" and programid = "&C2&";"
="update trackedentityprogramowner set organisationunitid  = "&B2&" where trackedentityinstanceid = "&A2&" and programid = "&C2&";"



-- TM registration Aasam db_identity TM Registration / Enrollment query as on 28/05/2024 for production
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_address.PermDistrict, i_ben_address.PermDistrictId

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_mapping.VanID IN ( SELECT VanID FROM db_iemr.m_van WHERE 
ProviderServiceMapID IN ( 12,13,14,15,16,17,19,21 ) ) AND i_ben_mapping.CreatedDate 
between '2019-09-05 00:00:00' and '2019-12-31 23:59:59' ORDER BY i_ben_mapping.BenRegId ASC;

-- TM start from 2019-09-05 21:01:01


Saksham TMC :Providerservicemapid in (21,1717) -- cron done
Cisco HWC: Providerservicemapid in (17) -- on hold
Kamrup-TMC: Providerservicemapid in (13,14,15,16) -- on hold
Majuli MMU: Providerservicemapid in (11) -- on hold
Majuli TMC: Providerservicemapid = 12 -- on hold
Sparsha-MMU: Providerservicemapid in (9,10) -- -- on hold
Sanjeevani MMU:Providerservicemapid in (18) -- cron done

-- Assam Saksham TMC db_identity TM Registration / Enrollment query as on 16/06/2024 for production
-- IP -- 192.168.5.7

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_address.PermDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID in ( 21,1717 )
ORDER BY i_ben_mapping.BenRegId ASC;


-- Assam Saksham TMC db_identity TM Registration / Enrollment count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/PmL2bw3p0ek/data?paging=false

https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:UUf3nIFKpE3&level=3&paging=false


-- Assam Saksham TMC Project event/Transactional final query for which data imported 14/06/2024
-- Query Used: 
SELECT db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo, -- db_iemr.t_benvisitdetail.CreatedDate,
CAST(db_iemr.t_benvisitdetail.CreatedDate AS DATE) As CreatedDate,
db_iemr.t_benvisitdetail.vanid,
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.benReferID,referal.referredToInstituteID,referal.referredToInstituteName,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text

FROM db_iemr.t_benvisitdetail

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId 
LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_patientissue patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_benreferdetails referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)
LEFT JOIN db_iemr.t_prescription As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
where db_iemr.t_benvisitdetail.providerservicemapid in (21,1717)
order by db_iemr.t_benvisitdetail.Visitcode ASC;

-- Saksham TMC query:
-- Assam Saksham TMC Project event/Transactional final query for which data imported 22/06/2024
-- Query Used: 
SELECT db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo, -- db_iemr.t_benvisitdetail.CreatedDate,
CAST(db_iemr.t_benvisitdetail.CreatedDate AS DATE) As CreatedDate,
db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.benReferID,referal.referredToInstituteID,referal.referredToInstituteName,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.ComorbidCondition,patient.PrescriptionID As Drug_Dispensed,prescription.PrescriptionID As Drug_Prescribed,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,
testorder.VisitCode As Labtest_Prescribed,testresult.visitcode As Labtest_Prescribed_Done,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.fetosenseID,ft.fetosensetestid,mft.TestName
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId 
LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_bencomorbiditycondition tm on tm.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_patientissue patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 
LEFT JOIN db_iemr.t_benreferdetails referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 
LEFT JOIN db_iemr.t_lab_testresult testresult ON ( testresult.Visitcode = testorder.Visitcode
AND testresult.ProcedureID = testorder.ProcedureID)
 
LEFT JOIN db_iemr.t_prescription As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join db_iemr.t_fetosensedata ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
left join db_iemr.m_fetosensetests mft on mft.fetosensetestid=ft.fetosensetestid
where db_iemr.t_benvisitdetail.providerservicemapid in (21,1717) 
and db_iemr.t_benvisitdetail.Visitcode is not null
order by db_iemr.t_benvisitdetail.Visitcode ASC;



-- Assam Saksham_TMC_Enrollment TEI list with MappingBenRegId teiUID and ouUID 22/07/2024
select teav.value benregid,tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' AND teav.trackedentityattributeid = 7210 -- MappingBenRegId
AND pi.organisationunitid in (  select organisationunitid from organisationunit 
where parentid = 9765465 );

-- Assam Saksham_TMC_Enrollment count 03/08/2024
select count(*) from programinstance
where programid in ( select programid from program where uid = 'hQUeRtU70wj' ) and organisationunitid in (
select organisationunitid from organisationunit where parentid = 9765465);

-- Assam Saksham_TMC_Event count 03/08/2024

select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and organisationunitid in (
select organisationunitid from organisationunit where parentid = 9765465);


-- Assam Saksham TMC db_identity TM Registration / Enrollment count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/PmL2bw3p0ek/data?paging=false

https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:UUf3nIFKpE3&level=3&paging=false
-- Assam Saksham TMC db_identity TM event count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/AXTf2qUrvPV/data?paging=false

SELECT psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (select organisationunitid from organisationunit where parentid = 9765465)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and 
cast(data.value::json ->> 'value' AS VARCHAR)  in('30028402669552',
'30028402669622','30028402669847','30028402669849','30028501292097');


select psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'bN7qCYfCDc3' AND
psi.programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and psi.organisationunitid in (
select organisationunitid from organisationunit where parentid = 9765465);


-- 1143 pushing event start . 2024-08-03 19:30:02 via sql query done pushing event finished . 2024-08-03 23:16:11








-- oneDrive link for eventData
https://piramalfoundation1-my.sharepoint.com/personal/kandarp_joshi_piramalfoundation_org1/_layouts/15/onedrive.aspx?ga=1&id=%2Fpersonal%2Fkandarp%5Fjoshi%5Fpiramalfoundation%5Forg1%2FDocuments%2FDHIS2%20AMRIT%2FDHIS2%20LIVE%20Deployment%2Fxls%5Fsql











-- Assam Saksham TMC tei attribute value i_ben_mapping.BenRegId AS mappingBenRegId
select teav.value benregid, tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in ( select organisationunitid from organisationunit 
where parentid = 9765465 );


select teav.value benregid, tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in ( select organisationunitid from organisationunit 
where parentid = 9765465 );

select * from trackedentityattributevalue
where value in ('7502736','5305603')
and trackedentityattributeid = 7210;

-- Assam Saksham TMC event count
select count(*) from programstageinstance where organisationunitid in 
( select organisationunitid from organisationunit 
where parentid = 9765465 );


-- 20/06/2024 delete  Assam Saksham TMC  data enrollment/events

delete from trackedentityattributevalue where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where organisationunitid in 
( select organisationunitid from organisationunit 
where parentid = 9765465 ));

delete from programstageinstance where organisationunitid in 
( select organisationunitid from organisationunit 
where parentid = 9765465 ); --2638

delete from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where organisationunitid in 
( select organisationunitid from organisationunit 
where parentid = 9765465 )); -- 1014


delete from trackedentityprogramowner where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where organisationunitid in 
( select organisationunitid from organisationunit 
where parentid = 9765465 )); -- 1014

delete from trackedentityinstance where organisationunitid in 
( select organisationunitid from organisationunit 
where parentid = 9765465 ); -- 1256

-- Assam Saksham TMC eventDataValue dataElement -- Test Result Value_HWC, MMU & TMC

SELECT psi.uid eventID,psi.created::date,psi.lastupdated::date,psi.executiondate::date as eventdate, 
psi.storedby,psi.status,psi.completeddate::date,psi.completedby,org.uid AS orgUID,org.name AS orgName,
prg.uid AS prgUID, prg.name AS prgName,ps.uid AS prgStageUID, ps.name AS prgStageName,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'pLicXKFM8Uu' and ps.uid = 'gpZJwMDObuC'
AND org.organisationunitid in (
select organisationunitid from organisationunit where parentid = 9765465);


-- Assam Saksham TMC eventDataValue dataElement -- Test Result Value (numeric)_TMC
SELECT psi.uid eventID,psi.created::date,psi.lastupdated::date,psi.executiondate::date as eventdate, 
psi.storedby,psi.status,psi.completeddate::date,psi.completedby,org.uid AS orgUID,org.name AS orgName,
prg.uid AS prgUID, prg.name AS prgName,ps.uid AS prgStageUID, ps.name AS prgStageName,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'E5GHW8MDQTs' and ps.uid = 'gpZJwMDObuC'
AND org.organisationunitid in (
select organisationunitid from organisationunit where parentid = 9765465);



-- end

-- Assam MMU Sanjeevani Assam MMU Assam MMU registration Aasam db_identity MMU Registration / Enrollment query as on 28/05/2024 for production
-- MMU start from 2019-11-07 17:45:52

-- IP -- 192.168.5.7
-- 13/06/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_address.PermDistrict, i_ben_address.PermDistrictId


FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID in (18)
 AND i_ben_mapping.CreatedDate 
between '2019-11-07 00:00:00' and '2019-12-31 23:59:59' ORDER BY i_ben_mapping.BenRegId ASC;


-- Final Assam MMU Sanjeevani Assam MMU Assam MMU registration Aasam db_identity MMU Registration / Enrollment query
-- for python script
-- 13/06/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate, i_ben_mapping.VanID,
i_ben_details.FirstName, i_ben_details.MiddleName, i_ben_details.LastName,i_ben_details.Gender, 
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_address.PermDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details 
ON (i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address 
ON (i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.vanid=i_ben_mapping.vanid)

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID in (18)
AND i_ben_mapping.CreatedDate between  '2022-01-01 00:00:00' and '2023-01-01 00:00:00'
ORDER BY i_ben_mapping.BenRegId ASC;

-- add schedular on server date 17/06/2024
 --- end 

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,vanmaster.vanname,f.facilityname, i_ben_address.PermDistrict, i_ben_address.PermDistrictId
FROM db_identity.i_beneficiarymapping i_ben_mapping
INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON (i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON (i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.vanid=i_ben_mapping.vanid)
INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID
WHERE i_ben_mapping.BenRegId IS NOT NULL

AND vanmaster.ProviderServiceMapID in (18) AND i_ben_mapping.CreatedDate between  '2022-01-01 00:00:00' and '2023-01-01 00:00:00'
ORDER BY i_ben_mapping.BenRegId ASC
-- group by DATE_FORMAT( i_ben_mapping.CreatedDate, '%Y-%m') 

-- i_ben_mapping.CreatedDate between  '2022-01-01 00:00:00' and '2023-01-01 00:00:00' -- 391,574 +  437549 + 247159 == -- 10,76,282 done

-- tea value -- 684669 39 duplicate
-- Assam MMU Sanjeevani van master detials query

select vanmaster.VanID, vanmaster.vanname, f.facilityname from db_iemr.m_van vanmaster
INNER JOIN db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID
where vanmaster.ProviderServiceMapID in (18);


-- Assam MMU Sanjeevani Assam MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:BMyH5wphvtp&level=3&paging=false

-- Assam MMU Sanjeevani Registration / Enrollment count query

https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/uAC6LhlDFce/data?paging=false

-- Assam MMU Sanjeevani Assam MMU ou parent ID
select * from organisationunit where uid = 'dfh0n0UUtv1' -- 143673


update trackedentityinstance set created = now()::timestamp where created = '2024-05-30';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update programinstance set created = now()::timestamp where created = '2024-05-30';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-30';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityattributevalue set created = now()::timestamp where created = '2024-05-30';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

-- Assam_MMU_Sanjeevani_Enrollment_count -- uAC6LhlDFce
select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in (  select organisationunitid  from organisationunit where parentid = 143673));





-- as on 07/05/2024

Table	Table View
i_beneficiaryaddress	i_beneficiaryaddress_vtbl
i_beneficiarycontacts	i_beneficiarycontacts_vtbl
i_beneficiarydetails	i_beneficiarydetails_vtbl
i_beneficiaryidentity	i_beneficiaryidentity_vtbl
i_beneficiaryimage	i_beneficiaryimage_vtbl
m_beneficiaryregidmapping	m_beneficiaryregidmapping_vtbl
i_ben_flow_outreach	i_ben_flow_outreach_vtbl



-- sehatok production - IP 192.168.45.221

-- sehatok_db_identity registration query 07/05/2024
-- for production 08/05/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate, i_ben_details.FirstName,
i_ben_details.MiddleName, i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID, i_ben_address.PermDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID = 3 
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'
ORDER BY i_ben_mapping.BenRegId ASC;

-- python script
from datetime import date, timedelta
# Returns the current local date
print("Current time: ", datetime.now())
print(datetime.now() - timedelta(days=5, hours=-5))
today = date.today()
print("Current date: ", today)
print(today - timedelta(days=1))
today = date.today()
todayStartDate = today.strftime("%Y-%m-%d") + " " + "00:00:00"
todayEndDate = today.strftime("%Y-%m-%d") + " " + "23:59:59"
print(f"todayStartDate {todayStartDate}", f"todayEndDate : {todayEndDate}")
#print("Today date is: ", todayStartDate )

-- AND i_ben_mapping.CreatedDate between '{todayStartDate}' and '{todayEndDate}'

-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 109,357 -- done
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'; -- 165,216 + 109,357 = 274,573
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59'; -- 54822 + 175 + 274,573 + 52 = 329522

-- Sehat OK  ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:fsSeHWU07zY&level=3&paging=false


-- TEI enrollment list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/jE5v1DSy2bz/data?paging=false
-- check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=cgc0mgUcaNG&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:522574
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=cgc0mgUcaNG&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:1271778
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=cgc0mgUcaNG&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:290122


-- Sehat OK registration/enrollment count 
-- Sehat OK MMU TEI list with MappingBenRegId teiUID and ouUID 22/07/2024
select teav.value benregid,tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 -- MappingBenRegId
AND pi.organisationunitid in (  select organisationunitid from organisationunit 
where parentid = 7774477 );



-- Sehat OK MMU TEI list with csr_partner teiUID and ouUID 26/09/2024
select tei.trackedentityinstanceid, teav.value AS csr_partner, tei.uid tei_uid
from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 22906243 
AND pi.organisationunitid in (select organisationunitid from organisationunit 
where parentid = 7774477);

-- check event exist
https://samiksha.piramalswasthya.org/amrit/api/events.json?orgUnit=cgc0mgUcaNG&ouMode=SELECTED&program=NMGbY2nXCKu&status=ACTIVE&skipPaging=true&filter=QRE1IBSOKdE:eq:10006500027054

-- Sehat OK MMU event count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/e302lPSyJUJ/data?paging=false

-- event count
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (select organisationunitid from organisationunit 
where parentid = 7774477)
and created::date = '2024-07-31' order by programstageinstanceid desc;

-- Sehat OK MMU csr_partner event query 26/09/2024

SELECT psi.uid as eventUID, cast(data.value::json ->> 'value' AS VARCHAR) AS csr_partner
 FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'fVFoB96fAK1' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid = 7774477)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.eventdatavalues -> 'fVFoB96fAK1' is null;


-- visit_code
SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS visit_code,
psi.uid as eventUID,psi.executiondate::date as created_date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid

INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid = 7774477)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G')

-- Sehat OK MMU event count 2023
SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS visit_code,
psi.uid as eventUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid = 7774477)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and 
psi.executiondate::date between '2023-01-01' AND '2023-12-31';



SELECT psi.uid as eventUID,de.uid as dataElementUID,psi.organisationunitid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid in (7774507,7774509,7774519,7774512,7774531,7774508,
7774481,7774510,7774516,7774511,7774527,7774513,
7774514,7774518,7774515,7774517,7774520,7774524,7774530,
7774521,7774522,7774523,7774525,7774528,7774526,7774529)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and 
cast(data.value::json ->> 'value' AS VARCHAR)  = '10006500027054';


SELECT psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (7774507,7774509,7774519,7774512,7774531,7774508,
7774481,7774510,7774516,7774511,7774527,7774513,
7774514,7774518,7774515,7774517,7774520,7774524,7774530,
7774521,7774522,7774523,7774525,7774528,7774526,7774529)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and 
cast(data.value::json ->> 'value' AS VARCHAR)  in('30007100435158',
'30006900435159');


SELECT psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (7774507,7774509,7774519,7774512,7774531,7774508,
7774481,7774510,7774516,7774511,7774527,7774513,
7774514,7774518,7774515,7774517,7774520,7774524,7774530,
7774521,7774522,7774523,7774525,7774528,7774526,7774529)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.created = '2024-08-07';




-- 134086 -- pushing event start . 2024-07-27 00:20:02  -- imported -- 134086 for event-MMU-SehatOk_2022_jan_dec_26July2024 file 
-- 168197 -- pushing event start . 2024-07-28 16:15:01 168197 + 134086 = 302,283 -- imported --  event-MMU-SehatOk_2024_01_01_2024_07_21_28July2024 file 
-- 288933 + 9122 == 298,055 + 3 = 298058 --  done as on 31
-- missing TEI -- 3824 + 421

-- 302283-288933 = 

-- 47939 47939 + 298058 = 345,997 pushing event start. 2024-08-01 14:25:02 .done at 2024-08-02 01:21:12 file event-mmu-SehatOk_2023-09-01_2023-11-01_31July2024-1.xlsx

-- 47869  47869 + 345,997 = 393,866 pushing event start . 2024-08-02 15:55:02 done at pushing event finished . 2024-08-03 18:28:30 -- event-mmu-SehatOk_2023-07-01_2023-09-01_31July2024-2.xlsx
-- 44600  44600 + 393,866 = 438,466 pushing event start . 2024-08-03 18:40:01 done at pushing event finished . 2024-08-04 02:52:01 -- evemt-mmu-SehatOk_2023-05-01_2023-07-01_31July2024-3.xlsx
-- 40876  40876 + 438,466 = 479,342 pushing event start . 2024-08-04 11:45:01 done at pushing event finished . 2024-08-04 19:24:02 -- event-mmu-SehatOk_2023-03-01_2023-05-01_31July2024-4.xlsx
-- 43458  43458 + 479,342 = 522,800 pushing event start . 2024-08-04 23:20:02 done at pushing event finished . 2024-08-05 07:24:25 -- event_mmu-SehatOk_2023-01-01_2023-03-01_31July2024-5.xlsx
-- 48956  48956 + 522,800 = 571,756 pushing event start . 2024-08-05 10:10:05 done at pushing event finished . 2024-08-05 21:14:22 -- event_mmu-SehatOk_2023-11-01_2024-01-01_31July2024-6.xlsx
-- 89888  89888 + 571,756 = 661,644 pushing event start . 2024-08-05 21:58:02 event_Sehatok_mmu_missing_2022_2023_2024_05Aug2024.xlsx
-- 12577  12577 + 661,644 = 674,221 pushing event start . 2024-08-07 14:40:02 done at pushing event finished . 2024-08-07 15:52:54 sehtok_mmu_from_21July_to_06Aug_2024_07Aug2024.xlsx
--- end


SELECT mb.BeneficiaryID, i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

YEAR(i_ben_details.DOB),
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,vanmaster.VanName,f.FacilityName,i_ben_mapping.CreatedDate,CAST(i_ben_mapping.CreatedDate AS DATE),
i_ben_address.PermState,i_ben_address.PermStateId,i_ben_address.PermDistrict,
i_ben_address.PermDistrictId,i_ben_address.PermSubDistrictId

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN db_identity.i_beneficiaryaddress i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
-- AND i_ben_address.PermStateId IS NOT NULL
-- AND i_ben_address.PermDistrictId IS NOT NULL 
and vanmaster.ProviderServiceMapID = 3 AND
i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 109,357


-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 109,357
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'; -- 165,216
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59'; -- 29,595



-- bayer TM production - IP 192.168.45.219
-- bayer TM ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:OZW5netBBfD&level=3&paging=false


-- bayer_db_identity registration query 09/05/2024
-- for production 09/05/2024

SELECT mb.BeneficiaryID, i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, i_ben_details.FirstName,
i_ben_details.MiddleName, i_ben_details.LastName, i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
bayerVan.VanID FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN db_iemr.m_van bayerVan ON  bayerVan.VanID = db_identity.i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND bayerVan.ProviderServiceMapID = 1
AND i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'
ORDER by MappingBenRegId ASC;


-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 29336
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'; -- 60228
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59'; -- 29336 + 60228 + 13830 = 103394 start as on 16/05/2024 - 02 17 * * * 
-- all registration done on 17/05/2024 production 

-- bayer TM TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/i5jDuLcPddc/data?paging=false

-- bayer TM check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=MMxapqbHbw2&ouMode=SELECTED&program=hQUeRtU70wj&filter=HKw3ToP2354:eq:1271778


Table	Table View
i_beneficiaryaddress	i_beneficiaryaddress_vtbl
i_beneficiarycontacts	i_beneficiarycontacts_vtbl
i_beneficiarydetails	i_beneficiarydetails_vtbl
i_beneficiaryidentity	i_beneficiaryidentity_vtbl
i_beneficiaryimage	i_beneficiaryimage_vtbl
m_beneficiaryregidmapping	m_beneficiaryregidmapping_vtbl
i_ben_flow_outreach	i_ben_flow_outreach_vtbl

-- bayer final event / TRANSACTION query -- 18/05/2024 for DHIS2 Event
-- for production 18/05/2024
-- Bayer event query hQUeRtU70wj 21/05/2024

SELECT db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,
CAST(db_iemr.t_benvisitdetail.CreatedDate AS DATE) AS CreatedDate, db_iemr.t_benvisitdetail.VanID ,
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory,

db_iemr.t_benvisitdetail.RCHID,

pnc.ProvisionalDiagnosis,phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,
--patient.PrescriptionID
,referal.referredToInstituteName,testorder.ProcedureName,

SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1) AS NCD_Condition1,
CASE
	WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1)
END AS NCD_Condition2,
CASE
    WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1)
END AS NCD_Condition3,
CASE
    WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(ncd.ncd_condition, '||', 4), '||', - 1)
END AS NCD_Condition4,
SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1) AS DiagnosisProvided1,
CASE
    WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 1), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1)
END AS DiagnosisProvided2,
CASE
    WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 2), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1)
END AS DiagnosisProvided3,
CASE
    WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 3), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1)
END AS DiagnosisProvided4,
CASE
    WHEN STRCMP(SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 4), '||', - 1), SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)) <> 0 THEN SUBSTRING_INDEX(SUBSTRING_INDEX(DiagnosisProvided, '||', 5), '||', - 1)
END AS DiagnosisProvided5

FROM db_iemr.t_benvisitdetail

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_tmrequest tm on tm.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
--LEFT JOIN db_iemr.t_patientissue patient on patient.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN db_iemr.t_benreferdetails referal ON referal.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN db_iemr.t_prescription prescription ON prescription.BenVisitID=db_iemr.t_benvisitdetail.BenVisitID

WHERE i_ben_mapping.VanID  IN 
( SELECT VanID FROM db_iemr.m_van WHERE ProviderServiceMapID in (1)); -- 165846 as on 25/05/2024

-- start cron job at 25/05/2024 on 17 02 * * *

-- bayer TMC EVENT count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/YyTJDps9EDs/data?paging=false

-- bayer TMC EVENT count list SQL query
select count(*)  from programstageinstance where organisationunitid in (7471628,
7471629,7471630,7471632,7471631,7471636,7471633,7471634,
7471635,7471638,7471639,7471637,7471640,7471641,7471631)
and programstageid = 146164;

-- end

-- count van based on t_benvisitdetail
SELECT   BeneficiaryRegID,  count(distinct(VanID)) as cnt 
FROM bayer_db_iemr.t_benvisitdetail group by BeneficiaryRegID having cnt >1 
order by cnt desc;

SELECT   BeneficiaryRegID, VanID,  count(distinct(VanID)) as cnt 
FROM bayer_db_iemr.t_benvisitdetail 
WHERE ProviderServiceMapID in (1)
group by BeneficiaryRegID,VanID 
order by cnt desc;









--- end





-- 1097 AIDS Helpline  production - IP 192.168.35.152
-- Username:db_amrit_dhis
-- Password:Dhis_DB@2024$

-- 1097 AIDS Helpline ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:l38VgCtdLFD&level=3&paging=false


-- 1097_db_1097_identity registration query 09/05/2024
-- for production 09/05/2024
-- start date 2021-03-17 20:52:52
SELECT mb.BeneficiaryID, distinct i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID, 
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_details.SexualOrientationType, i_ben_details.preferredLanguage, 
i_ben_address.PermDistrict, i_ben_address.PermDistrictId

FROM db_identity.i_beneficiarymapping i_ben_mapping 

INNER JOIN db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermDistrictId IS NOT NULL
AND i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2021-12-31 23:59:59' -- 36,490

ORDER by MappingBenRegId ASC;

-- i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2021-12-31 23:59:59' -- 36,490
-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 58,711
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'; -- 85,638
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59'; -- 7,025
-- 

-- 1097 AIDS Helpline TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/JpTtpSn6mCL/data?paging=false

-- 1097 AIDS Helpline check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=KO7B0FymQ4D&ouMode=SELECTED&program=ggbtdN2DyfR&filter=HKw3ToP2354:eq:180888


update trackedentityinstance set created = now()::timestamp where created = '2024-05-30';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update programinstance set created = now()::timestamp where created = '2024-05-30';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-30';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityattributevalue set created = now()::timestamp where created = '2024-05-30';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-05-30';



-- 1097 AIDS Helpline TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/JpTtpSn6mCL/data?paging=false

-- 1097 AIDS Helpline check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=KO7B0FymQ4D&ouMode=SELECTED&program=ggbtdN2DyfR&filter=HKw3ToP2354:eq:180888
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=ggbtdN2DyfR&filter=HKw3ToP2354:eq:180888


-- 1097 AIDS Helpline TEI list with MappingBenRegId teiUID and ouUID 03/09/2024
select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ggbtdN2DyfR' AND teav.trackedentityattributeid = 7210;


select tei.uid tei_uid, org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'ggbtdN2DyfR' AND teav.trackedentityattributeid = 7210
and teav.value = '${BeneficiaryRegID}';


https://samiksha.piramalswasthya.org/amrit/api/sqlViews/CZwCS499cuI/data.json?var=BeneficiaryRegID:248310&paging=false


-- 1097 AIDS Helpline enrollment count 

select count(*) from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in (select programid from program where uid = 'ggbtdN2DyfR')) );


-- 1097 AIDS Helpline event count 
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/K4EuHfcijN6/data?paging=false

-- 1097 AIDS Helpline event count 13/09/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'kjSBCEmnHbG');

select uid from programstageinstance psi
where psi.programstageid in ( select programstageid
from programstage where uid = 'kjSBCEmnHbG') and 
psi.created >= '2024-09-13 17:26:05.623';

select uid from programstageinstance psi
where psi.programstageid in ( select programstageid
from programstage where uid = 'kjSBCEmnHbG') and 
psi.created >= '2024-09-13 17:26:05.623';

SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID,
psi.uid as eventUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'hsbXpo83f4I' and  psi.programstageid in ( select programstageid
from programstage where uid = 'kjSBCEmnHbG') and 
psi.created::date = '2024-09-13';


-- 284,107 -- 1097_event_2021_march_sept_2024_284107.xlsx done














-- end


-- end

--

-- Health and Wellness (HWC) Program - 
-- HWC gok_db_identity registration query 06/06/2024 -- push using SQL-QUERY
-- 

SELECT beneficiaryregidmapping.BeneficiaryID,gok_db_identity.i_ben_mapping.BenRegId AS MappingBenRegId,
gok_db_identity.i_ben_details.BeneficiaryRegID,
CAST(gok_db_identity.i_ben_mapping.CreatedDate AS DATE) AS EnrollmentDate,
gok_db_identity.i_ben_details.FirstName,
gok_db_identity.i_ben_details.MiddleName,
gok_db_identity.i_ben_details.LastName,
gok_db_identity.i_ben_details.Gender,
IF(gok_db_identity.i_ben_details.DOB IS NOT NULL,
DATE_FORMAT(gok_db_identity.i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
gok_db_identity.i_ben_mapping.VanID,gok_db_identity.i_ben_address.PermStateId,
gok_db_identity.i_ben_address.PermState,gok_db_identity.i_ben_address.PermDistrictId,
gok_db_identity.i_ben_address.PermDistrict,gok_db_identity.i_ben_address.PermSubDistrictId,
gok_db_identity.i_ben_address.PermSubDistrict,
dm.DistrictBranchID AS registration_facility_id, dm.VillageName AS registration_facility

-- i_ben_address.PermVillageId,i_ben_address.PermVillage

FROM gok_db_identity.i_beneficiarymapping i_ben_mapping

left join gok_db_identity.m_beneficiaryregidmapping beneficiaryregidmapping  ON
beneficiaryregidmapping.BenRegId = i_ben_mapping.BenRegId

LEFT JOIN gok_db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_identity.i_beneficiaryaddress i_ben_address
ON gok_db_identity.i_ben_address.BenAddressID = i_ben_mapping.BenAddressId
left join gok_db_iemr.m_user m on i_ben_mapping.CreatedBy=m.UserName
left join gok_db_iemr.t_usermastervillagemapping mv on mv.user_id=m.UserID
left join gok_db_iemr.m_districtbranchmapping dm on dm.DistrictBranchID=mv.masterVillage_id
WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
ORDER by MappingBenRegId ASC; -- 5967


-- Health and Wellness (HWC) Program HWC ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:v0l6GSGw7TS&level=5&paging=false


-- Health and Wellness (HWC) Program  TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/YYaipozePLx/data?paging=false -- -- 5967

-- Health and Wellness (HWC) Program  event count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/AfsAFCvsPmO/data?paging=false -- 5278

-- Final HWC event data python query push to DHIS2 06/06/2024 updated by venkat as on 06/06/2024

SELECT gok_db_iemr.t_benvisitdetail.BenVisitID, gok_db_iemr.t_benvisitdetail.BeneficiaryRegID,
gok_db_iemr.t_benvisitdetail.VisitNo,gok_db_iemr.t_benvisitdetail.CreatedDate,

year(gok_db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

gok_db_iemr.t_benvisitdetail.VisitReason,gok_db_iemr.t_benvisitdetail.VisitCategory,

pnc.ProvisionalDiagnosis,ncd.NCD_Condition,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs, 
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,tm.Status,patient.PrescriptionID,
testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,

prescription.DiagnosisProvided FROM gok_db_iemr.t_benvisitdetail

LEFT JOIN  gok_db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = gok_db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  gok_db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

LEFT JOIN gok_db_iemr.t_ancdiagnosis anc on anc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_pncdiagnosis pnc on pnc.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_ncddiagnosis ncd on ncd.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_phy_vitals phy on phy.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_tmrequest tm on tm.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_patientissue patient on patient.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_benreferdetails referal ON referal.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID
LEFT JOIN gok_db_iemr.t_lab_testorder testorder ON testorder.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_lab_testresult testresult ON ( testresult.BenVisitID = testorder.BenVisitID
AND testresult.ProcedureID = testorder.ProcedureID)

LEFT JOIN gok_db_iemr.t_prescription prescription ON prescription.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

LEFT JOIN gok_db_iemr.t_phy_anthropometry phyanthropometry ON 
phyanthropometry.BenVisitID=gok_db_iemr.t_benvisitdetail.BenVisitID

order by BenVisitID asc;  -- 5278

-- end






Table	Table View
i_beneficiaryaddress	i_beneficiaryaddress_vtbl
i_beneficiarycontacts	i_beneficiarycontacts_vtbl
i_beneficiarydetails	i_beneficiarydetails_vtbl
i_beneficiaryidentity	i_beneficiaryidentity_vtbl
i_beneficiaryimage	i_beneficiaryimage_vtbl
m_beneficiaryregidmapping	m_beneficiaryregidmapping_vtbl
i_ben_flow_outreach	i_ben_flow_outreach_vtbl

-- STFC MMU IP 192.168.45.113
-- STFC: inception date 2017-05-29 14:43:08

-- STFC DHIS2 registration query 14/03/2024 for python from '2021-01-01 00:00:00' to '2024-12-31 23:59:59'
-- stfc_db_identity
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB = '0-00-00 00:00:00', '1970-01-01',IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as DOB,

i_ben_mapping.VanID, i_ben_address.PermDistrict, i_ben_details.occupation

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER JOIN db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL 

AND i_ben_mapping.CreatedDate between '2019-01-01 00:00:00' and '2019-12-31 23:59:59'

ORDER by MappingBenRegId ASC;


-- STFC MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:dxsfy49ePQY&level=3&paging=false

-- STFC MMU TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/fOes5waxJ8A/data?paging=false

-- STFC MMU check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=RFKwQaRUwPI&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:180888

-- i_ben_mapping.CreatedDate between '2017-01-01 00:00:00' and '2017-12-31 23:59:59' -- 38,540 start 15/05/2024 on 58 11 * * * done as on 16/05/2024
-- i_ben_mapping.CreatedDate between '2018-01-01 00:00:00' and '2018-12-31 23:59:59' -- 155,140 = 193,680 start 18/05/2024 on 55 17 * * * done as on 20/05/2024
-- i_ben_mapping.CreatedDate between '2019-01-01 00:00:00' and '2019-12-31 23:59:59' -- 179,661 = 373,341 start 21/05/2024 on 01 00 * * * done as on 23/07/2024
-- i_ben_mapping.CreatedDate between '2020-01-01 00:00:00' and '2020-12-31 23:59:59' -- 75,597
-- i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2021-12-31 23:59:59' -- 86,434
-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59' -- 100,452
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59' -- 70,591
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59' -- 11,3

-- done -- 373,341 + 162,031 = 535,372 + 191472 = 726844

-- STFC MMU TEI list with MappingBenRegId teiUID and ouUID 17/06/2024
select teav.value benregid, tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (  7774555,7774550,7774558,7774560,7774551,7774554,
7774548,7774549,7774553,7774556,7774552,7774557,7774559,7774561,7774547  ); 

-- STFC MMU Event count
-- https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/H7CoTXMw1dh/data?paging=false

-- 27363 -- start cron from 17/07/2024 at 2024-07-17 00:47:01 == 27363 -- done at 2024-07-17 06:11:28 for stfc_mmu_Project_2022_17July2024 file
-- 34884 58644 -- start cron from 17/07/2024 at 2024-07-17 12:30:02 == 58644 + 27363 = 86007  -- done for stfc_Event-MMU-STFC Project_2023-01-01_023-05-01_17July2024
-- 57974 -- start cron from 2024-07-18 10:40:02 86007 + 57974 = 143,981 done as on 2024-07-18 22:34:17 for stfc_Event-MMU_2023-05-01_2023-09-01_18July2024_1
-- 60023 -- start cron from 2024-07-18 23:25:01 stfc_EVENT-MMU_2023-09-01_2024-01-01_18July2024_2.xlsx
-- 46241-- start 2024-07-19 12:30:02 stfc_EVENT-MMU_2023-09-01_2024-01-01_19July2024_missing done at 2024-07-19 22:27:03 = 204004 

-- 45823 -- stfc_Event-MMU_2024-01-01_2024-04-01_17July2024_4 
-- 53189 -- stfc_Event-MMU_2024-04-01_2024-07-15_17July2024_5 = 45823 + 53189 = 99012 start at 2024-07-20 13:10:02  doen 2024-07-21 10:09:27

-- total -- 204004 + 99012 = 303,016 -- done at 2024-07-21 10:09:27


-- 4767 pushing event start . 2024-08-23 18:18:02 stfc_missing_event_from_Aug_12_to_20_23Aug2024.xlsx

SELECT psi.uid as eventUID,de.uid as dataElementUID,psi.organisationunitid,org.uid as orgUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.created::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (7774555,7774550,7774558,7774560,7774551,7774554,
7774548,7774549,7774553,7774556,7774552,7774557,7774559,7774561,7774547)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and 
cast(data.value::json ->> 'value' AS VARCHAR)  in( '30003100303064',
'30003100303438','30003200303585','30003200303601',
'30003200303593','30003300303293','30003300303295','30003200303600',
'30003300303132','30003300303281','30003300303162','30003300303370',
'30003300303271','30003300303435','30003300303444','30003300303380');


SELECT psi.uid as eventUID,de.uid as dataElementUID,psi.organisationunitid,org.uid as orgUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.created::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (7774555,7774550,7774558,7774560,7774551,7774554,
7774548,7774549,7774553,7774556,7774552,7774557,7774559,7774561,7774547)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and executiondate::date = '2024-07-17';


-- end

--  using query
insert into trackedentityinstance (trackedentityinstanceid, uid, created, lastupdated,inactive,deleted,potentialduplicate,organisationunitid,trackedentitytypeid) values
="(nextval('hibernate_sequence'),'"&B2&"', '2024-05-23','2024-05-23', 'false','false','false', "&E2&", 7214 ),"

update trackedentityinstance set created = now()::timestamp where created = '2024-05-23';
update trackedentityinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

insert into programinstance (programinstanceid, uid, created, lastupdated, enrollmentdate,  status, trackedentityinstanceid, programid, incidentdate, organisationunitid, deleted, storedby ) values
="(nextval('hibernate_sequence'),'"&D2&"', '2024-05-23', '2024-05-23', '"&F2&"', 'ACTIVE', "&C2&", 7220,'"&F2&"', "&E2&", 'false','admin' ),"

update programinstance set created = now()::timestamp where created = '2024-05-23';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

insert into trackedentityprogramowner (trackedentityprogramownerid, trackedentityinstanceid, programid, created, lastupdated, organisationunitid, createdby) values
="(nextval('hibernate_sequence'),"&C2&", 7220,'2024-05-23','2024-05-23',"&E2&",'admin' ),"

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-23';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-23';

insert into trackedentityattributevalue (trackedentityinstanceid,trackedentityattributeid,created,lastupdated,value,storedby) values
="("&A2&","&B2&",'2024-05-23','2024-05-23','"&C2&"','admin'),"

update trackedentityattributevalue set created = now()::timestamp where created = '2024-05-30';
update trackedentityattributevalue set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-30';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

-- end






-- JHarkhand IP 192.168.45.114
-- JHarkhand 2014-02-21 20:35:33
-- JHarkhand MMU production - IP 192.168.45.219
-- JHarkhand MMU ou list

https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:FA0FFjw3TOX&level=3&paging=false

-- jh_db_identity registration query 15/05/2024
-- for production 13/05/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS MappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,
i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_mapping.VanID,i_ben_address.PermDistrict,i_ben_details.occupation,
FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON
(i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.VanID)

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON
(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.VanID)

INNER JOIN jh_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
INNER JOIN jh_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND i_ben_mapping.CreatedDate between '2014-01-01 00:00:00' and '2016-12-31 23:59:59'
ORDER by MappingBenRegId ASC;

-- i_ben_mapping.CreatedDate between '2014-01-01 00:00:00' and '2016-12-31 23:59:59'; -- 79080 -- start at 40:16 13/05/2024 not started
-- i_ben_mapping.CreatedDate between '2017-01-01 00:00:00' and '2018-12-31 23:59:59'; -- 205534
-- i_ben_mapping.CreatedDate between '2019-01-01 00:00:00' and '2020-12-31 23:59:59'; -- 143905
-- i_ben_mapping.CreatedDate between '2021-01-01 00:00:00' and '2021-12-31 23:59:59'; -- 454175
-- i_ben_mapping.CreatedDate between '2022-01-01 00:00:00' and '2022-12-31 23:59:59'; -- 172365
-- i_ben_mapping.CreatedDate between '2023-01-01 00:00:00' and '2023-12-31 23:59:59'; -- 72506
-- i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59'; -- 34970 -- 1,162,535

-- JHarkhand TM TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/bKaIBah03TU/data?paging=false

-- JHarkhand TM check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=WcqHrxQyutq&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:1271778

--- end

-- JHarkhand MMU TEI list with MappingBenRegId teiUID and ouUID 01/07/2024
select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205); -- 99646

-- JHarkhand MMU TEI list with csr_partner teiUID and ouUID 26/09/2024
select tei.trackedentityinstanceid, teav.value AS csr_partner, tei.uid tei_uid
from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 22906243 
AND pi.organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205);



-- JHarkhand MMU event count 01/07/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205);


 -- update on 11/07/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205)
and created::date in ( '2024-07-11', '2024-07-12');


-- eventDataValue -- RBS -- JHarkhand MMU

-- eventDataValue visit_code
SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS visit_code, psi.uid eventID,
psi.executiondate::date as created_date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'QRE1IBSOKdE' and ps.uid = 'qJbHjQBuG3G'
AND org.organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205); -- 152787 as on 10/10/2024






SELECT psi.uid eventID,psi.created::date,psi.lastupdated::date,psi.executiondate::date as eventdate, 
psi.storedby,psi.status,psi.completeddate::date,psi.completedby,org.uid AS orgUID,org.name AS orgName,
prg.uid AS prgUID, prg.name AS prgName,ps.uid AS prgStageUID, ps.name AS prgStageName,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 's7vpadfqfmS' and ps.uid = 'qJbHjQBuG3G'
AND org.organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205);



-- JHarkhand MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:FA0FFjw3TOX&level=3&paging=false
-- JHarkhand MMU event count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/wTsvzw1Zwg8/data?paging=false

-- 63038 -- start cron from 09/07/2024 at 16:10 PM == 63038  Lg7ilkJ2ZGe
-- 72608 -- start cron from 11/07/2024 at 18:15 PM == 63038 + 72608 == 135,646 done


2024-07-22 21:52:10,544 - ERROR - Failed to create events . Visitcode : 10002200029185 . BeneficiaryRegID : 58793703. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'P73ZGr9cIWh', 'value': 'value_not_numeric'}], 'rejectedIndexes': [], 'reference': 'SDXUn1ptGk7'}], 'total': 1}}
2024-07-22 15:58:42,528 - ERROR - Failed to create events . Visitcode : 20002200028885 . BeneficiaryRegID : 58792548. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'KtoABiKQ6lK', 'value': "Value 'Bokaro General Hospital (BGH) ' is not a valid option code of option set: mjojQxMgoZe"}], 'rejectedIndexes': [], 'reference': 'MALIvs2PZtm'}], 'total': 1}}
2024-07-22 15:57:56,672 - ERROR - Failed to create events . Visitcode : 20002200028880 . BeneficiaryRegID : 58244526. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'KtoABiKQ6lK', 'value': "Value 'Bokaro General Hospital (BGH) ' is not a valid option code of option set: mjojQxMgoZe"}], 'rejectedIndexes': [], 'reference': 'LSTXcdkPjxA'}], 'total': 1}}
2024-07-22 15:55:45,227 - ERROR - Failed to create events . Visitcode : 20002200028865 . BeneficiaryRegID : 56957884. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'KtoABiKQ6lK', 'value': "Value 'Bokaro General Hospital (BGH) ' is not a valid option code of option set: mjojQxMgoZe"}], 'rejectedIndexes': [], 'reference': 'C2Pr9oSNepU'}], 'total': 1}}
2024-07-22 15:24:04,535 - ERROR - Failed to create events . Visitcode : 10002200028809 . BeneficiaryRegID : 56979617. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'KtoABiKQ6lK', 'value': "Value 'Bokaro General Hospital (BGH) ' is not a valid option code of option set: mjojQxMgoZe"}], 'rejectedIndexes': [], 'reference': 'bVmO6G3iw4v'}], 'total': 1}}
2024-07-23 09:22:20,201 - ERROR - Failed to create events . Visitcode : 20002100028451 . BeneficiaryRegID : 56435252. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'wBL3WAU2bTC', 'value': "Value 'Anaemia  ||  Weakness' is not a valid option code of option set: bGjIwdpaU9Y"}], 'rejectedIndexes': [], 'reference': 'jae4veE62ET'}], 'total': 1}}
2024-07-23 08:24:33,284 - ERROR - Failed to create events . Visitcode : 30003100011271 . BeneficiaryRegID : 58903707. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'erQc3s2U1RN', 'value': 'value_not_numeric'}], 'rejectedIndexes': [], 'reference': 'so3pVLpXj0l'}], 'total': 1}}
2024-07-23 08:24:41,495 - ERROR - Failed to create events . Visitcode : 30003100011272 . BeneficiaryRegID : 58948184. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'erQc3s2U1RN', 'value': 'value_not_numeric'}], 'rejectedIndexes': [], 'reference': 'W0MWd9597sZ'}], 'total': 1}}
2024-07-23 06:04:03,943 - ERROR - Failed to create events . Visitcode : 20002200029384 . BeneficiaryRegID : 58456112. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'erQc3s2U1RN', 'value': 'value_not_numeric'}], 'rejectedIndexes': [], 'reference': 'Yl40qFDhST7'}], 'total': 1}}
2024-07-23 05:26:59,447 - ERROR - Failed to create events . Visitcode : 20002100028362 . BeneficiaryRegID : 58802218. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'wBL3WAU2bTC', 'value': "Value 'Weakness  ||  Pain of body region' is not a valid option code of option set: bGjIwdpaU9Y"}], 'rejectedIndexes': [], 'reference': 'NyU5Y1Q2WLN'}], 'total': 1}}
2024-07-22 21:52:10,544 - ERROR - Failed to create events . Visitcode : 10002200029185 . BeneficiaryRegID : 58793703. Status code: 409 . error details: {'httpStatus': 'Conflict', 'httpStatusCode': 409, 'status': 'ERROR', 'message': 'An error occurred, please check import summary.', 'response': {'responseType': 'ImportSummaries', 'status': 'ERROR', 'imported': 0, 'updated': 0, 'deleted': 0, 'ignored': 1, 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importSummaries': [{'responseType': 'ImportSummary', 'status': 'ERROR', 'importOptions': {'idSchemes': {}, 'dryRun': False, 'async': False, 'importStrategy': 'CREATE_AND_UPDATE', 'mergeMode': 'REPLACE', 'reportMode': 'FULL', 'skipExistingCheck': False, 'sharing': False, 'skipNotifications': False, 'skipAudit': False, 'datasetAllowsPeriods': False, 'strictPeriods': False, 'strictDataElements': False, 'strictCategoryOptionCombos': False, 'strictAttributeOptionCombos': False, 'strictOrganisationUnits': False, 'strictDataSetApproval': False, 'strictDataSetLocking': False, 'strictDataSetInputPeriods': False, 'requireCategoryOptionCombo': False, 'requireAttributeOptionCombo': False, 'skipPatternValidation': False, 'ignoreEmptyCollection': False, 'force': False, 'firstRowIsHeader': True, 'skipLastUpdated': False, 'mergeDataValues': False, 'skipCache': False}, 'importCount': {'imported': 0, 'updated': 0, 'ignored': 1, 'deleted': 0}, 'conflicts': [{'object': 'P73ZGr9cIWh', 'value': 'value_not_numeric'}], 'rejectedIndexes': [], 'reference': 'SDXUn1ptGk7'}], 'total': 1}}


-- search TEI across the program and orgUnit based on attributeValue
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&filter=HKw3ToP2354:eq:199337038&trackedEntityType=T10dZwFVdkz
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&trackedEntityType=T10dZwFVdkz&filter=HKw3ToP2354:eq:199337045


-- search event base on dataElement value -- Visitcode
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=NMGbY2nXCKu&orgUnit=Ha9zvTKxGga&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30002700013464&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?fields=*&program=NMGbY2nXCKu&orgUnit=Ha9zvTKxGga&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30003000000494&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=NMGbY2nXCKu&orgUnit=A7rUrJwlyqQ&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30002700013464&skipPaging=true


https://samiksha.piramalswasthya.org/amrit/api/events.json?program=NMGbY2nXCKu&orgUnit=iLxzohR8kRW&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30003100010467&skipPaging=true


-- jh MMU issue in TEI count -- 2

select teav.value benregid,tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 -- MappingBenRegId
AND pi.organisationunitid in ( 9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205 );

-- JH MMU event count
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205)
and created::date in('2024-07-22', '2024-07-23');

-- CSR partner value
SELECT psi.uid as eventUID, cast(data.value::json ->> 'value' AS VARCHAR) AS csr_partner,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'fVFoB96fAK1' and psi.organisationunitid 
in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.eventdatavalues -> 'fVFoB96fAK1' is null;


-- CSR partner is null
SELECT psi.uid as eventUID, psi.executiondate::date FROM programstageinstance psi
--JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
--INNER JOIN dataelement de ON de.uid = data.key
where psi.organisationunitid 
in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.eventdatavalues -> 'fVFoB96fAK1' is null;









select trackedentityinstanceid,uid as enrollment from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'NMGbY2nXCKu' )) 
and organisationunitid in (  9765207,
9765208,9765209,9765210,9765211,9765212 )) and enrollmentdate
between '2024-04-01' and '2024-04-30'; -- 59779

select count(*) from trackedentityinstance where  
organisationunitid in (  9765207,
9765208,9765209,9765210,9765211,9765212 ) -- 59779

select * from organisationunit where organisationunitid in ( 9765207,
9765208,9765209,9765210,9765211,9765212)

select * from trackedentityattribute;

select tei.trackedentityinstanceid tei_id, teav.value benregid,  tei.uid tei_uid,org.uid org_uid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7207 -- gendar
AND pi.organisationunitid in ( 9765207,
9765208,9765209,9765210,9765211,9765212 )and pi.enrollmentdate
between '2024-04-01' and '2024-04-30';

delete from programinstance where
trackedentityinstanceid in( 18933154,
18933152);

delete from trackedentityinstance where
trackedentityinstanceid in( 18933154,
18933152);

delete from trackedentityprogramowner
where trackedentityinstanceid in( 18933154,18933152);






-- end

Table	Table View
i_beneficiaryaddress	i_beneficiaryaddress_vtbl
i_beneficiarycontacts	i_beneficiarycontacts_vtbl
i_beneficiarydetails	i_beneficiarydetails_vtbl
i_beneficiaryidentity	i_beneficiaryidentity_vtbl
i_beneficiaryimage	i_beneficiaryimage_vtbl
m_beneficiaryregidmapping	m_beneficiaryregidmapping_vtbl
i_ben_flow_outreach	i_ben_flow_outreach_vtbl


-- APL IP 192.168.45.110
-- APL	MMU	6th July, 2019	192.168.45.110	Yes
-- APL	TMC	6th July, 2019	192.168.45.110	Yes
-- 1) APL MMU Demographic query: updated by 22/05/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_mapping.VanID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_address.PermDistrict, i_ben_details.occupation

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON

(i_ben_details.vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON

(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.vanid=i_ben_mapping.VanID)

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID = 10 
ORDER by MappingBenRegId ASC; -- 24123 


-- total records -- 24123 -- start at 15:16 22/05/2024 started done on 23/05/2024

-- APL MMU TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/jef0t5UvyRl/data?paging=false

-- APL MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:SF0xYCVCiTq&level=3&paging=false

-- APL MMU check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=oT8Cuafuf68&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:115001


-- APL MMU TEI list with MappingBenRegId teiUID and ouUID 27/06/2024
select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (9765151 ); -- 25236

-- APL MMU event count 27/06/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and organisationunitid in (
9765151);






-- APL MMU csr_partner event query 26/09/2024
SELECT psi.uid as eventUID, cast(data.value::json ->> 'value' AS VARCHAR) AS csr_partner,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'fVFoB96fAK1' and psi.organisationunitid 
in (9765151) and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.eventdatavalues -> 'fVFoB96fAK1' is null;



-- APL MMU event count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/xkZNv4NxIBY/data?paging=false

-- 94909 -- start cron from 01/07/2024 at 01:15 PM == 94909 -- done delete
-- 67213 -- start cron from 12/07/2024 at 15:45 PM == 67213 -- 

-- 2206 --  pushing event start . 2024-08-07 14:45:02 == 2206 + 67213 = 69,419 -- 69350-- pushing event finished . 2024-08-07 15:10:05

--end




-- 2) APL TMC Demographic query: updated by 22/05/2024

SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_mapping.VanID,

i_ben_details.FirstName,i_ben_details.MiddleName,i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,

i_ben_address.PermDistrict, i_ben_details.occupation

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON

i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON

i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID in (1,2,3,4,5 )
ORDER by MappingBenRegId ASC; -- 98205 



-- total records -- 98203 -- start at 13:19 22/05/2024 started done 34073
-- again start i_ben_mapping.BenRegId > 34507 at 10:16 23/05/2024 done as on 24/05/2024

-- APL TMC TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/S8iVI3tAd0u/data?paging=false

-- APL TMC ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:IYabhGYdx3F&level=3&paging=false

-- APL TMC check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=zDIL2ljgYm8&ouMode=SELECTED&program=hQUeRtU70wj&filter=HKw3ToP2354:eq:436
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=x1wvwdBBXNs&ouMode=SELECTED&program=hQUeRtU70wj&filter=HKw3ToP2354:eq:199303973
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=x1wvwdBBXNs&ouMode=SELECTED&program=hQUeRtU70wj&filter=HKw3ToP2354:eq:199303973

-- search TEI across the program and orgUnit based on attributeValue
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&filter=HKw3ToP2354:eq:199337038&trackedEntityType=T10dZwFVdkz
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&trackedEntityType=T10dZwFVdkz&filter=HKw3ToP2354:eq:199337045


-- search event base on dataElement value -- Visitcode
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=hQUeRtU70wj&orgUnit=x7bE6Fwp7Od&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30002300045514&skipPaging=true


-- -- query for missing TEI in APL TMC
select teav.value benregid, enrollmentdate::date, pi.programinstanceid,
tei.trackedentityinstanceid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid
=pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where programid in (select programid from program where uid = 'hQUeRtU70wj')
and trackedentityattributeid = 7210 AND pi.organisationunitid in ( 9765161,
9765162,9765160,9765159,9765158 );

-- APL TMC TEI list with MappingBenRegId teiUID and ouUID 25/06/2024
select teav.value AS MappingBenRegId, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (9765161,9765162,9765160,9765159,9765158); -- 100856 , 101838,102123

-- APL TMC event count 25/06/2024
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and organisationunitid in (
9765161,9765162,9765160,9765159,9765158);


-- APL TMC csr_partner event query 26/09/2024
SELECT psi.uid as eventUID, cast(data.value::json ->> 'value' AS VARCHAR) AS csr_partner,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'fVFoB96fAK1' and psi.organisationunitid 
in (9765161,9765162,9765160,9765159,9765158) and  psi.programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and psi.eventdatavalues -> 'fVFoB96fAK1' is null;



-- visit-code list
SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS visit_code,psi.uid as eventUID,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (9765161,9765162,9765160,9765159,9765158)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') 
and executiondate::date between '2019-01-01' and '2020-12-31';

https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/LpTI6XWqUVp/data?paging=false
-- done 25/06/2024 -- 95523
-- 643420 -- start cron from 26/06/2024 at 09:30 AM == 643420 + 95523 == 738,943
-- 320338 done as on 27/06/2024 -- 224,815 -- remaining -- 418605
-- 157779 -- start cron on 27/06/2024 at 15:25 PM == 95523 + 224,815 + 157779 == 478,117 -- done
-- rest -- 260826 + 7517 ( missing ) = 268343 -- start cron on 28/06/2024 at 10:25 AM 268343 + 478,117 =   746460

-- 27132 start cron on 30/06/2024 at 17:20 AM 746460 + 27132 =   773,592 -- deleted as on 14/08/2024

-- 42396 pushing event start . 2024-08-14 22:40:02 apl_tmc_event_data_2019_2020_14_08_2024.xlsx -- done
-- 49129 pushing event start . 2024-08-15 14:30:02 apl_tmc_event_data_2022_jan_aug_15_08_2024 -- done
-- 56983 pushing event start . 2024-08-15 16:55:01 apl_tmc_event_data_2021_15_08_2024.xlsx -- done
-- 53160 pushing event start . 2024-08-15 17:12:01 apl_tmc_event_data_2022_sept_2023_april_15_08_2024.xlsx -- done
-- 53588 pushing event start . 2024-08-15 23:20:02 apl_tmc_event_data_2023_may_dec_15_08_2024.xlsx -- done
-- 51912 pushing event start . 2024-08-15 23:38:01 apl_tmc_event_data_2023_dec_2024_july_15_08_2024.xlsx -- done
-- 9423  pushing event start . 2024-08-16 11:38:01 apl_tmc_event_data_2024_jul_13_aug_2024_16_08_2024.xlsx
-- 230 done
-- 316,821 + 13 = 316,834 ( one missing BeneficiaryRegID -- 43942 Visitcode -- 30002600108829 -- done)
-- 777 pushing event start . 2024-08-16 19:24:59 apl_tmc_13_aug_2024_17_aug_16_08_2024.xlsx
-- 316,834 + 777 = 317,611


update programinstance set created = now()::timestamp where created = '2024-05-30';
update programinstance set lastupdated = now()::timestamp where lastupdated = '2024-05-30';

update trackedentityprogramowner set created = now()::timestamp where created = '2024-05-30';
update trackedentityprogramowner set lastupdated = now()::timestamp where lastupdated = '2024-05-30';


--end


-- digwal IP 192.168.45.218

-- Digwal MMU Inceptiondate: 2020-09-29 18:12:41
-- Digwal MMU Inceptiondate: 2020-09-29 18:12:41

-- Digwal MMU Inceptiondate: 2020-09-29 18:12:41
-- Digwal MMU Inceptiondate: 2020-09-29 18:12:41

-- 2) Digwal MMU Demographic query: updated by 22/05/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, i_ben_mapping.VanID,
i_ben_details.FirstName, i_ben_details.MiddleName, i_ben_details.LastName, i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) as DOB, 
i_ben_details.occupation,  i_ben_address.PermDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON

(i_ben_details.Vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.VanID=i_ben_mapping.VanID)

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON
(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.vanid)

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL

AND vanmaster.ProviderServiceMapID in (4);

-- total records -- 10171 -- start at 15:13 22/05/2024 done no of records 9993

-- Digwal MMU TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/UBrNHTi9KJz/data?paging=false

-- Digwal MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:oI6vsOz8ocO&level=3&paging=false

-- Digwal MMU check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=Lk012PNGNGi&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:732644501

-- end

-- digwal MMU TEI list with BenRegId teiUID and ouUID 20/06/2024

select teav.value benregid, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid, pi.enrollmentdate::date from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (  9765149   ); -- 10146

-- digwal MMU event count 20/06/2024

https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/IUWb4MzgLp7/data?paging=false

select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and organisationunitid in (
9765149);

-- 27303 pushing event start.2024-08-19 22:00:02 done -- pushing event finished . 2024-08-20 03:20:35 digwal_MMU_EVENT_Data_Inception_to_17_Aug_2024_19Aug2024.xlsx


-- end

-- 2) Digwal SJVN MMU Demographic query: updated by 22/05/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, i_ben_mapping.VanID,
i_ben_details.FirstName, i_ben_details.MiddleName, i_ben_details.LastName, i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) as DOB, 
i_ben_details.occupation,  i_ben_address.PermDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON

(i_ben_details.Vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.VanID=i_ben_mapping.VanID)

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON
(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.vanid)

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
AND vanmaster.ProviderServiceMapID in ( 5,6,7 );

-- total records -- 6663 -- start at 45:13 22/05/2024 done as on 22/05/2024

-- Digwal MMU SJVN TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/S4hhMHCZyhu/data?paging=false


-- Digwal SJVN MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:lNRGLhA5a6S&level=3&paging=false

-- Digwal MMU SJVN check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=GlvEGtvt5QM&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:732644501

-- search TEI across the application
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?fields=*&ou=NQjElqVFZTm&ouMode=DESCENDANTS&trackedEntityType=T10dZwFVdkz&filter=HKw3ToP2354:eq:266501


-- digwal Digwal SJVN MMU list with BenRegId teiUID and ouUID 20/06/2024
select teav.value benregid, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid, pi.enrollmentdate::date from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'NMGbY2nXCKu' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (  11063188, 11062382, 11063265  ); 






-- chech events exists

https://samiksha.piramalswasthya.org/amrit/api/events.json?program=NMGbY2nXCKu&orgUnit=Nn3r5tsA0GJ&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30003600002014&skipPaging=true

-- digwal Digwal SJVN MMU event count 17/07/2024

-- https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/hLeoD72iEhJ/data?paging=false
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (11063188, 11062382, 11063265 );

select uid,created from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (11063188, 11062382, 11063265)
and created::date > '2024-07-17'
order by created desc; -- 28


select * from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (11063188, 11062382, 11063265)
and executiondate::date = '2024-08-05';

-- month wise event list
SELECT psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.executiondate::date,
psi.created::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (11063188, 11062382, 11063265)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.executiondate::date
between '2024-02-01' AND '2024-02-29';


SELECT psi.uid as eventUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.executiondate::date,
psi.created::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (11063188, 11062382, 11063265)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and psi.executiondate::date
between '2024-08-01' AND '2024-08-31';


-- total records -- 21506 -- start at 2024-07-16 23:58:02 -- done at 2024-07-17 04:47:36 no of records ( missing records) -- 1185
-- 1185 + 21506 = 22,691 -- pushing event start . 2024-08-03 21:50:02 done at pushing event finished . 2024-08-03 22:06:25

-- digwal server -- digwal MMU,digwal TMC, Digwal SJVN

-- 27860 + (809-497 = 312) = 28,172 pushing event start . 2024-08-10 16:20:04
-- 28690 as on 11/08/2024 





-- end

-- 1) Digwal TMC Demographic query: -- 22/05/2024

-- 2) Digwal TMC Demographic query: updated by 22/05/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, i_ben_mapping.VanID,
i_ben_details.FirstName, i_ben_details.MiddleName, i_ben_details.LastName, i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) as DOB, 
i_ben_details.occupation,  i_ben_address.PermDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON

(i_ben_details.Vanserialno = i_ben_mapping.BenDetailsId and i_ben_details.VanID=i_ben_mapping.VanID)

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON
(i_ben_address.vanserialno = i_ben_mapping.BenAddressId and i_ben_address.VanID=i_ben_mapping.vanid)

INNER JOIN db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID

WHERE i_ben_mapping.BenRegId IS NOT NULL AND vanmaster.ProviderServiceMapID in ( 3 );


-- total records -- 5957 -- start at 05:14 22/05/2024 done 
-- Digwal TMC ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:rj27EpQhDJ1&level=3&paging=false

-- Digwal TMC TEI enrollment count list
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/r5XtgdoNKeo/data?paging=false

-- Digwal TMC check TEI exist
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=QEP9CZSA7SB&ouMode=SELECTED&program=hQUeRtU70wj&filter=HKw3ToP2354:eq:732644501


-- digwal TMC TEI list with BenRegId teiUID and ouUID 20/06/2024

select teav.value benregid, tei.uid tei_uid,org.uid org_uid,
tei.trackedentityinstanceid,org.organisationunitid,pi.enrollmentdate::date from programinstance pi
INNER JOIN trackedentityinstance tei on tei.trackedentityinstanceid =pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'hQUeRtU70wj' AND teav.trackedentityattributeid = 7210 
AND pi.organisationunitid in (  9765148  ); -- 6094


SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS visit_code, psi.uid as eventUID,
psi.executiondate::date,
psi.created::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (9765148) and  psi.programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') 
-- and psi.executiondate::date between '2024-08-01' AND '2024-08-31';

-- digwal TMC event count 20/06/2024

select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'gpZJwMDObuC') and organisationunitid in (
9765148);

https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/WpVhM24Zzm1/data?paging=false


-- 21977 pushing event start . 2024-08-18 18:33:01 digwal_tmc_event_data_up_17_aug_18_08_2024.xlsx  -- 21519 imported
 
-- 21519 + 377 = 21,896 pushing event start . 2024-08-19 22:10:02 digwal_tmc_event_missing_UrineAlbumin_NIL_18Aug2024.xlsx
-- 2157 + 21,896 = 24,053 pushing event finished . 2024-08-20 18:15:00 digwal_tmc_event_missing_widal_test_20Aug2024.xlsx
-- total 24094 up to 2024-08-21 00:00:00
-- end








-- query for missing TEI in Digwal TMC
select trackedentityinstanceid, value from trackedentityattributevalue
where trackedentityinstanceid in ( select trackedentityinstanceid
from trackedentityinstance 
where trackedentityinstanceid not in (
select trackedentityinstanceid from programinstance where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance
where trackedentityinstanceid in (
select trackedentityinstanceid from programinstance 
where programid in ( select programid from program where uid = 'hQUeRtU70wj' )) 
and organisationunitid in ( 9765148 ))) and organisationunitid in ( 9765148 ))
and trackedentityattributeid = 7210 order by trackedentityinstanceid asc;


-- STFC registration query final 09/05/2024
SELECT mb.BeneficiaryID, i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) AS CreatedDate, 
i_ben_details.FirstName, i_ben_details.MiddleName, i_ben_details.LastName, i_ben_details.Gender,
IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_address.PermDistrict, i_ben_details.occupation, i_ben_mapping.VanID

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER JOIN db_identity.m_beneficiaryregidmapping_vtbl mb on mb.BenRegId=i_ben_mapping.BenRegId

INNER JOIN db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

INNER JOIN db_identity.i_beneficiaryaddress_vtbl i_ben_address ON 
i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

-- INNER JOIN stfc_db_iemr.m_van vanmaster ON vanmaster.VanID = i_ben_mapping.VanID
-- INNER JOIN stfc_db_iemr.m_facility f on vanmaster.FacilityID=f.FacilityID

WHERE i_ben_mapping.BenRegId IS NOT NULL 
-- AND i_ben_address.PermStateId IS NOT NULL
-- AND i_ben_address.PermDistrictId IS NOT NULL
-- AND i_ben_mapping.CreatedDate between '2019-01-01 00:00:00' and '2019-12-31 23:59:59'
ORDER by i_ben_mapping.BenRegId ASC;






-- end




-- 104 Agent Queue Time_104 bihar production registration based on AgentID
select DISTINCT detCallReport.AgentID 
from bihar_db_iemr.t_detailedcallreport detCallReport
order by AgentID ASC; -- 102 total records



-- 104 Agent Queue Time_104 bihar production event data as Queue
select date(Call_Start_Time), AgentID as AgentID ,
Campaign_Name  As Campaign_Name,avg(Queue_time) 
from bihar_db_iemr.t_detailedcallreport 
group by date(Call_Start_Time), Campaign_Name,AgentID
order by AgentID ASC; -- 10289 total records






---- 
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_address.PermSubDistrictId

FROM db_identity.i_beneficiarymapping i_ben_mapping 

INNER join db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3 and 
i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-12-31 23:59:59';


-- b) 104 Event and DataValue Query

-- b) bihar db_iemr TMC event / TRANSACTION Query for python script production server as on 12/04/2024
SELECT distinct db_iemr.t_bencall.BenCallID, db_iemr.t_bencall.CallID, 
db_iemr.t_bencall.BeneficiaryRegID,

CAST(db_iemr.t_bencall.Calltime AS DATE) As CreatedDate,
year(db_iemr.t_bencall.CreatedDate) -
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

-- IF(db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') AS IsOutbound,

c.CategoryName,s.SubCategoryName, p.PrescriptionID, db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds,
mct.CallType,mct.CallGroupType, b.SelecteDiagnosis As Diasease

FROM db_iemr.t_bencall

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON
i_ben_mapping.BenRegId = db_iemr.t_bencall.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
and db_iemr.t_bencall.BeneficiaryRegID in ( select BenRegId
from db_identity.i_beneficiarymapping where 
CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59')
-- AND db_iemr.t_bencall.Calltime between '2024-01-01 00:00:00' and '2024-03-31 23:59:59' 
ORDER BY BeneficiaryRegID ASC; -- 138919, 91886





SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
CAST(db_iemr.t_bencall.CreatedDate AS DATE) As CreatedDate,
year(db_iemr.t_bencall.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') AS IsOutbound,

db_iemr.mct.CallTypeID, c.CategoryName,s.SubCategoryName,
p.PrescriptionID, db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds, 

db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,
b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm

FROM db_iemr.t_bencall

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_bencall.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails i_ben_details ON 
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL 
AND db_iemr.t_bencall.CreatedDate 
between '2024-01-01 00:00:00' and '2024-12-31 23:59:59';



-- 104 Health Helpline
-- a)	Registration/Enrolment/Demographics Query
-- -- 104 production registration query for production as on 01/04/2024
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_address.PermSubDistrictId,i_ben_address.PermSubDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3 limit 1000 and
i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59';


-- 104 production registration query for production as on 03/04/2024 push to DHIS2 with Python script
SELECT mb.BeneficiaryID,i_ben_mapping.BenRegId AS mappingBenRegId, i_ben_details.BeneficiaryRegID,
CAST(i_ben_mapping.CreatedDate AS DATE) As CreatedDate,i_ben_details.FirstName,i_ben_details.MiddleName,
i_ben_details.LastName,i_ben_details.Gender,

IF(i_ben_details.DOB IS NOT NULL,DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL) AS DOB,
i_ben_mapping.VanID,i_ben_address.PermSubDistrictId,i_ben_address.PermSubDistrict

FROM db_identity.i_beneficiarymapping i_ben_mapping

INNER join db_identity.m_beneficiaryregidmapping mb on mb.BenRegId=i_ben_mapping.BenRegId
INNER JOIN db_identity.i_beneficiarydetails i_ben_details ON i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId
INNER JOIN db_identity.i_beneficiaryaddress i_ben_address ON i_ben_address.BenAddressID = i_ben_mapping.BenAddressId

WHERE i_ben_mapping.BenRegId IS NOT NULL AND i_ben_address.PermStateId IS NOT NULL
AND i_ben_address.PermDistrictId IS NOT NULL AND i_ben_address.PermSubDistrictId IS NOT NULL
AND i_ben_mapping.VanID = 3 and
i_ben_mapping.CreatedDate between '2024-01-01 00:00:00' and '2024-03-31 23:59:59'
order by i_ben_mapping.BenRegId;

-- Note: Hope you are mentioned District information capturing through Master table as per past conversation.

-- (b) 104 Event and Data Value/Transactional Query
-- 104 production Event and Data Value/Transactional Query query for production as on 01/04/2024

-- 104 production Event and Data Value/Transactional Query query for production as on 01/04/2024

SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,
-- CAST(db_iemr.t_bencall.CreatedDate AS DATE) As CreatedDate,
CAST(db_iemr.t_bencall.Calltime AS DATE) As CreatedDate,
year(db_iemr.t_bencall.CreatedDate) -
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') AS IsOutbound,

db_iemr.mct.CallTypeID, c.CategoryName,s.SubCategoryName,
p.PrescriptionID, db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds,

db_iemr.t_bencall.TypeOfComplaint,mct.CallGroupType,mct.CallType,p.PrescriptionID,
b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm

FROM db_iemr.t_bencall

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON
i_ben_mapping.BenRegId = db_iemr.t_bencall.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.Calltime order by BeneficiaryRegID
between '2024-01-01 00:00:00' and '2024-03-31 23:59:59' ORDER BY BeneficiaryRegID ASC;

-- 104 production Event and Data Value/Transactional Query query for production as on 03/04/2024 push to DHIS2 with Python script

SELECT distinct db_iemr.t_bencall.BenCallID,db_iemr.t_bencall.CallID, db_iemr.t_bencall.BeneficiaryRegID,

CAST(db_iemr.t_bencall.Calltime AS DATE) As CreatedDate,
year(db_iemr.t_bencall.CreatedDate) -
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

IF(db_iemr.t_bencall.is1097 = 1, 'true', 'false') AS Is1097,
IF(db_iemr.t_bencall.IsOutbound = 1, 'true', 'false') AS IsOutbound,

c.CategoryName,s.SubCategoryName, p.PrescriptionID, db_iemr.t_bencall.ReceivedRoleName,

TIME_TO_SEC(TIMEDIFF(db_iemr.t_bencall.CallEndTime,db_iemr.t_bencall.CallTime)) AS CallDurationInSeconds,
mct.CallType,mct.CallGroupType,
b.SelecteDiagnosis As Diasease,b.DiseaseSummary As Algorithm

FROM db_iemr.t_bencall

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON
i_ben_mapping.BenRegId = db_iemr.t_bencall.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails i_ben_details ON
i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId

left join db_iemr.t_104benmedhistory b on b.BenCallID = db_iemr.t_bencall.BenCallID
left join db_iemr.t_104prescription p on p.BenCallID=b.BenCallID
inner join db_iemr.m_calltype mct on mct.CallTypeID=db_iemr.t_bencall.CallTypeID
left join db_iemr.m_category c on c.CategoryID=b.CategoryID
left join db_iemr.m_subcategory s on s.SubCategoryID=b.SubCategoryID

WHERE db_iemr.t_bencall.BeneficiaryRegID IS NOT NULL
AND db_iemr.t_bencall.Calltime order by BeneficiaryRegID
between '2024-01-01 00:00:00' and '2024-03-31 23:59:59' 
ORDER BY BeneficiaryRegID ASC;












-- We have updated where condition.
--1.1 Agent query 

select CampaignName,Loggedin,CreatedDate,LastModDate,Incall,
HOLD,AWT,NotReady,Free,Aux from db_iemr.t_nhmagentrealtimedata; -- 25


-- 1.2 Agent Queue_time
 
table t_detailedcallreport  -- agent registration as on 08/02/2024

select date(Call_Start_Time), AgentID as AgentID ,
Campaign_Name  As Campaign_Name,avg(Queue_time) 
from db_iemr.t_detailedcallreport 
group by date(Call_Start_Time), Campaign_Name,AgentID;

-- Note: We captured below query from previous mail conversations.



-- 9) -- agent query for add new program Agent as on 08/02/2024

select CampaignName,Loggedin,CreatedDate,LastModDate,Incall,
HOLD,AWT,NotReady,Free,Aux  from db_iemr.t_nhmagentrealtimedata; -- 25

-- 10) -- Queue_time for indicators -- table t_detailedcallreport  -- agent registration as on 08/02/2024

select date(Call_Start_Time), AgentID as AgentID ,
Campaign_Name  As Campaign_Name,avg(Queue_time) 
from db_iemr.t_detailedcallreport 
group by date(Call_Start_Time), Campaign_Name,AgentID;

--

select DISTINCT detCallReport.AgentID,CAST(detCallReport_temp.CreatedDate AS DATE) As CreatedDate
from db_iemr.t_detailedcallreport detCallReport
INNER JOIN db_iemr.t_detailedcallreport detCallReport_temp ON
detCallReport.AgentID = detCallReport_temp.AgentID
order by AgentID ASC;



select * from categoryoptioncombo where name ='default';
select * from categoryoptioncombo where uid = 'eTVxIFioHYF'
select * from categorycombo where name ='default';
select * from dataelementcategory where name ='default';
select * from dataelementcategoryoption where name ='default';


select * from categorycombos_optioncombos
where categoryoptioncomboid in( 24,22970862);

insert into categorycombos_optioncombos (categoryoptioncomboid, categorycomboid)
values ( 24,23);




22970862

select * from categoryoptioncombos_categoryoptions
where categoryoptioncomboid in( 24,22970862);

insert into categoryoptioncombos_categoryoptions (categoryoptioncomboid, categoryoptionid)
values ( 24,21);


select * from _categorystructure

select * from _categoryoptioncomboname 
where categoryoptioncomboname = 'default';

select * from _dataelementcategoryoptioncombo

select * from programstageinstance where uid in( 'sW90UHlVQe9','P7vO4ykvvZ6');

select * from dataelement where uid = 'PZWwFi96Z5c'

insert into _categoryoptioncomboname (categoryoptioncomboid, categoryoptioncomboname)
values ( 24,'default');





SELECT cast(data.value::json ->> 'value' AS VARCHAR) AS BenCallID,
psi.uid as eventUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'hsbXpo83f4I' and psi.organisationunitid 
in (select organisationunitid from organisationunit 
where parentid = 11762)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'ISSSjurI0kD') and 
psi.created::date = '2024-09-05';


select * from datavalueaudit;
			
			