

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