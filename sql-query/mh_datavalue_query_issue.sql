
-- 06/03/2023  delete datavalue from last to 2016

-- https://links.hispindia.org/mh/dhis-web-commons/security/login.action
-- tracker data

select * from programinstance; -- 3
select * from programstageinstance; -- 7
select * from trackedentityattributevalue; -- 0
select * from trackedentitydatavalue; -- 13
select * from trackedentityinstance; -- 0


select count(*)	from datavalue; -- 917959966

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '1707-12-31' and 
enddate <= '2016-12-31'); -- 529309476;

select count(*) from datavalue where periodid in(
select periodid from period where 
enddate <= '2016-12-31') -- 529309476;

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2023-12-31'); -- 388649624

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2017-01-01'); -- 388649624

select * from period where startdate >= '2017-01-01' and 
enddate <= '2017-12-31' order by startdate;

-- total -- 529309476 + 388649624 = 917,959,100


-- 2017 period count -- 22
select * from period where startdate >= '2017-01-01' and 
enddate <= '2017-12-31' order by startdate; -- period count -- 22

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2017-12-31'); -- 67239932

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2017-12-31'); -- 17630941

select count(*) from completedatasetregistration where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2017-12-31'; -- 120420;
	
select count(*) from lockexception where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2017-12-31') -- 64722;


-- 2018 
select * from period where startdate >= '2018-01-01' and 
enddate <= '2018-12-31' order by startdate; -- period count -- 33

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2018-01-01' and 
enddate <= '2018-12-31'); -- 75565500

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2018-01-01' and 
enddate <= '2018-12-31'); -- 23593432

select count(*) from completedatasetregistration where periodid in
(select periodid from period where startdate >= '2018-01-01' and 
enddate <= '2018-12-31'); -- 303345;
	
select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2018-01-01' and 
enddate <= '2018-12-31'); -- 118329;

-- 2019 period count -- 80

select * from period where startdate >= '2019-01-01' and 
enddate <= '2019-12-31' order by startdate; -- period count -- 80

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2019-01-01' and 
enddate <= '2019-12-31'); -- 70741962

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2019-01-01' and 
enddate <= '2019-12-31'); -- 11922822

select count(*) from completedatasetregistration where periodid in
(select periodid from period where startdate >= '2019-01-01' and 
enddate <= '2019-12-31'); -- 264206;
	
select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2019-01-01' and 
enddate <= '2019-12-31'); -- 201900;


-- 2020 period count -- 80

select * from period where startdate >= '2020-01-01' and 
enddate <= '2020-12-31' order by startdate; -- period count -- 80

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2020-01-01' and 
enddate <= '2020-12-31'); -- 52622006

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2020-01-01' and 
enddate <= '2020-12-31') -- 2043569;

select count(*) from completedatasetregistration where periodid in
(select periodid from period where startdate >= '2020-01-01' and 
enddate <= '2020-12-31'); -- 231629;
	
select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2020-01-01' and 
enddate <= '2020-12-31'); -- 152816;


-- 2021 period count -- 80

select * from period where startdate >= '2021-01-01' and 
enddate <= '2021-12-31' order by startdate; -- period count -- 80

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2021-01-01' and 
enddate <= '2021-12-31'); -- 48515414

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2021-01-01' and 
enddate <= '2021-12-31') -- 1472168;

select count(*) from completedatasetregistration where periodid in
(select periodid from period where startdate >= '2021-01-01' and 
enddate <= '2021-12-31'); -- 195129;
	
select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2021-01-01' and 
enddate <= '2021-12-31'); -- 351496;

-- 2022 period count -- 84

select * from period where startdate >= '2022-01-01' and 
enddate <= '2022-12-31' order by startdate; -- period count -- 84

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2022-01-01' and 
enddate <= '2022-12-31'); -- 64079771

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2022-01-01' and 
enddate <= '2022-12-31'); -- 2227569;

select count(*) from completedatasetregistration where periodid in
(select periodid from period where startdate >= '2022-01-01' and 
enddate <= '2022-12-31'); -- 231878;
	
select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2022-01-01' and 
enddate <= '2022-12-31'); -- 378337;


-- 2023 period count -- 28
select * from period where startdate >= '2023-01-01' and 
enddate <= '2023-12-31' order by startdate; -- period count -- 28

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2023-01-01' and 
enddate <= '2023-12-31'); -- 9712632

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2023-01-01' and 
enddate <= '2023-12-31'); -- 275886;

select count(*) from completedatasetregistration where periodid in
(select periodid from period where startdate >= '2023-01-01' and 
enddate <= '2023-12-31'); -- 34927;
	
select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2023-01-01' and 
enddate <= '2023-12-31'); -- 8022;

select count(*) from lockexception where periodid in
(select periodid from period where startdate >= '2023-01-01' and 
enddate <= '2023-12-31');

select * from period order by startdate;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2010-01-01' and 
enddate <= '2010-12-31'); 13438

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2009-01-01' and 
enddate <= '2009-12-31')-- 7827;


select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2008-01-01' and 
enddate <= '2008-12-31')-- 9466;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2007-01-01' and 
enddate <= '2007-12-31')-- 3567;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2006-01-01' and 
enddate <= '2006-12-31')-- 3534;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2005-01-01' and 
enddate <= '2005-12-31')-- 4744;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '2004-01-01' and 
enddate <= '2004-12-31')-- 19505;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '1999-01-01' and 
enddate <= '1999-12-31')-- 0;

select count(*) from datavalue where 
periodid in(select periodid from period where startdate >= '1998-01-01' and 
enddate <= '1998-12-31')-- 0;


---- for weekly and financialyApril period
select * from period where periodid in (
65262903,46793325,80564579,38145986,32530595,
42725651,80623595,89872952,38114639,90497697);

select * from periodtype;

select count(*) from datavalue where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2023-12-31'); -- 20485

select count(*) from datavalueaudit where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2023-12-31'); -- 5243

select count(*) from completedatasetregistration where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2023-12-31'); -- 5049 

select count(*) from lockexception where periodid in(
select periodid from period where startdate >= '2017-01-01' and 
enddate <= '2023-12-31'); -- 1393; 







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
	
	

--15/02/2023

SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)
,split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod,pet.name AS periodType, pe.periodtypeid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and de.uid = 'cRyTk6K7BEi' and coc.uid = 'DLr4VIEGNIo';

-- 16/02/2023
SELECT de.uid AS dataElementUID,de.name AS dataElementName, dv.dataelementid,coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName,dv.categoryoptioncomboid, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, dv.attributeoptioncomboid, org.uid AS organisationunitUID, org.name AS organisationunitName,
dv.sourceid,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)
,split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod,pet.name AS periodType, pe.periodtypeid,dv.periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and de.uid = 'cRyTk6K7BEi' and coc.uid = 'DLr4VIEGNIo';


="update datavalue set dataelementid = "&B2&", categoryoptioncomboid = "&D2&", attributeoptioncomboid = "&E2&"  where dataelementid = "&A2&" and periodid = "&K2&" and categoryoptioncomboid = "&C2&" and attributeoptioncomboid = "&E2&" and sourceid = "&G2&";"





-- 23/01/2023
SELECT org.uid AS orgUnitUid, org.name AS orgUnitName, de.uid AS deUID, de.name AS deName, 
SUM( cast( value as numeric) ) FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN organisationunit org On org.organisationunitid = dv.sourceid
WHERE dv.dataelementid IN ( select dataelementid from dataelement where uid in (
'QJXDS374FL7', 'O0LVG8R8UPi', 'WqLhMox6u5s', 'uDEe2DLpNf4', 'pfBSJgGzmUT', 'lSmRsc4EX4u', 
'KVdjXOnhbGq', 'ejB5Wtu3kVJ', 'E3QKzVDQE5B', 'CofKyFHumWx', 'ZouGfFRrpse', 'YsGEPZpQe6I', 
'FHU3UYSbHKJ', 'E3xhEA1oeJd', 'cYOeeJikhrK', 'iDZL9StfKBp', 'FXGyhXPbGf4', 'eQLgQnRthFy', 
'kgUqFmv4gEM', 'yz99h1xdt4V', 'GmsqnhxaZJa', 'IkOkQJMOrdj', 'AtkwRd4KZy8', 'yaos4Jzbp7Q', 
'cKtRhs9xC1H', 'sT5qVbr2iCf', 'l3w3WwUpXca', 'ZLoDeEmpypb', 'MHAmn8Lrbud', 'ikw26VrSnHH', 
'hITgdvklyDS', 'F75Ofi034Vc', 'yRxgzTOaHpQ', 'sA0OnoEtmIN', 'IsaEep9Rro7', 'S8v99VpXaVm', 
'SYMC85nGD4q', 'ZbhYKew0RAn', 'x9bxR6p7fvQ', 'lJC6GiZYFLI')) 
AND dv.sourceid IN (select organisationunitid from organisationunit 
where path like '%b3vBdsycgAD%') AND dv.periodid IN 
(select periodid from period where startdate >= '2022-01-01' and enddate <= '2022-12-31'
and periodtypeid = 3) GROUP BY org.uid,org.name,de.uid,de.name order by org.name;





