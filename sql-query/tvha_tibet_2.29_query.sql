

select * from 	userkeyjsonvalue where uid = 'w4UBiJZHcGx';
select * from 	userkeyjsonvalue where userid = 914627; -- hispdev

select * from program where uid = 'w4UBiJZHcGx'
	
select * from userinfo where userinfoid in ( 12469071, 914627 )	;

select * from usersetting where name = 'keyTrackerDashboardLayout';
delete from usersetting where name = 'keyTrackerDashboardLayout';

select * from keyjsonvalue;
delete from keyjsonvalue;

select * from systemsetting where name  = 'keyTrackerDashboardDefaultLayout';	
delete from systemsetting where name  = 'keyTrackerDashboardDefaultLayout';	