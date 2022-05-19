---


-- datavalue 
 -- COVID19 - DCHC & CCC Reporting Dataset rnayK9uGowo
 -- COVID19 - CCCC (4C) Reporting Dataset HiuM9tRwiT7
 
 
select * from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'HiuM9tRwiT7')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-12-23' and '2022-01-10');

select * from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'HiuM9tRwiT7')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-12-23' and '2022-01-10'); 

 
select * from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'rnayK9uGowo')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-10-25' and '2021-10-31');

select * from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'rnayK9uGowo')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-10-25' and '2021-10-31'); 
 
 
select * from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-08-01' and '2021-08-31');

select * from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-08-01' and '2021-08-31');

delete from datavalue where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-09-01' and '2021-09-30');

delete from datavalueaudit where dataelementid in (
select dataelementid from datasetelement where datasetid in (
select datasetid from dataset where uid = 'gl7JRAdXkhR')) and
periodid in (select periodid from period where periodtypeid = 3 and startdate between 
'2021-09-01' and '2021-09-30');

select programstageinstanceid,uid,programstageid,executiondate::date,created::date,
lastupdated::date from programstageinstance where executiondate::date = '2021-10-27';


delete from programstageinstance where executiondate::date = '2021-10-27';

select * from programstageinstance where executiondate::date = '2021-10-27';

select programinstanceid,uid,programid,trackedentityinstanceid,enrollmentdate::date,
created::date,lastupdated::date from programinstance where enrollmentdate::date = '2021-10-27';

delete from programinstance where enrollmentdate::date = '2021-10-27';

select * from programinstance where enrollmentdate::date = '2021-10-27';

-- 31/10/2021
select count(*) from trackedentityinstance; 119071
select count(*) from programinstance; 119069
select count(*) from programstageinstance; 139275

-- 23/11/2021

select * from programinstance where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2022-01-24 05:30:00'::timestamp 
where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2021-11-22 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-12-27';

update programinstance set enrollmentdate = '2021-11-22 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-11-22';

SELECT CAST('2021-11-22' AS timestamp);

SELECT CAST('2021-11-22 12:45:15.255' AS timestamp) AS CURRENT_DATE

update programinstance set enrollmentdate = '2021-12-27' where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2021-12-27 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-12-27';

select * from trackedentityattributevalue where trackedentityattributeid = 22745; -- serial no

-- run on 18/04/2022

select * from programinstance where enrollmentdate::date = '1970-01-01';

update programinstance set enrollmentdate = '2022-04-13 05:30:00'::timestamp 
where enrollmentdate::date = '1970-01-01';

-- 

SELECT psi.programstageinstanceid, psi.uid eventID, psi.executiondate::date,
prg.uid AS prgUID, ps.uid AS programStageUID,teav.value AS serial_no FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate = '2022-01-18' and teav.trackedentityattributeid = 22745
and prg.uid = 'CTUqdqhrb46' and ps.uid = 'xikrKb0k2Eg';