-- 14/12/2022 -- delete datavalue for OU Group ID : KZrndomu4ju Dataset ID : FBxQzVU8IuI Period from : April 2022
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)
,split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod,pet.name AS periodType, pe.periodtypeid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and de.dataelementid in(select dataelementid from datasetelement
where datasetid = 35923) and dv.periodid in ( select periodid from period 
where periodtypeid = 3 and startdate >= '2022-04-01' and enddate <= '2022-12-31') and dv.sourceid in (
select organisationunitid from orgunitgroupmembers where orgunitgroupid in (
select orgunitgroupid from orgunitgroup where uid = 'KZrndomu4ju' ));


select * from dataset where uid = 'FBxQzVU8IuI' 
35923

select * from datasetelement where datasetid = 35923;

select * from orgunitgroup where uid = 'KZrndomu4ju';
92824815

select * from orgunitgroupmembers where orgunitgroupid in (
select orgunitgroupid from orgunitgroup where uid = 'KZrndomu4ju' );

select * from periodtype;
select * from period where periodtypeid = 3 and startdate >= '2022-04-01'
and enddate <= '2022-12-31';

select * from datavalue where periodid in (select periodid from period where 
periodtypeid = 3 and startdate >= '2022-04-01'and enddate <= '2022-12-31') and
dataelementid in ( select dataelementid from datasetelement where datasetid = 35923)
and sourceid in ( select organisationunitid from orgunitgroupmembers where orgunitgroupid in (
select orgunitgroupid from orgunitgroup where uid = 'KZrndomu4ju' ) );


------- 


-- maharashtra datavalueset query for no of bed for period april-2021 to march-2022
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, dv.created, dv.lastupdated, pe.startdate,pe.enddate,pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'fePK3YQItlG' and dv.periodid in ( select periodid from period where startdate >= '2021-04-01' 
and enddate <= '2022-03-31' and periodtypeid = 9 ) and 
dv.value is not null and dv.deleted is not true;


select * from period where startdate = '2021-04-01'

select * from dataset where uid = 'dewVc85OtXn';


2021April
fePK3YQItlG-HllvX50cXC0-val

-- no of bed
SELECT de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID, org.uid AS organisationunitUID, dv.value, 
dv.storedby,dv.periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.dataelementid = 29711 and dv.periodid = 65262903 and dv.deleted = false and dv.value is not null;	


select * from datavalue where dataelementid = 29711 and periodid = 65262903;

select * from datavalue where periodid = 88138814
and dataelementid in ( select dataelementid from datasetelement where 
datasetid in ( 6207,40719,6205,6209,39427,6203,6197,6199,6201,40772,
1943,1949,1946,1957,1960,1963,1969,1967,72844,72846,72843,72842,72845,29710))
and sourceid in (21030,9470,9795,9794,87801443,9750,9957,9920,9798,9701,9826,
9538,9718,9434,9716,9159,9157,9170,7334,9963,9206,9231,9799,9749,10237,9452,
9477,9266,9677,9936,9282,9840,9697,9970,10229,9727,9480,9471,9765,9717,9886,
9219,7333,9983,9914,9779,9838,9397,7326,9361,9338,9385,9853,10194,9839,9363,
9031,9888,10363,9899,9719,9473,9383,9937,9028,10195,9933,9917,10400,9962,9084,
9989,9996,8987,9954,9764,9851,7327,43800396,9622,9674,9185,10234,9898,9398,9746,
32812667,10192,10261,10257,87803409,10298,10338,10193,10272,10373,9346,10293,
10299,10273,10292,38655490,84269097);







