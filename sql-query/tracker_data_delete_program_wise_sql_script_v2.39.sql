begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 239672); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 239672); 

-- 3) relationship
	update relationshipitem set trackedentityinstanceid = null where relationshipid in ( select relationshipid from 
	relationship where to_relationshipitemid in ( select relationshipitemid from 
	relationshipitem where trackedentityinstanceid in ( select trackedentityinstanceid from programinstance where programid = 239672 )));
	
-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 239672 )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 239672 )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid = 239672 );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid = 239672 );

-- 9) programinstance 
      delete from programinstance where programid = 239672; 

-- 10) trackedentityinstance 
delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid = 239672 ); 

end;