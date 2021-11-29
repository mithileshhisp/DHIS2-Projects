begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));

-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));
	
-- 3) relationship
	--delete from relationship;
	
-- 4) trackedentitydatavalue

	
-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit where programstageinstanceid in(
	select programstageinstanceid from programstageinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));
	
-- 6) programstageinstancecomments

	delete from programstageinstancecomments;

-- 7) programstageinstance 
	
	delete from programstageinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');
	
-- 8) programstageinstance 
	delete from programinstancecomments;

-- 9) programinstance 
      
	  delete from programinstance where organisationunitid in (
	  select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

-- 10) trackedentityinstance 

     delete from trackedentityinstance where organisationunitid in (
	 select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');
	 
end;