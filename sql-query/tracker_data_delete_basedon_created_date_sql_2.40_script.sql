begin;

-- TEI delete based on created date

-- 1) trackedentityattributevalueaudit
delete from trackedentitydatavalueaudit where programstageinstanceid
in ( select programstageinstanceid from programstageinstance where created::date = '2023-11-01');

-- 2) programstageinstance
delete from programstageinstance where created::date = '2023-11-01';

-- 3) programinstance
delete from programinstance where created::date = '2023-11-01';

-- 4) trackedentityattributevalue
delete from trackedentityattributevalue where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance 
where created::date = '2023-11-01');

-- 5) trackedentityprogramowner
delete from trackedentityprogramowner where trackedentityinstanceid
in ( select trackedentityinstanceid from trackedentityinstance 
where created::date = '2023-11-01');

-- 6) trackedentityinstance
delete from trackedentityinstance where created::date = '2023-11-01';
	 
end;