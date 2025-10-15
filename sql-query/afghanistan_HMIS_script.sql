-- 22/04/2025

-- 2.41 query wrong period
select ev.uid, ev.scheduleddate ,ev.occurreddate  from event ev where
(EXTRACT(year from ev.occurreddate) < 1900
 or EXTRACT(year from ev.occurreddate) > 2050);
 
-- wrong eventdataValue date_type
select ev.uid eventID,ev.eventid , ev.occurreddate::date,
ev.scheduleddate::date,org.uid orgUID,org.name orgName, data.key as dataElement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS wrong_date from event ev
JOIN json_each_text(ev.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN organisationunit org ON org.organisationunitid = ev.organisationunitid
where cast(data.value::json ->> 'value' AS VARCHAR) like '%0000-%' and 
(EXTRACT(year from ev.occurreddate) < 1900 
or EXTRACT(year from ev.occurreddate) > 2050) 
order by ev.occurreddate;


select ev.uid eventuid, ev.eventid , ev.occurreddate::date,
ev.scheduleddate::date,org.uid orgUID,org.name orgName, data.key as dataElement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS wrong_date from event ev
JOIN json_each_text(ev.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN organisationunit org ON org.organisationunitid = ev.organisationunitid
where cast(data.value::json ->> 'value' AS VARCHAR) like '%0000-%' 
order by ev.occurreddate;