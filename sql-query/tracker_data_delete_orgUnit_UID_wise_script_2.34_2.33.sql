begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid 
	in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH') ));

-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid
	in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH')));
	
-- 3) relationship
	--delete from relationship;
	
-- 4) trackedentitydatavalue

	
-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit where programstageinstanceid in(
	select programstageinstanceid from programstageinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH')));
	
-- 6) programstageinstancecomments

	--delete from programstageinstancecomments;

-- 7) programstageinstance 
	
	delete from programstageinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH'));
	
-- 8) programstageinstance 
	--delete from programinstancecomments;

-- 8) programinstanceaudit 
	
	  delete from programinstanceaudit where programinstanceid in ( select programinstanceid
	  from programinstance where organisationunitid in (
	  select organisationunitid from organisationunit where
	  uid in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH')));

	  
-- 9) programinstancecomments 
	
	  delete from programinstancecomments where programinstanceid in ( select programinstanceid
	  from programinstance where organisationunitid in (
	  select organisationunitid from organisationunit where
	  uid in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH')));	  
	  
-- 10) programinstance 
      
	  delete from programinstance where organisationunitid in (
	  select organisationunitid from organisationunit where
	  uid in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH'));

-- 12) trackedentityprogramowner 
	  
	  delete from trackedentityprogramowner where trackedentityinstanceid in ( select 
	  trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	  select organisationunitid from organisationunit where uid 
	  in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH')));
	  
-- 11) relationshipitem 
	  
	  update  relationshipitem set trackedentityinstanceid = null where trackedentityinstanceid in (
	  select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	  select organisationunitid from organisationunit where uid 
	  in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH')));
	  
-- 12) trackedentityinstance 

     delete from trackedentityinstance where organisationunitid in (
	 select organisationunitid from organisationunit where uid 
	 in( 'm7qfb6zAhMT','uTPSHIEpTLQ','Jdl7CmnmwsR','qX0HVuyWLnp','kq5SVPO6kHw','AjNNX1d56tj','O9XCmS5qRzH'));
	 
end;

