begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 103); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 103); 

-- 3) relationship
	
	update  relationshipitem set relationshipid = null;
	delete from relationship;
	delete from relationshipitem;
-- 4) trackedentitydatavalue



-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 103 )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 103 )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid = 103 );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid = 103 );

-- 9) programinstance 
      delete from programinstance where programid = 103; 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid = 103 ); 

end;