begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid in( 4033677,4034126,4034349 ) ); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid in( 4033677,4034126,4034349 ) ); 

-- 3) relationship
	

-- 4) trackedentitydatavalue



-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in( 4033677,4034126,4034349 ) ) );

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in( 4033677,4034126,4034349 ) ) );

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid in( 4033677,4034126,4034349 ) );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid in( 4033677,4034126,4034349 ) );

-- 9) programinstance 
      delete from programinstance where programid in( 4033677,4034126,4034349 ); 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid in( 4033677,4034126,4034349 ) ); 

end;