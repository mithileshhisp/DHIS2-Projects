---


-- datavalue 

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

update programinstance set enrollmentdate = '2021-11-22 12:45:15.255'::timestamp 
where enrollmentdate::date = '2021-11-22';

SELECT CAST('2021-11-22' AS timestamp);

SELECT CAST('2021-11-22 12:45:15.255' AS timestamp) AS CURRENT_DATE




