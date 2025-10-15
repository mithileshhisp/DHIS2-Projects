begin;

	delete from datasetsource where sourceid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from datavalue where sourceid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from datavalueaudit where organisationunitid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from orgunitgroupmembers where organisationunitid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from userdatavieworgunits where organisationunitid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from usermembership where organisationunitid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from visualization_organisationunits where organisationunitid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));
	
	delete from lockexception where organisationunitid in (
	select organisationunitid from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ'));

	delete from organisationunit where uid in ('HOkLAdpOh2I','cbZU7xVW2rJ');

end;
