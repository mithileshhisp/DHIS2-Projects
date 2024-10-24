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


-- insert into programnotificationtemplate_deliverychannel for SMS not push via API
-- as on 01/04/2024

insert into programnotificationtemplate_deliverychannel (programnotificationtemplatedeliverychannelid, deliverychannel ) values 
( 3421649, 'SMS');

-- 05/06/2024 query for sending SMS

SELECT tei.uid AS teiUID, psi.uid AS eventUID, psi.duedate::date as due_date,
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.programstageid in ( select programstageid from programstage 
where uid = 's53RFfXA75f') AND psi.duedate::date = '2024-06-06';


SELECT tei.uid AS teiUID, psi.uid AS eventUID,psi.executiondate::date as Event_date,
cast(data.value::json ->> 'value' AS VARCHAR)
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN dataelement de ON data.key = de.uid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE psi.programstageid in ( select programstageid from programstage 
where uid = 'BrZ8MF97cDH') AND tei.uid = 'fRHpYpNUP79'
and de.uid in ( 'kQzpqh4JL7l','nVU4BU2jHc3','x3s6CXPdNjd')
ORDER BY psi.executiondate desc LIMIT 1;


Yemen EPI/HMIS production
https://yemhis.org/epi/

test_covax
District@2024

-- 07/06/2024

-- yemen/epi multiple TEA value trackedentityattributevalue for send SMS

SELECT tei.uid AS teiUID, psi.uid AS eventUID, psi.duedate::date as due_date,
org.name,teav1.value as mobile_number, teav2.value as first_name, 
teav3.value as last_name FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityattributevalue teav1 ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid

INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3421643 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid

INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3421645 ) teav3
on teav1.trackedentityinstanceid = teav3.trackedentityinstanceid

WHERE psi.programstageid in ( select programstageid from programstage 
where uid = 's53RFfXA75f') AND psi.duedate::date = '2024-06-08'
AND teav1.trackedentityattributeid = 3421642;



-- final query 10/06/2024

SELECT tei.uid AS teiUID, psi.uid AS eventUID, psi.duedate::date as due_date,  
org.name as orgunit_name,teav1.value as mobile_number, teav2.value as first_name,   
teav3.value as last_name FROM programstageinstance psi  
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid  
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid  
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid  
INNER JOIN trackedentityattributevalue teav1 ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid  
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue WHERE trackedentityattributeid = 3421643 ) teav2  
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid  
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue WHERE trackedentityattributeid = 3421645 ) teav3  
ON teav1.trackedentityinstanceid = teav3.trackedentityinstanceid 
WHERE psi.programstageid in ( select programstageid from programstage WHERE uid = 's53RFfXA75f')  
AND teav1.trackedentityattributeid = 3421642 AND psi.duedate::date = '2024-06-11'



pjexi5YaAPa -- 3421642 -- Primary contact number
ftFBu8mHZ4H -- 3421643 -- Primary contact's first name
EpbquVl5OD6 -- 3421645 -- Primary contact's last name

select * from trackedentityattribute where uid = 'pjexi5YaAPa'

SEND_PROGRAM_NOTIFICATION_SCHEDULED_MESSAGE:d.Z.t("Send scheduled Custom SMS"),

-- message

Welcome A{ftFBu8mHZ4H} A{EpbquVl5OD6}. Most parents of children attend immunization visits to help keep their baby safe. Your child will get immunizations to protect them and others against certain infectious diseases. As agreed, we will send you reminders about upcoming visits. You may let us know if you don't want to receive anymore. 
"حان موعد تطعيم طفلكم بحسب جدول التطعيم الروتيني.وزارة الصحة- برنامج التحصين"




-- openMRS queries

