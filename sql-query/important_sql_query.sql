
-- organisationunit with parent
-- analytics table list


select table_name from information_schema.tables where table_name like 'analytics%' 
and table_type = 'BASE TABLE'

-- resource table list
select table_name, table_type from information_schema.tables where table_name like '_%' 
and table_type = 'BASE TABLE'


select parent.name parentName,	org.organisationunitid, org.uid, org.code, org.name, org.shortname, 
org.parentid,org.hierarchylevel from  organisationunit org
INNER JOIN organisationunit parent on parent.organisationunitid = org.parentid
where org.hierarchylevel = 2; 

select org.organisationunitid, org.uid, org.code, org.name, org.shortname, 
org.hierarchylevel, parent.name parentName,org.parentid,parent.uid 
from organisationunit org
INNER JOIN organisationunit parent on parent.organisationunitid = org.parentid
where org.hierarchylevel = 4;

select org.organisationunitid, org.uid orgUID, org.code orgCode, org.name orgName, org.shortname, 
org.hierarchylevel, parent.name parentName, parent.parentid, parent.uid parentUID ,parent.code parentCode,
parent.hierarchylevel parenthierarchylevel
from organisationunit org
INNER JOIN organisationunit parent on parent.organisationunitid = org.parentid
where org.hierarchylevel = 4;

select parent.organisationunitid parentID, parent.uid parentUID,parent.name parentName, 
org.organisationunitid, org.uid orgUID, org.name orgName, org.shortname orgShortName, org.hierarchylevel orgLevel,
parent.hierarchylevel parentLevel from  organisationunit org
INNER JOIN organisationunit parent on parent.organisationunitid = org.parentid
where parent.hierarchylevel = 3 order by parent.name; 

select org.organisationunitid, org.uid, org.code, org.name, org.shortname, 
org.parentid,org.hierarchylevel, parent.name parentName, parent.uid parentUID,
parent.hierarchylevel parenHierarchylevel from  organisationunit org
INNER JOIN organisationunit parent on parent.organisationunitid = org.parentid
where org.hierarchylevel = 2;

select org.organisationunitid, org.uid, org.code, org.name, 
org.shortname, org.parentid,org.hierarchylevel,parent.name parentName, parent.uid parentUID,
parent.hierarchylevel parenHierarchylevel from organisationunit org
INNER JOIN organisationunit parent on parent.organisationunitid = org.parentid
where org.hierarchylevel = 3 order by parent.name; 

-- levelwise orgUnitList
select
ou1.uid as Level1uid1, ou1.organisationunitid as Level1Id , max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as Level2Id , max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as Level3Id, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as Level4Id, max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid as Level5Id, max(ou5.name) as Level5Name,
ou6.uid as Level6uid6, ou6.organisationunitid as Level6Id , max(ou6.name) as Level6Name
from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT  join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid,ou6.uid,ou6.organisationunitid;


-- mysql


SELECT * FROM PERIOD WHERE periodtypeid = 3 ORDER BY startdate DESC;

SELECT startdate, 
SUBSTRING_INDEX(startdate,'-', 2) AS STRING 
FROM PERIOD WHERE periodtypeid = 3 ORDER BY startdate DESC;

SELECT startdate, SUBSTRING_INDEX(startdate,'-', 2) AS STRING , 
SUBSTRING_INDEX(SUBSTRING_INDEX(startdate, '-', 2), '-', -1) AS STRING
FROM PERIOD WHERE periodtypeid = 3 ORDER BY startdate DESC;

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('2021-11-01', '-', 2), '-', -1) AS JoiningMonth

SELECT startdate, SUBSTRING_INDEX(startdate,'-', 1) AS STRING , 
SUBSTRING_INDEX(SUBSTRING_INDEX(startdate, '-', 2), '-', -1) AS STRING
FROM `period` WHERE periodtypeid = 3 ORDER BY startdate DESC;

SELECT startdate, 
CONCAT(SUBSTRING_INDEX(startdate,'-', 1),SUBSTRING_INDEX(SUBSTRING_INDEX(startdate, '-', 2), '-', -1) ) AS STRING
FROM `period` WHERE periodtypeid = 3 ORDER BY startdate DESC;

-- jan 2021 - 417

--
dataelements list with data-sets with categoryUID,categoryID ,categoryName categoryoptioncomboid categoryoptioncomboname 
categoryoptioncomboUID for 2.7

SELECT ds.name,de.dataelementid AS deid,de.uid AS deUID,de.name AS deName,cc.uid AS categoryUID,
cc.name AS categoryName,coc.categoryoptioncomboid AS categoryoptioncomboid,coc.uid AS categoryoptionUID,cocname.categoryoptioncomboname AS categoryOptionName
FROM dataelement  AS de  
INNER JOIN categorycombo AS cc ON cc.categorycomboid = de.categorycomboid 
INNER JOIN categorycombos_optioncombos AS cc_coc ON cc_coc.categorycomboid = de.categorycomboid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
INNER JOIN _categoryoptioncomboname AS cocname ON coc.categoryoptioncomboid = cocname.categoryoptioncomboid
INNER JOIN datasetmembers dsm ON dsm.dataelementid = de.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dsm.datasetid
GROUP BY de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
ORDER BY de.name,cc.name,cocname.categoryoptioncomboname;

//

select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.categorycomboid,cc.uid as categoryUID, 
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,
cocname.categoryoptioncomboname as categoryOptionName from dataelement as de 
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid 
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid 
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid 
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,cc.categorycomboid,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname 
order by de.name,cc.name,cocname.categoryoptioncomboname




select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.categoryid as categoryID,cc.uid as categoryUID, cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionName from dataelement as de inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid group by de.dataelementid,de.uid,cc.uid,cc.categoryid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname order by de.name,cc.name,cocname.categoryoptioncomboname

select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.categoryid as categoryID,cc.uid as categoryUID, cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionName from dataelement as de inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid group by de.dataelementid,de.uid,cc.uid,cc.categoryid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname order by de.name,cc.name,cocname.categoryoptioncomboname

-- for datavalue of HP 2.7 my-sql

SELECT de.uid AS dataElementUID,dv.dataelementid, dv.periodid, dv.sourceid, org.uid AS organisationunitUID, 
dv.categoryoptioncomboid, coc.uid AS ategoryoptioncomboUID, dv.value, dv.lastupdated FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.periodid = 385;

-- HP -2.7 mysql datavalue query with isoperiod

SELECT de.uid AS dataElementUID, coc.uid AS categoryoptioncomboUID, org.uid AS organisationunitUID, 
dv.value AS dataValue, dv.lastupdated AS lastUpdated , dv.storedby AS storedBy , 
CONCAT(SUBSTRING_INDEX(pe.startdate,'-', 1),SUBSTRING_INDEX(SUBSTRING_INDEX(pe.startdate, '-', 2), '-', -1) ) AS isoPeriod
FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN `period` pe ON pe.periodid = dv.periodid
WHERE dv.periodid = 417 and dv.dataelementid in ( 5978,6073,6028,6081,130,6053,12,10,3,4,6091,7,
6080,6118,6024,6054,1485,6124,68,6078,5954,6233,5953,6038,6040,6037,6070,5976,62,6228,6001,6088,
6018);

--- 31/05/2023
select pi.programindicatorid, pi.uid programindicatorUID,pi.name 
programindicatorName,pb.periodboundaryid, pb.uid, pb.created, 
pb.lastupdated, pb.boundarytarget, pb.analyticsperiodboundarytype from periodboundary pb
INNER JOIN programindicator pi ON pi.programindicatorid = pb.programindicatorid
order by pi.programindicatorid;


select prg.name prgName,prg.uid prgUID,pi.programindicatorid, 
pi.uid programindicatorUID,pi.name programindicatorName,
pi.expression,pi.filter,pi.aggregationtype,pi.analyticstype,
pb.periodboundaryid, pb.uid, pb.boundarytarget, 
pb.analyticsperiodboundarytype from periodboundary pb
INNER JOIN programindicator pi ON pi.programindicatorid = pb.programindicatorid
INNER JOIN program prg ON prg.programid = pi.programid
order by pi.programindicatorid;

adding date column in sql query making in excel

=TEXT(F2,"yyyy-MM-DD")

=TEXT(F2,"yyyy-MM-DD HH-MM-SS")



-- datavalue query / update datavalue query

select (value::NUMERIC / 10) from datavalue

SELECT 16000::NUMERIC / 7500 col ,ceil(16000::NUMERIC / 7500)

select round(value ::decimal / 10 ) from datavalue;

select round(value ::decimal / 10 ) from datavalue;

update datavalue as dv1 set value = ( select round(dv2.value ::decimal / 10 ) 
from datavalue as dv2 where dv1.dataelementid
= dv2.dataelementid and value is not null );

begin;
DELETE FROM trackedentitydatavalue
 WHERE programstageinstanceid in (
            select programstageinstanceid 
            from programstageinstance 
            where programstageid in (
                        select programstageid 
                        from programstage 
                        where uid = 'DQCCgUfyDTR'
                        )
                );
DELETE FROM programstageinstance
 WHERE programstageid in (
            select programstageid from programstage where uid = 'DQCCgUfyDTR'
            );
commit; 


SELECT  dataelement.dataelementid,dataelement.name, dataelement.uid as dataElement_Uid,categories_categoryoptions.categoryoptionid, dataelementcategoryoption.name,dataelementcategoryoption.uid as dataelementcategoryoption_uid from dataelement
INNER JOIN categorycombos_categories ON categorycombos_categories.categorycomboid = dataelement.categorycomboid
INNER JOIN categories_categoryoptions ON categories_categoryoptions.categoryid = categorycombos_categories.categoryid
INNER JOIN dataelementcategoryoption ON dataelementcategoryoption.categoryoptionid = categories_categoryoptions.categoryoptionid

order by dataelement.dataelementid;


SELECT  dataelement.dataelementid,dataelement.name, categories_categoryoptions.categoryoptionid, dataelementcategoryoption.name from dataelement
INNER JOIN categorycombos_categories ON categorycombos_categories.categorycomboid = dataelement.categorycomboid
INNER JOIN categories_categoryoptions ON categories_categoryoptions.categoryid = categorycombos_categories.categoryid
INNER JOIN dataelementcategoryoption ON dataelementcategoryoption.categoryoptionid = categories_categoryoptions.categoryoptionid
order by dataelement.dataelementid;

SELECT _categoryoptioncomboname.categoryoptioncomboid, categoryoptioncombo.uid,  _categoryoptioncomboname.categoryoptioncomboname FROM _categoryoptioncomboname
INNER JOIN categoryoptioncombo ON categoryoptioncombo.categoryoptioncomboid = _categoryoptioncomboname.categoryoptioncomboid;



SELECT distinct (dataelement.dataelementid),dataelement.name
as deName, categories_categoryoptions.categoryoptionid, dataelementcategoryoption.name from dataelement
INNER JOIN categorycombos_categories ON categorycombos_categories.categorycomboid = dataelement.categorycomboid
INNER JOIN categories_categoryoptions ON categories_categoryoptions.categoryid = categorycombos_categories.categoryid
INNER JOIN dataelementcategoryoption ON dataelementcategoryoption.categoryoptionid = categories_categoryoptions.categoryoptionid
INNER JOIN datasetelement  ON  datasetelement.dataelementid = dataelement.dataelementid where dataelement.dataelementid in 
( select datasetelement.dataelementid from datasetelement where datasetelement.datasetid = 6191 )
order by dataelement.dataelementid


-- categorycombo and categoryoptioncombo map

SELECT cc.uid as categorycombo_uid,cc.categorycomboid as categorycomboid,cc.name as categorycombo_name, _categoryoptioncomboname.categoryoptioncomboid, categoryoptioncombo.uid,  _categoryoptioncomboname.categoryoptioncomboname 
FROM _categoryoptioncomboname
INNER JOIN categoryoptioncombo ON categoryoptioncombo.categoryoptioncomboid = _categoryoptioncomboname.categoryoptioncomboid
INNER JOIN categorycombos_optioncombos coc_cc ON coc_cc.categoryoptioncomboid = categoryoptioncombo.categoryoptioncomboid
INNER JOIN categorycombo cc ON cc.categorycomboid = coc_cc.categorycomboid;



--final categorycombo name uid query

SELECT _categoryoptioncomboname.categoryoptioncomboid, categoryoptioncombo.uid,  
_categoryoptioncomboname.categoryoptioncomboname FROM _categoryoptioncomboname
INNER JOIN categoryoptioncombo ON categoryoptioncombo.categoryoptioncomboid = 
_categoryoptioncomboname.categoryoptioncomboid;

select * from categorycombos_optioncombos


select dse.*,ccombo.categoryoptioncomboid from datasetelement dse
INNER JOIN categorycombos_optioncombos ccombo on ccombo.categorycomboid = dse.categorycomboid
where dse.datasetid=6191


-- dataelement-category-and combination


select de.dataelementid as dataElementID,de.uid as dataElementUID,de.name as dataElementName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionComboName
from dataelement as de
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
order by de.name,cc.name,cocname.categoryoptioncomboname

select de.dataelementid as dataElementID,de.uid as dataElementUID,de.name as dataElementName, cc.categorycomboid
as categoryComboID, cc.uid as categoryComboUID, cc.name as categoryCOMBOName, coc.categoryoptioncomboid 
as categoryoptioncomboid,coc.uid as categoryOptionComboUID,cocname.categoryoptioncomboname as 
categoryOptionComboName from dataelement as de
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
where de.domaintype = 'AGGREGATE' group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,cc.categorycomboid,
coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname order by de.name,cc.name,cocname.categoryoptioncomboname

select de.dataelementid as dataElementID,de.uid as dataElementUID,de.name as dataElementName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionComboName
from dataelement as de
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
INNER JOIN datasetelement dse ON dse.dataelementid = de.dataelementid
WHERE dse.datasetid = 940
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
order by de.name,cc.name,cocname.categoryoptioncomboname


-- catrgory-combo-and category-and option dataset-element-wise

SELECT ds.datasetid as dataSetId, ds.uid as datasetUID, ds.name ad datasetName,de.dataelementid as dataElementID,
de.uid as dataElementUID,de.name as dataElementName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryOptionComboUID,
cocname.categoryoptioncomboname as categoryOptionComboName from datasetelement dse
INNER JOIN dataelement de ON de.dataelementid = dse.dataelementid
inner join categorycombo as cc on cc.categorycomboid = dse.categorycomboid
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = dse.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
INNER JOIN dataset ds on ds.datasetid = dse.datasetid
group by ds.datasetid,ds.uid,ds.name,de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
order by ds.name,de.name,cc.name,cocname.categoryoptioncomboname;





// catrgory-combo-and category-and option

SELECT cat_catoption.categoryid, cat_catoption.categoryoptionid, catCombo.categorycomboid,deCateOption.name
FROM public.categories_categoryoptions cat_catoption
INNER JOIN categorycombos_categories catCombo ON catCombo.categoryid = cat_catoption.categoryid
INNER JOIN dataelementcategoryoption deCateOption ON deCateOption.categoryoptionid = cat_catoption.categoryoptionid
where catCombo.categorycomboid in( 588773,52240, 588773);


// dataElement category categoryoptioncombo

select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.uid as categoryUID, 
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionComboUID,
cocname.categoryoptioncomboname as categoryOptionComboName from dataelement as de 
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid 
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid 
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid 
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname 
order by de.name,cc.name,cocname.categoryoptioncomboname



select ds.name dataSetName ,de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionName
from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
inner join datasetelement dsm on dsm.dataelementid = de.dataelementid
inner join dataset ds on ds.datasetid = dsm.datasetid 
order by de.name,cc.name,cocname.categoryoptioncomboname;


// attribute-option-combo

select coc.categoryoptioncomboid, coc.name,coc.uid from categoryoptioncombo coc
INNER JOIN categorycombos_optioncombos coc_co ON coc_co.categoryoptioncomboid = coc.categoryoptioncomboid
INNER JOIN categorycombo co ON co.categorycomboid = coc_co.categorycomboid
where co.datadimensiontype = 'ATTRIBUTE';

// dataSet wise dataElement list
select ds.name as dataSetName, ds.uid as dataSetUid, de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionComboUID,cocname.categoryoptioncomboname as categoryOptionComboName
from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
inner join datasetelement dsm on dsm.dataelementid = de.dataelementid
inner join dataset ds on ds.datasetid = dsm.datasetid
order by ds.name,cc.name,cocname.categoryoptioncomboname;




// dataSet element

select ds.uid dataSetUid, ds.name dataSetNane,dse.datasetid, dse.dataelementid, 
de.uid dataElementUID,de.name dataElementName from datasetelement dse
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN dataelement de ON de.dataelementid = dse.dataelementid
where ds.uid in ( 'FZB9SiMP6fz', 'Ph5eqU5w5V2', 'JrewIoPYAsH', 'DCoyvS9Cp80', 'GFGJt9m7zSh');


	
select ds.uid dataSetUid, ds.name dataSetNane,dse.datasetid, dse.dataelementid, 
de.uid dataElementUID,de.name dataElementName, dse.categorycomboid from datasetelement dse
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN dataelement de ON de.dataelementid = dse.dataelementid
order by ds.name;	

// datasetindicator

select dsi.indicatorid indicatorID, ind.uid as indicatorUID, ind.name indicatorName, 
dsi.datasetid dsID, ds.uid as dataSetUID, ds.name dataSetName from datasetindicators dsi
INNER JOIN indicator ind ON ind.indicatorid = dsi.indicatorid
INNER JOIN dataset ds ON ds.datasetid = dsi.datasetid
order by ds.name;

// hp-2.29 SQL-view Query

select organisationunitid,name,parentid,uid from organisationunit;

//  - ou parent
select ou.uid as ouuid, ou.name,parent.uid as parentuid, parent.name as parentname, concat(ou.uid,'-',parent.uid)
from organisationunit ou
left join organisationunit parent on parent.organisationunitid = ou.parentid
group by ou.organisationunitid, parent.uid, parent.name


select ou.uid as ouuid, ou.name, parent.uid as parentuid, parent.name as parentname, 
ou.hierarchylevel ouLevel, concat(ou.uid,'-',parent.uid) from organisationunit ou
left join organisationunit parent on parent.organisationunitid = ou.parentid
group by ou.organisationunitid,parent.uid,parent.name order by ou.hierarchylevel desc;


select ou.uid as ouuid, ou.name, parent.uid as parentuid, parent.name as parentname, 
grandparent.uid AS grandparentuid, grandparent.name AS grandparentName,
ou.hierarchylevel ouLevel, concat(grandparent.name, '-' , parent.name , '-', ou.name) from organisationunit ou
left join organisationunit parent on parent.organisationunitid = ou.parentid
left join organisationunit grandparent on grandparent .organisationunitid = parent.parentid
where ou.hierarchylevel = 6
group by ou.organisationunitid,parent.uid,parent.name,grandparent.uid,grandparent.name
order by ou.hierarchylevel desc;

select ou.uid as ouuid, ou.name, parent.uid as parentuid, parent.name as parentname, 
grandparent.uid AS grandparentuid, grandparent.name AS grandparentName,
ou.hierarchylevel ouLevel, concat(grandparent.name, '-' , ou.name) from organisationunit ou
left join organisationunit parent on parent.organisationunitid = ou.parentid
left join organisationunit grandparent on grandparent .organisationunitid = parent.parentid
where ou.hierarchylevel = 6
group by ou.organisationunitid,parent.uid,parent.name,grandparent.uid,grandparent.name
order by ou.hierarchylevel desc;


select ou.organisationunitid orgUnitId, ou.uid orgUID, ou.name, parent.uid parentUID, 
parent.organisationunitid parentID ,parent.name as parentname, concat(ou.uid,'-',parent.uid)
from organisationunit ou
left join organisationunit parent on parent.organisationunitid = ou.parentid
group by ou.organisationunitid,parent.uid,parent.name



// dataelements list with data-sets with categoryUID,categoryID ,categoryName categoryoptioncomboid categoryoptioncomboname 
categoryoptioncomboUID

