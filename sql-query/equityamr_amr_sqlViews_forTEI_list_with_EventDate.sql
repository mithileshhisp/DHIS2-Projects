
-- SQL-View-Id -- WKhh3qxwcPW -- name -- AMRNEWDATAVIEW
-- query

-- api

-- https://ln1.hispindia.org/equityamr/api/trackedEntityInstances.json?ouMode=DESCENDANTS&program=L7bu48EI54J&ou=wN35yT3J6Du&order=lastUpdated:desc&skipPaging=true

-- https://ln1.hispindia.org/equityamr/api/trackedEntityInstances?paging=false&fields=trackedEntityInstance&filter=nFrlz82c6jS:eq:3016&ou=wN35yT3J6Du&trackedEntityType=tOJvIFXsB5V

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false and psi.executiondate >  CURRENT_DATE - INTERVAL '2 months'  order by psi.executiondate desc,psi.created desc


SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  
and psi.executiondate >  CURRENT_DATE - INTERVAL '2 months'  order by psi.executiondate desc;


SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  
and psi.created >  CURRENT_DATE - INTERVAL '2 months'  order by psi.created desc;

-- 25/07/2023

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7') 
and org.path LIKE '%ANGhR1pa8I5%'and psi.executiondate >  CURRENT_DATE - INTERVAL '2 months'  
order by psi.executiondate desc;


SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7') 
and org.path LIKE '%${orgunit}%'and psi.executiondate >  CURRENT_DATE - INTERVAL '2 months'  
order by psi.executiondate desc;



-- updated query

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false order by psi.executiondate desc,psi.created desc


 -- for sample testing only
SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  order by psi.executiondate desc,psi.created desc

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  
and psi.created >  CURRENT_DATE - INTERVAL '2 months' order by psi.executiondate desc,psi.created desc

SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  
and tei.created >  CURRENT_DATE - INTERVAL '2 months' order by psi.executiondate desc,psi.created desc;

-- event list with trackedentityattributevalue
SELECT org.name AS orgName,tei.uid AS teiUID,teav.value as CR_Number,psi.uid eventID,
psi.executiondate::date,psi.status,psi.completeddate::date,psi.completedby 
FROM programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
where psi.status = 'COMPLETED' and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and teav.trackedentityattributeid =  3418;


-- event list with multiple TEA value trackedentityattributevalue
SELECT teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and psi.status = 'COMPLETED';


-- all eventDataValue

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
INNER JOIN dataelement de ON de.uid = data.key;


-- de optionSet optionValue
SELECT de.name deName,de.uid deUid ,os.name optionsetName,
os.uid optionsetUid ,ov.uid optionValueUid ,ov.name optionValueName,
ov.code optionValueCode FROM optionvalue ov
INNEr JOIN optionset os ON os.optionsetid = ov.optionsetid
INNER JOIN dataelement de ON de.optionsetid = os.optionsetid;


-- 
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.created::date,
prg.uid AS prgUID,de.name AS dataElementName FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where org.uid = 'J2lJXpkaTZC' and de.uid = 'dRKIjwIDab4' 
and psi.executiondate::date between  '2023-04-01' 
and '2023-04-30' ;


-- 31/05/2023

select opg.optiongroupid optionGrpID, opg.uid optionGrpUID, opg.name optionGrpName,
opv.optionvalueid, opv.uid optionUID, opv.name optionName, opv.code optionCode from optiongroup opg
INNER JOIN optiongroupmembers opgm ON opgm.optiongroupid = opg.optiongroupid
INNER JOIN optionvalue opv ON opv.optionvalueid = opgm.optionid
where opg.uid = 'TzkUQCsDv6P'
order by opg.name;

select * from optionvalue where uid = 'ADf1CAKWGwt';

select * from optionvalue where optionsetid is  null
order by created desc;

delete from optionvalue where optionsetid is  null
order by created desc;

delete from optiongroupmembers where optionid in (
select optionvalueid from optionvalue where optionsetid is  null);


-- 19/07/2023 AMR varanasi delete optionvalue which r not optionset
select * from optionvalue where optionsetid is  null
and code = 'Semen'
order by created desc ;

delete from optionvalue where optionsetid is  null
order by created desc;

delete from optiongroupmembers where optionid in (
select optionvalueid from optionvalue where optionsetid is  null);







-- AMR tanda for upgrade and add new aggregation logic

-- 15/06/2023 to 17/06/2023

select * from dataelement where uid = 'SaQe2REkGVw'; -- Organism -- Tracker -- code -- Organism

