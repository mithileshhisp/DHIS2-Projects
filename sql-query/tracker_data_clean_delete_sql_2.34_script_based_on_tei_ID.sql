begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in ( 305265,287791);
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in ( 305265, 287791);

-- 3) relationship

	update relationshipitem set trackedentityinstanceid = null where relationshipid in ( select relationshipid from 
	relationship where to_relationshipitemid in ( select relationshipitemid from 
	relationshipitem where trackedentityinstanceid in ( 305265, 287791);
	
-- 4) trackedentitydatavalue

-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit where programstageinstanceid in (select programstageinstanceid
	from programstageinstance where programinstanceid in 
	(select programinstanceid from programinstance where 
	trackedentityinstanceid in ( 305265,287791);

-- 6) programstageinstance 
	delete from programstageinstance where programinstanceid in 
	(select programinstanceid from programinstance where 
	trackedentityinstanceid in ( 305265, 287791);

-- 7) programstageinstance 
	delete from programinstance where trackedentityinstanceid in ( 305265,287791);

-- 8) trackedentityprogramowner
     delete from trackedentityprogramowner where trackedentityinstanceid in ( 305265, 287791);
	  
-- 9) trackedentityinstance
     delete from trackedentityinstance where trackedentityinstanceid in ( 305265,287791 );
	 
end;