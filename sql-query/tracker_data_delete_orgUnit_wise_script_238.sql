begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 );
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 );

-- 3) relationship
	delete from relationship;
	
-- 4) trackedentitydatavalue

	-- delete from trackedentitydatavalue where programstageinstanceid in ( select programstageinstanceid from programstageinstance where programinstanceid in ( select programinstanceid from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 ) ) );

-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programinstanceid in 
	( select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 ) ) );

-- 6) programstageinstancecomments

	delete from programstageinstancecomments where programstageinstanceid in 
	(select programstageinstanceid from programstageinstance where programinstanceid in 
	( select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 ) ));

-- 7) programstageinstance 
	delete from programstageinstance where programinstanceid in 
	( select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 ) );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in (
	select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in ( 121547) ) );


-- 9) programinstance 
      delete from programinstance where trackedentityinstanceid in 
	  ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 );

-- 10) trackedentityprogramowner 
	 delete from trackedentityprogramowner where trackedentityinstanceid in (
	 select trackedentityinstanceid from trackedentityinstance where organisationunitid in( 121547 ));

-- 11) relationshipitem 
     update relationshipitem set trackedentityinstanceid = null where trackedentityinstanceid in (
     select trackedentityinstanceid from trackedentityinstance where organisationunitid in( 121547 ));
	 
-- 12) trackedentityinstance 
     delete from trackedentityinstance where organisationunitid = 121547;
	 
end;