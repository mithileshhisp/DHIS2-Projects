
-- fpan 

select * from dataelement where uid = 'RdMXoQJeHPh';

select * from orgunitgroup where uid = 'GhuHmwRnPBs'

select * from orgunitgroupmembers where orgunitgroupid = 490;

de - 1689099

female	7731	7724	7732	7727	7713	7723	7722	7715	7739	7730
male	7717	7726	7729	7741	7716	7734	7740	7737	7712	7728

select * from period where startdate > '2020-01-01' and enddate <= '2021-01-31' and 
periodtypeid = 2;

and categoryoptioncomboid = 7731 

select * from periodtype;
wee - 2
monthly - 3

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


select * from datavalue where dataelementid = 1689099 and categoryoptioncomboid in( 
7731,7724,7732,7727,7713,7723,7722,7715,7739,7730)
and periodid in (select periodid from period where startdate > '2020-01-01' 
and enddate <= '2020-12-31' ) and sourceid in (select organisationunitid 
from orgunitgroupmembers where orgunitgroupid = 490);

update datavalue set categoryoptioncomboid = 7728 where dataelementid = 1689099 
and categoryoptioncomboid = 7730 and periodid in (select periodid from period 
where startdate > '2019-01-01' and enddate <= '2019-12-31' ) 
and sourceid in (select organisationunitid 
from orgunitgroupmembers where orgunitgroupid = 490);

delete from datavalue where dataelementid = 1689099 and categoryoptioncomboid = 7715
and periodid in (select periodid from period where startdate > '2021-01-01' 
and enddate <= '2021-12-31' and periodtypeid = 3 ) and sourceid in (select organisationunitid 
from orgunitgroupmembers where orgunitgroupid = 490);


-- 04/02/2022 for update dataset attribite and expirydays and davalue to attributecomboid

update dataset set categorycomboid = 9435067 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);

update dataset set expirydays = 0 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);

select * from datavalue where dataelementid in ( select dataelementid from
datasetelement where datasetid = 9369165) and periodid in (select periodid 
from period where startdate >= '2021-01-01' and enddate <= '2021-12-31' and 
periodtypeid = 3) and sourceid in (select sourceid 
from datasetsource where datasetid = 9369165);

update datavalue set attributeoptioncomboid = 9435068 where dataelementid in ( select dataelementid from
datasetelement where datasetid = 9369165) and periodid in (select periodid 
from period where startdate >= '2021-01-01' and enddate <= '2021-12-31' and 
periodtypeid = 3) and sourceid in (select sourceid 
from datasetsource where datasetid = 9369165);

-- 08/02/2022 for rollbackup change done on 04/02/2022

select count(*) from datavalue where attributeoptioncomboid = 9435068; -- 522384

update dataset set categorycomboid = 14 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);

update dataset set expirydays = 30 where datasetid in ( 9369165,
9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,
9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170);


update datavalue set attributeoptioncomboid = 15 where dataelementid in ( select dataelementid from
datasetelement where datasetid in( 9369165,9369149,9369155,9369161,9369162,9369163,9369166,
9369158,9369164,9369152,9369171,9369184,9369168,9369153,9369172,9369173,9369154,9369174,9369175,
9369179,9369156,9369185,9369167,9369170 )) and periodid in (select periodid 
from period where startdate >= '2021-01-01' and enddate <= '2021-12-31' and 
periodtypeid = 3); -- 546991


delete from datavalue where attributeoptioncomboid = 9435068; -- 483 enter on date 08/02/2022

-- 10/02/2023  IPPF fpop Philippines delete query

delete from visualization_datadimensionitems where datadimensionitemid in (
select datadimensionitemid from datadimensionitem where datasetid in ( 5343,9369157) );

delete from datadimensionitem where datasetid in ( 5343,9369157);
delete from datainputperiod where datasetid in ( 5343,9369157);
delete from lockexception where datasetid in ( 5343,9369157);
delete from dataset where datasetid in ( 5343,9369157);

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';


-- ippf she_maldives upgrade from 2.34 to 2.38 03/03/2023

delete from audit;
delete from messageconversation_messages;	
delete from messageconversation_usermessages;
delete from usermessage;
delete from messageconversation;
delete from message;

-- upgrade from 2.34 to 2.38

-- direct run the war file of 2.38 not 2.34/2.35/2.36/2.37
-- run the following queries

