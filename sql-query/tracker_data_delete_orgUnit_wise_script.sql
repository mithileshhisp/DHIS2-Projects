begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 163951 );
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 163951 );

-- 3) relationship
	delete from relationship;
	
-- 4) trackedentitydatavalue

	delete from trackedentitydatavalue where programstageinstanceid in ( select programstageinstanceid from programstageinstance where programinstanceid in ( select programinstanceid from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 163951 ) ) );

-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit where programstageinstanceid in ( select programstageinstanceid from programstageinstance where programinstanceid in ( select programinstanceid from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 163951 ) ) );

-- 6) programstageinstancecomments

	delete from programstageinstancecomments;

-- 7) programstageinstance 
	delete from programstageinstance where programinstanceid in ( select programinstanceid from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 163951 ) );
	
-- 8) programstageinstance 
	delete from programinstancecomments;


-- 9) programinstance 
      delete from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 163951 );

-- 10) trackedentityinstance 
     delete from trackedentityinstance where organisationunitid = 163951;
	 
end;