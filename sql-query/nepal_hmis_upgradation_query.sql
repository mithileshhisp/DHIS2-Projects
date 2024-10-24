-- delete all aggregated data and tracker data with metadata
-- 16/05/2024
select count(*) from datavalue; -- 171932759

select count(*) from datavalueaudit; -- 13018386

select count(*) from completedatasetregistration; -- 16461022

delete from datavalue;
delete from datavalueaudit;
delete from completedatasetregistration;
delete from audit; -- 33
delete from indicator; -- 853
delete from indicatorgroupmembers; -- 747
delete from datasetindicators; -- 154

delete from dataelement; -- 3982
delete from dataelementgroupmembers; -- 4336
delete from dataelementoperand; -- 4805
delete from datasetmembers; -- 2797
delete from datasetelement; -- 5941
delete from sectiongreyedfields; -- 1
delete from minmaxdataelement; -- 12061
delete from programstagedataelement; -- 36

delete from dataset; -- 123
delete from datasetsource; -- 659688
delete from interpretation; -- 548
delete from interpretation_comments; -- 779
delete from intepretation_likedby; -- 113
delete from datasetlegendsets; -- 1
delete from datasetnotification_datasets; -- 1
delete from section; -- 1

delete from program; -- 4
delete from program_attributes; -- 3
delete from program_userroles; -- 3
delete from programstage; --3
delete from program_organisationunits; --7
delete from programinstance; -- 3
delete from eventvisualization; -- 1
delete from eventvisualization_columns; -- 2
delete from eventvisualization_organisationunits; -- 1
delete from dashboarditem; -- 10883
delete from dashboard_items; -- 10877
delete from dashboarditem_reports; -- 81
delete from dashboarditem_users; -- 23
delete from dashboarditem_resources; -- 58
delete from section; -- 1

delete from trackedentityattribute; -- 4
delete from trackedentityattributevalue; -- 4
delete from trackedentitytypeattribute; -- 2

delete from optionset;-- 10
delete from optionvalue; -- 14423

delete from categoryoptioncombo;-- 59891
delete from categorycombos_optioncombos; -- 59891
delete from categoryoptioncombos_categoryoptions; -- 60433
delete from validationresult; -- 46486

delete from dataelementcategoryoption; -- 31654
delete from categories_categoryoptions; -- 29386
delete from categorydimension_items; -- 8695

delete from dataelementcategory; -- 53
delete from users_catdimensionconstraints; -- 212
delete from categorycombos_categories; -- 70
delete from categorydimension; -- 326
delete from visualization_categorydimensions; -- 326

delete from categorycombo; -- 54

delete from indicatorgroup; -- 31
delete from indicatorgroupsetmembers; -- 14
delete from configuration; -- 1

delete from indicatorgroupset; -- 4

-- 30/05/2024

select * from period
where startdate >= '2022-01-01' 
order by startdate desc; -- 531

select * from period
where startdate < '2022-01-01' 
order by startdate desc; -- 222

select count(*) from datavalue where 
periodid in ( select periodid from period
where startdate >= '2022-01-01'); -- 52556686

select count(*) from datavalueaudit where 
periodid in ( select periodid from period
where startdate >= '2022-01-01'); -- 6261915

select count(*) from completedatasetregistration where 
periodid in ( select periodid from period
where startdate >= '2022-01-01'); -- 5822443

select count(*) from datavalue where 
periodid not in ( select periodid from period
where startdate >= '2022-01-01'); -- 119376832 , 119376832 

delete from datavalue where 
periodid not in ( select periodid from period
where startdate >= '2022-01-01'); -- 119376832 , 119376832 

select count(*) from datavalueaudit where 
periodid not in ( select periodid from period
where startdate >= '2022-01-01'); -- 6756473

delete from datavalueaudit where 
periodid not in ( select periodid from period
where startdate >= '2022-01-01'); -- 6756473

select count(*) from completedatasetregistration where 
periodid not in ( select periodid from period
where startdate >= '2022-01-01');

delete from completedatasetregistration where 
periodid not in ( select periodid from period
where startdate >= '2022-01-01'); -- 10638579

select count(*) from datavalue where 
periodid in ( select periodid from period
where startdate >= '2022-01-01') and dataelementid in (
29598005,29598004,29598406,29597936); -- 756

select * from dataelement where uid in 
('Qkvjn2q97YT', 'H5jyPNkebXO','tzULdcen3g7','AA84bnSbUgL');


