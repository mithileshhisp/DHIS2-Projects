
-- for data move/delete from 2.24 to 2.35

select * from programstageinstance order by created desc; 

select count(*) from programstageinstance; -- 5943 -- 6414

select count(*) from programinstance; -- 12684 -- 13381

select count(*) from trackedentityinstance; -- 12688 -- 13386

select count(*) from trackedentityattributevalue; -- 149849 --158721























-- for 2.35

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