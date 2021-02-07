
begin;

delete from trackedentityattributevalue where trackedentityinstanceid in (  select trackedentityinstanceid from programinstance
where enrollmentdate::date between '2014-01-01' AND '2018-07-31');

delete from trackedentityattributevalueaudit where trackedentityinstanceid in (  select trackedentityinstanceid from programinstance
where enrollmentdate::date between '2014-01-01' AND '2018-07-31');

delete from trackedentitydatavalue where programstageinstanceid in ( select programstageinstanceid from programstageinstance 
where programinstanceid in ( select programinstanceid from programinstance  where enrollmentdate::date between '2014-01-01' AND '2018-07-31' ) );


delete from trackedentitydatavalueaudit where programstageinstanceid in ( select programstageinstanceid from programstageinstance 
where programinstanceid in ( select programinstanceid from programinstance  where enrollmentdate::date between '2014-01-01' AND '2018-07-31' ) );


delete from programstageinstancecomments where programstageinstanceid in ( select programstageinstanceid from programstageinstance 
where programinstanceid in ( select programinstanceid from programinstance  where enrollmentdate::date between '2014-01-01' AND '2018-07-31' ) );


delete from programstageinstance where programinstanceid in ( select programinstanceid from programinstance  
where enrollmentdate::date between '2014-01-01' AND '2018-07-31' );

delete  from programinstancecomments where programinstanceid in ( select programinstanceid from programinstance
where enrollmentdate::date between '2014-01-01' AND '2018-07-31' );

delete from programinstance where enrollmentdate::date between '2014-01-01' AND '2018-07-31';

delete from trackedentityinstance where trackedentityinstanceid in (  select trackedentityinstanceid from programinstance
where enrollmentdate::date between '2014-01-01' AND '2018-07-31' );

end;