select string_agg(ds.name,chr(10)),de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionComboUID,cocname.categoryoptioncomboname as categoryOptionComboName
from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
inner join datasetelement dsm on dsm.dataelementid = de.dataelementid
inner join dataset ds on ds.datasetid = dsm.datasetid
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
order by de.name,cc.name,cocname.categoryoptioncomboname;

// select ds.name as dataSetName, ds.uid as dataSetUid, de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionComboUID,cocname.categoryoptioncomboname as categoryOptionComboName
from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
inner join datasetelement dsm on dsm.dataelementid = de.dataelementid
inner join dataset ds on ds.datasetid = dsm.datasetid
order by ds.name,cc.name,cocname.categoryoptioncomboname;




// dataelements list with data-sets with categoryUID,categoryID ,categoryName categoryoptioncomboid categoryoptioncomboname 
categoryoptioncomboUID for 2.7

SELECT ds.name,de.dataelementid AS deid,de.uid AS deUID,de.name AS deName,cc.uid AS categoryUID,
cc.name AS categoryName,coc.categoryoptioncomboid AS categoryoptioncomboid,coc.uid AS categoryoptionUID,cocname.categoryoptioncomboname AS categoryOptionName
FROM dataelement  AS de  
INNER JOIN categorycombo AS cc ON cc.categorycomboid = de.categorycomboid 
INNER JOIN categorycombos_optioncombos AS cc_coc ON cc_coc.categorycomboid = de.categorycomboid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
INNER JOIN _categoryoptioncomboname AS cocname ON coc.categoryoptioncomboid = cocname.categoryoptioncomboid
INNER JOIN datasetmembers dsm ON dsm.dataelementid = de.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dsm.datasetid
GROUP BY de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
ORDER BY de.name,cc.name,cocname.categoryoptioncomboname;

// de with coc list

select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.categorycomboid,cc.uid as categoryUID, 
cc.name as categoryName,coc.categoryoptioncomboid as categoryOptionComboid,coc.uid as categoryOptionComboUID,
coc.name as categoryOptionComboName from dataelement as de 
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid 
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid 
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid 
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,cc.categorycomboid,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname 
order by de.name,cc.name,cocname.categoryoptioncomboname;


-- period wise some datavalue

SELECT de.uid AS dataElementUID, coc.uid AS categoryoptioncomboUID, org.uid AS organisationunitUID, 
SUM( cast( dv.value as numeric) ) FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN period pe ON pe.periodid = dv.periodid
WHERE dv.periodid in ( select periodid from period where periodtypeid = 8 
and startdate >= '2017-04-01' and enddate <='2018-03-31') and de.uid in (
'jRuV3gFk8oL','N5qx0mV9BHN') GROUP BY de.uid,coc.uid ,org.uid;

--

SELECT de.name AS dataElementName, coc.name AS categoryoptioncomboName, org.name AS organisationunitName, 
org.uid AS organisationunitUID,SUM( cast( dv.value as numeric) ) FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN period pe ON pe.periodid = dv.periodid
WHERE dv.periodid in ( select periodid from period where periodtypeid = 8 
and startdate >= '2019-04-01' and enddate <='2020-03-31') and de.uid in ('jRuV3gFk8oL','N5qx0mV9BHN')
GROUP BY de.name,coc.name ,org.uid,org.name;




select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.categoryid as categoryID,cc.uid as categoryUID, cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionName from dataelement as de inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid group by de.dataelementid,de.uid,cc.uid,cc.categoryid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname order by de.name,cc.name,cocname.categoryoptioncomboname

select de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.categoryid as categoryID,cc.uid as categoryUID, cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionUID,cocname.categoryoptioncomboname as categoryOptionName from dataelement as de inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid group by de.dataelementid,de.uid,cc.uid,cc.categoryid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname order by de.name,cc.name,cocname.categoryoptioncomboname
 -- for datavalue of HP 2.7 my-sql

SELECT de.uid AS dataElementUID,dv.dataelementid, dv.periodid, dv.sourceid, org.uid AS organisationunitUID, 
dv.categoryoptioncomboid, coc.uid AS ategoryoptioncomboUID, dv.value, dv.lastupdated FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.periodid = 385;

-- HP -2.7 mysql datavalue query with isoperiod

SELECT de.uid AS dataElementUID, coc.uid AS categoryoptioncomboUID, org.uid AS organisationunitUID, 
dv.value AS dataValue, dv.lastupdated AS lastUpdated , dv.storedby AS storedBy , 
CONCAT(SUBSTRING_INDEX(startdate,'-', 1),SUBSTRING_INDEX(SUBSTRING_INDEX(startdate, '-', 2), '-', -1) ) AS isoPeriod
FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN `period` pe ON pe.periodid = dv.periodid
WHERE dv.periodid = 417 and dv.dataelementid in ( 5978,6073,6028,6081,130,6053,12,10,3,4,6091,7,
6080,6118,6024,6054,1485,6124,68,6078,5954,6233,5953,6038,6040,6037,6070,5976,62,6228,6001,6088,
6018);


-- datavalue query

SELECT de.valuetype, de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID, dv.value, 
dv.storedby,dv.periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.attributeoptioncomboid = 3996518 and dv.periodid = 3974457;


// atm datavalue query

SELECT de.valuetype, de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, attcoc.uid AS attributeOptionComboUID,
org.uid AS organisationunitUID, dv.value, dv.periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
WHERE dv.periodid = 10225460 and org.uid = 'iUAqcdUW1WD' and ds.uid = 'ad3DGuQmgQi';

-- dataValue query

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
where datasetid = 4012560);


SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null;


 -- yearly datavalue
 
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('xl4EXfRMBrK','evXyDr6c7eu','evXyDr6c7eu') 
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;

-- with coc
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in( 'EnQPW5xZDPX') and coc.uid in ('Ei6fwK40fzN','grw5pufOjWU')
and dv.value is not null and dv.deleted = false;

-- include datavalue comment and datavalue NULL
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value,dv.comment dataValueComment, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid in ('xl4EXfRMBrK','evXyDr6c7eu','evXyDr6c7eu') 
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and  dv.deleted = false order by pe.startdate;


SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE ds.uid in ('m4Hy2QZbW9p', 'c8Q3QiX5He3') and org.uid = 'eNKiuyk8bOB'
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;

SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, org.uid AS organisationunitUID,
org.name AS organisationunitName,dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE ds.uid in ('m4Hy2QZbW9p', 'c8Q3QiX5He3') 
and pe.startdate >= '2019-01-01' and pe.enddate <= '2021-12-31'
and dv.value is not null and dv.deleted = false order by pe.startdate;

select distinct ( dv.periodid ),pe.startdate,split_part(pe.startdate::TEXT,'-', 1) as year
,pe.enddate, split_part(pe.enddate::TEXT,'-', 2) as month,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod, pe.periodtypeid from datavalue dv 
inner join period pe ON pe.periodid = dv.periodid
where attributeoptioncomboid = 3996518 order by pe.periodtypeid;


SELECT de.valuetype, de.uid AS dataElementUID, coc.uid AS categoryOptionComboUID, attcoc.uid AS attributeOptionComboUID,
org.uid AS organisationunitUID, dv.value, dv.storedby, split_part(pe.startdate::TEXT,'-', 1) as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
WHERE  ds.uid = 'jiu1tOn9kTi' and dv.value is not null;



-- complusery_count_dataElements_for dataStatus app

select dse.datasetelementid from datasetelement dse
INNER JOIN categorycombos_optioncombos ccombo on ccombo.categorycomboid = dse.categorycomboid
where dse.datasetid='${datasetelementid}'

 -- relationship query   
---- relationshipitem, relationship

select relationshipitemid, trackedentityinstanceid from relationshipitem where 
trackedentityinstanceid in ( 356957 );

select relationshipitemid, trackedentityinstanceid from relationshipitem where relationshipitemid in(
select to_relationshipitemid from relationship where from_relationshipitemid in(
select relationshipitemid from relationshipitem where 
trackedentityinstanceid in ( 356957 ) ));

-- final query	
select rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid	
where rel1.trackedentityinstanceid in ( 356957 )
order by rel1.trackedentityinstanceid;	


-- tei list bsed on event programstageinstance

SELECT tei.uid AS tei_uid, pi.uid AS enrollment_uid, psi.uid AS event_uid 
from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where prg.uid = 'L78QzNqadTV' and ps.uid = 'xYcDpATOc1y' 
and org.uid = 'vXdngpv3PzI' and psi.executiondate::date >= '2022-01-01' 
and psi.executiondate::date <= '2022-12-31';

-- unique tei list bsed on event programstageinstance

SELECT distinct(tei.uid) AS tei_uid from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where prg.uid = 'L78QzNqadTV' and ps.uid = 'xYcDpATOc1y' 
and org.uid = 'vXdngpv3PzI' and psi.executiondate::date >= '2022-01-01' 
and psi.executiondate::date <= '2022-12-31';

SELECT distinct(tei.uid) AS tei_uid from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where prg.uid = 'L78QzNqadTV' and ps.uid in( 'xYcDpATOc1y' )
and org.uid = 'vXdngpv3PzI' and psi.executiondate::date >= '2022-01-01' 
and psi.executiondate::date <= '2022-12-31';

SELECT distinct(tei.uid) AS tei_uid from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where prg.uid = 'L78QzNqadTV' and ps.uid in( 'xYcDpATOc1y' )
and org.path like '%cCTQiGkKcTk%' and psi.executiondate::date >= '2022-01-01' 
and psi.executiondate::date <= '2022-12-31';


-- tei list bsed on program

SELECT tei.uid tei_uid,tei.trackedentityinstanceid, tei.created tei_created,
tei.lastupdated tei_lastupdated,pi.enrollmentdate pi_enrollmentdate from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'SuvMxhyPK5l' and pi.enrollmentdate::date != tei.created::date;

SELECT tei.uid tei_uid,tei.trackedentityinstanceid, tei.created tei_created,
tei.lastupdated tei_lastupdated,pi.enrollmentdate pi_enrollmentdate from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'SuvMxhyPK5l' and pi.enrollmentdate::date != tei.created::date;


// Query for Levelwise OrgUnit

SELECT organisationunitid, organisationunituid, level, idlevel1, uidlevel1, 
       idlevel2, uidlevel2, idlevel3, uidlevel3, idlevel4, uidlevel4, 
       idlevel5, uidlevel5, idlevel6, uidlevel6, idlevel7, uidlevel7
  FROM _orgunitstructure;


SELECT organisationunit.organisationunitid, organisationunit.name, organisationunit.shortname, organisationunit.uid, organisationunit.code FROM organisationunit 
INNER JOIN _orgunitstructure ON _orgunitstructure.organisationunitid = organisationunit.organisationunitid
and _orgunitstructure.level = 4;


select ou.organisationunitid orgUnitId, ou.uid orgUID, ou.name, parent.uid parentUID, 
parent.organisationunitid parentID ,parent.name as parentname, concat(ou.uid,'-',parent.uid)
from organisationunit ou
left join organisationunit parent on parent.organisationunitid = ou.parentid
group by ou.organisationunitid,parent.uid,parent.name



SELECT ou1.name, _orgunitstructure.idlevel1, _orgunitstructure.uidlevel1,  
ou2.name,_orgunitstructure.idlevel2, _orgunitstructure.uidlevel2, 
ou3.name,_orgunitstructure.idlevel3, _orgunitstructure.uidlevel3,
ou4.name,_orgunitstructure.idlevel4, _orgunitstructure.uidlevel4
FROM _orgunitstructure 
left JOIN organisationunit ou1 ON ou1.uid = _orgunitstructure.uidlevel1
left JOIN organisationunit ou2 ON ou2.uid = _orgunitstructure.uidlevel2
left JOIN organisationunit ou3 ON ou3.uid = _orgunitstructure.uidlevel3
left JOIN organisationunit ou4 ON ou4.uid = _orgunitstructure.uidlevel4
where level < 5
order by level;


-- user import query

-- ui.firstname, ui.surname, us.username,
select 	us.uid userUID,ui.firstname, ui.surname, us.username, 
ui.uid userinfoUID  from userinfo ui
INNER JOIN users us ON us.userid = ui.userinfoid;


select 	ui.firstname, ui.surname, us.username,org.uid, ui.uid  from userinfo ui
INNER JOIN users us ON us.userid = ui.userinfoid
INNER JOIN usermembership um ON um.userinfoid = ui.userinfoid
inner join organisationunit org ON org.organisationunitid = um.organisationunitid

SELECT 	ui.userinfoid,us.userid, ui.firstname, ui.surname, us.username, org.uid, ui.uid,
org.organisationunitid from userinfo ui
INNER JOIN users us ON us.userid = ui.userinfoid
INNER JOIN usermembership um ON um.userinfoid = ui.userinfoid
inner join organisationunit org ON org.organisationunitid = um.organisationunitid
where us.username in ('phcnara','phckora');


-- user and userinfo table query

select us.userid,us.username,usinf.userinfoid,usinf.firstname,usinf.firstname from users us
inner join userinfo usinf ON usinf.userinfoid = us.userid;

select * from userinfo

-- user list with userinfo and member-orgUnit
select us.uid as userUID, us.username, us.created as usercreated, us.lastupdated as userlastupdated, 
usinf.uid as userInfoUID, usinf.created as userInfocreated, usinf.lastupdated as userInfolastupdated,
usinf.firstname, usinf.surname, org.uid as userOrgUID from  usermembership usm
INNER JOIN userinfo usinf ON usinf.userinfoid = usm.userinfoid
INNER JOIN users us ON us.userid = usinf.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
order by us.lastupdated desc;


select us.uid as userUID, us.username, us.created as usercreated, us.lastupdated as userlastupdated, 
usinf.uid as userInfoUID, usinf.created as userInfocreated, usinf.lastupdated as userInfolastupdated,
usinf.firstname, usinf.surname from  users us 
INNER JOIN userinfo usinf ON usinf.userinfoid = us.userid
order by us.lastupdated desc;


-- user-attributevalue and user list with userinfo and member-orgUnit
SELECT usinf.firstname first_name, usinf.surname sur_name,
cast(userAttribute.value::json ->> 'value' AS VARCHAR) 
AS userAttribute_value, org.uid as user_org_uid FROM userinfo usinf
JOIN json_each_text(usinf.attributevalues::json) userAttribute ON TRUE 
INNER JOIN usermembership usm ON usinf.userinfoid = usm.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
INNER JOIN attribute attr ON attr.uid = userAttribute.key
WHERE attr.uid = 'FeCWLipdN3o';


select us.uid as userUID, us.username, us.created as usercreated, us.lastupdated as userlastupdated, 
usinf.uid as userInfoUID, usinf.created as userInfocreated, usinf.lastupdated as userInfolastupdated,
usinf.firstname, usinf.surname, org.uid as userOrgUID, org.name as userOrgName, ur.uid as userRoleUID, 
ur.name as userRoleName, urg.uid as userGroupUID, urg.name as userGroupName from  usermembership usm
INNER JOIN userinfo usinf ON usinf.userinfoid = usm.userinfoid
INNER JOIN users us ON us.userid = usinf.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
inner join userrolemembers urm ON us.userid = urm.userid 
inner join userrole ur ON ur.userroleid = urm.userroleid
inner join usergroupmembers ugm ON us.userid = ugm.userid 
inner join usergroup urg ON urg.usergroupid = ugm.usergroupid
order by us.username desc;


-- usergroupmembers
select * from usergroupmembers where usergroupid in(
select usergroupid from usergroup where uid = 'zJTLD2Gxqf9');


select urg.name as userGRPName, usinf.uid, usinf.username,
usinf.firstname, usinf.surname from userinfo usinf
inner join usergroupmembers ugm ON usinf.userinfoid = ugm.userid
inner join usergroup urg ON urg.usergroupid = ugm.usergroupid
where urg.uid = 'vvJpMDhWonz';



--user-role list

select 	urm.userid,us.username, urm.userroleid,ur.name,ur.uid from  userrolemembers urm
INNER JOIN users us ON us.userid = urm.userid
INNER JOIN userrole ur on ur.userroleid = urm.userroleid

select us.uid userUID,	urm.userid userID, us.username userName,ur.uid userRoleUID, urm.userroleid userRoleID
,ur.name userRoleName from  userrolemembers urm
INNER JOIN users us ON us.userid = urm.userid
INNER JOIN userrole ur on ur.userroleid = urm.userroleid
order by ur.name

-- user-outPut org list

select 	uo.userinfoid,us.username, org.uid outPutOrgUID from  userdatavieworgunits uo
INNER JOIN userinfo ui ON ui.userinfoid = uo.userinfoid
INNER JOIN users us ON us.userid = ui.userinfoid
inner join organisationunit org ON org.organisationunitid = uo.organisationunitid
order by us.username

-- orgUnit level wise user list
select 	us.username, ui.firstname userFirstName, ui.surname userSurName, um.userinfoid, 
org.uid userOrgUID, org.name userOrgUnitName, org.hierarchylevel  from  usermembership um
INNER JOIN userinfo ui ON ui.userinfoid = um.userinfoid
INNER JOIN users us ON us.userid = ui.userinfoid
inner join organisationunit org ON org.organisationunitid = um.organisationunitid
 where org.hierarchylevel = 6 order by us.username;



select count(*) from _orgunitstructure
where level < 5

-- list of tei based of program and orgUnit ( all decendent )

SELECT 	tei.uid as tei, prg.uid as program, pi.uid as enrollment, pi.status 
from programinstance pi INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'L78QzNqadTV' and org.path like '%cCTQiGkKcTk%' and pi.deleted is false;


-- event list based on trackedentityinstance

-- event list based on trackedentityinstance

-- for AMR Pilot

-- programwise eventlist

SELECT psi.uid eventID,psi.storedby, psi.status, psi.executiondate::date,
psi.completedby, psi.completeddate::date , psi.deleted,
prg.uid AS prgUID FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
where prg.uid = 'dzizG8i1cmP' and psi.executiondate between '2021-08-01' and '2021-08-31';


select uid, storedby, status, executiondate::date, completedby, completeddate::date 
from programstageinstance where executiondate::date between '2021-08-01' and '2021-11-30' and 
status = 'COMPLETED' and programinstanceid in (
select programinstanceid from programinstance where programid != 522061);


select * from trackedentityattribute where trackedentityattributeid = 3418;
select * from trackedentityattributevalue where trackedentityattributeid = 3418;


SELECT psi.uid as eventUID, psi.programstageinstanceid, tei.uid as teiUID,
tei.trackedentityinstanceid from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate::date between '2021-08-01' and '2021-11-30' and 
psi.status = 'COMPLETED' and pi.programid != 522061; 


SELECT psi.uid as eventUID, psi.programstageinstanceid, tei.uid as teiUID,
tei.trackedentityinstanceid from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
where tei.uid = 'hjk1nz33lZp';



delete from datavalue where periodid in (21859684,21858736,21841507,21832298);
delete from datavalueaudit where periodid in (21859684,21858736,21841507,21832298);

-- based on program

SELECT org.uid as orgUnit, tei.uid as tei, pi.uid AS enrollment, psi.uid as event, psi.created, 
psi.status, psi.duedate, psi.executiondate as eventDate from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = 'L78QzNqadTV' and tei.uid = 'zNOsV68KsIa' and psi.deleted is false order by psi.created desc LIMIT 2;


SELECT org.uid as orgUnit, tei.uid as tei, pi.uid AS enrollment, psi.uid as event, psi.created, 
psi.status, psi.duedate, psi.executiondate as eventDate from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE tei.uid = 'zNOsV68KsIa' and psi.deleted is false order by psi.created desc LIMIT 2;

SELECT org.uid as orgUnit, tei.uid as tei, pi.uid AS enrollment, psi.uid as event, psi.created, 
psi.organisationunitid, psi.status, psi.duedate, psi.executiondate as eventDate from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE tei.uid = 'zNOsV68KsIa' and psi.deleted is false order by psi.created desc LIMIT 2;

