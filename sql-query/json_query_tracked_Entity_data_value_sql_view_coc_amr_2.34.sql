
-- sql view for trcaker-aggregation app

select de.code as deCode, de.name as deName,de.uid as deUID,cc.uid as categoryComboUID, cc.name as categoryComboName,
coc.categoryoptioncomboid as categoryOptionComboid, coc.uid as categoryOptionComboUID, 
cocname.categoryoptioncomboname as categoryOptionComboName from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
group by de.code, de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid,coc.uid,cocname.categoryoptioncomboname
order by de.name;


-- Tracker Aggregation 1

select de.code as deCode, de.name as deName,de.uid as deUID,cc.uid as categoryComboUID, cc.name as categoryComboName,
coc.categoryoptioncomboid as categoryOptionComboid, coc.uid as categoryOptionComboUID, 
cocname.categoryoptioncomboname as categoryOptionComboName from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
where de.domaintype = 'TRACKER'
group by de.code, de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid,coc.uid,cocname.categoryoptioncomboname
order by de.name;

-- Tracker Aggregation 2

select de.code as deCode, de.name as deName,de.uid as deUID,cc.uid as categoryComboUID, cc.name as categoryComboName,
coc.categoryoptioncomboid as categoryOptionComboid, coc.uid as categoryOptionComboUID, 
cocname.categoryoptioncomboname as categoryOptionComboName from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
where de.domaintype = 'AGGREGATE' and cc.name in( 'default', 'Sample', 'Sample group', 'Sample & Location', 'NFGNB' )
group by de.code, de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid,coc.uid,cocname.categoryoptioncomboname
order by de.name;

-- Tracker Aggregation 3

select de.code as deCode, de.name as deName,de.uid as deUID,cc.uid as categoryComboUID, cc.name as categoryComboName,
coc.categoryoptioncomboid as categoryOptionComboid, coc.uid as categoryOptionComboUID, 
cocname.categoryoptioncomboname as categoryOptionComboName from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
where de.domaintype = 'AGGREGATE' and cc.name in( 'Salmonella (non-faecal)', 'Enterobacteriaceae', 'Enterococci', 'Streptococcus', 'Staphylococci'  )
group by de.code, de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid,coc.uid,cocname.categoryoptioncomboname
order by de.name;

-- Tracker Aggregation 4

select de.code as deCode, de.name as deName,de.uid as deUID,cc.uid as categoryComboUID, cc.name as categoryComboName,
coc.categoryoptioncomboid as categoryOptionComboid, coc.uid as categoryOptionComboUID, 
cocname.categoryoptioncomboname as categoryOptionComboName from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
where de.domaintype = 'AGGREGATE' and cc.name in( 'Faecal isolates', 'Fungal isolates' )
group by de.code, de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid,coc.uid,cocname.categoryoptioncomboname
order by de.name;


default
Sample group
Sample & Location
Enterobacteriaceae
Enterococci
Faecal isolates
Fungal isolates
NFGNB
Salmonella (non-faecal)
Sample
Staphylococci
Streptococcus



// for AMR Ids

// with null

SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%mKmB0wcw7Gf%' and eventdatavalues is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';


// not null
SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%mKmB0wcw7Gf%' and eventdatavalues -> 'lIkk661BLpG' is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';


// sql-views update on instance
SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%${orgunit}%' and eventdatavalues -> 'lIkk661BLpG' is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';






// sample json query for help








select * from json_each_text('{"a":"foo", "b":"bar"}')

SELECT programstageinstanceid,uid,
   eventdatavalues -> 'zTwMKXGt0xF' ->> 'value' as value
FROM
   programstageinstance where uid in ( 'AiSdX1jtq0x','ykEs09tttt7','vpcxSuFm4CS','d8f0Fjbjk2j',
'QuV5wz4fzbK','YfwXSS3Q6F1','YHPOHL4Z7Q7')


SELECT programstageinstanceid,
   eventdatavalues -> 'FU4eoBAjxVJ' ->> 'value' as value,
   eventdatavalues -> 'T7L6dtXlGRh' ->> 'value' as value,
   eventdatavalues -> 'QPCKDxWIlds' ->> 'value' as value
FROM
   programstageinstance

SELECT programstageinstanceid,
   eventdatavalues ->> 'FU4eoBAjxVJ' AS deUid
FROM
   programstageinstance;

SELECT programstageinstanceid, uid,
 eventdatavalues #>> '{FU4eoBAjxVJ, value}',
 eventdatavalues #>> '{T7L6dtXlGRh, value}',
 eventdatavalues #>> '{T7L6dtXlGRh, value}'
 
 FROM
   programstageinstance;


SELECT programstageinstanceid, uid,
 eventdatavalues #>> '{gC5vAvkiDQC, value}'
 
 FROM
   programstageinstance;   


