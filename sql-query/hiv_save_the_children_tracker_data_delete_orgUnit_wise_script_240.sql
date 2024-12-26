begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'CrO47WdGZp0') );
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'CrO47WdGZp0') );

-- 3) relationship
	delete from relationship;
	
-- 4) trackedentitydatavalue

	-- delete from trackedentitydatavalue where programstageinstanceid in ( select programstageinstanceid from programstageinstance where programinstanceid in ( select programinstanceid from programinstance where trackedentityinstanceid in ( select trackedentityinstanceid from trackedentityinstance where organisationunitid = 121547 ) ) );

-- 5) trackedentitydatavalueaudit 

	delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programinstanceid in 
	( select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'CrO47WdGZp0') ) ) );

-- 6) programstageinstancecomments

	delete from programstageinstancecomments where programstageinstanceid in 
	(select programstageinstanceid from programstageinstance where programinstanceid in 
	( select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'CrO47WdGZp0') ) ));

-- 7) programstageinstance 
	delete from programstageinstance where programinstanceid in 
	( select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where uid = 'CrO47WdGZp0') ) );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in (
	select programinstanceid from programinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from trackedentityinstance where organisationunitid in 
	( select organisationunitid from organisationunit where uid = 'CrO47WdGZp0' ) ) );


-- 9) programinstance 
      delete from programinstance where trackedentityinstanceid in 
	  ( select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	  select organisationunitid from organisationunit where uid = 'CrO47WdGZp0') );

-- 10) trackedentityprogramowner 
	 delete from trackedentityprogramowner where trackedentityinstanceid in (
	 select trackedentityinstanceid from trackedentityinstance where organisationunitid in( 
	 select organisationunitid from organisationunit where uid = 'CrO47WdGZp0' ));

-- 11) relationshipitem 
     update relationshipitem set trackedentityinstanceid = null where trackedentityinstanceid in (
     select trackedentityinstanceid from trackedentityinstance where organisationunitid in
	 ( select organisationunitid from organisationunit where uid = 'CrO47WdGZp0' ));
	 
-- 12) trackedentityinstance 
     delete from trackedentityinstance where organisationunitid in (
	 select organisationunitid from organisationunit where uid = 'CrO47WdGZp0');
	 
end;