--event list


SELECT psi.uid eventID, psi.executiondate::date,org.uid AS orgUnitUID,
org.name AS orgUnitName,prg.uid AS prgUID,prg.name AS prgName,
ps.uid AS programStageUID,ps.name AS programStageName FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where psi.executiondate = '2022-04-01' and prg.uid = 'a7e2Yf1OdI5';

SELECT org.uid as orgUnit, tei.uid as tei, pi.uid AS enrollment, psi.uid as event, psi.created, 
psi.organisationunitid, psi.status, psi.duedate, psi.executiondate as eventDate from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE prg.uid = 'L78QzNqadTV' and org.uid = 'UcFtqIBF6dF' and psi.deleted is false 
order by psi.created desc LIMIT 2;

-- hiv-tracker eventdatavalues with dataelement value

-- hiv-tracker eventdatavalues with dataelement value and TEI and trackedentityattributevalue
SELECT tei.uid  as tei_uid,  psi.uid as event, psi.executiondate::date, 
eventdatavalues -> 'fVVUM6blNja' ->> 'value' as sample_collection_date,  
teav.value AS client_code FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE  prg.uid = 'L78QzNqadTV' and ps.uid = 'YRSdePjzzfs' and psi.deleted is false and 
eventdatavalues -> 'fVVUM6blNja' is not null and 
eventdatavalues -> 'fVVUM6blNja' ->> 'value' between '2022-01-01'
AND '2022-12-31' and teav.trackedentityattributeid = 2602 order by psi.created desc;


SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'aXquUzlrYYv' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'transfer_out' order by psi.created desc;

-- event -data-value

SELECT org.uid as orgUnit, tei.uid as tei, pi.uid AS enrollment, psi.uid as event, psi.created,
psi.status, eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status, psi.duedate, psi.executiondate as eventDate from programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
WHERE prg.uid = '${program}' and tei.uid = '${tei}' and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'transfer_out'
and psi.deleted is false order by psi.executiondate desc LIMIT 1 ; 

-- based on enrollmentdate

SELECT distinct tei.uid  as tei_uid FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'UcFtqIBF6dF' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null and pi.enrollmentdate::date between
'2019-01-01' and '2019-12-31';

SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as dataValue FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON psi.organisationunitid = org .organisationunitid
WHERE org.uid =  'UcFtqIBF6dF' and prg.uid = 'L78QzNqadTV' and psi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null and pi.enrollmentdate::date between
'2019-01-01' and '2019-12-31';

SELECT tei.uid  as tei_uid,  psi.uid as event, psi.created::date,  psi.status ,
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' as art_status, pi.enrollmentdate::date FROM programstageinstance psi
INNER JOIN programinstance pi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN program prg ON pi.programid = prg.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN organisationunit org ON pi.organisationunitid = org .organisationunitid
WHERE org.path like  '%cCTQiGkKcTk%' and prg.uid = 'L78QzNqadTV' and pi.deleted is false and 
eventdatavalues -> 'WpBa1L6xxPC' is not null  and 
eventdatavalues -> 'WpBa1L6xxPC' ->> 'value' = 'transfer_out'
and pi.enrollmentdate::date <= '2020-12-31';



-- dataelement list based on dataelementGroup;
select deg.dataelementgroupid as deGrpID, deg.uid as deGrpUID, deg.name as deGrpName,
de.dataelementid as deID, de.uid as deUID, de.name as deName from dataelement de
INNER JOIN dataelementgroupmembers deGrpm ON deGrpm.dataelementid = de.dataelementid
INNER JOIN dataelementgroup deg ON deg.dataelementgroupid = deGrpm.dataelementgroupid
order by deg.name;

// indicator list based on indicatorGroup;
select indg.indicatorgroupid as indGrpID, indg.uid as indGrpUID, indg.name as indGrpName,
ind.indicatorid as indID, ind.uid as indUID, ind.name as indName from indicator ind
INNER JOIN indicatorgroupmembers indGrpm ON indGrpm.indicatorid = ind.indicatorid
INNER JOIN indicatorgroup indg ON indg.indicatorgroupid = indGrpm.indicatorgroupid
order by indg.name;

// lenghth function in sql

delete from trackedentityattributevalue where trackedentityattributeid = 2617
and length( value ) != 10

-- geeting all analytics tables

SELECT table_name from information_schema.tables where table_name like 'analytics%' and table_type = 'BASE TABLE';

SELECT * from information_schema.tables where table_name like 'analytics%' and table_type = 'BASE TABLE';


// period-wise-progress-report-query -- app based -- sample for orissa-2.32

select json_agg(main.*) from (

             select  pivot as key,
        format('{%s}',string_agg(format('"%s":"%s"',
                                        decoc,
                                        value), ',')):: json as value
        from
        (
            
        select to_char(pe.startdate , 'yyyy-mm-dd')as pivot,
        concat('nogroup','-',de.uid,'-',coc.uid) as decoc ,
        sum(dv.value :: float) as value
        from datavalue dv
        
        inner join period as pe on pe.periodid = dv.periodid 
	inner join periodtype as pt on pt.periodtypeid = pe.periodtypeid 
	inner join dataelement as de on de.dataelementid = dv.dataelementid 
	inner join categoryoptioncombo coc on coc.categoryoptioncomboid = dv.categoryoptioncomboid 
        where pe.startdate >= to_date('202001','yyyymm')
        and pe.startdate <= to_date('202003','yyyymm')
        and dv.attributeoptioncomboid=22
	and dv.value ~'^-?[0-9]+.?[0-9]*$' and dv.value !='0'
	and dv.sourceid in ( 7518,3274,8331,2548,6629,9366,5177,670,946,5261,7680,9489,9614,4424,417,5245,7041,4112,707,8784,3607,7040,227,9599,505,2646,280,2014,5366,5646,7809,3985,4850,3214,578,1771,3003,8724,3816,7161,5235,1124,9306,5119,508,9527,7072,7940,5461,9281,4325,796,7265,5143,7939,8703,4279,4425,8309,6358,8684,9491,321,5433,6537,4621,7274,6715,7162,3223,3244,2549,220,4845,7298,3509,5089,5689,497,3895,2911,7113,6952,416,4406,7824,8246,1992,4854,3733,902,6696,8462,8881,4224,8159,5285,5388,9305,7945,5335,1965,3621,3978,6700,7808,4399,5292,5650,4933,2811,7257,2677,787,7768,8372,4398,1214,1061,7368,7014,8550,8157,2849,2739,6311,6591,2220,2733,5690,795,9657,8369,789,1838,4981,2915,6003,7310,2720,4000,8839,6452,6777,9363,762,9478,1059,2141,9496,1689,9262,7163,5220,8374,1052,289,5766,7369,8278,3677,9315,9032,7400,8045,1398,763,279,507,7455,4476,6695,7803,3640,2218,8671,281,8181,9605,3506,288,3216,324,3275,7493,6976,8552,7681,6627,6386,3731,939,3910,3183,5760,2142,5668,868,418,2427,7383,947,9479,4057,3111,882,6855,2216,1904,6684,8838,5121,3222,5286,8388,4322,4377,6444,290,494,9635,7679,9288,8634,8290,7675,8378,492,6356,8387,9263,3663,4463,880,3643,7676,2948,4818,4400,3823,671,2219,7918,7926,4868,928,4184,130,9304,3993 )
        and dv.dataelementid in  (select dataelementid from dataelement where uid in ('ywf4k8K5dvF','Bjf26xzMWhe'))
        and concat(de.uid,'-',coc.uid) in ('ywf4k8K5dvF-HllvX50cXC0','Bjf26xzMWhe-HllvX50cXC0') group by pe.startdate,de.uid,coc.uid

        )main
        group by main.pivot

                union all

                
        select 'pivot' as key,
	format('{%s}' ,
	       string_agg(format('"%s":"%s"',
			         to_char(date,'yyyy-mm-dd'),
			         to_char(date,'Mon yyyy')), 
			  ','))::json as value
        from generate_series(
	    to_date('202001','yyyymm'),
	    to_date('202003','yyyymm'),
	    '1 month'::interval
        ) date
            
        )main



// organisationunitattributevalues

  SELECT orgAttrValue.organisationunitid,attrValue.attributeid, attrValue.value from organisationunitattributevalues orgAttrValue
  INNER JOIN attributevalue attrValue ON attrValue.attributevalueid = orgAttrValue.attributevalueid
  WHERE attrValue.attributeid = 38115164;


SELECT attrValue.attributevalueid,  attrValue.value, attrValue.attributeid
	FROM public.attributevalue attrValue
	inner JOIN organisationunitattributevalues orgAttrValue ON attrValue.attributevalueid = orgAttrValue.attributevalueid
	inner JOIN organisationunit org ON org.organisationunitid = orgAttrValue.organisationunitid
    WHERE attrValue.attributeid = 38115164 and org.hierarchylevel = 8 and attrValue.value in (


-- enrollment count query user-wise

select us.userid,us.username,org.name,org.uid,count(tei.trackedentityinstanceid) as count from trackedentityinstance tei
INNER JOIN users us ON us.userid = tei.lastupdatedby
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
where pi.programid = 2437 and pi.enrollmentdate between '2018-01-01' and '2018-10-31'
group by us.userid,us.username,org.name,org.uid


select us.userid,us.username,org.name,org.uid,pg.name,pg.uid,count(tei.trackedentityinstanceid) as count from trackedentityinstance tei
INNER JOIN users us ON us.userid = tei.lastupdatedby
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program pg ON pg.programid = pi.programid
where pi.enrollmentdate between '1990-01-01' and '2018-10-31'
group by us.userid,us.username,org.name,org.uid,pg.name,pg.uid;



SELECT us.userid,us.username as user_name,org.name as org_name,org.uid as org_uid,pg.name as program_name,pg.uid as program_uid,count(tei.trackedentityinstanceid) as count from trackedentityinstance tei
INNER JOIN users us ON us.userid = tei.lastupdatedby
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program pg ON pg.programid = pi.programid
where pg.uid in ('y6lXVg8TdOj','Fcyldy4VqSt') and  pi.enrollmentdate between '1990-01-01' and '2018-10-31'
group by us.userid,us.username,org.name,org.uid,pg.name,pg.uid;

SELECT dv.sourceid,org1.name,org.name,count(dv.sourceid) from datavalue dv
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN organisationunit org1 ON org1.organisationunitid = org.parentid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
where dse.datasetid = 10886 and dv.dataelementid not in ( 10871,10872,10870, 1774) and dv.periodid = 848 
group by dv.sourceid,org1.name,org.name order by org1.name;

--user-wise enrollment count

SELECT us.userinfoid,us.firstname,us.surname,org.name as org_name,org1.name as parent_name, org.uid as org_uid,count(tei.trackedentityinstanceid) as count from trackedentityinstance tei
left JOIN userinfo us ON us.userinfoid = tei.lastupdatedby
left JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
left JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
left JOIN organisationunit org1 ON org1.organisationunitid = org.parentid
left JOIN program pg ON pg.programid = pi.programid
where pg.uid = 'y6lXVg8TdOj'  and pi.enrollmentdate::date between '2018-01-01' and '2018-12-31'  
and pi.organisationunitid IN ( select organisationunitid from organisationunit where
parentid in ( select organisationunitid from organisationunit where parentid in ( select organisationunitid from organisationunit  where uid = 'c1HbB4LCCcI') ) )
group by us.userinfoid,us.firstname,us.surname,org.name,org1.name,org.uid,pg.name,pg.uid order by us.firstname\



SELECT attvalue.attributevalueid, attvalue.created, attvalue.lastupdated, attvalue.value, attvalue.attributeid,orgUnit.name
  FROM public.attributevalue attvalue
INNER JOIN organisationunitattributevalues orgattvalue ON orgattvalue.attributevalueid = attvalue.attributevalueid
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = orgattvalue.organisationunitid

  where attvalue.attributeid = 38115164 and  orgUnit.hierarchylevel = 8 order by lastupdated desc;

-- split function
select trackedentityinstanceid, trackedentityattributeid,
value,TRIM(split_part(value, '-', 3)) from trackedentityattributevalue 
where trackedentityattributeid = 647;

select pss.name as section_name ,ps.name as ps_name,de.name,de.dataelementid as de_name from programstagesection pss
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN programstagedataelement psde on psde.programstageid = pss.programstageid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid where  de.dataelementid in(7710,
176701,
214872,
7739,
176739,
156025,
163594,
8693,
150033,
176700,
203837,
174673);


-- for sait-lucia query inspection list with multiple TEA value filter in one query 
query = "SELECT psi.programstageinstanceid " +
                    "FROM programstageinstance psi " +
                    "INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid " +
                    "INNER JOIN programstage ps ON ps.programstageid = psi.programstageid ";
            
            if( !inspectionType.equalsIgnoreCase( "" ) )    // inspection filter
                /*
                query += "INNER JOIN (" +
                          "SELECT programstageinstanceid " +
                          "FROM trackedentitydatavalue " +
                          "WHERE dataelementid = 1953 " + // -- inspection type
                          "AND value ILIKE '" + inspectionType + "' " +
                          ") tdv1 on tdv1.programstageinstanceid = psi.programstageinstanceid ";
                */
                query += "INNER JOIN (" + "SELECT programstageinstanceid FROM programstageinstance " +
                    "WHERE eventdatavalues -> 'aQQ4oBQ2LlT' ->> 'value' " + // -- inspection type dataelementUid
                    " ILIKE '" + inspectionType + "' " +
                    ") evdatavalue1 on evdatavalue1.programstageinstanceid = psi.programstageinstanceid ";
            
            if( !assignedInspector.equalsIgnoreCase( "" ) )     // inspector filter
                
                /*query += "INNER JOIN (" +
                         "SELECT programstageinstanceid " +
                         "FROM trackedentitydatavalue " +
                         "WHERE dataelementid = 1954 " +  // -- assigned inspector
                         "AND value ILIKE '" + assignedInspector + "' " +
                         ") tdv2 on tdv2.programstageinstanceid = psi.programstageinstanceid ";
                */
                
                query += "INNER JOIN (" + "SELECT programstageinstanceid FROM programstageinstance " +
                         "WHERE eventdatavalues -> 'aBx0rbxAGei' ->> 'value' " + // -- assigned inspector dataelementUid
                         " ILIKE '" + assignedInspector + "' " +
                         ") evdatavalue2 on evdatavalue2.programstageinstanceid = psi.programstageinstanceid ";            
            
            
            
            if( !districtName.equalsIgnoreCase( "" ) )    // district filter
                query += "INNER JOIN (" +
                         "SELECT trackedentityinstanceid " +
                         "FROM trackedentityattributevalue " +
                         "WHERE trackedentityattributeid = 698 " + //  --district
                         "AND value ILIKE '" + districtName + "' " +
                         ") tav1 on tav1.trackedentityinstanceid = pi.trackedentityinstanceid ";
            
            if( !communityName.equalsIgnoreCase( "" ) )   // community filter
                query += "INNER JOIN (" +
                         "SELECT trackedentityinstanceid " +
                         "FROM trackedentityattributevalue " +
                         "WHERE trackedentityattributeid = 699 " + //  -- community
                         "AND value ILIKE '" +communityName + "' " +
                         ") tav2 on tav2.trackedentityinstanceid = pi.trackedentityinstanceid ";
            
            //String q_where = " WHERE psi.programstageid = 130 ";    // inspection program stage id
            String q_where = " WHERE ps.name ILIKE 'Inspection' AND psi.deleted = false " ;
            
            if( !status.equalsIgnoreCase( "" ) )
                q_where += "AND psi.status = '" + status + "' ";  // status filter
                
            if( programId != null )
                q_where += "AND pi.programid = " + programId + " "; // program filter
            
            switch( dateCheck ) {                                   // date filter 
                case 1: q_where += "AND psi.duedate >= '"+ scheduleStartDate +"' "; break;
                case 2: q_where += "AND psi.duedate <= '"+ scheduleEndDate +"' "; break;
                case 3: q_where += "AND psi.duedate BETWEEN '" + scheduleStartDate + "' AND '" + scheduleEndDate +"' "; break;

            }
            
            query = query + q_where;
            
            System.out.println( " query -- " + query  );



-- TEI count based on orgUnit and program

SELECT COUNT(tei.trackedentityinstanceid) from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE orgUnit.uid = '${orgUnitUid}' and prg.uid = '${programUid}' ;

SELECT COUNT(tei.trackedentityinstanceid) from trackedentityinstance tei
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE orgUnit.uid = 'hDZ51aXdVMO' and prg.uid = 'aMCrYXpdUaz';

-- TEI count based on orgUnit
SELECT COUNT(pi.trackedentityinstanceid) from programinstance pi
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
WHERE orgUnit.uid = 'SOtfI3u1Qk8' and ;

-- TEI count based on orgUnit and enrollmentDate
SELECT COUNT(pi.trackedentityinstanceid) from programinstance pi
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
WHERE orgUnit.uid = 'SOtfI3u1Qk8' and pi.enrollmentdate::date = '2023-03-27'
and pi.deleted is false;

SELECT COUNT(pi.trackedentityinstanceid) from programinstance pi
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
WHERE pi.deleted is false and orgUnit.uid = '${orgUnitUid}' 
and pi.enrollmentdate::date = '${enrollmentDate}';

 -- var=orgUnitUid:SOtfI3u1Qk8&var=enrollmentDate:2023-03-27;

SOtfI3u1Qk8


-- dmc query


SELECT tei.uid teiUID,tea.uid attributeUID,tea.name attributeName, teav.value
attributeValue,org.uid AS orgUID, org.name AS orgName 
FROM trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
WHERE org.organisationunitid = 67


select * from trackedentityattribute where uid = 'KrCahWFMYYz';

select * from trackedentityattributevalue where trackedentityattributeid = 521331;

-- house_hold
SELECT teav1.trackedentityinstanceid, teav1.value as PersonID, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  128 and  prg.uid = 'BgTTdBNKHwc';

-- house_hold - member

SELECT teav1.trackedentityinstanceid, teav1.value as PersonID, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  675 and  prg.uid = 'TcaMMqHJxK5';

-- dmc event dataValue
SELECT tei.trackedentityinstanceid, psi.uid eventID,psi.executiondate::date as eventdate, 
data.key as de_uid, cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, prg.uid AS prgUID, 
de.name AS dataElementName FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'DDZRoVKo9rF' and prg.uid = 'BgTTdBNKHwc';

SELECT tei.uid teiUID, teav1.value as PersonID, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  139 and 
teav1.value = 'Female' and prg.uid = 'TcaMMqHJxK5';

SELECT tei.uid teiUID, teav1.value as dob, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 139 AND value = 'Female') teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  138 and prg.uid = 'TcaMMqHJxK5';

-- dmc attribute value and age calculation based on dob

SELECT tei.uid teiUID, teav1.value as dob, 
EXTRACT(year FROM AGE(current_date,teav1.value::date))::int as age ,
org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 139 AND value = 'Female') teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  138 
and EXTRACT(year FROM AGE(current_date,teav1.value::date))::int between 12 and 19 
and prg.uid = 'TcaMMqHJxK5';



SELECT tei.uid teiUID,teav1.value as motherName, 
org.uid AS orgUID,org.name AS orgName FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 139 AND value = 'Female') teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  521323 and pi.programid = 1256;



SELECT tei.uid teiUID,tea.uid teaUID, teav.value 
FROM trackedentityattributevalue teav
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
WHERE tea.uid = 'ZQMF7taSAw8';

SELECT tei.trackedentityinstanceid, tei.uid teiUID,tea.uid teaUID, teav.value 
FROM trackedentityattributevalue teav
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid  = tei.trackedentityinstanceid 
INNER JOIN program prg ON prg.programid = pi.programid
WHERE tea.uid = 'ZQMF7taSAw8' and prg.uid = 'BgTTdBNKHwc';



