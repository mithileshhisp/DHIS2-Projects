begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid in( 8699,8668,8689,51005,51006 ) ); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid in( 8699,8668,8689,51005,51006 ) ); 

-- 3) relationship
	delete from relationship;
-- 4) trackedentitydatavalue

    delete from trackedentitydatavalue where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in( 8699,8668,8689,51005,51006 ) )
	);

-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in( 8699,8668,8689,51005,51006 ) )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in( 8699,8668,8689,51005,51006 ) )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid in( 8699,8668,8689,51005,51006 ) );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid in( 8699,8668,8689,51005,51006 ) );

-- 9) programinstance 
      delete from programinstance where programid in( 8699,8668,8689,51005,51006 ); 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid in( 8699,8668,8689,51005,51006 ) ); 

end;