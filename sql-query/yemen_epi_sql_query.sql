-- yemen_epi 

--  Yemen HMIS - EPI 
-- upgrade from 2.34 to 2.39/2.40
-- 11/08/2023

-- admin old password -  '$2a$10$iPEkDTORGhbZW2N2nNaJHuyO6Iu/bJnae/aHp00OYCWI5/vqdU.k6'

-- from run in 2.39.2.1

-- run delete QuarterlyNov periodtype


yemen_epi_234_11_08_2023
psql -U postgres yemen_epi_234_11_08_2023 < 
pg_dump -U postgres -d yemen_epi_234_11_08_2023 > "C:\Users\Mithilesh Thakur\Desktop\yemen_epi_239_11Aug2023.sql"



-- as on 04/03/2024 analytics issue in nutration instance

SELECT psi.uid eventID,psi.executiondate::date,psi.duedate::date,
data.key as de_uid,de.valuetype,de.name,cast(data.value::json ->> 'value' AS VARCHAR) AS dataValue
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where cast(data.value::json ->> 'value' AS VARCHAR) like '000%' order by 
psi.created desc;

select * from trackedentityattributevalue where
trackedentityattributeid in( 9694 ) 
and value in ( '0001-08-18','0003-03-14','0001-06-04','0004-08-03') and
trackedentityinstanceid in ( select trackedentityinstanceid
from programinstance where 
programid in ( select programid from program where uid = 'm6OaZSquWeu'))
order by created desc;

select * from trackedentityattributevalue where
trackedentityattributeid in( 9698 ) 
and
trackedentityinstanceid in ( select trackedentityinstanceid
from programinstance where 
programid in ( select programid from program where uid = 'm6OaZSquWeu'))
order by created desc;


select * from trackedentityattributevalue where 
trackedentityinstanceid in ( 2375,2374,2367,510);


select * from trackedentityattributevalue where 
trackedentityattributeid in( 9694 ) and trackedentityinstanceid
in ( 2375,2374,2367,510);

delete from trackedentityattributevalue where 
trackedentityattributeid in( 9698 ) and trackedentityinstanceid
in ( 9121,8633,5939 );

trackedentityattributeid=9695




select * from periodtype 
where name = 'QuarterlyNov';

delete from periodtype 
where name = 'QuarterlyNov';

="update optionvalue set sort_order  = "&C2&" where optionvalueid = "&A2&" and uid = '"&B2&"';"	

select * from optionset where uid = 'CNNH0YKxRh9'

select * from optionvalue where optionsetid = 10811
order by optionvalueid;

select * from optionvalue where optionsetid in(
select optionsetid from optionset where uid = 'oj3CWm4hpPb' )
order by optionvalueid;


update users set password = '$2a$10$ygJzpL.g054Z9RSPF1w6Y.SI3FhlqpPO4Hut690n6aHQG1BdvWKsa' 
where username = 'admin';

select count(*) from trackedentityinstance where deleted is true; --11041

delete from trackedentityattributevalueaudit where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true); -- 38274

delete from trackedentityprogramowner where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityinstance where deleted is true); -- 10538

delete from programownershiphistory where trackedentityinstanceid in 
(select trackedentityinstanceid from trackedentityinstance where deleted is true); -- 5

delete from programmessage where trackedentityinstanceid in 
(select trackedentityinstanceid from trackedentityinstance where deleted is true); -- 4832

delete from trackedentityinstance where deleted is true;

select count(*) from trackedentityinstance where deleted is true;

select * from trackedentityinstance where deleted is true; --11041

-- run on production database

UPDATE programstageinstance SET 
eventdatavalues = jsonb_set(eventdatavalues,'{FmDPRFXrMaG, value}', '"2021-08-17T20:53:08.000Z"',true) 
WHERE programstageinstanceid = '123621';


SELECT * from programownershiphistory where programid=10882; -- 536
select * from program where programid=10882; -- COVAC - COVID-19 Vaccination Registry
delete from programownershiphistory where programid=10882; --563

DELETE FROM public.categorycombos_optioncombos 
WHERE categoryoptioncomboid=4043009; 

DELETE FROM public.categorycombos_optioncombos 
WHERE categoryoptioncomboid=4204368;
	
DELETE FROM public.categoryoptioncombos_categoryoptions 
WHERE categoryoptioncomboid='4043009';

DELETE FROM public.categoryoptioncombos_categoryoptions
WHERE categoryoptioncomboid='4204368';

DELETE FROM public.categoryoptioncombo 
WHERE categoryoptioncomboid='4043009';

DELETE FROM public.categoryoptioncombo 
WHERE categoryoptioncomboid='4204368';


# vaccine name

UPDATE public.optionvalue SET sort_order= 1 WHERE optionvalueid = 10770;
UPDATE public.optionvalue SET sort_order= 2 WHERE optionvalueid = 10798;
UPDATE public.optionvalue SET sort_order= 3 WHERE optionvalueid = 10772;

# dose number

UPDATE public.optionvalue SET sort_order= 1 WHERE optionvalueid = 10794;
UPDATE public.optionvalue SET sort_order= 2 WHERE optionvalueid = 10786;

# vaccine manufacture

UPDATE public.optionvalue SET sort_order= 1 WHERE optionvalueid = 10775;
UPDATE public.optionvalue SET sort_order= 2 WHERE optionvalueid = 10774;
UPDATE public.optionvalue SET sort_order= 3 WHERE optionvalueid = 10768;
UPDATE public.optionvalue SET sort_order= 4 WHERE optionvalueid = 10792;
UPDATE public.optionvalue SET sort_order= 5 WHERE optionvalueid = 10785;
UPDATE public.optionvalue SET sort_order= 6 WHERE optionvalueid = 10801;

# occupation

select * from optionvalue where optionsetid in(
select optionsetid from optionset where uid = 'CNNH0YKxRh9' )
order by optionvalueid;

UPDATE public.optionvalue AS ov SET sort_order = (SELECT COUNT(*) FROM public.optionvalue AS sub_ov 
WHERE sub_ov.optionvalueid <= ov.optionvalueid 
AND sub_ov.optionsetid = 10811 
AND sub_ov.optionvalueid <> ov.optionvalueid) + 1 WHERE ov.optionsetid = 10811;


Category combination sort order 

UPDATE categorycombos_categories SET sort_order = 3 WHERE categoryid = 8018 AND categorycomboid = 5790;
UPDATE categorycombos_categories SET sort_order = 1 WHERE categoryid = 5784 AND categorycomboid = 5790;
UPDATE categorycombos_categories SET sort_order = 2 WHERE categoryid = 8018 AND categorycomboid = 5790;
UPDATE categorycombos_categories SET sort_order = 3 WHERE categoryid = 8018 AND categorycomboid = 5787;
UPDATE categorycombos_categories SET sort_order = 1 WHERE categoryid = 5781 AND categorycomboid = 5787;
UPDATE categorycombos_categories SET sort_order = 2 WHERE categoryid = 8018 AND categorycomboid = 5787;
UPDATE categorycombos_categories SET sort_order = 4 WHERE categoryid = 9279 AND categorycomboid = 9291;
UPDATE categorycombos_categories SET sort_order = 1 WHERE categoryid = 9275 AND categorycomboid = 9291;
UPDATE categorycombos_categories SET sort_order = 2 WHERE categoryid = 9279 AND categorycomboid = 9291;