-- and run the script in side file -- V2_37_17__Remove_Chart_and_ReportTable.sql
-- location of file is dhis-2\dhis-support\dhis-support-db-migration\src\main\resources\org\hisp\dhis\db\migration\2.37
DROP TABLE IF EXISTS  dashboarditem_reporttables;
delete from flyway_schema_history where installed_rank = 199;

update flyway_schema_history set checksum = 172668348
where installed_rank = 199; -- 2.37.17 V2_37_17__Remove_Chart_and_ReportTable.sql


-- ippf_Philippines_FPOP delete 30/03/2023

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';

-- tracker-data clean

-- aggregated data delete
   delete from datavalue;
   delete from datavalueaudit;
   delete from completedatasetregistration;
   
-- trcaker related meta data

select * from dataelement where domaintype = 'TRACKER';


delete from program_organisationunits;
delete from programstagedataelement;
delete from programstagesection;
delete from programstagesection_dataelements;

delete from mapview_columns where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_dataelementdimensions where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_filters where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_organisationunits where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapmapviews where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview where programstageid in (
select programstageid from programstage);

delete from programstage;
delete from program_userroles;
delete from programrule;
delete from programruleaction;
delete from programrulevariable;
delete from program_attributes;

delete from periodboundary where programindicatorid in (
select programindicatorid from programindicator where programid in (
select programid from program));

delete from programindicator;
delete from program;

delete from trackedentityattribute;

select * from dataelement where domaintype = 'TRACKER';

delete from trackedentitydataelementdimension where 
dataelementid in (select dataelementid from 
dataelement where domaintype = 'TRACKER');


delete from dataelement where domaintype = 'TRACKER';

-- https://www.pkbidhis.org/ippf-indonesia   delete 30/03/2023

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';

-- tracker-data clean

-- aggregated data delete
   delete from datavalue;
   delete from datavalueaudit;
   delete from completedatasetregistration;
   
-- trcaker related meta data

-- trcaker related meta data

select * from dataelement where domaintype = 'TRACKER';


delete from program_organisationunits;
delete from programstagedataelement;
delete from programstagesection;
delete from programstagesection_dataelements;

delete from mapview_columns where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_dataelementdimensions where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_filters where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview_organisationunits where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapmapviews where mapviewid in (
select mapviewid from mapview where programstageid in (
select programstageid from programstage));

delete from mapview where programstageid in (
select programstageid from programstage);

delete from programstage;
delete from program_userroles;
delete from programrule;
delete from programruleaction;
delete from programrulevariable;
delete from program_attributes;

delete from periodboundary where programindicatorid in (
select programindicatorid from programindicator where programid in (
select programid from program));

delete from programindicator;
delete from program;

delete from trackedentityattribute;

select * from dataelement where domaintype = 'TRACKER';

delete from trackedentitydataelementdimension where 
dataelementid in (select dataelementid from 
dataelement where domaintype = 'TRACKER');

-- fpanpro delete all ASR related dataelement and indicators 31/03/2023

select * from indicator where name like 'ASR%'
delete from indicator where name like 'ASR%';

select * from dataelement where name like 'ASR%'
delete from dataelement where name like 'ASR%';

-- 05/06/2023

select * from dataelement where domaintype = 'TRACKER'
and valuetype = 'INTEGER_POSITIVE';

update dataelement set valuetype = 'TRUE_ONLY' 
where domaintype = 'TRACKER' and valuetype = 'INTEGER_POSITIVE';




-- prep_tracker_Myanmar 19/06/2023

select * from program;

select * from programindicator order by programindicator desc;

select * from programindicator where programindicatorid > 150401;


INSERT INTO programindicator(programindicatorid, uid, created, lastupdated, name, shortname, programid, expression, filter, aggregationtype, analyticstype) VALUES
="(nextval('hibernate_sequence'),'"&A2&"','2023-06-19','2023-06-19','"&D2&"','"&E2&"',"&C2&",'"&H2&"','"&I2&"','"&F2&"','"&G2&"'),"

delete from programindicator where
uid = 'EimethzR9gD'

update programindicator  set created = now()::timestamp where created ='2023-06-19';
update programindicator  set lastupdated = now()::timestamp where lastupdated ='2023-06-19';


INSERT INTO periodboundary(periodboundaryid, uid, created, lastupdated, boundarytarget, analyticsperiodboundarytype, programindicatorid ) VALUES
="(nextval('hibernate_sequence'),'"&A2&"','2023-06-19','2023-06-19','"&D2&"','"&F2&"',"&C2&"),"