-- final relationship query
select rels.relationshiptypeid,rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid	
where rel1.trackedentityinstanceid in ( select trackedentityinstanceid from 
trackedentityinstance where uid = 'GNqKL1hOeLi')
order by rel1.trackedentityinstanceid;	


select rels.relationshiptypeid,rels.from_relationshipitemid,rels.to_relationshipitemid,rel1.relationshipitemid, rel1.trackedentityinstanceid
as from_tei,rel2.relationshipitemid, rel2.trackedentityinstanceid as to_tei from relationshipitem rel1
INNER JOIN relationship rels ON rels.from_relationshipitemid = rel1.relationshipitemid
INNER JOIN relationshipitem rel2 ON rel2.relationshipitemid = rels.to_relationshipitemid	
where rel1.trackedentityinstanceid in (SELECT tei.trackedentityinstanceid
FROM trackedentityattributevalue teav
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid  = tei.trackedentityinstanceid 
INNER JOIN program prg ON prg.programid = pi.programid
WHERE tea.uid = 'ZQMF7taSAw8' and prg.uid = 'BgTTdBNKHwc' )
order by rel1.trackedentityinstanceid;	


-- dmc event dataValue





-- for sait-lucia query



update dataelement set valuetype = 'TEXT' where dataelementid = 3460;
update optionset set valuetype = 'TEXT' where uid = 'KsPNxD1dqyk';

select * from trackedentityattribute where uid = 'fOHkLJDVm18';

select * from trackedentityattributevalue where trackedentityattributeid = 699;

select * from organisationunit where name = 'THE MORNE'


-- hiv-tracker-save-child -- SMS related queries


-- multiple TEA value in one query

SELECT tei.uid teiUID, teav1.value as PersonID, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  139 and 
teav1.value = 'Female' and prg.uid = 'TcaMMqHJxK5';

SELECT tei.uid teiUID, teav1.value as dob, org.uid AS orgUID,org.name AS orgName 
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 139 AND value = 'Female') teav2
ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN programinstance pi  on pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg on prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  138 and prg.uid = 'TcaMMqHJxK5';


SELECT teav1.trackedentityinstanceid, teav1.value FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 4728214 AND value ILIKE '%NCASC%') teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 2618 and value = 'true' ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
WHERE teav1.trackedentityattributeid = 2617;

SELECT teav1.trackedentityinstanceid FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 4728214 AND value ILIKE '%Save the Children%') teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
WHERE teav1.value = 'true' AND teav1.trackedentityattributeid = 2618;


SELECT teav1.trackedentityinstanceid, teav1.value FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 4728214 AND value ILIKE '%Save the Children%') teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 2617 ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
WHERE teav1.value = 'true' AND teav1.trackedentityattributeid = 2618;






--  multiple TEA value in one query with orgUnit name and uid

SELECT teav1.trackedentityinstanceid, teav2.value as name ,teav1.value as dateValue, 
teav3.value AS CID_number,org.uid AS orgUID,org.name AS orgName FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 140561 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3987324 ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
WHERE teav1.trackedentityattributeid =  3987326 AND teav1.value ILIKE '%0000-%';

--  multiple TEA value in one query with orgUnit name and uid and based on program

SELECT teav1.trackedentityinstanceid, teav2.value as name,teav1.value as dateValue, 
teav3.value AS CID_number,org.uid AS orgUID,org.name AS orgName, teav1.storedby
FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 140561 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN ( SELECT trackedentityinstanceid, value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 3987324 ) teav3
on teav2.trackedentityinstanceid = teav3.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE teav1.trackedentityattributeid =  3987326 and prg.uid = 'SuvMxhyPK5l';



-- eventdatavalues related queries

SELECT pi.trackedentityinstanceid, psi.organisationunitid, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
WHERE psi.programstageid = 2485 and de.dataelementid = 2378
and teav.trackedentityattributeid = 2618 and teav.value = 'true';


SELECT psi.uid as eventUID,de.uid as dataElementUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key

-- all eventDataValue

SELECT psi.uid eventID,psi.created::date,psi.lastupdated::date,psi.executiondate::date as eventdate, 
psi.storedby,psi.status,psi.completeddate::date,psi.completedby,org.uid AS orgUID,org.name AS orgName,
prg.uid AS prgUID, prg.name AS prgName,ps.uid AS prgStageUID, ps.name AS prgStageName,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key;

-- all eventDataValue with TEI attribueValue
SELECT org.name AS orgName,tei.uid AS teiUID,teav.value as SEX,psi.uid eventID,
psi.executiondate::date,psi.status,psi.completeddate::date,psi.completedby,
de.name AS dataElementName, data.key as de_uid,cast(data.value::json ->> 'value' AS VARCHAR) AS de_value 
FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where org.uid in ( 'SalGKJqIV3t')
and teav.trackedentityattributeid =  3420;

SELECT psi.organisationunitid, de.dataelementid, 
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN dataelement de ON de.uid = data.key
WHERE psi.programstageid = 2537
AND de.dataelementid = 2397
order by psi.lastupdated desc;

-- event list with trackedentityattributevalue
SELECT org.name AS orgName,tei.uid AS teiUID,teav.value as CR_Number,psi.uid eventID,
psi.executiondate::date,psi.status,psi.completeddate::date,psi.completedby 
FROM programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
where psi.status = 'COMPLETED' and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and teav.trackedentityattributeid =  3418;


-- event list with multiple TEA value trackedentityattributevalue
SELECT teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and psi.status = 'COMPLETED';




-- query based on TEA value
select teav.trackedentityinstanceid,teav.trackedentityattributeid, teav.value, 
org.name,org.uid, org.organisationunitid orgID, pi.organisationunitid enrollORGID,
psi.organisationunitid eventOrgUnitID, pg.programid, pg.name programName,psi.programstageinstanceid
from trackedentityattributevalue teav
INNER JOIN organisationunit org ON org.name=teav.value
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN program pg on pi.programid = pg.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
where teav.trackedentityattributeid = 699 and pi.programid not in ( 105,441084,441102,442161,3335);

SELECT prg.programid,prg.uid as program_UID, prg.name AS program_name,ps.programstageid, 
ps.uid AS stage_UID, ps.name as stage_name,pss.programstagesectionid, pss.uid AS section_UID,
pss.name AS section_name from programstagesection pss
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN program prg ON prg.programid = ps.programid;


-- programstage dataelements programStageSection dataelement list
SELECT pg.programid programID,pg.uid programUID,pg.name programName, ps.programstageid programstageID, 
ps.uid programstageUID,ps.name as ps_name,psde.dataelementid psDataElement,psde.sort_order AS ps_sort_order, 
pss.programstagesectionid programStageSectionID, pss.uid programStageSectionUID, pss.name 
as section_name, pss.sortorder AS section_sortorder, pss_de.dataelementid AS pss_dataElementID,
pss_de.sort_order AS pss_de_sort_order,de.name as de_name, de.dataelementid from programstagesection pss
INNER JOIN programstagesection_dataelements pss_de ON pss_de.programstagesectionid = pss.programstagesectionid
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
INNER JOIN programstagedataelement psde on psde.programstageid = pss.programstageid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid 
where ps.uid = 'WCgcN8eovPv' order by ps_se.name, ps_de.sort_order;

-- for saint-lucia programstage dataelements with optionset
select pg.programid programID,pg.uid programUID,pg.name programName, ps.programstageid programstageID, 
ps.uid programstageUID,ps.name as ps_name, pss.programstagesectionid programStageSectionID, pss.uid programStageSectionUID, pss.name 
as section_name ,de.name as de_name, de.dataelementid,de.uid deUID, de.optionsetid, ops.name from programstagesection pss
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
INNER JOIN programstagedataelement psde on psde.programstageid = pss.programstageid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid 
INNER JOIN optionset ops ON ops.optionsetid = de.optionsetid
where ps.name Ilike '%Inspection%' and ops.name ilike '%Inspection item result%';

-- for Food Establishments and inspection stage
SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where pg.uid = 'tITlMGNJTbJ' and ps.programstageid = 130 
and de.name not ilike '%Comment%' order by ps_se.name, ps_de.sort_order;

-- programstagedataelement list witout section
SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where  ps.uid = 'WCgcN8eovPv';


-- programstagedataelement list witout section
SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_de.sort_order,
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where  ps.uid in( 'WCgcN8eovPv','','');

SELECT os.uid AS optionSetUID,os.name AS optionSetName,opv.uid AS optionUID
,opv.name AS optionName, opv.code AS optionCode from optionvalue opv
INNER JOIN optionset os ON os.optionsetid = opv.optionsetid
where os.uid = 'tdtBR9OdXMJ';

select os.optionsetid,opv.optionvalueid,opv.uid,opv.name,opv.code 
from optionvalue opv
INNER JOIN optionset os ON os.optionsetid = opv.optionsetid
 where os.optionsetid != 1558;

select * from optionvalue where optionsetid = 2295;

select ops.optionsetid optionSETID, ops.uid optionsetUID, ops.name optionsetName,
opv.optionvalueid, opv.uid optionUID, opv.name optionName,opv.code optionCode from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.name ilike '%Inspection item result%'
order by ops.name;


select ops.optionsetid optionSETID, ops.uid optionsetUID, ops.name optionsetName,
opv.optionvalueid, opv.uid optionUID, opv.name optionName,opv.code optionCode from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid in (
's1UF1wpUrpB','pdt5glVYQL5','c5unlpfGaog','tdtBR9OdXMJ')
order by ops.name;

select ops.optionsetid optionSETID, ops.uid optionsetUID, ops.name optionsetName,
opv.optionvalueid, opv.uid optionUID, opv.name optionName,opv.code optionCode,
opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid in (
's1UF1wpUrpB','pdt5glVYQL5','c5unlpfGaog','tdtBR9OdXMJ')
order by ops.name;


-- program /stage wise dataelement count
select pg.name,pg.programid,psde.programstageid, ps.name, count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid,psde.programstageid,ps.name;

-- programwise dataelement count
select pg.name, pg.programid, pg.uid, count(psde.dataelementid) de_count
from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid;

 
 -- program  wise dataelement count
select pg.name,pg.programid, count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid;

-- program /stage wise dataelement count
select pg.name,pg.programid,psde.programstageid, ps.name, 
count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid,psde.programstageid,ps.name;


select pg.name,pg.programid,psde.programstageid, ps.name,de.name,de.uid from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid;


select pg.name programName, pg.uid programUID, pg.programid programID ,psde.programstageid programStageID,
ps.uid programStageUID, ps.name programStageName, de.name dataElementName, de.uid dataElementUID, de.dataelementid
dataelementID, de.domaintype deDomainType from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid;

-- program wise section wise dataelements list

SELECT pg.name as programName,pg.uid as programUID, ps.name as programStageName, 
ps.uid as programStageUid, ps_se.name as sectionName, ps_se.uid as sectionUid,
ps_de.dataelementid,de.name as dataElementName, de.uid as dataElementUID, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid

-- section wise dataelements list based on program and its stage

SELECT pg.name as programName,pg.uid as programUID, ps.name as programStageName, 
ps.uid as programStageUid, ps_se.name as sectionName, ps_se.uid as sectionUid,
ps_de.dataelementid,de.name as dataElementName, de.uid as dataElementUID, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
where pg.uid = 'luutVY8uc84' and ps.uid in ( 'Dur8ctsCSXD' , 'Sas5iXkJLG3' ) ;


-- program wise programstage section wise dataElement List
SELECT pg.name as programName, pg.uid as programUID, ps.name programStageName, ps.uid programStageUID,  
ps_se.uid programStageSectionUID, ps_se.name programStageSectionName, de.uid as dataElementUID,
de.name as dataElementName,de.shortname AS dataElementShortName,de.formname dataElementFormName,
de.valuetype AS dataElementValueType FROM programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
order by pg.name;


UPDATE programstagedataelement SET rendertype = jsonb_pretty('{"MOBILE": {"type": "HORIZONTAL_CHECKBOXES"}}')::jsonb
WHERE programstagedataelementid in(431412,431281,431284);


="update programstagedataelement set SET rendertype = jsonb_pretty('{"MOBILE": {"type": "HORIZONTAL_CHECKBOXES"}}')::jsonb where programstagedataelementid = "&A2&";"

-- program stage dataelements list
SELECT pg.name as programName, pg.uid as programUID, ps.name programStageName, ps.uid programStageUID,  
de.uid as dataElementUID, de.name as dataElementName,de.shortname AS dataElementShortName,
de.formname AS dataElementFormName, de.valuetype AS dataElementValueType
FROM programstagedataelement ps_de
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_de.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
order by pg.name;


select pss.name as section_name ,ps.name as ps_name,de.name,de.dataelementid as de_name from programstagesection pss
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN programstagedataelement psde on psde.programstageid = pss.programstageid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid where  de.dataelementid in(7710,
176701,
214872,
7739,
176739,
156025,
163594,
8693,
150033,
176700,
203837,
174673);



SELECT pg.name as programName, pg.uid as programUID, ps.uid programStageUID, ps.name programStageName, 
ps_se.uid programStageSectionUID, ps_se.name programStageSectionName, de.uid as deUID,
de.name as dataElementName,de.shortname AS dataElementShortName,de.formname dataElementFormName
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
WHERE pg.uid = 'ecIoUziI2Gb' order by pg.name;




-- program wise dataElement List

SELECT pg.name as programName, pg.uid as programUID, pg.programid as programId, 
ps.uid programStageUID, ps.programstageid programStageID, ps.name programStageName, 
ps_se.uid programStageSectionUID, ps_se.programstagesectionid programStageSectionID, 
ps_se.name programStageSectionName, de.uid as deUID
,de.dataelementid as deId, de.name as dataElementName,de.formname dataElementFormName
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
WHERE pg.uid = 'ecIoUziI2Gb' order by pg.name;

SELECT pg.name as programName, pg.uid as programUID, pg.programid as programId, ps.name as psName,ps.uid as psUID,
ps.programstageid as psID,ps_de.dataelementid,de.uid as deUID
,de.dataelementid as deId, de.name as dataElementName
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
WHERE pg.uid = 'aYkLHnoPNo5'  order by pg.name;



SELECT pg.name as programName, pg.uid as programUID, ps.name as programStageName, 
ps.uid as programStageUID, ps_se.name as sectionName,ps_se.uid as sectionUID, ps_de.dataelementid, de.uid as deUID, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
WHERE pg.uid = 'L78QzNqadTV';

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid order by pg.name


-- program/program-stage/ program-stage-section without dataelement

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid
FROM programstagesection ps_se 
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid = 'KHvMmIe88PQ' order by pg.name;


-- program/program-stage/ program-stage-section wise dataelement-list

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_se.name as sectionName, 
ps_se.programstagesectionid, ps_se.uid as programstagesection_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, ps_de.sort_order
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid 
WHERE pg.uid = 'VscnMM6g6Ow' order by pg.name;

-- programStage wise dataElement List programstagedataelement list witout section

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, ps_de.sort_order,
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where  ps.uid in( 't0tWNua9VQL','R8Yvu2xBGIz','stpGlwydi7Z');

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid order by ps.name

SELECT pg.name as programName, pg.programid,pg.uid as pg_uid, ps.name as programStageName, 
ps.programstageid,ps.uid as programStage_uid, 
ps_de.dataelementid, de.uid as dataElement_uid, de.name as dataElementName, de.shortname
FROM programstagedataelement ps_de
LEFT JOIN dataelement de On de.dataelementid = ps_de.dataelementid
LEFT JOIN programstage ps ON ps.programstageid = ps_de.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid 
where pg.uid = 'L78QzNqadTV' order by ps.name;


-- programStage Section Name 


SELECT pg.name as programName, pg.uid as programUID, pg.programid as programId, ps.name as pStageName,ps.uid as psSageUID,
ps.programstageid as pStageID, ps_se.name as pss_Name, ps_se.uid as pss_UID, ps_se.programstagesectionid as pssId, 
ps_de.dataelementid,de.uid as deUID,de.dataelementid as deId, de.formname as dataElementFormName
FROM public.programstagesection_dataelements ps_de
INNER JOIN programstagesection ps_se ON ps_se.programstagesectionid = ps_de.programstagesectionid
INNER JOIN dataelement de On de.dataelementid = ps_de.dataelementid
INNER JOIN programstage ps ON ps.programstageid = ps_se.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
WHERE pg.uid = 'aYkLHnoPNo5'  order by pg.name;

SELECT de.name deName,de.uid deUid,de.valuetype as deValueType,
os.name optionsetName,os.uid optionsetUid ,ov.uid optionValueUid ,
ov.name optionValueName,ov.code optionValueCode FROM optionvalue ov
INNEr JOIN optionset os ON os.optionsetid = ov.optionsetid
INNER JOIN dataelement de ON de.optionsetid = os.optionsetid;


SELECT de.name deName,de.uid deUid ,os.name optionsetName,os.uid optionsetUid,
ov.uid optionValueUid ,ov.name optionValueName,ov.code optionValueCode FROM optionvalue ov
INNEr JOIN optionset os ON os.optionsetid = ov.optionsetid
INNER JOIN dataelement de ON de.optionsetid = os.optionsetid;

-- de optionSet optionValue
SELECT de.name deName,de.uid deUid ,os.name optionsetName,
os.uid optionsetUid ,ov.uid optionValueUid ,ov.name optionValueName,
ov.code optionValueCode FROM optionvalue ov
INNEr JOIN optionset os ON os.optionsetid = ov.optionsetid
INNER JOIN dataelement de ON de.optionsetid = os.optionsetid;

select pg.name programname ,pg.programid,ps.name progrmStageName,ps.programstageid,pss.programstagesectionid,pss.name programstageSectionName from programstagesection pss 
INNER JOIN programstage ps ON ps.programstageid = pss.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
order by pg.name

-- optionset and options 
select ops.optionsetid optionSETID, ops.uid optionsetUID, ops.name optionsetName,
opv.optionvalueid, opv.uid optionUID, opv.name optionName, opv.code optionCode from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
order by ops.name;

-- optiongroup and optiongroupmembers 	
select opg.optiongroupid optionGrpID, opg.uid optionGrpUID, opg.name optionGrpName,
opv.optionvalueid, opv.uid optionUID, opv.name optionName, opv.code optionCode from optiongroup opg
INNER JOIN optiongroupmembers opgm ON opgm.optiongroupid = opg.optiongroupid
INNER JOIN optionvalue opv ON opv.optionvalueid = opgm.optionid
order by opg.name;




SELECT tea.name teaName,tea.uid teaUid ,os.name optionsetName,os.uid optionsetUid 
,ov.uid optionValueUid ,ov.name optionValueName,ov.code optionValueCode FROM optionvalue ov
INNEr JOIN optionset os ON os.optionsetid = ov.optionsetid
INNER JOIN trackedentityattribute tea ON tea.optionsetid = os.optionsetid;

-- option value with option set
select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
order by ops.name;

select ops.uid optionsetUID, ops.name optionsetName, 
opv.uid optionUID, opv.name optionName, 
opv.code optionCode,opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
order by ops.name;

select ops.uid optionsetUID, ops.name optionsetName, opv.uid optionUID, opv.name optionName, 
opv.code optionCode, opv.sort_order from optionvalue opv 
INNER JOIN optionset ops ON ops.optionsetid = opv.optionsetid
where ops.uid = 'cjuiUdHB366' order by ops.name;


 -- who_leprosy reporting rate query

SELECT dv.sourceid,org1.name as Region_Name ,org.name as country_name,count( dv.sourceid ) 
from datavalue dv
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN organisationunit org1 ON org1.organisationunitid = org.parentid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN period pe ON pe.periodid = dv.periodid
where ds.uid in( 'KaaRzuDwB2X') and dv.deleted is not true and 
dv.dataelementid not in ( 22506,2350,2349, 1774 ) and 
pe.startdate = '2019-01-01' and pe.enddate = '2019-12-31'
group by dv.sourceid,org1.name,org.name order by org1.name;	