select count(*) from dataelementcategoryoption;

select * from dataelementcategory where uid =
'zvC3DOg0Ts4';

select count(*) from categories_categoryoptions
where categoryid = 18332385

select * from  dataelementcategoryoption
where categoryoptionid in ( select categoryoptionid from 
categories_categoryoptions
where categoryid = 18332385)

select * from categoryoptioncombo where 
categoryoptioncomboid = 52241

select * from datavalue where 
categoryoptioncomboid = 52241

select * from datavalue where 
attributeoptioncomboid = 52241

delete from datavalueaudit where attributeoptioncomboid
= 52261;

select count(*) from datavalueaudit where attributeoptioncomboid
in

select * from datavalueaudit where 
categoryoptioncomboid = 52261

select * from datavalueaudit where 
attributeoptioncomboid = 52261

-- delete duplicate default coc 28/08/2024 29/08/2024 production database
delete from categoryoptioncombo where categoryoptioncomboid = 7226795;

delete from categorycombos_optioncombos
where categoryoptioncomboid = 7226795;

delete from categoryoptioncombos_categoryoptions
where categoryoptioncomboid = 7226795;

select * from categoryoptioncombo where name = 'default'

select * from categoryoptioncombo where name = '1A00 Cholera'


delete from categoryoptioncombo where categoryoptioncomboid = 17875949; 

-- delete categorycombo not in used 'NtPHEnijTbP' -- ICD 1x
select * from categorycombo where uid = 'NtPHEnijTbP';

select * from dataset where categorycomboid = 17144980;
update dataset set categorycomboid = 15 where
datasetid = 16306876;

delete from categorycombo where categorycomboid = 17144980;


-- delete from datasetsource for closed datasets-- 30/08/2024

delete from datasetsource where datasetid in ();

-- user details 30/08/2024 

select userinfoid,uid,surname,firstname,username, 
lastlogin, EXTRACT(year FROM AGE(current_date,lastlogin::date))::int,disabled
from userinfo where lastlogin is not null 
and EXTRACT(year FROM AGE(current_date,lastlogin::date))::int <2; -- 2514

-- user list not login from last 2 years 04/09/2024
select userinfoid,uid,surname,firstname,username, 
lastlogin, EXTRACT(year FROM AGE(current_date,lastlogin::date))::int,disabled
from userinfo 
where EXTRACT(year FROM AGE(current_date,lastlogin::date))::int >=2; -- 566


select userinfoid,uid,surname,firstname,username, 
lastlogin, EXTRACT(year FROM AGE(current_date,lastlogin::date))::int,disabled
from userinfo where lastlogin is null; -- 9267

where lastlogin is null;

EXTRACT(year FROM AGE(current_date,lastlogin::date))::int

select * from userinfo; -- 12347

update userinfo set disabled = true where username = 'admin';

="update userinfo set disabled = true where userinfoid = "&A2&" and uid = '"&B2&"';"
="update userinfo set disabled = false where userinfoid = "&A2&" and uid = '"&B2&"';" -- 01/09/2024

-- dashboard related details -- 3108/2024
select * from dashboard;-- 10058

select * from dashboarditem; -- 13928

select * from dashboard where dashboardid 
not in ( select dashboardid from dashboard_items); -- 1266

select * from dashboard where dashboardid 
in ( select dashboardid from dashboard_items)
order by lastupdated desc; -- 8792


-- user list not login from last 6 months 04/09/2024
select userinfoid,uid,surname,firstname,username, lastlogin, 
EXTRACT(year FROM AGE(current_date,lastlogin::date))::int,disabled
from userinfo 
where EXTRACT(month FROM AGE(current_date,lastlogin::date))::int >= 6
order by lastlogin desc;


-- dashboard list and its items with map,eventreport,visualization etc 04/09/2024
select das.name AS dashboard_name, ma.name AS map_name,
evrep.name AS event_report_name, vis.name AS visualization_name,
dasitem.shape from dashboard das 
INNER JOIN dashboard_items das_item ON das_item.dashboardid = das.dashboardid
INNER JOIN dashboarditem dasitem ON dasitem.dashboarditemid = das_item.dashboarditemid
LEFT JOIN map ma ON ma.mapid = dasitem.mapid
LEFT JOIN eventreport evrep ON evrep.eventreportid = dasitem.eventreport
LEFT JOIN visualization vis ON vis.visualizationid = dasitem.visualizationid
order by das.lastupdated desc;