select * from periodboundary order by periodboundaryid desc;

select * from periodboundary where periodboundaryid > 153799;

update periodboundary  set created = now()::timestamp where created ='2023-06-19';
update periodboundary  set lastupdated = now()::timestamp where lastupdated ='2023-06-19';

update programindicator set expression = 'V{tei_count}'
where lastupdated::date ='2023-06-19';

-- 28/03/2023 issue is soft delete for trackedentityinstance

delete from trackedentityinstance where deleted is true;

delete from trackedentityprogramowner where 
trackedentityinstanceid in (select trackedentityinstanceid
from trackedentityinstance where deleted is true);

delete from relationshipitem where trackedentityinstanceid in
(select trackedentityinstanceid from trackedentityinstance where deleted is true );

select * from relationship where from_relationshipitemid in (
select relationshipitemid from relationshipitem where trackedentityinstanceid in
(select trackedentityinstanceid from trackedentityinstance where deleted is true ) );

update relationship set from_relationshipitemid = null where 
from_relationshipitemid in (
select relationshipitemid from relationshipitem where trackedentityinstanceid in
(select trackedentityinstanceid from trackedentityinstance where deleted is true ) );


-- ippf custom id generation SHE Maldives

-- sql-view -- TEI Count on OrgUnit Program and Enrollment Date -- CLFhvw5bXhl
SELECT COUNT(pi.trackedentityinstanceid) from programinstance pi
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE pi.deleted is false and orgUnit.uid = '${orgUnitUid}'  and prg.uid = '${programUid}' 
and pi.enrollmentdate::date = '${enrollmentDate}';

update sqlview set uid = 'CLFhvw5bXhl'
where name = 'TEI Count on OrgUnit Program and Enrollment Date';

SELECT COUNT(pi.trackedentityinstanceid) from programinstance pi
INNER JOIN organisationunit orgUnit ON orgUnit.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
WHERE pi.deleted is false and orgUnit.uid = 'SOtfI3u1Qk8'  and prg.uid = 'M1SdQvObog0' 
and pi.enrollmentdate::date = '2023-06-27';


let param = "var=orgUnitUid:" + org_uid + "&var=programUid:" + $scope.selectedProgram.id + "&var=enrollmentDate:" + $scope.selectedEnrollment.enrollmentDate;
$.getJSON("../api/sqlViews/CLFhvw5bXhl/data?"+param+"&paging=false", function (teiCountResponse) {
	let count = teiCountResponse.listGrid.rows[0];
	let countTeiByOrgUnit = count[0];
	let teiCount = countTeiByOrgUnit;
	var prefix = "";
	let totalTei = parseInt(teiCount) + 1;
	if( totalTei <10) prefix="00";
	else if (totalTei >9 && totalTei<100) prefix="0";

	$scope.finalTEICount = prefix + totalTei;
});




-- custom id code attributesById[k].code === 'custom_id'
-- custom id -- name attribute uid - tsBbDQe3sGo

let firstNameProfile = "";
if ($scope.selectedTei.tsBbDQe3sGo !== undefined) {
	let strP = $scope.selectedTei.tsBbDQe3sGo;
	firstNameProfile = strP.substr(0, 2).toUpperCase();
}

let customEnrollmentDate = $scope.selectedEnrollment.enrollmentDate.split("-")[2]+$scope.selectedEnrollment.enrollmentDate.split("-")[1]+$scope.selectedEnrollment.enrollmentDate.split("-")[0];
-- let firstString = strParentName + serviceDeliveryPoint + $scope.parentOrgUnitCode;
let firstString = $scope.selectedOrgUnit.code;
let secondString = firstNameProfile;
let thirdString = customEnrollmentDate;
let fourthString = $scope.finalTEICount;
$scope.generatedCustomId =  firstString+ "/" + secondString + "/" + thirdString + "/" + fourthString;

-- ippf custom id generation pstc ippf bangladesh -- 17/10/2024 2.38

update sqlview set uid = 'CLFhvw5bXhl' where 
uid = 'n5eJ12KzW8I' -- name -- TEI Count on OrgUnit Program and Enrollment Date

select * from trackedentityattribute

update trackedentityattribute set uid = 'Jn6YH8KIKpg'
where uid = 'i2L6kx524M1'; -- Unique Identification Number (UID) code -- custom_id

update trackedentityattribute set uid = 'tsBbDQe3sGo'
where uid = 'uovHj0OZnGj'; -- Client Name / name/