select * from dataelement where uid = 'Lc7YC95p0km'; -- Organism (Age and Gender) -- -- Tracker -- code --ORG_AGE_GEN
select * from dataelement where uid = 'SaQe2REkGVw';

update dataelement set attributevalues ='{}'
where uid = 'SaQe2REkGVw';

update dataelement set attributevalues = '{}'
where uid = 'SaQe2REkGVw';

update dataelement set code ='Organism'
where uid = 'Lc7YC95p0km';

update dataelement set code ='Organism'
where uid = 'Lc7YC95p0km';

update dataelement set code ='Organism_old'
where uid = 'SaQe2REkGVw';


set metadatatype attribute value to Organism for dataelement  -- Lc7YC95p0km;

update dataset set code = 'organismsIsolatedAntibioticWise_old' 
where uid = 'TZAFADC2vK0';

update dataset set code = 'organismsIsolatedAntibioticWise' 
where uid = 'hhnNVOZPrSa';


update dataset set code = 'organismsIsolated_old' 
where uid = 'fqDBu4H2xRX';

update dataset set code = 'organismsIsolated' 
where uid = 'cOtGbcL12N0';

update dataelement set code = null where uid in ('WwmJhFtEYet','pFlXIWJ4WLr','u7y7RK6IWXM', 'iH780RzlRZB','S2zgq3Yen6r','WJEtaSYUH19');

select * from datavalue order by 
created desc;

select * from dataelement where dataelementid 
in ( 21979618,21977858);
select * from categoryoptioncombo where categoryoptioncomboid
in ( 21744421,21744407,20);

select * from datavalue order by 
created desc;

delete from datavalue where dataelementid in ( 21980132,
21980132,21978373,21979682,21979682,21977921);

-- http://127.0.0.1:8091/amr/api/dataValues.json?paging=false&pe=202306&ds=hhnNVOZPrSa&de=uKdTimLSdjx&ou=bLfOUtl4eZd&cc=PvoQryFqDr1&cp=o2KJuGuyUQ8;OYrOCirjxOn;L9MeYmVFIgo&co=HllvX50cXC0


-- delete program rule -- 'bCV67bYyjVa', 's7IsuiPpkI8'

-- prg -- dzizG8i1cmP -- stage --UW26ioWbKzv to stage -- Q3UjBKHk5St
-- prg -- rMiBliR4FGr -- stage --xnUTNC3qxp2 to stage -- dyWSTPoKXnp

select * from programstageinstance  where programstageid in ( 
select programstageid from programstage where uid = 'UW26ioWbKzv'); -- 3643

select * from programstageinstance  where programstageid in ( 
select programstageid from programstage where uid = 'xnUTNC3qxp2'); -- 267

-- delete programrule Show non-urine samples -- bCV67bYyjVa and Show non-urine samples -- s7IsuiPpkI8

-- d2:yearsBetween(A{age}, V{enrollment_date}) < 18 -- 0-17

-- (d2:yearsBetween(A{age}, V{enrollment_date}) > 17) && (d2:yearsBetween(A{age}, V{enrollment_date}) < 46) -- 18-45

-- (d2:yearsBetween(A{age}, V{enrollment_date}) > 45) && (d2:yearsBetween(A{age}, V{enrollment_date}) < 61) -- 46-60
-- (d2:yearsBetween(A{age}, V{enrollment_date}) > 60) && (d2:yearsBetween(A{age}, V{enrollment_date}) < 76) -- 61-75
-- d2:yearsBetween(A{age}, V{enrollment_date}) > 75 -- >75

-- 15/06/2023

delete from programruleaction where programruleid in (
select programruleid from programrule where uid in 
('bCV67bYyjVa', 's7IsuiPpkI8'));

delete from programrule where uid in 
('bCV67bYyjVa', 's7IsuiPpkI8');

-- move stage data from one stage to another stage
-- also for equityamr_bihar_v234 -- 28/06/2023
update programstageinstance set programstageid = 4731 
where programstageid in ( 
select programstageid from programstage where uid = 'UW26ioWbKzv');

update programstageinstance set programstageid = 9389 
where programstageid in ( 
select programstageid from programstage where uid = 'xnUTNC3qxp2');

select * from programstageinstance where programstageid in (
select programstageid from programstage where uid 
in( 'UW26ioWbKzv', 'xnUTNC3qxp2'));

-- stage delete also from AMR-Varanashi

