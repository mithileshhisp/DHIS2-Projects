begin;

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where  programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602) ));

delete FROM programstageinstance where  programinstanceid in (
select programinstanceid from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602) );

delete from programinstance where trackedentityinstanceid in (
select trackedentityinstanceid from trackedentityattributevalue where 
value in('SH9120303954','BH9220303955','PU9320181849',
'KA9520182154','KH9420277655','TH9320263241')
and trackedentityattributeid = 2602);

end;