SELECT dv.sourceid,org1.name as region_Name , org1.uid as region_uid, org.name as country_name,
org.uid as country_uid,count( dv.sourceid ) from datavalue dv
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN organisationunit org1 ON org1.organisationunitid = org.parentid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN period pe ON pe.periodid = dv.periodid
where ds.uid = '${dataSetUid}' and dv.deleted is not true and 
dv.dataelementid not in ( 22506,2350,2349, 1774 ) and 
pe.startdate = '${startDate}' and pe.enddate = '${endDate}'
group by dv.sourceid,org1.name,org1.uid,org.name,org.uid order by org1.name;




Excel import & Report app db key migration from systemsetting table to keyjsonvalue table

Excel-import-app-templates
Excel-import-app-orgunit-mapping
Excel-import-app-pool
Excel-import-app-history

http://localhost:8090/dhis/api/system/id.json?limit=10

insert into keyjsonvalue (keyjsonvalueid,,uid, created, lastupdated, namespace, namespacekey ) values
="(nextval('hibernate_sequence'),'2019-02-26','2019-02-26','"&A2&"','"&B2&"'),"


select value::text
	from usersetting
	where name like 'keyMessageSmsNotification%'	

select value::text
	from systemsetting
	where name like 'keySmsSetting%' 	

update keyjsonvalue set created = now()::timestamp where created ='2019-02-26';
update keyjsonvalue set lastupdated = now()::timestamp where lastupdated ='2019-02-26';

update keyjsonvalue set value = 
	( select right(value::text,length(value::text) - 22 )
	from systemsetting
	where name like 'Excel-import-app-orgunit-mapping%' )
where namespace = 'Excel-import-app-orgunit-mapping';


update keyjsonvalue set value = 
	(select right(value::text,length(value::text) - 25)
	from systemsetting
	where name like 'Excel-import-app-pool%'
)
where namespace = 'Excel-import-app-pool';

update keyjsonvalue set value = 
	(select right(value::text,length(value::text) - 25)
	from systemsetting
	where name like 'Excel-import-app-templates%'
)
where namespace = 'Excel-import-app-templates';


update keyjsonvalue set value = 
	( select right(value::text,length(value::text) - 22 )
	from systemsetting
	where name like 'Excel-import-app-history%' )
where namespace = 'Excel-import-app-history';



update keyjsonvalue set value = 
	(select right(value::text,length(value::text) - 22)
	from systemsetting
	where name like 'reportApp-section-json'
)
where namespace = 'reportApp-section-json';

update keyjsonvalue set value = 
	(select right(value::text,length(value::text) - 22)
	from systemsetting
	where name like 'reportApp-reports-json'
)
where namespace = 'reportApp-reports-json';


select de.name deName, coc.name COCName, org.name orgName, pe.startdate STARTDATE, dv.* from datavalue dv 
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN period pe ON pe.periodid = dv.periodid
where dv.dataelementid in ( 591,590,589,23596,23475 ) and 	dv.categoryoptioncomboid = 21520
and dv.sourceid in ( 17150,17180,17147,17175,17149,17151,17148,17176,17145,17146 ) and dv.periodid in 
( 38135545,38002029,37979107,38115491,40582909,39795112,33184716,37809045,33143771)


select de.name deName, coc.name COCName, org.name orgName, pe.startdate STARTDATE, dv.* from datavalueaudit dv 
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN organisationunit org ON org.organisationunitid = dv.organisationunitid
INNER JOIN period pe ON pe.periodid = dv.periodid
where dv.dataelementid in ( 591,590,589,23596,23475 ) and 	dv.categoryoptioncomboid = 21520
and dv.organisationunitid in ( 17150,17180,17147,17175,17149,17151,17148,17176,17145,17146 ) and dv.periodid in 
( 38135545,38002029,37979107,38115491,40582909,39795112,33184716,37809045,33143771) order by pe.startdate

// for datasetelement

select ds.name,de.name,dsm.datasetid,dsm.dataelementid,co.name,de.categorycomboid from datasetmembers dsm
INNER JOIN dataset ds ON ds.datasetid = dsm.datasetid
INNER JOIN dataelement de ON de.dataelementid = dsm.dataelementid
INNER JOIN categorycombo co ON co.categorycomboid = de.categorycomboid





select pet.name,pe.* from period pe
INNER JOIN periodtype pet ON pet.periodtypeid = pe.periodtypeid order by pe.startdate;
where pe.periodid in ( select periodid from datavalue )
order by pe.startdate;


// UPHMIS-Auto-Approve Query
SELECT psi.programstageinstanceid, psi.completeddate::date,psi.status, tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
WHERE psi.programstageid in ( 38565722,38565580,38565712,38565696,73397819,73397876,
73397824,73337045,73337059,73337069,73397847,73397870,73397880,73397864,73397815,
73397885,73397828,73397894,73397890,73337065,87350569,87354729 ) AND 
psi.completeddate <= CURRENT_DATE - interval '7 day' AND psi.status = 'COMPLETED' AND
tedv.dataelementid = 38576348
order by psi.completeddate desc;



SELECT psi.programstageinstanceid, psi.completeddate::date,psi.status, tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( 73337033 ) ) AND 
psi.completeddate <= CURRENT_DATE - interval '30 day' AND psi.status = 'COMPLETED' AND
tedv.dataelementid = 88199674
order by psi.completeddate desc;



// UPHMIS-Auto-Approve Query Dr Diary

SELECT psi.programstageinstanceid, psi.completeddate from programstageinstance psi  
WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( 73337033 ) ) AND
psi.completeddate <= CURRENT_DATE - interval '30 day' AND psi.status = 'COMPLETED' order by psi.completeddate desc;

SELECT psi.programstageinstanceid, psi.completeddate from programstageinstance psi  
WHERE psi.programstageid in 
( SELECT programstageid from programstage where  programid in ( 73337033 ) ) 
AND psi.completeddate::date BETWEEN '2019-08-01' AND '2019-08-31'  
AND psi.status = 'COMPLETED' order by psi.completeddate desc

select tedv.* from trackedentitydatavalue tedv where tedv.programstageinstanceid in ( SELECT psi.programstageinstanceid from programstageinstance psi  
WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( 73337033 ) ) AND
psi.completeddate <= CURRENT_DATE - interval '30 day' AND psi.status = 'COMPLETED' order by psi.completeddate desc ) and tedv.dataelementid = 88199674



SELECT psi.programstageinstanceid, psi.completeddate::date,psi.status, tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
WHERE psi.programstageid in ( SELECT programstageid from programstage where  programid in ( 38565572,38565588,38565704 ) ) AND 
psi.completeddate <= CURRENT_DATE - interval '7 day' AND psi.status = 'COMPLETED' AND
tedv.dataelementid = 38576348
order by psi.completeddate desc;


// source tree password reset link

https://community.atlassian.com/t5/Sourcetree-questions/How-to-update-HTTP-S-credentials-in-sourcetree/qaq-p/297564

// UID generation function

CREATE OR REPLACE FUNCTION uid()
RETURNS text AS $$
  SELECT substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' 
    FROM (random()*51)::int +1 for 1) || 
    array_to_string(ARRAY(SELECT substring('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789' 
       FROM (random()*61)::int + 1 FOR 1) 
   FROM generate_series(1,10)), '') ;
$$ LANGUAGE sql;


// maharashtra advance analysis report query

-- dataSet source with its parent and parentparent name
SELECT  dss.datasetid,ds.name, dss.sourceid,
org.uid orgUID,org.name orgName, parentOrg.name parentName,
parentParentOrg.name parentParentName from datasetsource dss
INNER JOIN dataset ds ON ds.datasetid = dss.datasetid
INNER JOIN organisationunit org ON org.organisationunitid = dss.sourceid
INNER JOIN organisationunit parentOrg ON parentOrg.organisationunitid = org.parentid 
INNER JOIN organisationunit parentParentOrg ON parentParentOrg.organisationunitid = parentOrg.parentid 
where dss.datasetid in ( 1987,1991,1989,1978 )
order by ds.name;


SELECT  dss.datasetid,ds.name, count( dss.sourceid ) from datasetsource dss
INNER JOIN dataset ds ON ds.datasetid = dss.datasetid
where dss.datasetid in ( 72846,72845,72842,72843,72844 )
group by dss.datasetid,ds,name order by dss.datasetid;

SELECT  datasetid,count( sourceid ) from datasetsource
where datasetid in ( 72846,72845,72842,72843,72844 )
group by datasetid;


SELECT dsc.datasetid,ds.name, dsc.periodid, count( dsc.sourceid ) from completedatasetregistration dsc
INNER JOIN dataset ds ON ds.datasetid = dsc.datasetid
where dsc.datasetid in ( 72846,72845,72842,72843,72844 )
GROUP BY dsc.datasetid, ds.name, dsc.periodid order by dsc.datasetid;

SELECT datasetid,periodid, count( sourceid ) from completedatasetregistration
where datasetid in ( 72846,72845,72842,72843,72844 )
GROUP BY datasetid, periodid;

SELECT datasetid,periodid, attributeoptioncomboid,count( sourceid ) from completedatasetregistration
where datasetid in ( 72846,72845,72842,72843,72844 ) and periodid in ( 2241,95689,40582909,38135545 )
GROUP BY datasetid, periodid, attributeoptioncomboid;

//UPHMIS-III new tracker-report Dr.Diary

SELECT pi.trackedentityinstanceid, psi.programstageinstanceid,psi.executiondate::date,tedv.value from trackedentitydatavalue tedv
INNER JOIN programstageinstance psi ON psi.programstageinstanceid = tedv.programstageinstanceid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
where pi.trackedentityinstanceid in ( 88073536,102802294,88073550,88073608,88073589,88073590,102854204,
88073599,88069666,88073602,88069657,88073637,88069663,102859285,88069779,88069705,88070967,88073511,88073581,88070974,100891283,100542318,
102094078,100078041,103913070,103917592) and psi.programstageid = 87350569 and psi.executiondate between '2019-04-01' and '2019-06-01' 
and tedv.dataelementid = 38565556;


// NIN code for UPHMIS-III orgUnit

SELECT attrValue.value, org.uid, org.name,org.shortname from organisationunit org
left JOIN organisationunitattributevalues orgAttrValue ON orgAttrValue.organisationunitid = org.organisationunitid
left JOIN attributevalue attrValue ON  attrValue.attributevalueid = orgAttrValue.attributevalueid
and  attrValue.attributeid = 4393575





// SQLQUERY_TEI_DATA_VALUE_V1 HOnZ038FMkq  // for punjab

select tei.uid tei,ps.uid psuid,min(ps.name) psname,psi.uid ev ,psi.executiondate::date evdate,de.uid deuid,min(de.name) dename,min(tedv.value) devalue,ou.name, pi.enrollmentdate::date enrollDate from programstageinstance psi 
INNER JOIN programinstance pi ON  psi.programinstanceid = pi.programinstanceid 
INNER JOIN trackedentityinstance tei ON  pi.trackedentityinstanceid = tei.trackedentityinstanceid 
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid 
INNER JOIN dataelement de ON de.dataelementid = tedv.dataelementid 
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid 
INNER JOIN organisationunit ou ON ou.organisationunitid = psi.organisationunitid 
WHERE psi.programstageid IN (select programstageid from programstage where programid IN 
(select programid from program where uid = '${program}')) and psi.organisationunitid IN 
(select organisationunitid from organisationunit where path like '%${orgunit}%') 
and psi.executiondate between '${startdate}' and '${enddate}' 
group by tei.uid,ps.uid,psi.uid,psi.executiondate,de.uid,ou.name, pi.enrollmentdate order by psi.executiondate;


// TRACKER_REPORTS_TEI_ATTR_V1 tCRklU6jMp7 // for punjab

select tei.uid tei ,min(tea.name) attrname,tea.uid attruid,min(teav.value) attrvalue,ou.name,tei.created,pi.enrollmentdate::date enrolldate from programstageinstance psi 
INNER JOIN programinstance pi ON  psi.programinstanceid = pi.programinstanceid 
INNER JOIN trackedentityinstance tei ON  pi.trackedentityinstanceid = tei.trackedentityinstanceid 
INNER JOIN trackedentityattributevalue teav ON  teav.trackedentityinstanceid = pi.trackedentityinstanceid 
INNER JOIN trackedentityattribute  tea ON teav.trackedentityattributeid = tea.trackedentityattributeid 
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid 
INNER JOIN organisationunit ou ON ou.organisationunitid = psi.organisationunitid 
WHERE psi.programstageid IN (select programstageid from programstage 
where programid IN (select programid from program where uid = '${program}')) and 
psi.organisationunitid IN (select organisationunitid from organisationunit where path like '%${orgunit}%') 
and psi.executiondate between '${startdate}' and '${enddate}' 
group by tei.uid,pi.enrollmentdate,tea.uid,ou.name,tei.created order by pi.enrollmentdate;






select sum(vil_max_pop.max::integer) from organisationunit village
inner join (
 select max(trackedentitydatavalue.value), parent.uid vil_uid
 from trackedentitydatavalue
 inner join dataelement using(dataelementid)
 inner join programstageinstance using(programstageinstanceid)
 inner join organisationunit using(organisationunitid)
 inner join organisationunit parent on parent.organisationunitid=organisationunit.parentid
 where dataelement.uid='XJRt4P9JgLQ' and organisationunit.hierarchylevel=6 and date(programstageinstance.executiondate) 
 between '2019-8-1' and '2019-8-31'
 group by parent.uid
) vil_max_pop on vil_max_pop.vil_uid=village.uid
where village.hierarchylevel=5 and village.path ilike '%TANZANIA001%';


// query for complete registration

select dse.datasetid,dv.periodid,dv.sourceid,dv.attributeoptioncomboid from datavalue dv
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN period pe ON pe.periodid = dv.periodid
WHERE pe.startdate >= '2017-01-01' and enddate <= '2019-12-31'


// translation query

select op.optionvalueid, op.objecttranslationid,ot.locale, ot.property, ot.value from optionvaluetranslations op
INNER JOIN objecttranslation ot ON ot.objecttranslationid = op.objecttranslationid
where ot.locale = 'es';

//dataset assosiation
select ou.uid as ou_uid, array_agg(ds.uid) as ds_uid from datasetsource d 
inner join organisationunit ou on ou.organisationunitid=d.sourceid 
inner join dataset ds on ds.datasetid=d.datasetid 
where (ou.path like '/SpddBmmfvPr/v8EzhiynNtf%' ) group by ou_uid 


// mh circle list
SELECT 'All Circles' AS Circle FROM _orgunitstructure os
UNION
SELECT ou1.name AS Circle
FROM _orgunitstructure os
INNER JOIN organisationunit ou1 ON ou1.organisationunitid = os.idlevel3
WHERE (ou1.name LIKE 'All Circles' OR 'All Circles' LIKE 'All Circles')
GROUP BY ou1.name
order by Circle

// mh district

SELECT 'All Districts' AS District FROM _orgunitstructure os

UNION

SELECT ou1.name AS District
FROM _orgunitstructure os 
INNER JOIN organisationunit ou1 ON ou1.organisationunitid = os.idlevel4
INNER JOIN organisationunit ou2 ON ou2.organisationunitid = os.idlevel3
WHERE (ou1.name LIKE 'All Districts' OR  'All Districts' LIKE 'All Districts')
AND ou2.name LIKE ?
GROUP BY ou1.name
order by District

-- convert gemotery to Longitude, Latitude

SELECT organisationunitid,uid,name,geometry,
ST_X(ST_Transform (geometry, 4326)) AS "Longitude",
ST_Y(ST_Transform (geometry, 4326)) AS "Latitude"
FROM organisationunit where uid = 'WLBxL2ClHIC';

SELECT organisationunitid,uid,name,geometry,
ST_X(ST_Transform (geometry, 4326)) AS "Longitude",
ST_Y(ST_Transform (geometry, 4326)) AS "Latitude"
FROM organisationunit where organisationunitid in (
select organisationunitid from orgunitgroupmembers where orgunitgroupid in (
select orgunitgroupid from orgunitgroup where uid ='pW6owR4oRKb'));


-- HIV-tracker SMS program sms send details query 
SELECT prgmsg.created, prgmsg.lastupdated, prgmsg.text, prgmsg.subject, 
prgmsg.processeddate, prgmsg.messagestatus,
prgmsg.trackedentityinstanceid,prgmsg.programinstanceid, prgmsg.programstageinstanceid, 
prgmsg.lastupdatedby,ur.username, prgmsg_phone.phonenumber recevier_phone_number
from programmessage prgmsg
INNER JOIN programmessage_phonenumbers prgmsg_phone ON prgmsg_phone.programmessagephonenumberid = prgmsg.id
INNER JOIN users ur ON ur.userid = prgmsg.lastupdatedby;


-- program-rule-action query

SELECT pg.name pgName,pg.uid pgUID,pra.programstageid, ps.name psName,ps.uid psUID,
pss.name sectionName,pss.uid sectionUid, pr.name prGRuleName, pr.uid programRuleUID, pra.programruleid, pr.priority,
pra.dataelementid,pra.actiontype,pra.programstagesectionid, 
pra.programstageid, de.name deName,de.uid deUID, pr.rulecondition from programruleaction pra
LEFT JOIN programstage ps ON ps.programstageid = pra.programstageid
LEFT JOIN program pg ON pg.programid = ps.programid
LEFT JOIN programstagesection pss ON pss.programstagesectionid = pra.programstagesectionid
LEFT JOIN programrule pr ON pr.programruleid = pra.programruleid
LEFT JOIN dataelement de on de.dataelementid = pra.dataelementid

-- program rule list program wise
select pg.name programName, pg.uid programUID,pr.programid programId,pr.name programRuleName, 
pr.uid programRuleUID,pr.rulecondition, pr.priority from programrule pr
INNER JOIN program pg on pg.programid = pr.programid 
INNER JOIN programruleaction pra ON pra.programruleid = pr.programruleid

-- program rule list program wise with programrule action
SELECT pg.name programName, pg.uid programUID,pr.programid programId,pr.name programRuleName, 
pr.uid programRuleUID,pr.rulecondition, pr.priority, pra.programruleactionid,
pra.uid programruleactionUID, pra.actiontype programruleactionActiontype,pra.content programruleactionContent,
pra.data programruleactionDATA from programrule pr
INNER JOIN program pg on pg.programid = pr.programid
INNER JOIN programruleaction pra ON pra.programruleid = pr.programruleid


SELECT pg.name programName, pg.uid programUID,pr.programid programId,pr.name programRuleName, 
pr.uid programRuleUID,pr.rulecondition, pr.priority, pra.programruleactionid,
pra.uid programruleactionUID, pra.actiontype programruleactionActiontype,
pra.content programruleactionContent,
pra.data programruleactionDATA,pra.evaluationtime,pra.environments from programrule pr
INNER JOIN program pg on pg.programid = pr.programid
INNER JOIN programruleaction pra ON pra.programruleid = pr.programruleid;

SELECT pg.name programName, pg.uid programUID,pr.programid programId,pr.name programRuleName, 
pr.uid programRuleUID,pr.rulecondition, pr.priority, pra.programruleactionid,
pra.uid programruleactionUID, pra.actiontype programruleactionActiontype,pra.content programruleactionContent,
pra.data programruleactionDATA from programrule pr
INNER JOIN program pg on pg.programid = pr.programid
INNER JOIN programruleaction pra ON pra.programruleid = pr.programruleid
WHERE pg.uid = 'KgLaG1OfLJK';

select * from programruleaction

-- json query

-- for dataElement translations

SELECT specs.name, COUNT(*) AS total
FROM 
  categories, 
  jsonb_to_recordset(categories.specifics) AS specs(name jsonb, required boolean)
WHERE 
  specs.required = TRUE
  -- AND any other restrictions you need
GROUP BY specs.name
ORDER BY total DESC;

SELECT dataelement.dataelementid,dataelement.uid,
dataelement.name, de_translation.value,de_translation.locale,de_translation.property
FROM dataelement, jsonb_to_recordset(dataelement.translations) 
AS de_translation(value TEXT, locale TEXT, property TEXT)
WHERE de_translation.locale = 'my' and de_translation.property = 'NAME';