SELECT programstageinstanceid, uid,
 eventdatavalues #>> '{S1sDvEir5Ur, value}'
 
 FROM
   programstageinstance;




///




Create a table with a JSONB column in PostgreSQL

Before we begin our discussion of the functions and operators available for the PostgreSQL JSONB data type, let’s create a table that we can use in our examples:

	
CREATE TABLE cars(
    id SERIAL PRIMARY KEY,
    cars_info JSONB NOT NULL);
Inserting JSON data in the table

To insert data into our PostgreSQL table, we’ll use the following SQL statement:

	
INSERT INTO cars(cars_info)
VALUES('{"brand": "Toyota", "color": ["red", "black"], "price": 285000, "sold": true}'),
      ('{"brand": "Honda", "color": ["blue", "pink"], "price": 25000, "sold": false}'),
      ('{"brand": "Mitsubishi", "color": ["black", "gray"], "price": 604520, "sold": true}');

If we use a SELECT statement to view the contents of this table, the result will look like this:
	
 id |                                     cars_info                                      
----+------------------------------------------------------------------------------------
  1 | {"sold": true, "brand": "Toyota", "color": ["red", "black"], "price": 285000}
  2 | {"sold": false, "brand": "Honda", "color": ["blue", "pink"], "price": 25000}
  3 | {"sold": true, "brand": "Mitsubishi", "color": ["black", "gray"], "price": 604520}
Using the JSONB native operators

Using the -> operator in a query returns a JSONB value:
1
	
SELECT cars_info -> 'brand' AS car_name FROM cars;

The result will look like the following:

	
   car_name  
--------------
 "Toyota"
 "Honda"
 "Mitsubishi"

NOTE: Keep in mind that there’s also a ->> operator that can be used with JSON data. The -> operator will return a JSON object while the ->> operator returns the JSONB in the form of text.
PostgreSQL JSONB query

We can use the WHERE clause in a query to filter JSONB values. Here’s an example:
1
	
SELECT * FROM cars WHERE cars_info -> 'sold' = 'true';

The results are filtered based on the value of a specific JSON key:

	
 id |                                     cars_info                                      
----+------------------------------------------------------------------------------------
  1 | {"sold": true, "brand": "Toyota", "color": ["red", "black"], "price": 285000}
  3 | {"sold": true, "brand": "Mitsubishi", "color": ["black", "gray"], "price": 604520}
PostgreSQL JSONB functions

There are a number of built-in functions that can be used with JSONB data. Let’s look at an example of a query that makes use of the jsonb_each function:
1
	
SELECT jsonb_each('{"brand": "Toyota", "sold": "true"}'::jsonb);

The output takes the highest-level JSON document and expands it into a set of key-value pairs:

      jsonb_each      
----------------------
 (sold,"""true""")
 (brand,"""Toyota""")

Next, let’s look at an example using the jsonb_object_keys function:
1
	
SELECT jsonb_object_keys( '{"brand": "Mitsubishi", "sold": true}'::jsonb );

This function retrieves just the keys of the JSON document:

	
 jsonb_object_keys
-------------------
 sold
 brand

The following example uses the jsonb_extract_path function:
1
	
SELECT jsonb_extract_path('{"brand": "Honda", "sold": false}'::jsonb, 'brand');

The output contains the JSON object extracted by path:

	
 jsonb_extract_path
--------------------
 "Honda"

Our final example demonstrates the jsonb_pretty function:
1
	
SELECT jsonb_pretty('{"brand": "Honda", "sold": false}'::jsonb);

We can see that the output retrieves a simplified description that works for computer use. This easy-to-read format is a good choice if you want your JSON documents to be printed for human consumption.
	
     jsonb_pretty    
