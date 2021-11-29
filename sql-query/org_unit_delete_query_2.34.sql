begin;

-- 1) 

delete from datavalueaudit where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

--2)

delete from program_organisationunits where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

--3)

delete from trackedentitydatavalueaudit where programstageinstanceid in(
select programstageinstanceid from programstageinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));

-- 4)

delete from programstageinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

--5)

delete from programinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

--6)

delete from trackedentityattributevalue where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));

--7)

delete from trackedentityattributevalueaudit where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));

--8)

delete from trackedentityprogramowner where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s'));

--9)

delete from trackedentityinstance where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

--10)

delete from userdatavieworgunits where organisationunitid in (
select organisationunitid from organisationunit where uid = 'mJhY0bFkp3s');

-- 11)

delete from organisationunit where uid = 'mJhY0bFkp3s';

end;