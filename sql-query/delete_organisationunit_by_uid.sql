begin;

	delete from datasetsource where sourceid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from datavalue where sourceid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from datavalueaudit where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from orgunitgroupmembers where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from program_organisationunits where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz'));

	delete from trackedentitydatavalueaudit where programstageinstanceid
	in ( select programstageinstanceid from programstageinstance where programinstanceid in(
	select programinstanceid from programinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') )) );

	delete from programstageinstance where programinstanceid in(
	select programinstanceid from programinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') ));

	delete from programinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz'));

	delete from trackedentityattributevalue where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz')));

	delete from trackedentityprogramowner where trackedentityinstanceid in(
	select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') ));

	delete from trackedentityinstance where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from userdatavieworgunits where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from usermembership where organisationunitid in (
	select organisationunitid from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz') );

	delete from organisationunit where 
	uid in ( 'MiXV9sD6wTr', 'XjD7SU0T8Wm','kIMluutMHcO', 'zEaozIIKGtz');

end;