SELECT dataelement.dataelementid,dataelement.uid,
dataelement.name, de_translation.value,de_translation.locale,de_translation.property
FROM dataelement, jsonb_to_recordset(dataelement.translations) 
AS de_translation(value TEXT, locale TEXT, property TEXT)
WHERE de_translation.locale = 'my' and de_translation.property in( 'NAME','FORM_NAME');


SELECT *
FROM 
  dataelement, 
  jsonb_to_recordset(dataelement.translations) AS specs(value TEXT, locale TEXT,property TEXT)
WHERE 
  specs.locale = 'my'
  
SELECT * from jsonb_array_elements('[{"a":"apple", "b":"biscuit"}]');

SELECT * FROM
  json_to_recordset(
    '[{"x": "A", "y": 1}, {"x": "B", "y": 2}]')
	AS (x TEXT, y INT); 

SELECT * FROM json_each('{"a":"apple", "b":"biscuit"}');
-- got from global-team

SELECT data.key as de_uid,
cast(data.value::json → ‘value’ AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE

-- json query for eventdatavalues in programstageinstance table


-- eventDataValue update dataElement-value
 
UPDATE programstageinstance SET 
eventdatavalues = jsonb_set(eventdatavalues,'{FmDPRFXrMaG, value}', '"2021-08-17T20:53:08.000Z"',true) 
WHERE programstageinstanceid = '123621';




-- for all events dataelement and its value
SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE;


SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid eventID,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE
and psi.executiondate between '2021-01-01' and '2021-10-05'; 

-- event list with dataelement-value
SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid eventID,
psi.executiondate::date FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE
and psi.executiondate between '2021-08-01' and '2021-11-30'; 

-- event list with dataelement-value
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where psi.executiondate between '2021-08-01' and '2021-11-30';

SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, de.valuetype AS deValueType FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key

SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
length(cast(data.value::json ->> 'value' AS VARCHAR)) AS de_value_length,
prg.uid AS prgUID,de.valuetype AS deValueType FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key

where psi.created between '2022-09-28' and '2022-09-30';



-- program wise event list with dataelement-value
SELECT psi.uid eventID,psi.storedby, psi.status, psi.executiondate::date,org.uid AS orgUnit_uid,
org.name AS orgUnit_name, psi.completedby, psi.completeddate::date, psi.deleted,data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, de.name AS dataElementName,
prg.uid AS prgUID, prg.name AS prgName FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where prg.uid = 'dzizG8i1cmP' and psi.executiondate between '2021-08-01' and '2021-08-31'
order by psi.programstageinstanceid;


SELECT psi.uid eventID,psi.storedby, psi.status, psi.executiondate::date,org.uid AS orgUnit_uid,
org.name AS orgUnit_name, psi.completedby, psi.completeddate::date, psi.deleted,data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, de.name AS dataElementName,
prg.uid AS prgUID, prg.name AS prgName FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where prg.uid = 'qlHnTeSDOfP' order by psi.programstageinstanceid;


-- eventdatavalue based on dataelement value and uid

SELECT psi.uid eventID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'vHA2T42pAQz' and prg.uid = 'SuvMxhyPK5l' ;

SELECT psi.programstageinstanceid, psi.uid eventID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'nPcT1HabdNa' ->> 'value' < '2022-12-31'
and de.uid = 'nPcT1HabdNa' order by psi.programstageinstanceid;

select psi.uid eventID,psi.programstageinstanceid, psi.executiondate::date,
psi.duedate::date,org.uid orgUID,org.name orgName,data.key as dataElement_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS ADMISSION_NUMBER from programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
where de.uid = 'VxScEPPSjq8' and 
(EXTRACT(year from psi.executiondate) < 1990 
or EXTRACT(year from psi.executiondate) > 2029) 
order by psi.executiondate;



SELECT psi.uid eventID,psi.storedby, psi.status, psi.executiondate::date,
psi.completedby, psi.completeddate::date,psi.deleted,data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, de.name AS dataElementName,
prg.uid AS prgUID,org.uid AS orgUnit_uid FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'dKZsEnR8s9C'
order by psi.programstageinstanceid;

-- event list with dataelement-value with trackedentityattributevalue
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate between '2021-08-01' and '2021-11-30' and teav.trackedentityattributeid = 3418;

-- bhutan Gastric Cancer Management data list with CID attribute
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'SuvMxhyPK5l' and teav.trackedentityattributeid = 3987324;

-- bhutan Gastric Cancer Management data list with CID attribute
SELECT psi.uid eventID,psi.executiondate::date, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, 
prg.uid AS prgUID,de.name AS dataElementName, teav.value AS CR_Number, 
org.uid AS orgUnitUID, org.name AS orgUnitName FROM programstageinstance psi 
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN dataelement de ON de.uid = data.key
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where prg.uid = 'SuvMxhyPK5l' and teav.trackedentityattributeid = 3987324;

-- bhutan Gastric Cancer Management data list with CID attribute with orgUnit name and uid
SELECT psi.uid eventID, org.uid AS orgUnitUID, org.name AS orgUnitName, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, prg.uid AS prgUID, 
de.name AS dataElementName, teav.value AS CID_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where tea.uid = 'cae0w7Dh8q2' and de.uid = 't1BdYeCTz8Y' and prg.uid = 'VuoSamZ3qrE';

SELECT psi.programstageinstanceid, psi.uid eventID, psi.executiondate::date,
prg.uid AS prgUID, ps.uid AS programStageUID,teav.value AS serial_no FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
where psi.executiondate = '2022-01-18' and teav.trackedentityattributeid = 22745
and prg.uid = 'CTUqdqhrb46' and ps.uid = 'xikrKb0k2Eg';


SELECT psi.uid eventID,psi.executiondate::date as eventdate, org.uid AS orgUnitUID, org.name AS orgUnitName, 
data.key as de_uid, cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, prg.uid AS prgUID, 
de.name AS dataElementName, teav.value AS CID_Number FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN dataelement de ON de.uid = data.key
where tea.uid = 'cae0w7Dh8q2' and de.uid = 'pi92syhlS8p' and prg.uid = 'VuoSamZ3qrE';

-- event list with trackedentityattributevalue
SELECT org.name AS orgName,tei.uid AS teiUID,teav.value as CR_Number,psi.uid eventID,
psi.executiondate::date,psi.status,psi.completeddate::date,psi.completedby 
FROM programstageinstance psi
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
where psi.status = 'COMPLETED' and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and teav.trackedentityattributeid =  3418;


-- event list with multiple TEA value trackedentityattributevalue
SELECT teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and psi.status = 'COMPLETED';


-- event list with multiple TEA value trackedentityattributevalue
SELECT psi.uid AS eventUID,teav2.value as Patient_Name ,teav1.value as CR_Number, 
org.name AS orgName,psi.executiondate::date as Event_date,
psi.status AS Event_Status, psi.completeddate::date AS Completed_Date,
psi.completedby AS Completed_By FROM trackedentityattributevalue teav1
INNER JOIN ( SELECT trackedentityinstanceid,value FROM trackedentityattributevalue 
WHERE trackedentityattributeid = 474720 ) teav2
on teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
WHERE teav1.trackedentityattributeid =  3418 and org.uid in ( 'bLfOUtl4eZd','SalGKJqIV3t')
and psi.status = 'COMPLETED' and psi.executiondate 
between '2023-06-01' and '2023-06-30' and prg.uid not in ('L7bu48EI54J');



-- tei list based on tea attribute uid
SELECT tei.uid AS tei_uid, pi.uid AS enrollment_uid, prg.uid AS program_uid,
org.uid AS orgUnit_uid,teav.value AS care_mother_id from trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid 
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
where tea.uid = 'yDaWsAZcr8K';

-- tei,enrollment,org,program,event,eventdatavalues list
SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'nPcT1HabdNa' ->> 'value' < '2022-12-31'
and de.uid = 'nPcT1HabdNa' order by psi.programstageinstanceid;


-- tei,enrollment,org,program, programStage,event,eventdatavalues list
SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, prgs.uid as prgSUID,psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN programstage prgs ON prgs.programstageid = psi.programstageid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'AWprRTJ8phx' ->> 'value' != '2'
and de.uid = 'AWprRTJ8phx' order by psi.programstageinstanceid;

SELECT tei.uid AS teiUID, pi.uid AS enrollment, org.uid AS orgUnitUID, 
prg.uid as prgUID, psi.uid eventUID, data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) 
AS de_value FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where psi.eventdatavalues -> 'AWprRTJ8phx' ->> 'value' != '2'
and psi.executiondate::date between '2021-01-01' and '2021-12-31'
and de.uid = 'AWprRTJ8phx' order by psi.programstageinstanceid;



-- for all events dataelement and its value and programstageinstanceid , UID
SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid,psi.programstageinstanceid
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE;


SELECT data.key as de_uid,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value, psi.uid,psi.programstageinstanceid
FROM programstageinstance psi
JOIN json_each_text(eventdatavalues::json) data ON TRUE where psi.programstageinstanceid = 79876;


 -- single dataElement value
SELECT e.uid, eventdatavalues -> 'ooIQeHbhH61' ->> 'value' as dataValue
FROM programstageinstance e
where eventdatavalues -> 'ooIQeHbhH61' is not null 
ORDER BY eventdatavalues -> 'ooIQeHbhH61' ->> 'value';


-- json query for AMR-2.34


SELECT e.uid, eventdatavalues -> 'ooIQeHbhH61' ->> 'value' as amrid
FROM programstageinstance e
and eventdatavalues -> 'ooIQeHbhH61' is not null 
ORDER BY eventdatavalues -> 'ooIQeHbhH61' ->> 'value';


SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%mKmB0wcw7Gf%' and eventdatavalues -> 'lIkk661BLpG' is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';


SELECT eventdatavalues -> 'lIkk661BLpG' ->> 'value' as amrid
FROM programstageinstance e
INNER JOIN programinstance pi ON e.programinstanceid = pi.programinstanceid
INNER JOIN program pr ON pi.programid = pr.programid
INNER JOIN organisationunit o ON e.organisationunitid = o.organisationunitid
WHERE o.path LIKE '%mKmB0wcw7Gf%' and eventdatavalues is not null 
ORDER BY eventdatavalues -> 'lIkk661BLpG' ->> 'value';


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



create or replace function generate_uid()
  returns text as
$$
declare
  chars  text [] := '{0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z}';
  result text := chars [11 + random() * (array_length(chars, 1) - 11)];
begin
  for i in 1..10 loop
    result := result || chars [1 + random() * (array_length(chars, 1) - 1)];
  end loop;
  return result;	
end;
$$
language plpgsql;

delete query for tracker data

// start
select * from trackedentityinstance;
delete from trackedentityinstance;

select * from trackedentityattributevalueaudit;
delete from trackedentityattributevalueaudit;

select * from trackedentityaudit;
delete from  trackedentityaudit;


select * from trackedentityattributevalue;
delete from  trackedentityattributevalue;

select * from programinstance; 
delete from programinstance; 

select * from programinstancecomments;
delete from programinstancecomments;


select * from programstageinstance;
delete from programstageinstance;

select * from trackedentitydatavalueaudit;
delete from trackedentitydatavalueaudit;

SELECT * FROM trackedentitydatavalue;
delete from trackedentitydatavalue;

// end

-- parent wise orgList
SELECT ou.organisationunitid as orgUnitID , ou.uid as orgUnid, ou.name as orgunit_name, parent.name as orgunit_parent, ous.level as orgunit_level, ou.code as orgunit_code from organisationunit ou 
inner join organisationunit parent on ou.parentid=parent.organisationunitid 
inner join _orgunitstructure ous on ou.organisationunitid=ous.organisationunitid 
order by ous.level, ou.name;


select organisationunitid,uid,name,shortname,code,path from organisationunit 
where path like '%Kg7auU6OEcY%' and hierarchylevel = 6;


-- orgUnit hierarchy Query

select
ou1.uid as uid1,max(ou1.name) as Level1,
ou2.uid as uid2,max(ou2.name) as Level2,
ou3.uid as uid3,max(ou3.name) as Level3,
ou4.uid as uid4,max(ou4.name) as Level4,
ou5.uid as uid5,max(ou5.name) as Level5,
ou6.uid as uid6,max(ou6.name) as Level6,
ou7.uid as uid7,max(ou7.name) as Level7,
ou8.uid as uid8,max(ou8.name) as Level8

from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
inner join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
inner join organisationunit ou8 on ou8.organisationunitid = ous.idlevel8
group by ou1.uid,ou2.uid,ou3.uid,ou4.uid,ou5.uid,ou6.uid,ou7.uid,ou8.uid

// for all ou


Select
ou1.uid as Level1uid1, ou1.organisationunitid as level1orgId, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as level2orgId, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as level3orgId, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as level4orgId, max(ou4.name) as Level4Name

from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4

group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid;




select
ou1.uid as Level1uid1, ou1.organisationunitid, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid, max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid, max(ou5.name) as Level5Name,
ou6.uid as Level6uid6, ou6.organisationunitid, max(ou6.name) as Level6Name
from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT  join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid,ou6.uid,ou6.organisationunitid;

// for all ou with code
// Level wise org unit hierarchy with id,uid,name,code

select
ou1.uid as Level1uid1, ou1.organisationunitid as ou1Id, max(ou1.code) as Level1Code, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as ou2Id, max(ou2.code) as Level2Code, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as ou3Id, max(ou3.code) as Level3Code, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as ou4Id, max(ou4.code) as Level4Code, max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid as ou5Id, max(ou5.code) as Level5Code, max(ou5.name) as Level5Name,
ou6.uid as Level6uid6, ou6.organisationunitid as ou6Id, max(ou6.code) as Level6Code, max(ou6.name) as Level6Name
from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT  join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid,ou6.uid,ou6.organisationunitid;

// for AES OrganisationunitHierarchylevel


select
ou1.uid as Level1uid1, ou1.organisationunitid as ou1Id, max(ou1.code) as Level1Code, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as ou2Id, max(ou2.code) as Level2Code, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as ou3Id, max(ou3.code) as Level3Code, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as ou4Id, max(ou4.code) as Level4Code, max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid as ou5Id, max(ou5.code) as Level5Code, max(ou5.name) as Level5Name,
ou6.uid as Level6uid6, ou6.organisationunitid as ou6Id, max(ou6.code) as Level6Code, max(ou6.name) as Level6Name,
ou7.uid as Level7uid7, ou7.organisationunitid as ou7Id, max(ou7.code) as Level7Code, max(ou7.name) as Level7Name 
from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT  join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
LEFT  join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid,ou6.uid,ou6.organisationunitid,ou7.uid,ou7.organisationunitid;



select
ou1.uid as Level1uid1, ou1.organisationunitid as ou1Id, max(ou1.code) as Level1Code, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as ou2Id, max(ou2.code) as Level2Code, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as ou3Id, max(ou3.code) as Level3Code, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as ou4Id, max(ou4.code) as Level4Code, max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid as ou5Id, max(ou5.code) as Level5Code, max(ou5.name) as Level5Name,
ou6.uid as Level6uid6, ou6.organisationunitid as ou6Id, max(ou6.code) as Level6Code, max(ou6.name) as Level6Name,
ou7.uid as Level7uid7, ou7.organisationunitid as ou7Id, max(ou7.code) as Level7Code, max(ou7.name) as Level7Name,
ou8.uid as Level8uid8, ou8.organisationunitid as ou8Id, max(ou8.code) as Level8Code, max(ou8.name) as Level8Name
from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT  join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
LEFT  join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
LEFT  join organisationunit ou8 on ou8.organisationunitid = ous.idlevel8

group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid,ou6.uid,ou6.organisationunitid,
ou7.uid,ou7.organisationunitid,ou8.uid,ou8.organisationunitid;



select
ou1.uid as Level1uid1, ou1.organisationunitid as ou1Id, max(ou1.code) as Level1Code, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as ou2Id, max(ou2.code) as Level2Code, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as ou3Id, max(ou3.code) as Level3Code, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as ou4Id, max(ou4.code) as Level4Code, max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid as ou5Id, max(ou5.code) as Level5Code, max(ou5.name) as Level5Name,
ou6.uid as Level6uid6, ou6.organisationunitid as ou6Id, max(ou6.code) as Level6Code, max(ou6.name) as Level6Name,
ou7.uid as Level7uid7, ou7.organisationunitid as ou7Id, max(ou7.code) as Level7Code, max(ou7.name) as Level7Name
from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT  join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
LEFT  join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7


group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid,ou6.uid,ou6.organisationunitid,
ou7.uid,ou7.organisationunitid;




SELECT organisationunitid, orgunitgroupid
  FROM public.orgunitgroupmembers;

SELECT orgGrp.name orgGrpName, orgGrp.uid orgGrpUID, grpm.orgunitgroupid, grpm.organisationunitid,
org.name orgName, org.uid orgUID from orgunitgroupmembers grpm
INNER JOIN orgunitgroup orgGrp on orgGrp.orgunitgroupid = grpm.orgunitgroupid
INNER JOIN organisationunit org ON org.organisationunitid = grpm.organisationunitid;


SELECT orgGrp.name orgGrpName, orgGrp.uid orgGrpUID, grpm.orgunitgroupid, grpm.organisationunitid,
org.uid orgUID,org.name orgName,org.geometry, org.featuretype, org.coordinates from orgunitgroupmembers grpm
INNER JOIN orgunitgroup orgGrp on orgGrp.orgunitgroupid = grpm.orgunitgroupid
INNER JOIN organisationunit org ON org.organisationunitid = grpm.organisationunitid
where orgGrp.uid = 'pW6owR4oRKb';


SELECT grpSetm.orgunitgroupid, orgGrp.uid orgGrpUID, orgGrp.name orgGrpName, 
grpSetm.orgunitgroupsetid, orgGrpSet.uid orgGrpSetUID, orgGrpSet.name orgGrpSetName
from orgunitgroupsetmembers grpSetm
INNER JOIN orgunitgroupset orgGrpSet on orgGrpSet.orgunitgroupsetid = grpSetm.orgunitgroupsetid
INNER JOIN orgunitgroup orgGrp on orgGrp.orgunitgroupid = grpSetm.orgunitgroupid



--
select
ou3.uid as Level3uid3, ou3.organisationunitid as Level3Id,  max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as Level4Id,  max(ou4.name) as Level4Name,
ou5.uid as Level5uid5, ou5.organisationunitid as Level5Id,  max(ou5.name) as Level5Name
from _orgunitstructure ous
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT  join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
where ou5.uid in ( 'GnmMb2JDryG','eWHFgzFPx6s','mn1kqNtHaDv','bCGIubyy1Ra',
'wdYp9GeyjGi','nCaOPu8dW2q','Avwl3ZS37fv','khagSyddxGD','XVrHQzr2uuV',
'Mjx97JHBajt','aOe6LJfPgC8','bd0T2offit7','aN5Ww1lDwwR','k6xigTNkh3C',
'EP543JuyvW4','Zjj4sopJNj8','XCw7ngFRczv','dyoczAXmFt1','LiDyIL5Z2YE',
'KLxWrjU0AlS','NMMEsxlyfNv','fdAEc0yRtA0','qehiqhmjOjN','V0EwlbvkbL3',
'TkWHGn8VdHm','SwImjMSBczk','ePQjOrsoH51','lDLzaeIC92C','GL3ESpEwcbI',
'dzSHLi345uI','M8dApIyKObH','O8pbGdxjEta','MvHnshMgGww','T40q8UGXg6o',
'CqAxFuLK9CU','vJu3pStVJDh','bXglQKwy4Pc','Ht9UnWXvhsc','ZgFcMdvh33u',
'kv4BR2Bzb7e','Lfgq2kbT01f','WBqQisvXIVx','lGeNrDsLoCs','LASK9BemUcR',
'ErUGJubk5Zl','rFmhkd2Krft','OH6yBGLFuTA','pz2kc8nDbAX','yVfoHWxxg7g',
'giYuPCrk5MI','JFQxuPyktdo','jKNRUG2X6LT','eYIdiwCQU5l','KySYf9xjX0j',
'a6pN1MgDnty','WQ8kYuiNTuH','dCrlmYk8hnN','v0iPqlcLJlN','u35ZfyFLJL5',
'rPf42IMqDE4','JTPaApiYHd8','cnUSAOL9iO0','fExnPmm9iWM','NF0WAN5SlAA',
'ES8uspmjzyL','njShRs3hrdI','cvnhdE9DCdR','OVTDpvtxg68','gdK17pU5Ksu',
'UgS2eBowyqZ','BmD60As6J5N','wHfih7aSejF','D6ygB4ofeyL','Htp9yGijiot',
'fWn8c93sDDA','mmrDHbdThya','FT73Aaila9n','nloHZoxddZv','qd2I5zguH83',
'RWWCPwGUctE','sdUm6hcCEjy','H4vbtYV5oVL','EBySyhko706','lcQmx8QY9JH',
'SgdvaMrintJ','tOXrq7UoUXY','EXPy1m5UYqr','X2QRZGcCndX','CwNxbn8LZi7',
'hgiYnVZiIod','f6jH0JyK5Ov','GBHE69GKJ7Z','baA7S89pint','L3YEgvX1Kl1',
'nLFJoAPw8j5','uXUK2VODDMb','cOaWgi1Nh7R','oCL8yjfLCGb','hVnGGSYuok5',
'GitGcQSio6e','Ii33sr9ZEn4')group by ou3.uid,ou3.organisationunitid, 
ou4.uid,ou4.organisationunitid,ou5.uid,ou5.organisationunitid;




