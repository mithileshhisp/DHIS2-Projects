begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 2930728); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 2930728); 

-- 3) relationship
	update relationshipitem set trackedentityinstanceid = null where relationshipid in ( select relationshipid from 
	relationship where to_relationshipitemid in ( select relationshipitemid from 
	relationshipitem where trackedentityinstanceid in ( select trackedentityinstanceid from programinstance where programid = 2930728 )));
	
	
-- 4) trackedentitydatavalue
     delete from trackedentitydatavalue where programstageinstanceid in (
     select programstageinstanceid from programstageinstance where programstageid in 
	( select programstageid from programstage where programid = 456215 ));

-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 2930728 )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 2930728 )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid = 2930728 );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid = 2930728 );

-- 9) programinstance 
      delete from programinstance where programid = 2930728; 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid = 2930728 ); 

end;