-- ippf fpanpro delete default COC


delete from categorycombos_optioncombos
where categoryoptioncomboid = 9492538;

delete from categoryoptioncombos_categoryoptions
where categoryoptioncomboid = 9492538;

update programstageinstance set attributeoptioncomboid = 15
where attributeoptioncomboid = 9492538;

delete from categoryoptioncombo where 
categoryoptioncomboid = 9492538;

-- delete categorycombo

delete from categorycombos_categories
where categorycomboid = 9492537;

update dataelement set categorycomboid =14 
where categorycomboid = 9492537;

delete from categorycombo where 
categorycomboid = 9492537;

-- delete dataelementcategory

delete from categories_categoryoptions
where categoryid = 9492536;

delete from dataelementcategory where
categoryid = 9492536;

-- dataelementcategoryoption

delete from dataelementcategoryoption
where categoryoptionid = 9492535;

-- delete tracker data/aggregateddata/users from fpanpro links for ippf bhutan 


select * from users where username in (
'sumit', 'hispdev', 'admin', 'testing');

select * from userinfo where userinfoid in (
select userid from users where username in (
'sumit', 'hispdev', 'admin', 'testing'));

-- for all meta data
update dataelementgroup 
set userid = 45 

update dataelement 
set lastupdatedby = 45


-- 25/06/2024

select * from dataelement where domaintype = 'TRACKER';

update dataelement set publicaccess = 'rw------'
where domaintype = 'TRACKER';

-- 20/08/2024 -- delete default datavalue

select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'lwomjryU8Ci') and categoryoptioncomboid = 15 
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','o4OoZ7umqCO'
'z662hSC2T9z','NcPUoeDdIbe','UAjWgfrv56R','XCjU1G2782I',
'iR5p5Nkoeof','q9UINjgsfTR'));


select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'lwomjryU8Ci')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','o4OoZ7umqCO'
'z662hSC2T9z','NcPUoeDdIbe','UAjWgfrv56R','XCjU1G2782I',
'iR5p5Nkoeof','q9UINjgsfTR'));



delete from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'lwomjryU8Ci') and categoryoptioncomboid = 15 
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','o4OoZ7umqCO'
'z662hSC2T9z','NcPUoeDdIbe','UAjWgfrv56R','XCjU1G2782I',
'iR5p5Nkoeof','q9UINjgsfTR'));

-- 22/08/2024

select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'lwomjryU8Ci')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'z662hSC2T9z'));

delete from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'lwomjryU8Ci')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'z662hSC2T9z'));


-- 20/09/2024

select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'BjwgoW6wCFF')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','z662hSC2T9z','UAjWgfrv56R'))
and categoryoptioncomboid = 15;

delete from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-06-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'BjwgoW6wCFF')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','z662hSC2T9z','UAjWgfrv56R'))
and categoryoptioncomboid = 15;

select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate in('2024-05-01', '2024-06-01'))
and sourceid in( select organisationunitid from organisationunit
where uid = 'fBysiAZ2odm')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','z662hSC2T9z','NcPUoeDdIbe','UAjWgfrv56R','XCjU1G2782I'))
and categoryoptioncomboid = 15;

delete from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate in('2024-05-01', '2024-06-01'))
and sourceid in( select organisationunitid from organisationunit
where uid = 'fBysiAZ2odm')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','z662hSC2T9z','NcPUoeDdIbe','UAjWgfrv56R','XCjU1G2782I'))
and categoryoptioncomboid = 15;

select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-02-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'OD0Jvpl8YwZ')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','z662hSC2T9z','UAjWgfrv56R','NcPUoeDdIbe',''))
and categoryoptioncomboid = 15;

delete from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-02-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'OD0Jvpl8YwZ')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','z662hSC2T9z','UAjWgfrv56R','NcPUoeDdIbe',''))
and categoryoptioncomboid = 15;

select * from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-04-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'YRkMteX1TGw')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','NcPUoeDdIbe','UAjWgfrv56R'))
and categoryoptioncomboid = 15;

delete from datavalue where periodid in ( select periodid
from period where periodtypeid =3 and startdate = '2024-04-01')
and sourceid in( select organisationunitid from organisationunit
where uid = 'YRkMteX1TGw')
and dataelementid in ( select dataelementid
from dataelement where uid in ( 'r6Jlq4shCIk','NcPUoeDdIbe','UAjWgfrv56R'))
and categoryoptioncomboid = 15;