//
select
ou1.uid as uid1,max(ou1.name) as Level1,
ou2.uid as uid2,max(ou2.name) as Level2,
ou3.uid as uid3,max(ou3.name) as Level3,
ou4.uid as uid4,max(ou4.name) as Level4,
ou5.uid as uid5,max(ou5.name) as Level5,
ou6.uid as uid6,max(ou6.name) as Level6,
ou7.uid as uid7,max(ou7.name) as Level7,
ou8.uid as uid8,max(ou8.name) as Level8,
ou8.code as villageCode
from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
inner join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
inner join organisationunit ou8 on ou8.organisationunitid = ous.idlevel8
where ou4.uid in ('I5thpfRseUa' )
group by ou1.uid,ou2.uid,ou3.uid,ou4.uid,ou5.uid,ou6.uid,ou7.uid,ou8.uid,ou8.code;


select
ou1.uid as uid1,max(ou1.name) as Level1,
ou2.uid as uid2,max(ou2.name) as Level2,
ou3.uid as uid3,max(ou3.name) as Level3,
ou4.uid as uid4,max(ou4.name) as Level4,
ou5.uid as uid5,max(ou5.name) as Level5,
ou6.uid as uid6,max(ou6.name) as Level6

from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6

where ou4.uid in ('I5thpfRseUa' )
group by ou1.uid,ou2.uid,ou3.uid,ou4.uid,ou5.uid,ou6.uid;




//

select
ou5.uid as uid5, max(ou5.code) as level5Code, max(ou5.name) as Level5,
ou6.uid as uid6, max(ou6.code) as level6Code, max(ou6.name) as Level6,
ou7.uid as uid7, max(ou7.code) as level7Code, max(ou7.name) as Level7
from _orgunitstructure ous
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
inner join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
where ou3.uid in ('btqqHOcHenl' )
group by ou5.uid,ou6.uid,ou7.uid;


// orgUnit hierarchy Query with code uid and name

select
ou1.uid as uid1,max(ou1.name) as Level1,ou1.code as code1,
ou2.uid as uid2,max(ou2.name) as Level2 , ou2.code as code2,
ou3.uid as uid3,max(ou3.name) as Level3 , ou3.code as code3,
ou4.uid as uid4,max(ou4.name) as Level4, ou4.code as code4,
ou5.uid as uid5,max(ou5.name) as Level5, ou5.code as code5,
ou6.uid as uid6,max(ou6.name) as Level6, ou6.code as code6
from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
where ou2.uid in ('LpfSRXWPPRz' )
group by ou1.uid,ou1.code,ou2.uid,ou2.code,ou3.uid,ou3.code,ou4.uid,ou4.code,ou5.uid,ou5.code,ou6.uid,ou6.code;


up to level-3

select
ou1.uid as uid1,max(ou1.name) as Level1,ou1.code as code1,
ou2.uid as uid2,max(ou2.name) as Level2 , ou2.code as code2,
ou3.uid as uid3,max(ou3.name) as Level3 , ou3.code as code3

from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3

group by ou1.uid,ou1.code,ou2.uid,ou2.code,ou3.uid,ou3.code;



up to level-4


select
ou1.uid as uid1,max(ou1.name) as Level1,ou1.code as code1,
ou2.uid as uid2,max(ou2.name) as Level2 , ou2.code as code2,
ou3.uid as uid3,max(ou3.name) as Level3 , ou3.code as code3

from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3

group by ou1.uid,ou1.code,ou2.uid,ou2.code,ou3.uid,ou3.code;



// up to level_9

select
ou1.uid as uid1,max(ou1.name) as Level1,
ou2.uid as uid2,max(ou2.name) as Level2,
ou3.uid as uid3,max(ou3.name) as Level3,
ou4.uid as uid4,max(ou4.name) as Level4,
ou5.uid as uid5,max(ou5.name) as Level5,
ou6.uid as uid6,max(ou6.name) as Level6,
ou7.uid as uid7,max(ou7.name) as Level7,
ou8.uid as uid8,max(ou8.name) as Level8,
ou9.uid as uid9,max(ou9.name) as Level9

from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
inner join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
inner join organisationunit ou8 on ou8.organisationunitid = ous.idlevel8
inner join organisationunit ou9 on ou9.organisationunitid = ous.idlevel9
group by ou1.uid,ou2.uid,ou3.uid,ou4.uid,ou5.uid,ou6.uid,ou7.uid,ou8.uid,ou9.uid;





select

ou3.uid as uid3,max(ou3.name) as Level3,
ou4.uid as uid4,max(ou4.name) as Level4,
ou5.uid as uid5,max(ou5.name) as Level5,
ou6.uid as uid6,max(ou6.name) as Level6,
ou7.uid as uid7,max(ou7.name) as Level7,
ou8.uid as uid8,max(ou8.name) as Level8,
ou9.uid as uid9,max(ou9.name) as Level9

from _orgunitstructure ous

inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
inner join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
inner join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
inner join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
inner join organisationunit ou7 on ou7.organisationunitid = ous.idlevel7
inner join organisationunit ou8 on ou8.organisationunitid = ous.idlevel8
inner join organisationunit ou9 on ou9.organisationunitid = ous.idlevel9
where ou3.uid in ('SNQGLnYiMBE' )
group by ou3.uid,ou4.uid,ou5.uid,ou6.uid,ou7.uid,ou8.uid,ou9.uid;



-- orgUnit herarchy by uid and complete path_name

select
ous.organisationunituid as orgunituid,
CONCAT (ou2.name,'/',ou3.name,'/',ou4.name ,'/',ou5.name ,'/',ou6.name) as heirarchy   
from _orgunitstructure ous
LEFT join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
LEFT join organisationunit ou5 on ou5.organisationunitid = ous.idlevel5
LEFT join organisationunit ou6 on ou6.organisationunitid = ous.idlevel6
group by ous.organisationunituid,ou2.name,ou3.name,ou4.name,ou5.name,ou6.uid,ou6.name;


select
ou1.uid as uid1,max(ou1.name) as Level1,
ou2.uid as uid2,max(ou2.name) as Level2,
ou3.uid as uid3,max(ou3.name) as Level3
from _orgunitstructure ous
inner join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
inner join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
inner join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
group by ou1.uid,ou2.uid,ou3.uid;


// WHO-LEP query

-- dataelement-cc-coc-datasetwise list
select string_agg(ds.name,chr(10)),de.dataelementid as deid,de.uid as deUID,de.name as deName,cc.uid as categoryUID,
cc.name as categoryName,coc.categoryoptioncomboid as categoryoptioncomboid,coc.uid as categoryoptionComboUID,cocname.categoryoptioncomboname as categoryOptionComboName
from dataelement  as de  
inner join categorycombo as cc on cc.categorycomboid = de.categorycomboid 
inner join categorycombos_optioncombos as cc_coc on cc_coc.categorycomboid = de.categorycomboid
inner join categoryoptioncombo as coc on coc.categoryoptioncomboid = cc_coc.categoryoptioncomboid
inner join _categoryoptioncomboname as cocname on coc.categoryoptioncomboid = cocname.categoryoptioncomboid
inner join datasetelement dsm on dsm.dataelementid = de.dataelementid
inner join dataset ds on ds.datasetid = dsm.datasetid
group by de.dataelementid,de.uid,cc.uid,de.name,cc.name,coc.categoryoptioncomboid ,coc.uid,cocname.categoryoptioncomboname
order by de.name,cc.name,cocname.categoryoptioncomboname;

-- validation rule with expression

SELECT vr.validationruleid, vr.uid,vr.name,vr.description, vr.instruction,vr.importance, vr.operator,
vr.leftexpressionid,l_exp.description left_description, l_exp.expression left_expression, vr.rightexpressionid,
r_exp.description right_description, r_exp.expression right_expression, 
vr.periodtypeid,pt.name periodType  from validationrule vr
INNER JOIN expression l_exp on vr.leftexpressionid = l_exp.expressionid
INNER JOIN expression r_exp on vr.rightexpressionid = r_exp.expressionid
INNER JOIN periodtype pt ON pt.periodtypeid = vr.periodtypeid;

-- level-wise ou list 

select
ou1.organisationunitid as level1_ID, ou1.uid as uid1,max(ou1.name) as Level1_name,
ou2.organisationunitid as level2_ID, ou2.uid as uid2,max(ou2.name) as Level2_name,
ou3.organisationunitid as level3_ID, ou3.uid as uid3,max(ou3.name) as Level3_name,
ou4.organisationunitid as level4_ID, ou4.uid as uid4,max(ou4.name) as Level4_name

from _orgunitstructure ous
left join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
left join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
left join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
left join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4
group by ou1.organisationunitid,ou2.organisationunitid,ou3.organisationunitid,
ou4.organisationunitid,ou1.uid,ou2.uid,ou3.uid,ou4.uid;


-- Organisation Unit Hierarchy Level-4

select
ou1.uid as Level1uid1, ou1.organisationunitid as ou1Id, max(ou1.code) as Level1Code, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as ou2Id, max(ou2.code) as Level2Code, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as ou3Id, max(ou3.code) as Level3Code, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as ou4Id, max(ou4.code) as Level4Code, max(ou4.name) as Level4Name
from _orgunitstructure ous

LEFT  join organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4

group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid;


// indicator list 

SELECT 	indicatorid, ind.uid, ind.name, shortname, description, annualized, decimals, 
ind.indicatortypeid, numerator, numeratordescription, denominator, denominatordescription,
it.name indicatorTypeName ,it.indicatorfactor,it.indicatornumber from indicator ind
INNER join indicatortype it ON it.indicatortypeid = ind.indicatortypeid;

// user-list user-role-wise

select usr.userid,usr.uid,usr.username,usr.lastupdated,usr.passwordlastupdated,
usr.lastlogin, usr.selfregistered, usr.invitation, usr.disabled, usrmem.userroleid,
urole.uid as userRoleUID ,urole.name as userRoleName from users usr
INNER JOIN userrolemembers usrmem ON usrmem.userid = usr.userid
INNER JOIN userrole urole ON urole.userroleid = usrmem.userroleid
order by usr.username;



SELECT username, lastupdated, COUNT(username)
FROM users
GROUP BY lastupdated, username HAVING COUNT(username) > 1
ORDER BY username DESC;


SELECT username, COUNT(username)
FROM users
GROUP BY  username HAVING COUNT(username) > 1
ORDER BY username;

SELECT username, lastupdated, COUNT(username)
FROM users
GROUP BY lastupdated, username 
ORDER BY username;

select usr.userid,usr.uid,usr.username, usrmem.userroleid,
urole.uid as userRoleUID ,urole.name as userRoleName from users usr
INNER JOIN userrolemembers usrmem ON usrmem.userid = usr.userid
INNER JOIN userrole urole ON urole.userroleid = usrmem.userroleid
order by usr.username;	

disable/ebnable key in postgres sql

BEGIN;
ALTER TABLE b DISABLE TRIGGER ALL;
-- now the RI over table b is disabled
ALTER TABLE b ENABLE TRIGGER ALL;
COMMIT;


select coc.categoryoptioncomboid from categoryoptioncombo coc 
            inner join categorycombos_optioncombos cco on coc.categoryoptioncomboid=cco.categoryoptioncomboid
            inner join categorycombo cc on cco.categorycomboid=cc.categorycomboid where cc.name='default';


-- program /stage wise dataelement count
select pg.name,pg.programid,psde.programstageid, ps.name, count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid,psde.programstageid,ps.name;

-- programwise dataelement count
select pg.name, pg.programid, pg.uid, count(psde.dataelementid) de_count
from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid;

 
 -- program  wise dataelement count
select pg.name,pg.programid, count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid;

-- program /stage wise dataelement count
select pg.name,pg.programid,psde.programstageid, ps.name, 
count(psde.dataelementid) from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
group by pg.name,pg.programid,psde.programstageid,ps.name;


select pg.name,pg.programid,psde.programstageid, ps.name,de.name,de.uid from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid;


select pg.name programName, pg.uid programUID, pg.programid programID ,psde.programstageid programStageID,
ps.uid programStageUID, ps.name programStageName, de.name dataElementName, de.uid dataElementUID, de.dataelementid
dataelementID, de.domaintype deDomainType from programstagedataelement psde
INNER JOIN programstage ps ON ps.programstageid = psde.programstageid
INNER JOIN program pg ON pg.programid = ps.programid
INNER JOIN dataelement de ON de.dataelementid = psde.dataelementid;


//Level wise org unit hierarchy with coordinates

SELECT
ou1.uid as Level1uid1, ou1.organisationunitid as ou1Id, max(ou1.code) as Level1Code, max(ou1.name) as Level1Name,
ou2.uid as Level2uid2, ou2.organisationunitid as ou2Id, max(ou2.code) as Level2Code, max(ou2.name) as Level2Name,
ou3.uid as Level3uid3, ou3.organisationunitid as ou3Id, max(ou3.code) as Level3Code, max(ou3.name) as Level3Name,
ou4.uid as Level4uid4, ou4.organisationunitid as ou4Id, max(ou4.code) as Level4Code, max(ou4.name) as Level4Name, max(ou4.featuretype) as Level4Featuretype, max(ou4.coordinates) as Level4Coordinates

from _orgunitstructure ous
LEFT  JOIN organisationunit ou1 on ou1.organisationunitid = ous.idlevel1
LEFT  join organisationunit ou2 on ou2.organisationunitid = ous.idlevel2
LEFT  join organisationunit ou3 on ou3.organisationunitid = ous.idlevel3
LEFT  join organisationunit ou4 on ou4.organisationunitid = ous.idlevel4

group by ou1.uid,ou1.organisationunitid,ou2.uid,ou2.organisationunitid,ou3.uid,ou3.organisationunitid,
ou4.uid,ou4.organisationunitid;


select distinct ( dv.periodid ),pe.startdate,split_part(pe.startdate::TEXT,'-', 1) as year
,pe.enddate, split_part(pe.enddate::TEXT,'-', 2) as month,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod, pe.periodtypeid from datavalue dv 
inner join period pe ON pe.periodid = dv.periodid
where attributeoptioncomboid = 3996518 order by pe.periodtypeid;


-- SQL View Parameters

var param = "var=program:"+program.id + "&var=orgunit:"+$scope.selectedOrgUnitName_level_id+"&var=startdate:"+$scope.startdateSelected+"&var=enddate:"+$scope.enddateSelected;

https://uphmis.in/uphmis/api/sqlViews/yHR3u7imDlB/data.json?var=deuid:qYpFbVo8WsL&var=orgunituid:N5WWbRtsjWp

https://ln1.hispindia.org/leprosy/api/sqlViews/pRpki4MlEOr/data.json?paging=false
https://ln1.hispindia.org/leprosy/api/sqlViews/xK5wR6gwMtW/data.json?paging=false&var=dataSetUid:m4Hy2QZbW9p&var=startDate:2019-01-01&var=endDate:2019-12-31

// amr sql-views

https://ln2.hispindia.org/amr/api/sqlViews/joGfuhbHQUx/data.json?var=orgunit:mKmB0wcw7Gf&paging=false

-- amr query for get data of all period

select pe.periodid,pe.startdate,pe.enddate,periodtypeid,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
from period pe


select * from datavalue where periodid in ( select periodid from 
period where periodtypeid = 8 )

-- for HP 2.32
select * from datavalue where dataelementid in ( select dataelementid from
datasetelement where datasetid in ( select datasetid from dataset
where uid = 'DCoyvS9Cp80')) and periodid in ( select periodid from 
period where startdate = '2022-03-01' and enddate = '2022-03-31') and
sourceid in (select organisationunitid from organisationunit where uid = 'IMLk5ZXAMkO');


-- queries for dataValueSet
-- who-lep population data sql-query
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, split_part(pe.startdate::TEXT,'-', 1) as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and de.uid = 'd1d6EWQZJGB';



SELECT de.uid AS deUID, de.name AS deName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName,dv.categoryoptioncomboid, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, dv.attributeoptioncomboid,
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)
,split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod,pet.name AS periodType, pe.periodtypeid,dv.periodid,
SUM( cast( value as numeric) ) FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER JOIN organisationunit org On org.organisationunitid = dv.sourceid
inner join period pe ON pe.periodid = dv.periodid
inner join periodtype pet ON pet.periodtypeid = pe.periodtypeid
WHERE dv.sourceid IN (select organisationunitid from organisationunit 
where path like '%AmrbwMo8a3S%') AND dv.periodid IN 
(select periodid from period where startdate >= '2022-01-01' and enddate <= '2022-12-31'
and periodtypeid = 3) GROUP BY de.uid,de.name,isoPeriod,pe.periodtypeid,dv.periodid,pet.name,
coc.uid,categoryOptionComboName,attributeOptionComboName,attcoc.uid,dv.categoryoptioncomboid,
dv.attributeoptioncomboid;

-- sum based on periods

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
WHERE de.uid = 'gyhLpZ4Dh0R' and dv.periodid in ( select periodid from period where startdate >= '2017-01-01' 
and enddate <= '2022-12-31' and periodtypeid = 3 ) and 
dv.value is not null and dv.deleted is not true;

SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, dv.created, dv.lastupdated, pe.startdate,pe.enddate, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'gyhLpZ4Dh0R' and dv.periodid in ( select periodid from period where startdate >= '2017-01-01' 
and enddate <= '2022-12-31' and periodtypeid = 3 ) and 
dv.value is not null and dv.deleted is not true;


	
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, dv.created, dv.lastupdated, pe.startdate,pe.enddate, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'ilJHhsHQ7sA' and dv.value is not null and dv.deleted is not true;	
	
SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID, org.uid AS organisationunitUID, 
dv.value,  dv.created, dv.lastupdated, dv.storedby, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name, pe.startdate,pe.enddate FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'ilJHhsHQ7sA' and dv.value is not null and dv.deleted is not true;


-- with orgUnit path
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, dv.created, dv.lastupdated, pe.startdate,pe.enddate, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name,org.path FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'gyhLpZ4Dh0R' and dv.periodid in ( select periodid from period where startdate >= '2017-01-01' 
and enddate <= '2022-12-31' and periodtypeid = 3 ) and 
dv.value is not null and dv.deleted is not true;