----------------------
 {                   +
     "sold": false,  +
     "brand": "Honda"+
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 create or replace function sampleWiseOrganism() returns setof record as '

select de_aggid as deid,
	organism.sourceid,
	organism.startdate,
	organism.enddate,
	p.periodid,
	categoryoptioncomboid,
	count(organism.value) as value
	from (
	select psi.programstageinstanceid,
		to_char(executiondate, $$yyyy-mm-01$$)::date as startdate,
		(date_trunc($$month$$,executiondate)+interval $$1 month$$ - interval $$1 day$$)::date as enddate,
		psi.organisationunitid as sourceid,
		de.dataelementid as de_organismid,
		tedv.value,
		deAgg.dataelementid as de_aggid,
		deAgg.categorycomboid as de_aggccid,
		max(deAgg.name) as de_aggname
	from programstageinstance psi
	inner join trackedentitydatavalue tedv on tedv.programstageinstanceid = psi.programstageinstanceid
	inner join dataelement de on tedv.dataelementid = de.dataelementid
	inner join attributevalue av on tedv.value = av.value
	inner join dataelementattributevalues deav on deav.attributevalueid= av.attributevalueid
	inner join dataelement deAgg on deAgg.dataelementid = deav.dataelementid	
	where de.code = $$organism$$ and tedv.value != $$$$ and right(deAgg.code,3) !=$$_AW$$
	group by psi.programstageinstanceid,de.dataelementid,
		de.code,psi.organisationunitid,tedv.value,deAgg.dataelementid,executiondate
)organism
inner join
(
	select sample.programstageinstanceid,		
	array[sample_coid,loc_coid] as sample_location_coids,
	sample_coid,
	loc_coid
	from
	(
	select psi.programstageinstanceid,
		psi.organisationunitid as sourceid,
		de.dataelementid as de_sampleid,
		tedv.value as samplevalue,
		deco.categoryoptionid as sample_coid,
		deco.uid as sample_couid,
		max(deco.name) as sample_coname
		from programstageinstance psi
	inner join trackedentitydatavalue tedv on tedv.programstageinstanceid = psi.programstageinstanceid
	inner join dataelement de on tedv.dataelementid = de.dataelementid
	inner join dataelementcategoryoption deco on deco.code = tedv.value
	where de.uid = $$mp5MeJ2dFQz$$ and tedv.value != $$$$
	group by psi.programstageinstanceid,de.dataelementid,de.code,psi.organisationunitid,tedv.value,deco.categoryoptionid
	)sample
	inner join
	(
	select psi.programstageinstanceid,
		psi.organisationunitid as sourceid,
		de.dataelementid as de_locid,
		tedv.value as locvalue,
		deco.categoryoptionid as loc_coid,
		deco.uid as loc_couid,
		max(deco.name) as sample_coname
		from programstageinstance psi
	inner join trackedentitydatavalue tedv on tedv.programstageinstanceid = psi.programstageinstanceid
	inner join dataelement de on tedv.dataelementid = de.dataelementid
	inner join dataelementcategoryoption deco on deco.code = tedv.value
	where de.code = $$WARD_TYPE$$ and tedv.value != $$$$
	group by psi.programstageinstanceid,de.dataelementid,de.code,psi.organisationunitid,tedv.value,deco.categoryoptionid
	)loc
	on loc.programstageinstanceid = sample.programstageinstanceid
)sample_location
on organism.programstageinstanceid = sample_location.programstageinstanceid
inner join
(
select coc_co.categoryoptioncomboid,array_agg(coc_co.categoryoptionid) as cocelems,cc.categorycomboid,max(cc.name) as ccname
from categoryoptioncombos_categoryoptions coc_co
inner join categorycombos_optioncombos cc_coc on cc_coc.categoryoptioncomboid = coc_co.categoryoptioncomboid
inner join categorycombo cc on cc.categorycomboid = cc_coc.categorycomboid
group by coc_co.categoryoptioncomboid,cc.categorycomboid
)cocs
on 	sample_location.sample_coid = any (cocs.cocelems) and 
	sample_location.loc_coid = any (cocs.cocelems) and 
	organism.de_aggccid = cocs.categorycomboid
left join period p on p.startdate = organism.startdate and p.enddate = organism.enddate
group by de_aggid,organism.sourceid,organism.startdate,organism.enddate,categoryoptioncomboid,p.periodid
order by deid


' Language sql;
CREATE or replace FUNCTION cs() RETURNS void AS $$
declare
dv record;
monthlyperiodtypeid integer;

BEGIN
    RAISE NOTICE 'Starting analytics generation...';
	DROP TABLE IF EXISTS inshallah;

	execute format('create temporary table inshallah as (select deid dataelementid,periodid,sourceid,
			coc categoryoptioncomboid,20 attributeoptioncomboid,value,''amr_analytics''::character varying storedby,now() created,now() lastupdated,
			NULL::character varying as comment,false followup,false deleted,startdate,enddate
			from sampleWiseOrganism()
			as so(deid integer,sourceid integer,startdate date,enddate date,periodid integer,coc integer,value bigint))');

	
	for dv in select distinct startdate,enddate from inshallah where periodid is NULL order by startdate
	loop		
		raise notice '%s',dv;
		INSERT INTO period(
		periodid, periodtypeid, startdate, enddate)
		VALUES (nextval('hibernate_sequence'), (select periodtypeid from periodtype where name='Monthly'), dv.startdate, dv.enddate);
	end loop;

	insert into datavalue select dataelementid,p.periodid,sourceid,
			categoryoptioncomboid,attributeoptioncomboid,value,storedby,created,lastupdated,
			comment,followup,deleted 
			from inshallah ins
			inner join period p on p.startdate=ins.startdate and p.enddate=ins.enddate
			where p.periodtypeid=(select periodtypeid from periodtype where name='Monthly')
	ON CONFLICT ON CONSTRAINT datavalue_pkey
	DO update set value=excluded.value,
			lastupdated=now(),
			storedby='amr_analytics';
	  
END;
$$ LANGUAGE plpgsql;

select cs();

