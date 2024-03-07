begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid in ( select programid from program
     where uid = 'ONV44BbaETD')); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid in ( select programid from program
     where uid = 'ONV44BbaETD')); 

-- 3) relationship
	update relationshipitem set trackedentityinstanceid = null where relationshipid in ( select relationshipid from 
	relationship where to_relationshipitemid in ( select relationshipitemid from 
	relationshipitem where trackedentityinstanceid in ( select trackedentityinstanceid from programinstance where programid in 
	( select programid from program
     where uid = 'ONV44BbaETD') )));
	
	
-- 4) trackedentitydatavalue


-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in ( select programid from program
     where uid = 'ONV44BbaETD') )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid in ( select programid from program
     where uid = 'ONV44BbaETD') )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid in ( select programid from program
     where uid = 'ONV44BbaETD') );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid in ( select programid from program
     where uid = 'ONV44BbaETD') );

-- 9) programinstance 
      delete from programinstance where programid in ( select programid from program
     where uid = 'ONV44BbaETD'); 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid in ( select programid from program
     where uid = 'ONV44BbaETD') ); 

end;