SELECT sag.Circle, sag.District,sag.name,sag.td,
SUM(c1::integer) AS  c1,
SUM(c2 ::integer) AS  c2,
SUM(c_old ::integer) AS  c_old,
SUM(c3::integer) AS  c3,
SUM(d1::integer) AS  d1,
SUM(d2::integer) AS  d2,
SUM(d3::integer) AS  d3,
SUM(d4::integer) AS  d4,
SUM(d5::integer) AS  d5,
SUM(d6::integer) AS  d6,
SUM(d7::integer) AS  d7,
SUM(d8::integer) AS  d8,
SUM(d9::integer) AS  d9,
SUM(e1::integer) AS  e1,
SUM(e2::integer) AS  e2,
SUM(e3::integer) AS  e3,
SUM(e4::integer) AS  e4,
SUM(e5::integer) AS  e5,
SUM(e6::integer) AS  e6,
SUM(e7::integer) AS  e7,
SUM(e8::integer) AS  e8,
SUM(e9::integer) AS  e9,
SUM(g1::integer) AS  g1,
SUM(g2::integer) AS  g2,
SUM(g3::integer) AS  g3,
SUM(g4::integer) AS  g4,
SUM(g5::integer) AS  g5,
SUM(g6::integer) AS  g6,
SUM(g7::integer) AS  g7,
SUM(g8::integer) AS  g8,
SUM(g9::integer) AS  g9,
SUM(g10::integer) AS  g10,
SUM(g11::integer) AS  g11,
SUM(g12::integer) AS  g12,
SUM(g13::integer) AS  g13,
SUM(g14::integer) AS  g14,
SUM(g15::integer) AS  g15,
SUM(g16::integer) AS  g16,
SUM(g17::integer) AS  g17,
SUM(g18::integer) AS  g18,
SUM(g19::integer) AS  g19,
SUM(g20::integer) AS  g20,
SUM(g21::integer) AS  g21,
SUM(g22::integer) AS  g22,
SUM(g23::integer) AS  g23,
SUM(g24::integer) AS  g24,
SUM(g25::integer) AS  g25,
SUM(g26::integer) AS  g26,
SUM(g27::integer) AS  g27,
SUM(g28::integer) AS  g28,
SUM(g29::integer) AS  g29,
SUM(g30::integer) AS  g30,
SUM(g31::integer) AS  g31,
SUM(g32::integer) AS  g32,
SUM(g33::integer) AS  g33,
SUM(g34::integer) AS  g34,
SUM(g35::integer) AS  g35,
SUM(g36::integer) AS  g36,
SUM(g37::integer) AS  g37,
SUM(g38::integer) AS  g38,
SUM(g39::integer) AS  g39,
SUM(g40::integer) AS  g40,
SUM(g41::integer) AS  g41,
SUM(g42::integer) AS  g42,
SUM(g43::integer) AS  g43,
SUM(g44::integer) AS  g44,
SUM(g45::integer) AS  g45,
SUM(g46::integer) AS  g46,
SUM(g47::integer) AS  g47,
SUM(g48::integer) AS  g48,
SUM(g49::integer) AS  g49,
SUM(g50::integer) AS  g50,
SUM(g51::integer) AS  g51,
SUM(g52::integer) AS  g52,
SUM(g53::integer) AS  g53,
SUM(g54::integer) AS  g54,
SUM(g55::integer) AS  g55,
SUM(g56::integer) AS  g56,
SUM(g57::integer) AS  g57,
SUM(g58::integer) AS  g58,
SUM(g59::integer) AS  g59,
SUM(g60::integer) AS  g60,
SUM(g61::integer) AS  g61,
SUM(g62::integer) AS  g62,
SUM(g63::integer) AS  g63,
SUM(g64::integer) AS  g64,
SUM(g65::integer) AS  g65,
SUM(g66::integer) AS  g66,
SUM(g67::integer) AS  g67,
SUM(g68::integer) AS  g68,
SUM(g69::integer) AS  g69,
SUM(g70::integer) AS  g70,
SUM(g71::integer) AS  g71,
SUM(g72::integer) AS  g72,
SUM(g73::integer) AS  g73,
SUM(g74::integer) AS  g74,
SUM(g75::integer) AS  g75,
SUM(g76::integer) AS  g76,
SUM(g77::integer) AS  g77,
SUM(g78::integer) AS  g78,
SUM(g79::integer) AS  g79,
SUM(g80::integer) AS  g80,
SUM(g81::integer) AS  g81,
SUM(g82::integer) AS  g82,
SUM(g83::integer) AS  g83,
SUM(g84::integer) AS  g84,
SUM(g85::integer) AS  g85,
SUM(g86::integer) AS  g86,
SUM(g87::integer) AS  g87,
SUM(g88::integer) AS  g88,
SUM(g89::integer) AS  g89,
SUM(g90::integer) AS  g90,
SUM(g91::integer) AS  g91,
SUM(g92::integer) AS  g92,
SUM(g93::integer) AS  g93,
SUM(g94::integer) AS  g94,
SUM(g95::integer) AS  g95,
SUM(g96::integer) AS  g96,
SUM(h1::integer) AS  h1,
SUM(h2::integer) AS  h2,
SUM(h3::integer) AS  h3,
SUM(h4::integer) AS  h4,
SUM(h5::integer) AS  h5,
SUM(h6::integer) AS  h6,
SUM(h7::integer) AS  h7,
SUM(h8::integer) AS  h8,
SUM(h9::integer) AS  h9,
SUM(h10::integer) AS  h10,
SUM(h11::integer) AS  h11,
SUM(h12::integer) AS  h12,
SUM(h13::integer) AS  h13,
SUM(h14::integer) AS  h14,
SUM(h15::integer) AS  h15,
SUM(h16::integer) AS  h16,
SUM(h17::integer) AS  h17,
SUM(h18::integer) AS  h18,
SUM(h19::integer) AS  h19,
SUM(h20::integer) AS  h20,
SUM(h21::integer) AS  h21,
SUM(i1::integer) AS  i1,
SUM(i2::integer) AS  i2,
SUM(j1::integer) AS  j1,
SUM(j2::integer) AS  j2,
SUM(k1::integer) AS  k1,
SUM(k2::integer) AS  k2,
SUM(l1::integer) AS  l1,
SUM(l2::integer) AS  l2,
SUM(l3::integer) AS  l3,
SUM(l4::integer) AS  l4,
SUM(l5::integer) AS  l5,
SUM(l6::integer) AS  l6,
SUM(l7::integer) AS  l7,
SUM(l8::integer) AS  l8,
SUM(l9::integer) AS  l9,
SUM(l10::integer) AS  l10,
SUM(l11::integer) AS  l11,
SUM(l12::integer) AS  l12,
SUM(l13::integer) AS  l13,
SUM(l14::integer) AS  l14,
SUM(l15::integer) AS  l15,
SUM(l16::integer) AS  l16,
SUM(l17::integer) AS  l17,
SUM(l18::integer) AS  l18,
SUM(l19::integer) AS  l19,
SUM(l20::integer) AS  l20,
SUM(l21::integer) AS  l21,
SUM(l22::integer) AS  l22,
SUM(l23::integer) AS  l23,
SUM(l24::integer) AS  l24,
SUM(l25::integer) AS  l25,
SUM(l26::integer) AS  l26,
SUM(l27::integer) AS  l27,
SUM(l28::integer) AS  l28,
SUM(l29::integer) AS  l29,
SUM(l30::integer) AS  l30,
SUM(l31::integer) AS  l31,
SUM(l32::integer) AS  l32,
SUM(l33::integer) AS  l33,
SUM(l34::integer) AS  l34,
SUM(l35::integer) AS  l35,
SUM(l36::integer) AS  l36,
SUM(l37::integer) AS  l37,
SUM(l38::integer) AS  l38,
SUM(l39::integer) AS  l39,
SUM(l40::integer) AS  l40,
SUM(l41::integer) AS  l41,
SUM(l42::integer) AS  l42,
SUM(l43::integer) AS  l43,
SUM(l44::integer) AS  l44,
SUM(l45::integer) AS  l45,
SUM(l46::integer) AS  l46,
SUM(l47::integer) AS  l47,
SUM(l48::integer) AS  l48,
SUM(l49::integer) AS  l49,
SUM(l50::integer) AS  l50,
SUM(l51::integer) AS  l51,
SUM(l52::integer) AS  l52,
SUM(l53::integer) AS  l53,
SUM(l54::integer) AS  l54,
SUM(l55::integer) AS  l55,
SUM(l56::integer) AS  l56,
SUM(l57::integer) AS  l57,
SUM(l58::integer) AS  l58,
SUM(l59::integer) AS  l59,
SUM(l60::integer) AS  l60,
SUM(l61::integer) AS  l61,
SUM(l62::integer) AS  l62,
SUM(l63::integer) AS  l63,
SUM(l64::integer) AS  l64,
SUM(l65::integer) AS  l65,
SUM(l66::integer) AS  l66,
SUM(l67::integer) AS  l67,
SUM(l68::integer) AS  l68,
SUM(l69::integer) AS  l69,
SUM(l70::integer) AS  l70,
SUM(l71::integer) AS  l71,
SUM(l72::integer) AS  l72,
SUM(l73::integer) AS  l73,
SUM(l74::integer) AS  l74,
SUM(l75::integer) AS  l75,
SUM(l76::integer) AS  l76,
SUM(l77::integer) AS  l77,
SUM(l78::integer) AS  l78,
SUM(l79::integer) AS  l79,
SUM(l80::integer) AS  l80,
SUM(l81::integer) AS  l81,
SUM(l82::integer) AS  l82,
SUM(l83::integer) AS  l83,
SUM(l84::integer) AS  l84,
SUM(l85::integer) AS  l85,
SUM(l86::integer) AS  l86,
SUM(l87::integer) AS  l87,
SUM(l88::integer) AS  l88,
SUM(l89::integer) AS  l89,
SUM(l90::integer) AS  l90,
SUM(l91::integer) AS  l91,
SUM(l92::integer) AS  l92,
SUM(l93::integer) AS  l93,
SUM(l94::integer) AS  l94,
SUM(l95::integer) AS  l95,
SUM(l96::integer) AS  l96,
SUM(m1::integer) AS  m1,
SUM(m2::integer) AS  m2,
SUM(m3::integer) AS  m3,
SUM(m4::integer) AS  m4,
SUM(m5::integer) AS  m5,
SUM(m6::integer) AS  m6,
SUM(m7::integer) AS  m7,
SUM(m8::integer) AS  m8,
SUM(m9::integer) AS  m9,
SUM(m10::integer) AS  m10,
SUM(m11::integer) AS  m11,
SUM(m12::integer) AS  m12,
SUM(m13::integer) AS  m13,
SUM(m14::integer) AS  m14,
SUM(m15::integer) AS  m15,
SUM(m16::integer) AS  m16,
SUM(m17::integer) AS  m17,
SUM(m18::integer) AS  m18,
SUM(m19::integer) AS  m19,
SUM(m20::integer) AS  m20,
SUM(m21::integer) AS  m21,
SUM(m22::integer) AS  m22,
SUM(m23::integer) AS  m23,
SUM(m24::integer) AS  m24,
SUM(m25::integer) AS  m25,
SUM(m26::integer) AS  m26,
SUM(m27::integer) AS  m27,
SUM(m28::integer) AS  m28,
SUM(m29::integer) AS  m29,
SUM(m30::integer) AS  m30,
SUM(m31::integer) AS  m31,
SUM(m32::integer) AS  m32,
SUM(m33::integer) AS  m33,
SUM(m34::integer) AS  m34,
SUM(m35::integer) AS  m35,
SUM(m36::integer) AS  m36,
SUM(m37::integer) AS  m37,
SUM(m38::integer) AS  m38,
SUM(m39::integer) AS  m39,
SUM(m40::integer) AS  m40,
SUM(m41::integer) AS  m41,
SUM(m42::integer) AS  m42,
SUM(m43::integer) AS  m43,
SUM(m44::integer) AS  m44,
SUM(m45::integer) AS  m45,
SUM(m46::integer) AS  m46,
SUM(m47::integer) AS  m47,
SUM(m48::integer) AS  m48,
SUM(m49::integer) AS  m49,
SUM(m50::integer) AS  m50,
SUM(m51::integer) AS  m51,
SUM(m52::integer) AS  m52,
SUM(m53::integer) AS  m53,
SUM(m54::integer) AS  m54,
SUM(m55::integer) AS  m55,
SUM(m56::integer) AS  m56,
SUM(m57::integer) AS  m57,
SUM(m58::integer) AS  m58,
SUM(m59::integer) AS  m59,
SUM(m60::integer) AS  m60,
SUM(m61::integer) AS  m61,
SUM(m62::integer) AS  m62,
SUM(m63::integer) AS  m63,
SUM(m64::integer) AS  m64,
SUM(m65::integer) AS  m65,
SUM(m66::integer) AS  m66,
SUM(m67::integer) AS  m67,
SUM(m68::integer) AS  m68,
SUM(m69::integer) AS  m69,
SUM(m70::integer) AS  m70,
SUM(m71::integer) AS  m71,
SUM(m72::integer) AS  m72,
SUM(m73::integer) AS  m73,
SUM(m74::integer) AS  m74,
SUM(m75::integer) AS  m75,
SUM(m76::integer) AS  m76,
SUM(m77::integer) AS  m77,
SUM(m78::integer) AS  m78,
SUM(m79::integer) AS  m79,
SUM(m80::integer) AS  m80,
SUM(m81::integer) AS  m81,
SUM(m82::integer) AS  m82,
SUM(m83::integer) AS  m83,
SUM(m84::integer) AS  m84,
SUM(m85::integer) AS  m85,
SUM(m86::integer) AS  m86,
SUM(m87::integer) AS  m87,
SUM(m88::integer) AS  m88,
SUM(m89::integer) AS  m89,
SUM(m90::integer) AS  m90,
SUM(m91::integer) AS  m91,
SUM(m92::integer) AS  m92,
SUM(m93::integer) AS  m93,
SUM(m94::integer) AS  m94,
SUM(m95::integer) AS  m95,
SUM(m96::integer) AS  m96,
SUM(o1::integer) AS  o1,
SUM(o2::integer) AS  o2,
SUM(p1	::integer) AS 	p1,
SUM(p2	::integer) AS 	p2,
SUM(p3	::integer) AS 	p3,
SUM(p4	::integer) AS 	p4,
SUM(p5	::integer) AS 	p5,
SUM(p6	::integer) AS 	p6,
SUM(p7	::integer) AS 	p7,
SUM(p8	::integer) AS 	p8,
SUM(p9	::integer) AS 	p9,
SUM(p10	::integer) AS 	p10,
SUM(p11	::integer) AS 	p11,
SUM(p12	::integer) AS 	p12,
SUM(p13	::integer) AS 	p13,
SUM(p14	::integer) AS 	p14,
SUM(p15	::integer) AS 	p15,
SUM(p16	::integer) AS 	p16,
SUM(p17	::integer) AS 	p17,
SUM(p18	::integer) AS 	p18,
SUM(p19	::integer) AS 	p19,
SUM(p20	::integer) AS 	p20,
SUM(p21	::integer) AS 	p21,
SUM(p22	::integer) AS 	p22,
SUM(p23	::integer) AS 	p23,
SUM(p24	::integer) AS 	p24,
SUM(p25	::integer) AS 	p25,
SUM(p26	::integer) AS 	p26,
SUM(p27	::integer) AS 	p27,
SUM(p28	::integer) AS 	p28,
SUM(p29	::integer) AS 	p29,
SUM(p30	::integer) AS 	p30,
SUM(p31	::integer) AS 	p31,
SUM(p32	::integer) AS 	p32,
SUM(p33	::integer) AS 	p33,
SUM(p34	::integer) AS 	p34,
SUM(p35	::integer) AS 	p35,
SUM(p36	::integer) AS 	p36,
SUM(p37	::integer) AS 	p37,
SUM(p38	::integer) AS 	p38,
SUM(p39	::integer) AS 	p39,
SUM(p40	::integer) AS 	p40,
SUM(p41	::integer) AS 	p41,
SUM(p42	::integer) AS 	p42,
SUM(p43	::integer) AS 	p43,
SUM(p44	::integer) AS 	p44,
SUM(p45	::integer) AS 	p45,
SUM(p46	::integer) AS 	p46,
SUM(p47	::integer) AS 	p47,
SUM(p48	::integer) AS 	p48,
SUM(p49	::integer) AS 	p49,
SUM(p50	::integer) AS 	p50,
SUM(p51	::integer) AS 	p51,
SUM(p52	::integer) AS 	p52,
SUM(p53	::integer) AS 	p53,
SUM(p54	::integer) AS 	p54,
SUM(p55	::integer) AS 	p55,
SUM(p56	::integer) AS 	p56,
SUM(p57	::integer) AS 	p57,
SUM(p58	::integer) AS 	p58,
SUM(p59	::integer) AS 	p59,
SUM(p60	::integer) AS 	p60,
SUM(p61	::integer) AS 	p61,
SUM(p62	::integer) AS 	p62,
SUM(p63	::integer) AS 	p63,
SUM(p64	::integer) AS 	p64,
SUM(p65	::integer) AS 	p65,
SUM(p66	::integer) AS 	p66,
SUM(p67	::integer) AS 	p67,
SUM(p68	::integer) AS 	p68,
SUM(p69	::integer) AS 	p69,
SUM(p70	::integer) AS 	p70,
SUM(p71	::integer) AS 	p71,
SUM(p72	::integer) AS 	p72,
SUM(p73	::integer) AS 	p73,
SUM(p74	::integer) AS 	p74,
SUM(p75	::integer) AS 	p75,
SUM(p76	::integer) AS 	p76,
SUM(p77	::integer) AS 	p77,
SUM(p78	::integer) AS 	p78,
SUM(p79	::integer) AS 	p79,
SUM(p80	::integer) AS 	p80,
SUM(p81	::integer) AS 	p81,
SUM(p82	::integer) AS 	p82,
SUM(p83	::integer) AS 	p83,
SUM(p84	::integer) AS 	p84,
SUM(p85	::integer) AS 	p85,
SUM(p86	::integer) AS 	p86,
SUM(p87::integer) AS 	p87,
SUM(R1::integer) AS  R1,
SUM(R2::integer) AS  R2,
SUM(R3::integer) AS  R3,
SUM(R4::integer) AS  R4,
SUM(R5::integer) AS  R5,
SUM(R6::integer) AS  R6,
SUM(R7::integer) AS  R7,
SUM(R8::integer) AS  R8,
SUM(R9::integer) AS  R9,
SUM(R10::integer) AS  R10,
SUM(R11::integer) AS  R11,
SUM(R12::integer) AS  R12,
SUM(R13::integer) AS  R13,
SUM(R14::integer) AS  R14,
SUM(R15::integer) AS  R15,
SUM(R16::integer) AS  R16,
SUM(R17::integer) AS  R17,
SUM(R18::integer) AS  R18,
SUM(R19::integer) AS  R19,
SUM(R20::integer) AS  R20,
SUM(R21::integer) AS  R21,
SUM(R22::integer) AS  R22,
SUM(R23::integer) AS  R23,
SUM(R24::integer) AS  R24,
SUM(R25::integer) AS  R25,
SUM(R26::integer) AS  R26,
SUM(R27::integer) AS  R27,
SUM(R28::integer) AS  R28,
SUM(R29::integer) AS  R29,
SUM(R30::integer) AS  R30,
SUM(R31::integer) AS  R31,
SUM(R32::integer) AS  R32,
SUM(R33::integer) AS  R33,
SUM(R34::integer) AS  R34,
SUM(R35::integer) AS  R35,
SUM(R36::integer) AS  R36,
SUM(R37::integer) AS  R37,
SUM(R38::integer) AS  R38,
SUM(R39::integer) AS  R39,
SUM(R40::integer) AS  R40,
SUM(R41::integer) AS  R41,
SUM(R42::integer) AS  R42,
SUM(R43::integer) AS  R43,
SUM(R44::integer) AS  R44,
SUM(R45::integer) AS  R45,
SUM(R46::integer) AS  R46,
SUM(R47::integer) AS  R47,
SUM(R48::integer) AS  R48,
SUM(R49::integer) AS  R49,
SUM(R50::integer) AS  R50,
SUM(R51::integer) AS  R51,
SUM(R52::integer) AS  R52,
SUM(R53::integer) AS  R53,
SUM(R54::integer) AS  R54,
SUM(R55::integer) AS  R55,
SUM(R56::integer) AS  R56,
SUM(R57::integer) AS  R57,
SUM(R58::integer) AS  R58,
SUM(R59::integer) AS  R59,
SUM(R60::integer) AS  R60,
SUM(R61::integer) AS  R61,
SUM(R62::integer) AS  R62,
SUM(R63::integer) AS  R63,
SUM(R64::integer) AS  R64,
SUM(R65::integer) AS  R65,
SUM(R66::integer) AS  R66,
SUM(R67::integer) AS  R67,
SUM(R68::integer) AS  R68,
SUM(R69::integer) AS  R69,
SUM(R70::integer) AS  R70,
SUM(R71::integer) AS  R71,
SUM(R72::integer) AS  R72,
SUM(R73::integer) AS  R73,
SUM(R74::integer) AS  R74,
SUM(R75::integer) AS  R75,
SUM(R76::integer) AS  R76,
SUM(R77::integer) AS  R77,
SUM(R78::integer) AS  R78,
SUM(R79::integer) AS  R79,
SUM(R80::integer) AS  R80,
SUM(R81::integer) AS  R81,
SUM(R82::integer) AS  R82,
SUM(R83::integer) AS  R83,
SUM(R84::integer) AS  R84,
SUM(R85::integer) AS  R85,
SUM(R86::integer) AS  R86,
SUM(R87::integer) AS  R87,
SUM(R88::integer) AS  R88,
SUM(R89::integer) AS  R89,
SUM(R90::integer) AS  R90,
SUM(R91::integer) AS  R91,
SUM(R92::integer) AS  R92,
SUM(R93::integer) AS  R93,
SUM(R94::integer) AS  R94,
SUM(R95::integer) AS  R95,
SUM(R96::integer) AS  R96,
SUM(R97::integer) AS  R97,
SUM(R98::integer) AS  R98,
SUM(R99::integer) AS  R99,
SUM(R100::integer) AS  R100,
SUM(R101::integer) AS  R101,
SUM(R102::integer) AS  R102,
SUM(R103::integer) AS  R103,
SUM(R104::integer) AS  R104,
SUM(R105::integer) AS  R105,
SUM(R106::integer) AS  R106,
SUM(R107::integer) AS  R107,
SUM(R108::integer) AS  R108,
SUM(R109::integer) AS  R109,
SUM(R110::integer) AS  R110,
SUM(R111::integer) AS  R111,
SUM(R112::integer) AS  R112,
SUM(R113::integer) AS  R113,
SUM(R114::integer) AS  R114,
SUM(s1::integer) AS  s1,
SUM(s2::integer) AS  s2,
SUM(s3::integer) AS  s3,
SUM(s4::integer) AS  s4,
SUM(s5::integer) AS  s5,
SUM(s6::integer) AS  s6,
SUM(g1_new::integer) AS  g1_new,
SUM(g2_new::integer) AS  g2_new,
SUM(g3_new::integer) AS  g3_new,
SUM(g4_new::integer) AS  g4_new,

