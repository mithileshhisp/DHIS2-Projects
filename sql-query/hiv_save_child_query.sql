
-- count as on 16/12/2021 on production
select count(*) from trackedentityinstance; -- 36664 21/12/2021 -- 36712
select count(*) from programinstance; -- 35850 21/12/2021 -- 35877
select count(*) from programstageinstance; -- 353877 21/12/2021 -- 354810
select count(*) from trackedentityattributevalue; -- 651333 21/12/2021 -- 652468
select count(*) from trackedentityattributevalueaudit; -- 282388 21/12/2021 -- 282527
select count(*) from trackedentitydatavalueaudit; -- 16334864 21/12/2021 -- 16422085
select count(*) from datavalue; -- 1883 21/12/2021 -- 1898
select count(*) from audit; -- 9732866 21/12/2021 -- 8

SELECT
    relname AS "tables",
    pg_size_pretty (
        pg_total_relation_size (X .oid)
    ) AS "size"
FROM
    pg_class X
LEFT JOIN pg_namespace Y ON (Y.oid = X .relnamespace)
WHERE
    nspname NOT IN (
        'pg_catalog',
        'information_schema'
    )
AND X .relkind <> 'i'
AND nspname !~ '^pg_toast'
ORDER BY
    pg_total_relation_size (X .oid) desc
LIMIT 10;


-- update Query to shift the profile and events on different organization unit
source -- 'LOSotbIZxiU' -- 4629953

select * from organisationunit where uid = 'LOSotbIZxiU';

-- destination  - 'nPv9ZSw7DU3'
-- source -- 'LOSotbIZxiU' -- 4629953
select * from organisationunit where uid = 'LOSotbIZxiU';
select count(*) from trackedentityinstance where organisationunitid = 4629953;
select count(*) from programinstance where organisationunitid = 4629953;
select count(*) from programstageinstance where organisationunitid = 4629953;
select count(*) from trackedentityprogramowner where organisationunitid = 4629953;

-- destination  - 'nPv9ZSw7DU3' -- 44844
select * from organisationunit where uid = 'nPv9ZSw7DU3';
select count(*) from trackedentityinstance where organisationunitid = 44844;
select count(*) from programinstance where organisationunitid = 44844;
select count(*) from programstageinstance where organisationunitid = 44844;
select count(*) from trackedentityprogramowner where organisationunitid = 44844;


update trackedentityinstance set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 77
update programinstance set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 77
update programstageinstance set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 389
update trackedentityprogramowner set organisationunitid = 44844 WHERE organisationunitid = 4629953; -- 77


-- remove coordinate from organisationunit

select * from organisationunit where uid = 'hasbXH0dTqM';

select geometry,featuretype from organisationunit where uid = 'hasbXH0dTqM';

select * from organisationunit where 
uid in( 'hasbXH0dTqM','LnJ8MTOmgGa','uHEl9oRZm8L','Wep3D4POB3H','eW2b8SUYRWt',
'eW2b8SUYRWt','grMJpaDdSrD');

update organisationunit set geometry = null, featuretype = null where 
uid in( 'hasbXH0dTqM','LnJ8MTOmgGa','uHEl9oRZm8L','Wep3D4POB3H','eW2b8SUYRWt',
'eW2b8SUYRWt','grMJpaDdSrD');


select count(*) from programstageinstance where geometry is  null; -- 56694
select count(*) from programstageinstance where geometry is not null;  -- 340075
select count(*) from programstageinstance where longitude is  null;  -- 396769
select count(*) from programstageinstance where latitude is  null;  -- 396769

update programstageinstance set geometry = null, longitude = null, latitude = null;