delete from programstagesection_dataelements where programstagesectionid in 
( select programstagesectionid from programstagesection where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 234

delete from programruleaction where programstagesectionid in 
( select programstagesectionid from programstagesection where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 6

delete from programstagesection where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 18

delete from programruleaction where programruleid in 
( select programruleid from programrule where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 0

delete from programrule where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 0

delete from programstagedataelement where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 235

delete from eventvisualization_dataelementdimensions where trackedentitydataelementdimensionid in 
( select trackedentitydataelementdimensionid from trackedentitydataelementdimension 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 82

delete from trackedentitydataelementdimension where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 82


delete from eventvisualization_attributedimensions where eventvisualizationid in 
( select eventvisualizationid from eventvisualization 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 4

delete from eventvisualization_columns where eventvisualizationid in 
( select eventvisualizationid from eventvisualization 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 90

delete from eventvisualization_organisationunits where eventvisualizationid in 
( select eventvisualizationid from eventvisualization 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 2

delete from eventvisualization where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); --2 
 
delete from trackedentitydatavalueaudit where programstageinstanceid in 
( select programstageinstanceid from programstageinstance 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 21

delete from programstageinstance where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); --2 
 
delete from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv');
 
delete from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'); --2 

-- update event list for incomplete

-- event list with multiple TEA value trackedentityattributevalue
SELECT psi.uid AS eventUID,teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and psi.status = 'COMPLETED' and psi.executiondate 
between '2023-06-01' and '2023-06-30' and prg.uid not in ('L7bu48EI54J'); -- 347

="update programstageinstance set status  = '"&C2&"' where uid = '"&A2&"';"

select * from period where periodid = 21993778; 
select * from datavalue where periodid = 21993778; -- 1725
select *  from datavalueaudit where periodid = 21993778; -- 699

delete from datavalue where periodid = 21993778;
delete from datavalueaudit where periodid = 21993778;

-- for AMR Varanasi
-- 16/06/2023 delete dataelement where domaintype = 'AGGREGATE'; before import
-- https://ln2.hispindia.org/amr_varanasi/

select * from categorycombo;
select * from dataelement where domaintype = 'AGGREGATE';

select count(*) from dataelement; -- 416
select count(*) from dataelement where domaintype = 'AGGREGATE';

delete from visualization_datadimensionitems where datadimensionitemid in 
(select datadimensionitemid from datadimensionitem where dataelementid
in ( select dataelementid from dataelement where domaintype = 'AGGREGATE'));

delete from  datadimensionitem where dataelementid
in ( select dataelementid from dataelement where domaintype = 'AGGREGATE');

delete from  dataelementgroupmembers where dataelementid
in ( select dataelementid from dataelement where domaintype = 'AGGREGATE');

delete from  datasetelement where dataelementid
in ( select dataelementid from dataelement where domaintype = 'AGGREGATE');

delete from dataelement where domaintype = 'AGGREGATE';



-- for AMR Varanasi delete dataelementcategory Pathogen / Suspected coloniser 22/06/2023



delete from categorydimension_items where categorydimensionid in (
select categorydimensionid from categorydimension where categoryid in (
select categoryid from dataelementcategory where uid = 'VS4iXUJFlka'));

delete from visualization_categorydimensions where categorydimensionid in (
select categorydimensionid from categorydimension where categoryid in (
select categoryid from dataelementcategory where uid = 'VS4iXUJFlka'));

delete from categorydimension where categoryid in (
select categoryid from dataelementcategory where uid = 'VS4iXUJFlka');

delete from dataelementcategory where uid = 'VS4iXUJFlka';

-- delete dataelementcategoryoption Pathogen - W1rrkaYiEFT  Suspected coloniser - EZnpCoCuq1I

delete from categoryoptioncombos_categoryoptions
where categoryoptionid in ( select categoryoptionid from
dataelementcategoryoption where uid 
in('W1rrkaYiEFT', 'EZnpCoCuq1I'));

delete from dataelementcategoryoption where uid 
in('W1rrkaYiEFT', 'EZnpCoCuq1I');


select * from categoryoptioncombo where name like
'%Pathogen%'

select * from categoryoptioncombo where name like
'%Suspected coloniser%'

delete from categorycombos_optioncombos where 
categoryoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Pathogen%');

delete from categoryoptioncombos_categoryoptions where 
categoryoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Pathogen%');

delete from datavalue where 
attributeoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Pathogen%');

delete from datavalueaudit where 
attributeoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Pathogen%');

delete from categoryoptioncombo where name like
'%Pathogen%';



delete from categorycombos_optioncombos where 
categoryoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Suspected coloniser%');

delete from categoryoptioncombos_categoryoptions where 
categoryoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Suspected coloniser%');

delete from datavalue where 
attributeoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Suspected coloniser%');

delete from datavalueaudit where 
attributeoptioncomboid in (select categoryoptioncomboid
from categoryoptioncombo where name like
'%Suspected coloniser%');

delete from categoryoptioncombo where name like
'%Suspected coloniser%';


-- for AMR Varanasi delete optionsets 22/06/2023

update dataelement set optionsetid = null where optionsetid in (
select optionsetid from optionset where 
uid in ('NsnxXMTpxrY', 'hRHti3LG2H9'));

delete from optiongroupmembers where optionid in (
select optionvalueid from optionvalue where optionsetid in (
select optionsetid from optionset where 
uid in ('NsnxXMTpxrY', 'hRHti3LG2H9')));

delete from optionvalue where optionsetid in (
select optionsetid from optionset where 
uid in ('NsnxXMTpxrY', 'hRHti3LG2H9'));

delete from programruleaction where optiongroupid in (
select optiongroupid from optiongroup where optionsetid in (
select optionsetid from optionset where 
uid in ('NsnxXMTpxrY', 'hRHti3LG2H9')));

delete from optiongroup where optionsetid in (
select optionsetid from optionset where 
uid in ('NsnxXMTpxrY', 'hRHti3LG2H9'));

delete from optionset where 
uid in ('NsnxXMTpxrY', 'hRHti3LG2H9');

-- for AMR Varanasi 04/08/2023

update dataelementcategoryoption set publicaccess = 'rwrw----';

-- equityamr upgradation fro 2.34 to 2.38 10/07/2023

-- event list with multiple TEA value trackedentityattributevalue
SELECT psi.uid AS eventUID,teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 
and psi.status = 'COMPLETED' and psi.executiondate 
between '2023-07-01' and '2023-07-31' and prg.uid 
not in ('L7bu48EI54J','vMmE5HHjPF7'); -- 26

-- update july event from COMPLETED to ACTIVE
="update programstageinstance set status  = 'ACTIVE' where uid = '"&A2&"';"

select * from datavalue where 
periodid = 21929764;

select * from period where periodid = 21929764; 
select * from datavalue where periodid = 21929764; -- 208
select *  from datavalueaudit where periodid = 21929764; -- 52

-- delete aggregated datavalue for july
delete from datavalue where periodid = 21929764;
delete from datavalueaudit where periodid = 21929764;

select * from period order by startdate desc;

-- used for list list with sample collection date lab id sample-type
SELECT org.uid as orgunit,tei.uid as tei, psi.uid as eventID, 
psi.eventdatavalues as datavalues, psi.created::date as created, psi.executiondate::date as eventDate,psi.deleted
from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.deleted is false  and prg.uid in ( 'L7bu48EI54J','vMmE5HHjPF7')  and psi.executiondate is not null
and psi.executiondate >  CURRENT_DATE - INTERVAL '2 months' order by psi.executiondate desc;

select CURRENT_DATE - INTERVAL '2 months'

-- stage delete also from equityamr

select * from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv');

delete from programstagesection_dataelements where programstagesectionid in 
( select programstagesectionid from programstagesection where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 132

delete from programruleaction where programstagesectionid in 
( select programstagesectionid from programstagesection where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 6

delete from programstagesection where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 20

delete from programruleaction where programruleid in 
( select programruleid from programrule where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 2

delete from programrule where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 2

delete from programstagedataelement where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 133

delete from eventvisualization_dataelementdimensions where trackedentitydataelementdimensionid in 
( select trackedentitydataelementdimensionid from trackedentitydataelementdimension 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 0

delete from trackedentitydataelementdimension where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); -- 0


delete from eventvisualization_attributedimensions where eventvisualizationid in 
( select eventvisualizationid from eventvisualization 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 0

delete from eventvisualization_columns where eventvisualizationid in 
( select eventvisualizationid from eventvisualization 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 0

delete from eventvisualization_organisationunits where eventvisualizationid in 
( select eventvisualizationid from eventvisualization 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 0

delete from eventvisualization where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); --0 
 
delete from trackedentitydatavalueaudit where programstageinstanceid in 
( select programstageinstanceid from programstageinstance 
 where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'))); -- 144

delete from programstageinstance where programstageid in (
select programstageid from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv')); --4 
 
delete from programstage where uid 
in('xnUTNC3qxp2', 'UW26ioWbKzv'); --2 


-- AMR tanda production delete duplicate coc

select * from categoryoptioncombo  
where uid in ( 'eC0WJnw7XFP','XwZmsrgz90e');

select * from period where periodid = 21876310; -- feb 2022
select * from dataelement where dataelementid = 21746308; -- Klebsiella pneumoniae - AW
select * from organisationunit where organisationunitid = 385680; -- RPGMC
select * from categoryoptioncombo  where uid in ( 'eC0WJnw7XFP');

eC0WJnw7XFP -- 21840069 coc - 1
XwZmsrgz90e -- 21874232 coc - 452

select * from datavalue where categoryoptioncomboid in ( 21840069 );
select * from datavalue where categoryoptioncomboid in ( 21874232 );

select * from datavalue where attributeoptioncomboid in ( 21840069 );
select * from datavalue where attributeoptioncomboid in ( 21874232 );

-- eC0WJnw7XFP -- 21840069 to be deleted
-- XwZmsrgz90e -- 21874232


delete from categorycombos_optioncombos 
where categoryoptioncomboid in ( 21840069); -- 1

delete from categoryoptioncombos_categoryoptions 
where categoryoptioncomboid in ( 21840069); -- 2

delete from datavalue 
where categoryoptioncomboid in ( 21840069); -- 1

delete from categoryoptioncombo  
where categoryoptioncomboid in ( 21840069);

-- Cefoperazone-sulbactam

-- oaP95BtU2mN - Cefoperazone-sulbactam -- 21831804
-- FH7D9HvXueQ - Cefoperazone-Sulbactam -- 21874222

select * from dataelementcategoryoption
where categoryoptionid = 21831804;

select * from dataelementcategoryoption
where name = 'Cefoperazone-Sulbactam';

delete  from dataelementcategoryoption
where categoryoptionid = 21831804;

delete from categorydimension_items
where categoryoptionid = 21831804;


select * from optionvalue 
where code = 'Cefoperazone-Sulbactam';


SELECT psi.uid AS eventUID,  de.dataelementid, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
WHERE de.uid = 'Qsx6EEKMxoX' and
eventdatavalues -> 'Qsx6EEKMxoX' ->> 'value' = 'Cefoperazone-sulbactam';

-- equityamr 
-- coc to be deleted
-- Cefoperazone-sulbactam, Intermediate -- lN0OVFrHVDc
-- Cefoperazone-sulbactam, Resistant -- eC0WJnw7XFP

select * from categoryoptioncombo  
where uid in ( 'lN0OVFrHVDc','eC0WJnw7XFP');

select * from datavalue where categoryoptioncomboid in ( 21840069,21840070 ); -- 0
select * from datavalue where attributeoptioncomboid in ( 21840069,21840070 ); -- 0

select * from categoryoptioncombo  
where categoryoptioncomboid in ( 21840069,21840070 );

delete from categorycombos_optioncombos
where categoryoptioncomboid in ( 21840069,21840070 ); --2

delete from categoryoptioncombos_categoryoptions
where categoryoptioncomboid in ( 21840069,21840070 ); -- 4

delete from datavalueaudit
where categoryoptioncomboid in ( 21840069,21840070 ); -- 2


delete from categoryoptioncombo  
where categoryoptioncomboid in ( 21840069,21840070 );


select * from dataelementcategoryoption
where name = 'Cefoperazone-sulbactam';

select * from dataelementcategoryoption
where categoryoptionid = 21831804;

delete  from dataelementcategoryoption
where categoryoptionid = 21831804;

delete from categorydimension_items
where categoryoptionid = 21831804; -- 123

-- AMR Varanasi 31/08/2023 delete Favorites created before 22/08/2023

delete from visualization_categorydimensions
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 623

delete from visualization_columns
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 623

delete from visualization_filters
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 928

delete from visualization_organisationunits
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 55

delete from visualization_rows
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 514

delete from visualization_datadimensionitems
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 839

delete from visualization_periods
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 31

delete from visualization_dataelementgroupsetdimensions
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 28

delete from visualization_orgunitlevels
where visualizationid in ( select visualizationid
from visualization where created::date < '2023-08-22'); -- 1

delete from visualization where
created::date < '2023-08-22'; -- 358




-- incomplete event list with CR number and name

SELECT psi.uid AS eventUID,teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 
and psi.status != 'COMPLETED';


-- incomplete event list with CR number and name not for Sample Testing Program

SELECT psi.uid AS eventUID,teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 
and psi.status != 'COMPLETED' and prg.uid not in ('L7bu48EI54J');