SELECT CONCAT(pn.given_name, " ", pn.middle_name, " ", pn.family_name) AS patientName, pi.identifier,
	TIMESTAMPDIFF(YEAR, person.birthdate, obs.obs_datetime ) AS age, person.gender, p_attribute.value AS category,
	DATE(e.encounter_datetime) AS registrationDate, et.name AS visitType
	FROM encounter e
	INNER JOIN obs ON obs.encounter_id = e.encounter_id AND obs.concept_id IN (SELECT concept_id FROM concept_name WHERE NAME LIKE "%OPD Ward%")
	INNER JOIN concept_name cn ON cn.concept_id = obs.value_coded AND cn.concept_name_type = "FULLY_SPECIFIED"
	INNER JOIN patient ON patient.patient_id = e.patient_id
	INNER JOIN person ON person.person_id = patient.patient_id
	INNER JOIN person_name pn ON pn.person_id = patient.patient_id
	INNER JOIN person_address pa ON pa.person_id = patient.patient_id
	INNER JOIN patient_identifier PI ON pi.patient_id = patient.patient_id
	INNER JOIN person_attribute p_attribute ON p_attribute.person_id = patient.patient_id
	INNER JOIN person_attribute_type pat ON pat.person_attribute_type_id = p_attribute.person_attribute_type_id AND pat.name LIKE '%Patient Category%'
	INNER JOIN encounter_type et ON et.encounter_type_id = e.encounter_type
	INNER JOIN users users ON users.user_id = pa.creator
	WHERE e.encounter_type IN (5, 6) AND DATE(e.encounter_datetime) BETWEEN '2021-01-01' AND '2021-11-30'
	AND cn.name LIKE '%GENERAL MEDICINE OPD ROOM NO 100 101%'
	GROUP BY DATE(e.encounter_datetime), patient.patient_id, cn.concept_id, e.encounter_type
	
	
SELECT 	pn.given_name, pn.middle_name,pn.family_name,
CONCAT(pn.given_name, " ", pn.middle_name, " ", pn.family_name) AS patientName, 
pi.identifier, person.gender, person.birthdate FROM encounter e
INNER JOIN patient ON patient.patient_id = e.patient_id
INNER JOIN person ON person.person_id = patient.patient_id
INNER JOIN patient_identifier pi ON pi.patient_id = patient.patient_id
INNER JOIN person_name pn ON pn.person_id = patient.patient_id
LIMIT 1000;


SELECT 	pn.given_name, pn.middle_name,pn.family_name,
CONCAT(pn.given_name, " ", pn.middle_name, " ", pn.family_name) AS patientName
from person_name pn limit 1000;


update person_name set person_name.given_name = '****' , person_name.middle_name = '****',
person_name.family_name = '****' where person_name_id > 31;




SELECT CONCAT(pn.given_name, " ", pn.middle_name, " ", pn.family_name) AS patientName, pi.identifier,
	TIMESTAMPDIFF(YEAR, person.birthdate, obs.obs_datetime ) AS age, person.gender, p_attribute.value AS category,
	DATE(e.encounter_datetime) AS registrationDate, et.name AS visitType
	FROM encounter e
	INNER JOIN obs ON obs.encounter_id = e.encounter_id AND obs.concept_id IN (SELECT concept_id FROM concept_name WHERE NAME LIKE "%OPD Ward%")
	INNER JOIN concept_name cn ON cn.concept_id = obs.value_coded AND cn.concept_name_type = "FULLY_SPECIFIED"
	INNER JOIN patient ON patient.patient_id = e.patient_id
	INNER JOIN person ON person.person_id = patient.patient_id
	INNER JOIN person_name pn ON pn.person_id = patient.patient_id
	INNER JOIN person_address pa ON pa.person_id = patient.patient_id
	INNER JOIN patient_identifier pi ON pi.patient_id = patient.patient_id
	INNER JOIN person_attribute p_attribute ON p_attribute.person_id = patient.patient_id
	INNER JOIN person_attribute_type pat ON pat.person_attribute_type_id = p_attribute.person_attribute_type_id AND pat.name LIKE '%Patient Category%'
	INNER JOIN encounter_type et ON et.encounter_type_id = e.encounter_type
	INNER JOIN users users ON users.user_id = pa.creator
	WHERE e.encounter_type IN (5, 6) AND DATE(e.encounter_datetime) BETWEEN '2021-01-01' AND '2021-11-30'
	AND cn.name LIKE '%GENERAL MEDICINE OPD ROOM NO 100 101%'
	GROUP BY DATE(e.encounter_datetime), patient.patient_id, cn.concept_id, e.encounter_type

	
	
	
	
	