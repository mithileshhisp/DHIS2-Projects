-- in 2.40 as on 15/03/2024

-- run for combat-amr jimma ethiopia 15/03/2024

http://127.0.0.1:8091/amr/api/dataValues.json?paging=false&pe=202403&ds=J3Me8JvCblY&de=MztXgvnNmtE&ou=bwSleo5PAaV&cc=gzeiWcdMfDo&cp=R5aJAFlmLsL;Nn0yqVDvMYP&co=HllvX50cXC0

select * from trackedentityinstance order by
trackedentityinstanceid desc;

select * from programinstance 
order by programinstanceid desc


select * from programstageinstance 
order by programstageinstanceid desc

SELECT last_value FROM hibernate_sequence;

select * from dataelement order by
dataelementid desc;

-- run on production 19/04/2024 in v40
SELECT last_value FROM trackedentityinstance_sequence;
ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 250501;

SELECT last_value FROM programinstance_sequence;
ALTER SEQUENCE programinstance_sequence RESTART WITH 250501;

SELECT last_value FROM programstageinstance_sequence;
ALTER SEQUENCE programstageinstance_sequence RESTART WITH 250501;

SELECT last_value FROM trackedentitydatavalueaudit_sequence;
ALTER SEQUENCE trackedentitydatavalueaudit_sequence RESTART WITH 250501;

SELECT last_value FROM datavalueaudit_sequence;
ALTER SEQUENCE datavalueaudit_sequence RESTART WITH 250501;

SELECT last_value FROM hibernate_sequence;
ALTER SEQUENCE hibernate_sequence RESTART WITH 250501;

select * from trackedentityprogramowner
order by trackedentityprogramownerid desc;

----

-- delete test TEI and aggregated data from jimma instance from march 2024 to till date -- 24/06/2024

select * from programinstance where enrollmentdate::date >= '2024-03-01';
select * from trackedentityinstance where created::date >= '2024-03-01';
select * from programstageinstance where created::date >= '2024-03-01';
select * from datavalue where created::date >= '2024-03-01';
select * from datavalueaudit where created::date >= '2024-03-01';


delete from datavalueaudit where created::date >= '2024-03-01'; -- 116
delete from datavalue where created::date >= '2024-03-01'; -- 38

delete from programstageinstance where created::date >= '2024-03-01'; -- 266
delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where created::date >= '2024-03-01')--3273

delete from programinstance where created::date >= '2024-03-01'; -- 99
delete from trackedentityinstance where created::date >= '2024-03-01'; -- 50

delete from trackedentityattributevalue where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance 
where created::date >= '2024-03-01'); -- 221

delete from trackedentityattributevalueaudit where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance 
where created::date >= '2024-03-01'); -- 16
 
delete from trackedentityprogramowner where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance 
where created::date >= '2024-03-01'); -- 96

select * from programinstance where created::date between  '2024-02-01'
and '2024-02-29';

select * from programinstance where created::date between  '2024-02-01'
and '2024-02-29';

select * from programstageinstance where created::date between  '2024-02-01'
and '2024-02-29';

select * from trackedentityinstance where created::date between  '2024-02-01'
and '2024-02-29';

select * from datavalue where created::date between  '2024-02-01'
and '2024-02-29';















SELECT last_value FROM trackedentityinstance_sequence;
ALTER SEQUENCE trackedentityinstance_sequence RESTART WITH 250461;

SELECT last_value FROM programinstance_sequence;
ALTER SEQUENCE programinstance_sequence RESTART WITH 250461;

SELECT last_value FROM programstageinstance_sequence;
ALTER SEQUENCE programstageinstance_sequence RESTART WITH 250461;

SELECT last_value FROM trackedentitydatavalueaudit_sequence;
ALTER SEQUENCE trackedentitydatavalueaudit_sequence RESTART WITH 250461;

SELECT last_value FROM datavalueaudit_sequence;
ALTER SEQUENCE datavalueaudit_sequence RESTART WITH 250461;

SELECT last_value FROM hibernate_sequence;
ALTER SEQUENCE hibernate_sequence RESTART WITH 250461;

select * from trackedentityprogramowner
order by trackedentityprogramownerid desc;


select * from trackedentitydatavalueaudit
order by trackedentitydatavalueauditid desc;

select * from trackedentitydatavalueaudit 
where trackedentitydatavalueauditid = 63775




















-- delete aggregated data
-- 1) delete datavalueaudit
    
	delete from datavalueaudit;

-- 2) delete datavalue
    
	delete from datavalue;

-- 3) delete completedatasetregistration
    
	delete from completedatasetregistration;


delete from programruleaction;
delete from programrulevariable;
delete from programrule;

delete from datavalue;
delete from datavalueaudit;

select * from programstageinstance where status = 'ACTIVE' 
order by lastupdated desc;

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid in (
select programid from program where uid = 'WhYipXYg2Nh'));

update programstageinstance set status = 'COMPLETED' 
where programinstanceid in (
select programinstanceid from programinstance where programid in (
select programid from program where uid = 'WhYipXYg2Nh'));

update programstageinstance set status = 'ACTIVE'; -- for imcomlpete event


select * from trackedentityinstance where uid = 'wBox23BJsPH';

select * from programinstance where trackedentityinstanceid = 401;

select * from programstageinstance where programinstanceid = 700;

select * from program;

update programstageinstance set status = 'ACTIVE'  where uid = 'IwaLRZWf3Tt'

-- amr jimma

SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.startdate::TEXT,'-', 2)) 
as isoPeriod, pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE dv.value is not null and dv.deleted is not true;

select * from programstage where programid in (860,1097);

select * from programstageinstance where programstageid in(
select programstageid from programstage where programid in (860,1097))
and status = 'COMPLETED';

update programstageinstance set status = 'ACTIVE' where programstageid in(
select programstageid from programstage where programid in (860,1097))
and status = 'COMPLETED'; 

-- event list
SELECT psi.programstageinstanceid, psi.uid eventID,psi.storedby, psi.status, 
psi.executiondate::date, psi.completedby, psi.completeddate::date,psi.status
FROM programstageinstance psi;

-- gram positive and negative program event list
SELECT prg.uid prgUID,prg.name AS prgName,psi.programstageinstanceid, psi.uid eventID,
psi.storedby, psi.status,psi.executiondate::date, psi.completedby, psi.completeddate::date,psi.status,
teav.value AS medical_record_number FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
WHERE prg.uid in ( 'ICxr5ByOXkV','qlHnTeSDOfP') and psi.status = 'COMPLETED' and tea.uid = 'uo3FuH69WXH';

SELECT prg.uid prgUID,prg.name AS prgName,psi.programstageinstanceid, psi.uid eventID,
psi.storedby, psi.status,psi.executiondate::date, psi.completedby, psi.completeddate::date,psi.status,
teav.value AS medical_record_number FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
WHERE prg.uid in ( 'ICxr5ByOXkV','qlHnTeSDOfP')  and tea.uid = 'uo3FuH69WXH';

INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate between '2021-08-01' and '2021-11-30' and teav.trackedentityattributeid = 3418;

uo3FuH69WXH