SUM(g7_new::integer) AS  g7_new,
SUM(g8_new::integer) AS  g8_new,
SUM(g9_new::integer) AS  g9_new,
SUM(g10_new::integer) AS  g10_new,


SUM(ipd1_new::integer) AS  ipd1_new,
SUM(ipd2_new::integer) AS  ipd2_new,
SUM(ipd3_new::integer) AS  ipd3_new,
SUM(ipd4_new::integer) AS  ipd4_new,

SUM(ipd5_new::integer) AS  ipd5_new,
SUM(ipd6_new::integer) AS  ipd6_new,
SUM(ipd7_new::integer) AS  ipd7_new,
SUM(ipd8_new::integer) AS  ipd8_new


FROM 
(
SELECT a1.Circle,a1.District,a1.name,a1.td AS td,
CASE WHEN uid='mBZ4hpVtZaP' and ccombouid ='Ue7vG5utcCw'  THEN asd1.value END AS c1,
CASE WHEN uid='mBZ4hpVtZaP' and ccombouid ='UI7DkNhm9XU'  THEN asd1.value END AS c2,
CASE WHEN uid='huq7iUHYtul'  THEN asd1.value END AS c_old, 
CASE WHEN uid='fePK3YQItlG' and ccombouid ='HllvX50cXC0'  THEN asd1.value END AS c3,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='NC7JOLHRe5T'  THEN asd1.value END AS d1,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='UDN5uuRl2Qo'  THEN asd1.value END AS d2,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='oeGERZcEOu4'  THEN asd1.value END AS d3,                                                         
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='Io6eML2VLbX'  THEN asd1.value END AS d4,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='PTEYHU5apTS'  THEN asd1.value END AS d5,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='cPuNpsmWTo2'  THEN asd1.value END AS d6,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='ZkJVJO8Olyh'  THEN asd1.value END AS d7,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='MT01rz6ivPu'  THEN asd1.value END AS d8,
CASE WHEN uid='BmKeiveujwY' and ccombouid ='fRCpYwN3fLU'  THEN asd1.value END AS d9,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='t26izMsLrrQ'  THEN asd1.value END AS e1,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='miYO4IUVWEE'  THEN asd1.value END AS e2,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='FxO4d1Kocws'  THEN asd1.value END AS e3,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='cWnObDvqFoX'  THEN asd1.value END AS e4,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='Zmm7xxXj4La'  THEN asd1.value END AS e5,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='quo9r3fl0b9'  THEN asd1.value END AS e6,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='oM13ECJcjv0'  THEN asd1.value END AS e7,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='CoLj1vGPfZr'  THEN asd1.value END AS e8,
CASE WHEN uid='BmKeiveujwY' and ccombouid ='iLf93vDUcHF'  THEN asd1.value END AS e9,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g1,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g2,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g3,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g4,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g5,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g6,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g7,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g8,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g9,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g10,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g11,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g12,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g13,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g14,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g15,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g16,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g17,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g18,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g19,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g20,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g21,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g22,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g23,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g24,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g25,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g26,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g27,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g28,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g29,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g30,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g31,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g32,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g33,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g34,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g35,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g36,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g37,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g38,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g39,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g40,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g41,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g42,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g43,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g44,
CASE WHEN uid='jQjf10fZPTQ' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g45,
CASE WHEN uid='jQjf10fZPTQ' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g46,
CASE WHEN uid='eH9zY0hfRV3' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g47,
CASE WHEN uid='eH9zY0hfRV3' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g48,
CASE WHEN uid='WWIx4r2BVzx' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g49,
CASE WHEN uid='WWIx4r2BVzx' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g50,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g51,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g52,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g53,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g54,
CASE WHEN uid='gj0nv9qKARs' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g55,
CASE WHEN uid='gj0nv9qKARs' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g56,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g57,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g58,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g59,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g60,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g61,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g62,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g63,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g64,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g65,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g66,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g67,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g68,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g69,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g70,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g71,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g72,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g73,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g74,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g75,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g76,
CASE WHEN uid='R1CzqINM52C' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g77,
CASE WHEN uid='R1CzqINM52C' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g78,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g79,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g80,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g81,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g82,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g83,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g84,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g85,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g86,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g87,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g88,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g89,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g90,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g91,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g92,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS g93,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS g94,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS g95,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS g96,
CASE WHEN uid='WWIx4r2BVzx' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g1_new,
CASE WHEN uid='WWIx4r2BVzx' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g2_new,
CASE WHEN uid='jQjf10fZPTQ' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g3_new,
CASE WHEN uid='jQjf10fZPTQ' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g4_new,

CASE WHEN uid='gj0nv9qKARs' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g7_new,
CASE WHEN uid='gj0nv9qKARs' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g8_new,
CASE WHEN uid='R1CzqINM52C' and ccombouid ='mG0zgFfA9iY'   THEN asd1.value END AS g9_new,
CASE WHEN uid='R1CzqINM52C' and ccombouid ='Rr0iLjh3jMJ'   THEN asd1.value END AS g10_new,

CASE WHEN uid='dcAfu7cERaO' and ccombouid ='ernzEKhlLOk'   THEN asd1.value END AS h1,
CASE WHEN uid='dcAfu7cERaO' and ccombouid ='O9AJbUxFf3W'   THEN asd1.value END AS h2,
CASE WHEN uid='lGiYtuL6ARl' and ccombouid ='ernzEKhlLOk'   THEN asd1.value END AS h3,
CASE WHEN uid='lGiYtuL6ARl' and ccombouid ='O9AJbUxFf3W'   THEN asd1.value END AS h4,
CASE WHEN uid='SO1qdniaXIy' and ccombouid ='ernzEKhlLOk'   THEN asd1.value END AS h5,
CASE WHEN uid='SO1qdniaXIy' and ccombouid ='O9AJbUxFf3W'   THEN asd1.value END AS h6,
CASE WHEN uid='QRgAqANCiOl' and ccombouid ='ernzEKhlLOk'   THEN asd1.value END AS h7,
CASE WHEN uid='QRgAqANCiOl' and ccombouid ='O9AJbUxFf3W'   THEN asd1.value END AS h8,
CASE WHEN uid='QW87gYpLCD7' and ccombouid ='ernzEKhlLOk'   THEN asd1.value END AS h9,
CASE WHEN uid='QW87gYpLCD7' and ccombouid ='O9AJbUxFf3W'   THEN asd1.value END AS h10,
CASE WHEN uid='dcAfu7cERaO' and ccombouid ='HKTnr7EF6Yf'   THEN asd1.value END AS h11,
CASE WHEN uid='dcAfu7cERaO' and ccombouid ='oLw5e5NKqpY'   THEN asd1.value END AS h12,
CASE WHEN uid='lGiYtuL6ARl' and ccombouid ='HKTnr7EF6Yf'   THEN asd1.value END AS h13,
CASE WHEN uid='lGiYtuL6ARl' and ccombouid ='oLw5e5NKqpY'   THEN asd1.value END AS h14,
CASE WHEN uid='SO1qdniaXIy' and ccombouid ='HKTnr7EF6Yf'   THEN asd1.value END AS h15,
CASE WHEN uid='SO1qdniaXIy' and ccombouid ='oLw5e5NKqpY'   THEN asd1.value END AS h16,
CASE WHEN uid='QW87gYpLCD7' and ccombouid ='HKTnr7EF6Yf'   THEN asd1.value END AS h17,
CASE WHEN uid='QW87gYpLCD7' and ccombouid ='oLw5e5NKqpY'   THEN asd1.value END AS h18,
CASE WHEN uid='SO1qdniaXIy' and ccombouid ='O9AJbUxFf3W'   THEN asd1.value END AS h19,
CASE WHEN uid='QRgAqANCiOl' and ccombouid ='oLw5e5NKqpY'   THEN asd1.value END AS h20,
CASE WHEN uid='QRgAqANCiOl' and ccombouid ='HKTnr7EF6Yf'   THEN asd1.value END AS h21,


CASE WHEN uid='GgSLEZcgxXU' and ccombouid ='Ue7vG5utcCw'  THEN asd1.value END AS i1,
CASE WHEN uid='GgSLEZcgxXU' and ccombouid ='UI7DkNhm9XU'  THEN asd1.value END AS i2,
CASE WHEN uid='sL53HjxB5JX' and ccombouid ='DLr4VIEGNIo'  THEN asd1.value END AS j1,
CASE WHEN uid='sL53HjxB5JX' and ccombouid ='ZnztZgggxd6'  THEN asd1.value END AS j2,
CASE WHEN uid='LpD1GmX2JWs' and ccombouid ='DLr4VIEGNIo'  THEN asd1.value END AS k1,
CASE WHEN uid='LpD1GmX2JWs' and ccombouid ='ZnztZgggxd6'  THEN asd1.value END AS k2,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l1,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l2,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l3,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l4,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l5,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l6,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l7,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l8,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l9,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l10,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l11,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l12,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l13,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l14,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l15,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l16,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l17,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l18,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l19,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l20,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l21,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l22,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l23,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l24,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l25,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l26,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l27,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l28,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l29,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l30,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l31,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l32,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l33,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l34,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l35,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l36,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l37,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l38,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l39,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l40,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l41,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l42,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l43,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l44,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l45,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l46,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l47,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l48,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l49,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l50,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l51,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l52,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l53,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l54,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l55,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l56,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l57,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l58,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l59,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l60,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l61,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l62,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l63,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l64,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l65,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l66,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l67,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l68,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l69,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l70,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l71,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l72,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l73,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l74,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l75,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l76,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l77,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l78,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l79,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l80,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l81,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l82,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l83,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l84,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l85,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l86,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l87,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l88,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l89,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l90,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l91,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l92,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS l93,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS l94,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS l95,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS l96,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m1,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m2,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m3,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m4,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m5,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m6,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m7,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m8,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m9,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m10,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m11,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m12,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m13,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m14,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m15,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m16,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m17,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m18,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m19,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m20,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m21,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m22,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m23,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m24,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m25,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m26,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m27,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m28,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m29,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m30,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m31,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m32,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m33,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m34,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m35,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m36,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m37,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m38,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m39,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m40,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m41,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m42,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m43,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m44,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m45,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m46,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m47,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m48,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m49,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m50,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m51,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m52,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m53,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m54,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m55,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m56,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m57,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m58,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m59,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m60,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m61,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m62,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m63,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m64,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m65,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m66,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m67,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m68,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m69,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m70,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m71,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m72,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m73,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m74,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m75,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m76,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m77,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m78,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m79,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m80,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m81,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m82,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m83,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m84,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m85,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m86,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m87,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m88,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m89,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m90,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m91,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m92,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS m93,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS m94,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS m95,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS m96,
CASE WHEN uid='emlcGeWeYoX' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS o1,
CASE WHEN uid='pgQdxOzqxEK' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS o2,
CASE WHEN uid='OINl6uGduUW' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p1,
CASE WHEN uid='kHaxuud80Iz' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p2,
CASE WHEN uid='KVpILshPxRH' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p3,
CASE WHEN uid='kEm3tEgg5YR' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p4,
CASE WHEN uid='kEm3tEgg5YR' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p5,
CASE WHEN uid='dDfdyKx6DW7' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p6,
CASE WHEN uid='dDfdyKx6DW7' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p7,
CASE WHEN uid='XAUStBZV0IW' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p8,
CASE WHEN uid='XAUStBZV0IW' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p9,
CASE WHEN uid='IvPaaBih3bF' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p10,
CASE WHEN uid='IvPaaBih3bF' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p11,
CASE WHEN uid='YSDE4zFf5Ob' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p12,
CASE WHEN uid='YSDE4zFf5Ob' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p13,
CASE WHEN uid='HwErS1poHJK' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p14,
CASE WHEN uid='HwErS1poHJK' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p15,
CASE WHEN uid='zicdEgAnnvR' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p16,
CASE WHEN uid='zicdEgAnnvR' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p17,
CASE WHEN uid='fUYo1XpSvaP' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p18,
CASE WHEN uid='fUYo1XpSvaP' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p19,
CASE WHEN uid='iyApntrZChB' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p20,
CASE WHEN uid='iyApntrZChB' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p21,
CASE WHEN uid='QRzYeR3peqk' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p22,
CASE WHEN uid='gySgyHEZVC6' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p23,
CASE WHEN uid='NbjDGOArQSo' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p24,
CASE WHEN uid='xJWaQfr5gJd' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p25,
CASE WHEN uid='s6695T588Ms' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p26,
CASE WHEN uid='aN9nXtxd1Mi' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS  p27,
CASE WHEN uid='KCJmPxSzYN6' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p28,
CASE WHEN uid='uOxgt0QY2PD' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p29,
CASE WHEN uid='uOxgt0QY2PD' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p30,
CASE WHEN uid='Xh9Y2G6eHzn' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p31,
CASE WHEN uid='Xh9Y2G6eHzn' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p32,
CASE WHEN uid='RRVMtQDu80y' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p33,
CASE WHEN uid='RRVMtQDu80y' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p34,
CASE WHEN uid='yDZIhuFaMpU' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p35,
CASE WHEN uid='yDZIhuFaMpU' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p36,
CASE WHEN uid='dP4TK5eMwOg' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p37,
CASE WHEN uid='dP4TK5eMwOg' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p38,
CASE WHEN uid='fI9IcUQDNts' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p39,
CASE WHEN uid='fI9IcUQDNts' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p40,
CASE WHEN uid='ewJCcRBef4i' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p41,
CASE WHEN uid='ewJCcRBef4i' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p42,
CASE WHEN uid='uYBOcputH7v' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p43,
CASE WHEN uid='uYBOcputH7v' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p44,
CASE WHEN uid='kFkxtDL3NRo' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p45,
CASE WHEN uid='kFkxtDL3NRo' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p46,
CASE WHEN uid='cT1z2TrEZkY' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p47,
CASE WHEN uid='cT1z2TrEZkY' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p48,
CASE WHEN uid='xDR50YMouZc' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p49,
CASE WHEN uid='xDR50YMouZc' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p50,
CASE WHEN uid='Orm2CRiGKLj' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p51,
CASE WHEN uid='Orm2CRiGKLj' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p52,
CASE WHEN uid='Rgh944AdZ9O' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p53,
CASE WHEN uid='Rgh944AdZ9O' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p54,
CASE WHEN uid='u95coZipuwC' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p55,
CASE WHEN uid='u95coZipuwC' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p56,
CASE WHEN uid='bvL8S73mvxc' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p57,
CASE WHEN uid='bvL8S73mvxc' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p58,
CASE WHEN uid='IVBXQwOuPzT' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p59,
CASE WHEN uid='IVBXQwOuPzT' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p60,
CASE WHEN uid='pmVHW2vMOUm' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p61,
CASE WHEN uid='pmVHW2vMOUm' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p62,
CASE WHEN uid='Z3E6bDsYpFw' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p63,
CASE WHEN uid='Z3E6bDsYpFw' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p64,
CASE WHEN uid='ulM7haN9NdC' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p65,
CASE WHEN uid='ulM7haN9NdC' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p66,
CASE WHEN uid='ufYzfRnRkuh' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p67,
CASE WHEN uid='ufYzfRnRkuh' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p68,
CASE WHEN uid='lMdAXeNy8QD' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p69,
CASE WHEN uid='rDmARJswjOq' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p70,
CASE WHEN uid='rDmARJswjOq' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p71,
CASE WHEN uid='xZowtHKl8lo' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p72,
CASE WHEN uid='xZowtHKl8lo' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p73,
CASE WHEN uid='smwuXsfyyra' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p74,
CASE WHEN uid='smwuXsfyyra' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p75,
CASE WHEN uid='xkdYbBbKz1t' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p76,
CASE WHEN uid='xkdYbBbKz1t' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p77,
CASE WHEN uid='d6ycprwTEjQ' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p78,
CASE WHEN uid='d6ycprwTEjQ' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p79,
CASE WHEN uid='yZRzjIsqaux' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p80,
CASE WHEN uid='yZRzjIsqaux' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p81,
CASE WHEN uid='hMSwwrTk4h1' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p82,
CASE WHEN uid='hMSwwrTk4h1' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p83,
CASE WHEN uid='R8mFWQdRtzg' and ccombouid ='VHbljVQ8REF'   THEN asd1.value END AS  p84,
CASE WHEN uid='R8mFWQdRtzg' and ccombouid ='tY82VK3LTQq'   THEN asd1.value END AS  p85,
CASE WHEN uid='DOWjzICXxPO' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS p86,
CASE WHEN uid='KVpILshPxRH' and ccombouid ='HllvX50cXC0'   THEN asd1.value END AS p87,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R1,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R2,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R3,
CASE WHEN uid='lIUy0jFAhJG' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R4,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R5,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R6,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R7,
CASE WHEN uid='IXoIviMH84Z' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R8,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R9,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R10,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R11,
CASE WHEN uid='wFMIC8LaeZE' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R12,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R13,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R14,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R15,
CASE WHEN uid='Le2mo0VvI11' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R16,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R17,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R18,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R19,
CASE WHEN uid='b5umAdxjoWB' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R20,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R21,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R22,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R23,
CASE WHEN uid='gcmFSxfKECg' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R24,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R25,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R26,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R27,
CASE WHEN uid='RACJs2tc7iX' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R28,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R29,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R30,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R31,
CASE WHEN uid='fxA5Obzc9Cp' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R32,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R33,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R34,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R35,
CASE WHEN uid='emXBlbUqEdu' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R36,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R37,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R38,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R39,
CASE WHEN uid='yscjZhqUVrc' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R40,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R41,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R42,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R43,
CASE WHEN uid='rHbbyr62qQf' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R44,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R45,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R46,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R47,
CASE WHEN uid='FAgMbwTM4qS' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R48,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R49,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R50,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R51,
CASE WHEN uid='rovJXxSD0nA' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R52,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R53,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R54,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R55,
CASE WHEN uid='yA18U0CFZr9' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R56,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R57,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R58,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R59,
CASE WHEN uid='OAZIquJBDUR' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R60,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R61,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R62,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R63,
CASE WHEN uid='xby6s6CpPMZ' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R64,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R65,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R66,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R67,
CASE WHEN uid='SC5DQ2Lh22L' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R68,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R69,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R70,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R71,
CASE WHEN uid='e0mAl1Xe9rK' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R72,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R73,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R74,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R75,
CASE WHEN uid='NfGChTX6nLo' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R76,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R77,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R78,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R79,
CASE WHEN uid='FpmIyf2rkuM' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R80,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R81,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R82,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R83,
CASE WHEN uid='JqfrxdCMqc8' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R84,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R85,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R86,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R87,
CASE WHEN uid='thuYhpOv61J' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R88,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R89,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R90,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R91,
CASE WHEN uid='x1NyquVWagC' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R92,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS R93,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS R94,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS R95,
CASE WHEN uid='pvK8kegxxWa' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS R96,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='NC7JOLHRe5T'   THEN asd1.value END AS R97,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='PTEYHU5apTS'   THEN asd1.value END AS R98,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='UDN5uuRl2Qo'   THEN asd1.value END AS R99,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='cPuNpsmWTo2'   THEN asd1.value END AS R100,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='oeGERZcEOu4'   THEN asd1.value END AS R101,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='ZkJVJO8Olyh'   THEN asd1.value END AS R102,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='Io6eML2VLbX'   THEN asd1.value END AS R103,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='MT01rz6ivPu'   THEN asd1.value END AS R104,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='fRCpYwN3fLU'   THEN asd1.value END AS R105,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='t26izMsLrrQ'   THEN asd1.value END AS R106,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='Zmm7xxXj4La'   THEN asd1.value END AS R107,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='miYO4IUVWEE'   THEN asd1.value END AS R108,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='quo9r3fl0b9'   THEN asd1.value END AS R109,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='FxO4d1Kocws'   THEN asd1.value END AS R110,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='oM13ECJcjv0'   THEN asd1.value END AS R111,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='cWnObDvqFoX'   THEN asd1.value END AS R112,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='CoLj1vGPfZr'   THEN asd1.value END AS R113,
CASE WHEN uid='gyhLpZ4Dh0R' and ccombouid ='iLf93vDUcHF'   THEN asd1.value END AS R114,
CASE WHEN uid='R5PRHo2takU' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS s1,
CASE WHEN uid='R5PRHo2takU' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS s2,
CASE WHEN uid='R5PRHo2takU' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS s3,
CASE WHEN uid='R5PRHo2takU' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS s4,
CASE WHEN uid='B6Dd3hSmRg3' and ccombouid ='Ue7vG5utcCw'   THEN asd1.value END AS s5,
CASE WHEN uid='B6Dd3hSmRg3' and ccombouid ='UI7DkNhm9XU'   THEN asd1.value END AS s6,


CASE WHEN uid='aUC5C7hOull' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS ipd1_new,
CASE WHEN uid='aUC5C7hOull' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS ipd2_new,
CASE WHEN uid='aUC5C7hOull' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS ipd3_new,
CASE WHEN uid='aUC5C7hOull' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS ipd4_new,
CASE WHEN uid='pSabV6ZeWrJ' and ccombouid ='phy0eMHB3Hr'   THEN asd1.value END AS ipd5_new,
CASE WHEN uid='pSabV6ZeWrJ' and ccombouid ='kWEQlYXihOL'   THEN asd1.value END AS ipd6_new,
CASE WHEN uid='pSabV6ZeWrJ' and ccombouid ='lidy03xkwd5'   THEN asd1.value END AS ipd7_new,
CASE WHEN uid='pSabV6ZeWrJ' and ccombouid ='CRk5QqUrAKx'   THEN asd1.value END AS ipd8_new


FROM

(
	SELECT * FROM
	(
	SELECT ogm.organisationunitid,og.name AS gname,ou.name,os.level,ou1.name AS Circle,ou2.name AS District
	FROM orgunitgroupmembers ogm
	INNER JOIN orgunitgroup og ON ogm.orgunitgroupid = og.orgunitgroupid
	INNER JOIN organisationunit ou ON ou.organisationunitid = ogm.organisationunitid
	INNER JOIN _orgunitstructure os ON os.organisationunitid = ou.organisationunitid
	INNER JOIN organisationunit ou1 ON ou1.organisationunitid = os.idlevel3
	INNER JOIN organisationunit ou2 ON ou2.organisationunitid = os.idlevel4
	WHERE og.name IN ('Hospital Group')
	AND (ou1.name LIKE 'Nasik Circle')
	
	)asd

		INNER JOIN (
SELECT SUM(extract(day from p.enddate)) AS td,CASE WHEN extract(month from  ?::date) < extract(month from  ?::date) THEN (13-extract(month from  ?::date))+extract(month from  ?::date)
					WHEN extract(month from  ?::date) > extract(month from  ?::date) THEN extract(month from  ?::date)-extract(month from  ?::date)+1
					WHEN extract(month from  ?::date) = extract(month from  ?::date) THEN 1  END AS numofmonth
	FROM period p 
	WHERE p.startdate BETWEEN '2021-01-01' AND '2021-01-31'
	AND periodtypeid = 3
	)b
	ON 1=1
	)a1

LEFT JOIN

	(
	

	SELECT de.uid,cc.uid as ccombouid,dv.value,dv.sourceid,p.startdate
	FROM datavalue dv
	inner join dataelement de on de.dataelementid = dv.dataelementid
			INNER JOIN period p ON p.periodid=dv.periodid 
			inner join categoryoptioncombo cc on cc.categoryoptioncomboid = dv.categoryoptioncomboid
			WHERE de.uid IN ('eH9zY0hfRV3','huq7iUHYtul','DOWjzICXxPO','kHaxuud80Iz','kEm3tEgg5YR','dDfdyKx6DW7','XAUStBZV0IW','IvPaaBih3bF','YSDE4zFf5Ob','HwErS1poHJK','zicdEgAnnvR','fUYo1XpSvaP','iyApntrZChB','QRzYeR3peqk','gySgyHEZVC6','NbjDGOArQSo','dP4TK5eMwOg','fI9IcUQDNts','ewJCcRBef4i','uYBOcputH7v','kFkxtDL3NRo','cT1z2TrEZkY','xJWaQfr5gJd','s6695T588Ms','aN9nXtxd1Mi','xDR50YMouZc','Orm2CRiGKLj','Rgh944AdZ9O','u95coZipuwC','KCJmPxSzYN6','bvL8S73mvxc','IVBXQwOuPzT','pmVHW2vMOUm','Z3E6bDsYpFw','ulM7haN9NdC','ufYzfRnRkuh','lMdAXeNy8QD','rDmARJswjOq','xZowtHKl8lo','smwuXsfyyra','xkdYbBbKz1t','d6ycprwTEjQ','yZRzjIsqaux','hMSwwrTk4h1','R8mFWQdRtzg','uOxgt0QY2PD','Xh9Y2G6eHzn','RRVMtQDu80y','yDZIhuFaMpU','R1CzqINM52C','gj0nv9qKARs','WWIx4r2BVzx','jQjf10fZPTQ','mBZ4hpVtZaP','fePK3YQItlG','gyhLpZ4Dh0R','BmKeiveujwY','lIUy0jFAhJG','IXoIviMH84Z','wFMIC8LaeZE','Le2mo0VvI11','b5umAdxjoWB','gcmFSxfKECg','RACJs2tc7iX','fxA5Obzc9Cp','emXBlbUqEdu','yscjZhqUVrc','rHbbyr62qQf','FAgMbwTM4qS','rovJXxSD0nA','yA18U0CFZr9','OAZIquJBDUR','xby6s6CpPMZ','SC5DQ2Lh22L','e0mAl1Xe9rK','NfGChTX6nLo','FpmIyf2rkuM','JqfrxdCMqc8','thuYhpOv61J','x1NyquVWagC','pvK8kegxxWa','dcAfu7cERaO','lGiYtuL6ARl','SO1qdniaXIy','QRgAqANCiOl','QW87gYpLCD7','GgSLEZcgxXU','sL53HjxB5JX','LpD1GmX2JWs','emlcGeWeYoX','pgQdxOzqxEK','OINl6uGduUW','KVpILshPxRH','R5PRHo2takU','B6Dd3hSmRg3','OINl6uGduUW','kHaxuud80Iz','KVpILshPxRH','kEm3tEgg5YR','kEm3tEgg5YR','dDfdyKx6DW7','dDfdyKx6DW7','XAUStBZV0IW','XAUStBZV0IW','IvPaaBih3bF','IvPaaBih3bF','YSDE4zFf5Ob','YSDE4zFf5Ob','HwErS1poHJK','HwErS1poHJK','zicdEgAnnvR','zicdEgAnnvR','fUYo1XpSvaP','fUYo1XpSvaP','iyApntrZChB','iyApntrZChB','QRzYeR3peqk','gySgyHEZVC6','NbjDGOArQSo','xJWaQfr5gJd','s6695T588Ms','aN9nXtxd1Mi','KCJmPxSzYN6','uOxgt0QY2PD','uOxgt0QY2PD','Xh9Y2G6eHzn','Xh9Y2G6eHzn','RRVMtQDu80y','RRVMtQDu80y','yDZIhuFaMpU','yDZIhuFaMpU','dP4TK5eMwOg','dP4TK5eMwOg','fI9IcUQDNts','fI9IcUQDNts','ewJCcRBef4i','ewJCcRBef4i','uYBOcputH7v','uYBOcputH7v','kFkxtDL3NRo','kFkxtDL3NRo','cT1z2TrEZkY','cT1z2TrEZkY','xDR50YMouZc','xDR50YMouZc','Orm2CRiGKLj','Orm2CRiGKLj','Rgh944AdZ9O','Rgh944AdZ9O','u95coZipuwC','u95coZipuwC','bvL8S73mvxc','bvL8S73mvxc','IVBXQwOuPzT','IVBXQwOuPzT','pmVHW2vMOUm','pmVHW2vMOUm','Z3E6bDsYpFw','Z3E6bDsYpFw','ulM7haN9NdC','ulM7haN9NdC','ufYzfRnRkuh','ufYzfRnRkuh','lMdAXeNy8QD','rDmARJswjOq','xZowtHKl8lo','smwuXsfyyra','xkdYbBbKz1t','d6ycprwTEjQ','d6ycprwTEjQ','yZRzjIsqaux','yZRzjIsqaux','hMSwwrTk4h1','R8mFWQdRtzg', 'aUC5C7hOull', 'pSabV6ZeWrJ')			
			    AND cc.uid IN ('VHbljVQ8REF','tY82VK3LTQq','HllvX50cXC0','mG0zgFfA9iY','Rr0iLjh3jMJ','Ue7vG5utcCw','UI7DkNhm9XU','NC7JOLHRe5T','UDN5uuRl2Qo','oeGERZcEOu4','Io6eML2VLbX','PTEYHU5apTS','cPuNpsmWTo2','ZkJVJO8Olyh','MT01rz6ivPu','fRCpYwN3fLU','t26izMsLrrQ','miYO4IUVWEE','FxO4d1Kocws','cWnObDvqFoX','Zmm7xxXj4La','quo9r3fl0b9','oM13ECJcjv0','CoLj1vGPfZr','iLf93vDUcHF','CRk5QqUrAKx','kWEQlYXihOL','lidy03xkwd5','phy0eMHB3Hr','ernzEKhlLOk','O9AJbUxFf3W','HKTnr7EF6Yf','oLw5e5NKqpY','DLr4VIEGNIo','ZnztZgggxd6'
       )
	AND p.startdate BETWEEN '2021-01-01' AND '2021-01-31'
	AND periodtypeid = 3

	UNION 
	
	SELECT de.uid,cc.uid as ccombouid,dv.value,dv.sourceid,p.startdate
	FROM datavalue dv
	inner join dataelement de on de.dataelementid = dv.dataelementid
			INNER JOIN period p ON p.periodid=dv.periodid 
			inner join categoryoptioncombo cc on cc.categoryoptioncomboid = dv.categoryoptioncomboid
			WHERE de.uid IN ('fePK3YQItlG')			
        AND cc.uid IN ('HllvX50cXC0')
        AND CASE WHEN extract(month from  ?::date) BETWEEN 1 AND 3 THEN p.startdate BETWEEN (extract(year from  ?::date) -1 || '-04-01')::date AND ?
		WHEN extract(month from  ?::date) BETWEEN 4 AND 12 THEN p.startdate BETWEEN (extract(year from  ?::date) || '-04-01')::date AND ? END 

	)asd1

ON a1.organisationunitid = asd1.sourceid
)sag
GROUP BY sag.Circle,sag.District,sag.name,sag.td
order by sag.Circle,sag.District,sag.name