SELECT de.uid AS dataElementUID,coc.uid AS categoryOptionComboUID, 
attcoc.uid AS attributeOptionComboUID,org.uid AS organisationunitUID,
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE de.uid = 'MIck76UldLx' and dv.periodid in (select periodid from period where startdate >= '2021-01-01' 
and enddate <= '2021-12-31' and periodtypeid = 3 )and dv.value is not null and dv.deleted = false;
 
-- monthly data 
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.startdate::TEXT,'-', 2)) 
as isoPeriod, pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE dv.value is not null and dv.deleted is not true; 
 
 
SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.startdate::TEXT,'-', 2),split_part(pe.startdate::TEXT,'-', 3)) 
as isoPeriod, pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE dv.value is not null and dv.deleted is not true;

SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby,dv.created, dv.lastupdated, CONCAT (split_part(pe.startdate::TEXT,'-', 1), 
split_part(pe.startdate::TEXT,'-', 2),split_part(pe.startdate::TEXT,'-', 3)) as isoPeriod, pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE dv.value is not null and dv.deleted is not true;


SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.startdate::TEXT,'-', 2)) 
as isoPeriod, pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE dv.value is not null and dv.deleted is not true;

SELECT de.dataelementid AS dataelementid, coc.categoryoptioncomboid AS categoryoptioncomboid, 
attcoc.categoryoptioncomboid AS categoryoptioncomboid, org.organisationunitid AS organisationunitid, 
dv.value,  pe.periodid as periodid FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
inner join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
WHERE dv.value is not null and dv.deleted is not true;

--  datasetcomplete completedatasetregistration

SELECT ds.uid as dataSetUID, org.uid AS organisationunitUID,comr.*, pety.name,
attcoc.uid AS attributeOptionComboUID,CONCAT (split_part(pe.startdate::TEXT,'-', 1), 
split_part(pe.enddate::TEXT,'-', 2), split_part(pe.enddate::TEXT,'-', 3)) as isoPeriod 
from completedatasetregistration comr
INNER JOIN organisationunit org ON org.organisationunitid = comr.sourceid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = comr.attributeoptioncomboid
INNER JOIN dataset ds ON ds.datasetid = comr.datasetid
INNER JOIN period pe ON pe.periodid = comr.periodid
INNER JOIN periodtype pety ON pety.periodtypeid = pe.periodtypeid 
where attcoc.uid = 'HllvX50cXC0';



SELECT dv.sourceid,org1.name as region_Name , org1.uid as region_uid, org.name as country_name,
org.uid as country_uid,count( dv.sourceid ) from datavalue dv
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER JOIN organisationunit org1 ON org1.organisationunitid = org.parentid
INNER JOIN datasetelement dse ON dse.dataelementid = dv.dataelementid
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN dataset ds ON ds.datasetid = dse.datasetid
INNER JOIN period pe ON pe.periodid = dv.periodid
where ds.uid = '${dataSetUid}' and dv.deleted is not true and 
dv.dataelementid not in ( 22506,2350,2349, 1774 ) and 
pe.startdate = '${startDate}' and pe.enddate = '${endDate}'
group by dv.sourceid,org1.name,org1.uid,org.name,org.uid order by org1.name;



/api/sqlViews/{id}/data?var=key1:value1&var=key2:value2

// lepmpa script

SELECT ds.state_id,ds.state_code, ds.district_id, ds.district_code, ds.district_name,bphc.bphc_id,
bphc.block_code,bphc.bphc_name,bphc.latitude,bphc.longitude FROM mst_district AS ds
INNER JOIN mst_bphc AS bphc ON ds.district_id = bphc.district_id
ORDER BY ds.state_id;

SELECT mst.*,state.state_name,dis.district_name,bphc.bphc_name FROM mst_suspect mst
INNER JOIN mst_state state ON state.state_id = mst.state
INNER JOIN mst_district dis ON dis.district_id = mst.district
INNER JOIN mst_bphc bphc ON bphc.bphc_id = mst.block_phc


-- dataSets.json?filter=id:eq:' + $scope.DataSet + "&fields=id,name,periodType,organisationUnits[id,name,code,attributeValues[attribute[id,name,code],value]&paging=false

-- for UPHMIS

select * from programstageinstance where completeddate::date <=now() and  status = 'COMPLETED';
select * from programstageinstance where completeddate < CURRENT_TIMESTAMP - INTERVAL '7 days' and status = 'COMPLETED';

select * from programstageinstance where completeddate between current_date and current_date - interval '7 day' and status = 'COMPLETED';


CURRENT_TIMESTAMP - INTERVAL '100 days'

date between current_date and current_date - interval '10 day';

select psi.programstageinstanceid,psi.completeddate,tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
where psi.completeddate between current_date and current_date - interval '7 day' and psi.status = 'COMPLETED' and tedv.dataelementid = 38576348
and tedv.value != 'Approved';


select psi.programstageinstanceid,psi.completeddate,tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
where psi.completeddate < CURRENT_TIMESTAMP - INTERVAL '7 days' and psi.status = 'COMPLETED' and tedv.dataelementid = 38576348
and tedv.value != 'Approved';



select psi.programstageinstanceid,psi.completeddate,tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
where psi.completeddate <= current_date - interval '7 day' and psi.status = 'COMPLETED' and tedv.dataelementid = 38576348
and tedv.value not in( 'Approved', 'Rejected', 'Re-submitted');

select psi.programstageinstanceid,psi.completeddate,tedv.value from programstageinstance psi
INNER JOIN trackedentitydatavalue tedv ON tedv.programstageinstanceid = psi.programstageinstanceid
where psi.completeddate <= current_date - interval '7 day' and psi.status = 'COMPLETED' and tedv.dataelementid = 38576348
and tedv.value not in( 'Approved', 'Rejected', 'Re-submitted');

select psi.programstageinstanceid,psi.completeddate from programstageinstance psi
where psi.completeddate <= current_date - interval '7 day' and psi.status = 'COMPLETED' order by psi.completeddate desc


select usi.surname,usi.firstname,us.username,us.lastlogin::date from userinfo usi
INNER JOIN users us ON us.userid = usi.userinfoid

SELECT psi.programstageinstanceid, psi.executiondate::date, pi.trackedentityinstanceid, teav.value, us.username,usinfo.email from programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
LEFT JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
LEFT JOIN users us ON teav.value = us.username
LEFT JOIN userinfo usinfo ON usinfo.userinfoid = us.userid
WHERE psi.programstageid in 
( SELECT programstageid from programstage where  programid in ( 73337033 ) ) 
AND psi.executiondate::date BETWEEN '2019-08-01' AND '2019-08-31'  
AND psi.status = 'COMPLETED' and teav.trackedentityattributeid  = 76755184 order by psi.completeddate desc

select psi.programstageinstanceid,psi.completeddate from programstageinstance psi
where psi.completeddate <= current_date and psi.status = 'COMPLETED' order by psi.completeddate desc

select current_date

select * from trackedentitydatavalue where programstageinstanceid in ( select psi.programstageinstanceid from programstageinstance psi
where psi.completeddate <= current_date - interval '7 day' and psi.status = 'COMPLETED') and dataelementid = 38576348
and dataelementid = 38576348
select value from trackedentitydatavalue where programstageinstanceid = 53579980 and dataelementid = 38576348


// IPPF

SELECT periodid, periodtypeid, startdate, enddate
  FROM public.period where periodtypeid = 2 and startdate >= '2018-02-01' and enddate <= '2018-05-01' order by startdate;

  select * from dataelement where code = 'SRV-373601203'
    select * from organisationunit where code = 'CL205HEA001'

    SELECT categoryoptioncomboid FROM categoryoptioncombo WHERE  uid = 'J1g7VOz80MM'

select * from datavalue where dataelementid = 1810 and sourceid = 1658 and 
periodid in ( select periodid from period where periodtypeid = 2 and startdate >= '2018-02-01' and enddate <= '2018-05-01' ) 
order by lastupdated desc




// event query

select * from (select psi.programstageinstanceid as psi_id, psi.uid as psi_uid, psi.code as psi_code, psi.status as psi_status, psi.executiondate as psi_executiondate, psi.duedate as psi_duedate, psi.completedby
 as psi_completedby, psi.storedby as psi_storedby, psi.longitude as psi_longitude, psi.latitude as psi_latitude, psi.created as psi_created, psi.lastupdated as
psi_lastupdated, psi.completeddate as psi_completeddate, psi.deleted as psi_deleted, coc.categoryoptioncomboid AS coc_categoryoptioncomboid, coc.code AS coc_categoryoptioncombocode, coc.uid AS coc_categoryoptioncombouid, 
cocco.categoryoptionid AS cocco_categoryoptionid, deco.uid AS deco_uid, pi.uid as pi_uid, pi.status
as pi_status, pi.followup as pi_followup, p.uid as p_uid, p.code as p_code, p.type as p_type, ps.uid as ps_uid, ps.code as ps_code, ps.capturecoordinates as ps_capturecoordinates, ou.uid as ou_uid, ou.code as ou_code, ou.name as ou_name, 
tei.trackedentityinstanceid as tei_id, tei.uid as tei_uid, teiou.uid as tei_ou, teiou.name as tei_ou_name, tei.created as tei_created, tei.inactive as tei_inactive from programstageinstance psi 
inner join programinstance pi on pi.programinstanceid=psi.programinstanceid 
inner join program p on p.programid=pi.programid 
inner join programstage ps on ps.programstageid=psi.programstageid 
inner join categoryoptioncombo coc on coc.categoryoptioncomboid=psi.attributeoptioncomboid 
inner join categoryoptioncombos_categoryoptions cocco on psi.attributeoptioncomboid=cocco.categoryoptioncomboid 
inner join dataelementcategoryoption deco on cocco.categoryoptionid=deco.categoryoptionid 
left join trackedentityinstance tei on tei.trackedentityinstanceid=pi.trackedentityinstanceid 
left join organisationunit ou on (psi.organisationunitid=ou.organisationunitid) 
left join organisationunit teiou on (tei.organisationunitid=teiou.organisationunitid) where p.programid = 9178 
and (psi.executiondate >= '2018-07-01' or (psi.executiondate is null and psi.duedate >= '2018-07-01')) 
and (psi.executiondate < '2018-08-01' or (psi.executiondate is null and psi.duedate < '2018-08-01'))and psi.deleted is false order by
 psi_executiondate asc  ) as event 
 left join (select pdv.programstageinstanceid as pdv_id, pdv.created as pdv_created, pdv.lastupdated as pdv_lastupdated, 
 pdv.value as pdv_value, pdv.storedby as pdv_storedby, pdv.providedelsewhere as pdv_providedelsewhere, de.uid as de_uid, de.code as de_code from trackedentitydatavalue pdv 
inner join dataelement de on pdv.dataelementid=de.dataelementid ) as dv on event.psi_id=dv.pdv_id 
 left join (select psic.programstageinstanceid as psic_id, psinote.trackedentitycommentid as psinote_id, psinote.commenttext as psinote_value, 
psinote.createddate as psinote_storeddate, psinote.creator as psinote_storedby from programstageinstancecomments psic 
inner join trackedentitycomment psinote on psic.trackedentitycommentid=psinote.trackedentitycommentid ) 
as cm on event.psi_id=cm.psic_id order by psi_executiondate asc


//

select * from (select psi.programstageinstanceid as psi_id, psi.uid as psi_uid, psi.code as psi_code, psi.status as psi_status, 
psi.executiondate as psi_executiondate, psi.duedate as psi_duedate, psi.completedby as psi_completedby, psi.storedby as psi_storedby, psi.longitude as psi_longitude, psi.latitude as psi_latitude, psi.created as psi_created, psi.lastupdated as
psi_lastupdated, psi.completeddate as psi_completeddate, psi.deleted as psi_deleted, coc.categoryoptioncomboid AS coc_categoryoptioncomboid, coc.code AS coc_categoryoptioncombocode, coc.uid AS coc_categoryoptioncombouid, cocco.categoryoptionid AS cocco_categoryoptionid, deco.uid AS 
deco_uid, deco.publicaccess AS deco_publicaccess, decoa.uga_access AS uga_access, decoa.ua_access AS ua_access, cocount.option_size AS option_size, pi.uid as pi_uid, pi.status as pi_status, pi.followup as pi_followup, p.uid as p_uid, p.code as p_code, p.type as p_type, ps.uid
as ps_uid, ps.code as ps_code, ps.capturecoordinates as ps_capturecoordinates, ou.uid as ou_uid, ou.code as ou_code, ou.name as ou_name, tei.trackedentityinstanceid as tei_id, tei.uid as tei_uid, teiou.uid as tei_ou, teiou.name as tei_ou_name, tei.created as tei_created, 
tei.inactive as tei_inactive from programstageinstance psi inner join programinstance pi on pi.programinstanceid=psi.programinstanceid 
inner join program p on p.programid=pi.programid 
inner join programstage ps on ps.programstageid=psi.programstageid inner join categoryoptioncombo coc on coc.categoryoptioncomboid=psi.attributeoptioncomboid 
inner join categoryoptioncombos_categoryoptions cocco on psi.attributeoptioncomboid=cocco.categoryoptioncomboid inner join dataelementcategoryoption deco on cocco.categoryoptionid=deco.categoryoptionid 
left join trackedentityinstance tei on tei.trackedentityinstanceid=pi.trackedentityinstanceid left join organisationunit ou on (psi.organisationunitid=ou.organisationunitid) left join organisationunit teiou on (tei.organisationunitid=teiou.organisationunitid)  
left join ( select categoryoptioncomboid, count(categoryoptioncomboid) as option_size from categoryoptioncombos_categoryoptions 
group by categoryoptioncomboid) as cocount on coc.categoryoptioncomboid = cocount.categoryoptioncomboid 
left join (select deco.categoryoptionid as deco_id,deco.uid as deco_uid, deco.publicaccess AS deco_publicaccess, couga.usergroupaccessid as uga_id, coua.useraccessid as ua_id, 
uga.access as uga_access, uga.usergroupid AS usrgrp_id, ua.access as ua_access, ua.userid as usr_id from dataelementcategoryoption deco 
left join dataelementcategoryoptionusergroupaccesses couga on deco.categoryoptionid = couga.categoryoptionid 
left join dataelementcategoryoptionuseraccesses coua on deco.categoryoptionid = coua.categoryoptionid 
left join usergroupaccess uga on couga.usergroupaccessid = uga.usergroupaccessid 
left join useraccess ua on coua.useraccessid = ua.useraccessid  
where ua.userid=202911 or uga.usergroupid in (14948)  ) as decoa on cocco.categoryoptionid = decoa.deco_id where p.programid = 9178 and 
(psi.executiondate >= '2018-07-01' or (psi.executiondate is null and psi.duedate >= '2018-07-01')) and (psi.executiondate < '2018-08-01' or (psi.executiondate is null and psi.duedate < '2018-08-01')) and psi.deleted is false order by psi_executiondate asc  ) as event 
left join (select pdv.programstageinstanceid as pdv_id, pdv.created as pdv_created, pdv.lastupdated as pdv_lastupdated, pdv.value as pdv_value, pdv.storedby as pdv_storedby, 
pdv.providedelsewhere as pdv_providedelsewhere, de.uid as de_uid, de.code as de_code from trackedentitydatavalue pdv inner join dataelement de on pdv.dataelementid=de.dataelementid ) as dv on event.psi_id=dv.pdv_id 
left join (select psic.programstageinstanceid as psic_id, psinote.trackedentitycommentid as psinote_id, psinote.commenttext as psinote_value, psinote.createddate as psinote_storeddate, psinote.creator as psinote_storedby from programstageinstancecomments psic 
inner join trackedentitycomment psinote on psic.trackedentitycommentid=psinote.trackedentitycommentid ) as cm on event.psi_id=cm.psic_id order by psi_executiondate asc


-- binary data read query in systemseeting table
-- // https://www.postgresql.org/docs/9.4/functions-binarystring.html
select systemsettingid, name, encode(value::bytea, 'escape') from systemsetting;

select systemsettingid, name, encode(value::bytea, 'escape') from systemsetting
where systemsettingid in (1577570,1092872, 1092873 );


-- delete training instance tracker-data nad tracker-meta data
-- 170.187.252.160 22  root 3gWR#EFq1e@G# 1212 -- libya libya
-- 25/07/2023

delete from eventchart;

delete from eventchart_rows 
where eventchartid in ( select eventchartid
from eventchart where programid =310090 );

delete from eventreport
where programid =310090;

delete from eventreport_rows 
where eventreportid in ( select eventreportid
from eventreport where programid =310090 );

delete from program_organisationunits
where programid =310090;

delete from programindicator
where programid =310090;

delete from periodboundary 
where periodboundary in ( select periodboundary
from programindicator where programid =310090 );

delete from programstagesection_dataelements
where programstagesectionid in (
select programstagesectionid from programstagesection 
where programstageid in ( select programstageid
from programstage where programid =310090 ));

delete from programstagesection 
where programstageid in ( select programstageid
from programstage where programid =310090 );

delete from programstagedataelement 
where programstageid in ( select programstageid
from programstage where programid =310090 );

delete from trackedentitydataelementdimension 
where programstageid in ( select programstageid
from programstage where programid =310090 );

delete from programstageusergroupaccesses 
where programstageid in ( select programstageid
from programstage where programid =310090 );

delete from programstage
where programid =310090;

delete from program_attributes
where programid =310090;

delete from programusergroupaccesses
where programid = 310090;

delete from program;

delete from trackedentityattribute;
delete from trackedentityattributeusergroupaccesses;
delete from trackedentityattributelegendsets;
delete from trackedentityattributedimension;

delete from dataelement;
delete from dataelementusergroupaccesses;
delete from trackedentitydataelementdimension;

delete from indicator;

delete from optionset;
delete from optiongroupset;
delete from optiongroup;
delete from optiongroupsetmembers;
delete from optionvalue;
delete from optiongroupmembers;

delete from attribute;



-- unfpa_239 academy 18/09/2023

delete from datavalue where dataelementid in(
select dataelementid from dataelement where uid = 'AaIqiIX2qxH')
and categoryoptioncomboid = 24;

select * from datavalue where dataelementid in(
select dataelementid from dataelement where uid = 'qqc4NnWVFL9')
and categoryoptioncomboid = 24;

delete from datavalueaudit where dataelementid in(
select dataelementid from dataelement where uid = 'AaIqiIX2qxH')
and categoryoptioncomboid = 24;


select * from datavalueaudit where dataelementid in(
select dataelementid from dataelement where uid = 'qqc4NnWVFL9')
and categoryoptioncomboid = 24;

delete from datavalueaudit where dataelementid in(
select dataelementid from dataelement where uid = 'qqc4NnWVFL9')
and categoryoptioncomboid = 24;

delete from datavalue where dataelementid in(
select dataelementid from dataelement where uid = 'qqc4NnWVFL9')
and categoryoptioncomboid = 24; -- 55338

SELECT de.uid AS dataElementUID,de.name AS dataElementName, coc.uid AS categoryOptionComboUID, 
coc.name AS categoryOptionComboName, attcoc.uid AS attributeOptionComboUID,attcoc.name AS
attributeOptionComboName, org.uid AS organisationunitUID, org.name AS organisationunitName, 
dv.value, dv.storedby, dv.created, dv.lastupdated, pe.startdate,pe.enddate, 
CONCAT (split_part(pe.startdate::TEXT,'-', 1), split_part(pe.enddate::TEXT,'-', 2)) 
as isoPeriod,pety.name FROM datavalue dv
INNER JOIN dataelement de ON de.dataelementid = dv.dataelementid
INNER JOIN categoryoptioncombo AS coc ON coc.categoryoptioncomboid = dv.categoryoptioncomboid
INNER JOIN categoryoptioncombo AS attcoc ON attcoc.categoryoptioncomboid = dv.attributeoptioncomboid
INNER join period pe ON pe.periodid = dv.periodid
INNER JOIN organisationunit org ON org.organisationunitid = dv.sourceid
INNER join periodtype pety ON pety.periodtypeid = pe.periodtypeid
WHERE de.uid = 'AaIqiIX2qxH' and dv.value is not null and dv.deleted is not true;	






