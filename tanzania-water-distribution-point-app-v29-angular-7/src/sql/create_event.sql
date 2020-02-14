DROP FUNCTION createEvent(VARCHAR,VARCHAR,VARCHAR,VARCHAR,VARCHAR);
CREATE OR REPLACE FUNCTION createEvent(org_unit_uid VARCHAR,event_date VARCHAR,user_uid VARCHAR,event_latitude VARCHAR,event_longitude VARCHAR) RETURNS VARCHAR AS $$
DECLARE
	_c text;
	user_id integer;
	results VARCHAR;
	event_uid character varying(11) := uid();
	org_unit_id integer;
	username VARCHAR;
	dataSetUID VARCHAR := 'MTAVidYwh6V';
BEGIN
	BEGIN
	  raise notice '% %', event_latitude, event_longitude;
	  IF event_latitude = 'undefined' THEN
      event_latitude = '0';
    END IF;
    IF event_longitude = 'undefined' THEN
      event_longitude = '0';
    END IF;
    SELECT users.userid,users.username INTO user_id,username  FROM users WHERE userid = (SELECT userinfoid FROM userinfo WHERE uid = user_uid);
    SELECT organisationunitid INTO org_unit_id FROM organisationunit WHERE uid = org_unit_uid;
    --TODO check user username instead of id
	  INSERT INTO programstageinstance (programstageinstanceid,uid,created,lastupdated,programinstanceid,programstageid,attributeoptioncomboid,storedby,duedate,executiondate,organisationunitid,status,latitude,longitude,completedby,completeddate,deleted)
	  VALUES((SELECT MAX(programstageinstanceid) + 1 FROM programstageinstance),event_uid,now(),now(),23719,23718,15,username,(select to_timestamp(event_date, 'YYYY-MM-DD')::timestamp without time zone),(select to_timestamp(event_date, 'YYYY-MM-DD')::timestamp without time zone),org_unit_id,'COMPLETED',(select cast(regexp_replace(event_latitude,'dot','.') as double precision)),(select cast(regexp_replace(event_longitude,'dot','.') as double precision)),username,(select to_timestamp(event_date, 'YYYY-MM-DD')::timestamp without time zone),FALSE);

		results := event_uid;


	EXCEPTION WHEN OTHERS THEN
		GET STACKED DIAGNOSTICS _c = PG_EXCEPTION_CONTEXT;
		RAISE NOTICE 'context: >>%<<', _c;
		raise notice '% %', SQLERRM, SQLSTATE;
		results := 'Error';
	END;

	RETURN results;

END;
$$
LANGUAGE plpgsql;
/*
 call delete function by pass orgunit id  text, text, text,MMhip91li8h text,iLKwCl3Od9c text,rqlTarZRu8L text,koixPT9d3Sr text,FzlzchJ2J7S
*/
-- SELECT createEvent('hFj6vyIHfs0','2018-03-01','BZB2SLt3ylj','undefined','undefined');

--PGPASSWORD=dhis psql -U dhis -h localhost -d water_test -a -f create_event.sql
--PGPASSWORD=postgres psql -U postgres -h localhost -d water -a -f src/sql/create_event.sql

