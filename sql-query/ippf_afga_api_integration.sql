
KAP-CBD-15

-- 23/02/2022

select * from organisationunit where uid = 'AmrbwMo8a3S';

select * from organisationunit where parentid = 2062693;
select organisationunitid from organisationunit where parentid = 2062693;

update datavalue set sourceid = 3560921 where sourceid = 1996768 and periodid in ( 3240495,3282262,3354237,3363239,3367729,3379193,3391085,3399681,3404502,3422967,3429435,3500866); 


select startdate,enddate, periodid from period where startdate >= '2022-01-01' and enddate <= '2022-12-31'
and periodtypeid = 3


select * from datavalue where sourceid = 3561875 and periodid in ( 3240495,3282262,
3354237,3363239,3367729,3379193,3391085,3399681,3404502,3422967,3429435,3500866);

update datavalue set sourceid = 1996768 where sourceid = 2045411 and periodid in ( 3240495,3282262,3354237,3363239,3367729,3379193,3391085,3399681,3404502,3422967,3429435,3500866);


="update datavalue set sourceid = "&D2&" where sourceid = "&B2&" and periodid in ( 3240495,3282262,3354237,3363239,3367729,3379193,3391085,3399681,3404502,3422967,3429435,3500866);"

-- sum aggregated data based on orgUnit

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



-- ANC -- lyV4xaK35cS,dKZsEnR8s9C,lyV4xaK35cS,nYxitbqPTef,GPnKb9raUcp,eabkOm49r3O,NWAbJmZi5ey,OSIhs30rFQK
-- fDUINIR160n,  value type numner to text

-- PNC -- uF84mQtvlmR,S289YKm0YVI,CLAR667oKdA -- yes/no to text,
-- dG5Lxn3OIVf,fXUJMeK0Y2T,XCVF4Od77tB,Z2KCGcpPyHB, JwC0Yyo18U1,RNrGHYHaeXN -- value type numner to text

-- afga orgUnit list and CBD group members of afga orgUnit

select org.uid,org.name,org.shortname from organisationunit org
INNER JOIN orgunitgroupmembers orgGrpM ON orgGrpM.organisationunitid = org.organisationunitid
where org.path like '%Kg7auU6OEcY%' and org.hierarchylevel = 6
and orgGrpM.orgunitgroupid = 490;	

-- afga orgUnit list
select uid,name,shortname,code from organisationunit 
where path like '%Kg7auU6OEcY%' and hierarchylevel = 6;


select * from trackedentityinstance where trackedentityinstanceid in(
select trackedentityinstanceid from trackedentityattributevalue where 
trackedentityattributeid = 3115052) and created::date = '2022-01-08';

select * from trackedentityattribute order by trackedentityattributeid desc;

select * from program where uid = 'EAY7CYYkrpi';

select * from programstage where programid = 2930728;

select count(*) from programinstance where programid = 2930728
and created::date = '2022-01-31';

select * from programinstance where programid = 2930728;

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728);

select de.name,de.uid,de.code from programstagedataelement psde
inner join dataelement de ON de.dataelementid = psde.dataelementid
where psde.programstageid = 2930724;

select de.name,de.uid,de.code,de.valuetype from programstagedataelement psde
inner join dataelement de ON de.dataelementid = psde.dataelementid
where psde.programstageid = 2930727;

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930857 );

select * from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programstageid 
in( 2930725,2930726,2930727 ));

out - 2930857 -  ,his 2930724 -  anc - 2930725 mother-PNC 2930726 child-PNC 2930727


anc -- 

-- 30/11/2021 -- total tei -- 1044
-- events  history -- 1044 outcome -- 407

-- anc, mother pnc,child pnc
select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930726,2930727,2930725);

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid = 2930725;

-- as on 14/02/2022
select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930724,2930857 ) -- 16166;

select * from programinstance where programid = 2930728 -- 13568 ;

select * from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930725,2930726,2930727 ) -- 207 ;




update trackedentityattribute set uid = 'yDaWsAZcr8K' where uid = 'jrboI161yqv';


select  us.username user_name, usinf.firstname first_name, usinf.surname sur_name, 
org.uid as user_org_uid from  usermembership usm
INNER JOIN userinfo usinf ON usinf.userinfoid = usm.userinfoid
INNER JOIN users us ON us.userid = usinf.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
order by usinf.firstname;

select * from users;

select * from userinfo;

select * from userattributevalues;


-- create SQL-VIEW
-- user-attributevalue and 
SELECT usinf.firstname first_name, usinf.surname sur_name,
cast(userAttribute.value::json ->> 'value' AS VARCHAR) 
AS userAttribute_value, org.uid as user_org_uid FROM userinfo usinf
JOIN json_each_text(usinf.attributevalues::json) userAttribute ON TRUE 
INNER JOIN usermembership usm ON usinf.userinfoid = usm.userinfoid
inner join organisationunit org ON org.organisationunitid = usm.organisationunitid
INNER JOIN attribute attr ON attr.uid = userAttribute.key
WHERE attr.uid = 'FeCWLipdN3o';

-- create SQL-VIEW
-- tei list based on tea attribute uid
SELECT tei.uid AS tei_uid, pi.uid AS enrollment_uid, prg.uid AS program_uid,
org.uid AS orgUnit_uid,teav.value AS care_mother_id from trackedentityattributevalue teav
INNER JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = teav.trackedentityinstanceid 
INNER JOIN programinstance pi ON pi.trackedentityinstanceid = teav.trackedentityinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg ON prg.programid = pi.programid
where tea.uid = 'yDaWsAZcr8K';



delete from programstageinstance where programstageid = 2930725;

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programstageid = 2930725);

delete from programstageinstance where programstageid in( 2930726,2930727);

delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programstageid in( 2930726,2930727));

-- as on 14/02/2022
delete from trackedentitydatavalueaudit where programstageinstanceid in (
select programstageinstanceid from programstageinstance where programstageid 
in( 2930725,2930726,2930727 ));

delete from programstageinstance where programinstanceid in (
select programinstanceid from programinstance where programid = 2930728) 
and programstageid in( 2930725,2930726,2930727 );


-- update dataelement valuetype for import tracker-data aggregation to dataset 

select * from dataelement where dataelementid in (
select dataelementid from datasetelement where datasetid = 3141857);

update dataelement set valuetype = 'NUMBER' where dataelementid in (
select dataelementid from datasetelement where datasetid = 3141857);

update dataelement set valuetype = 'INTEGER_POSITIVE' where dataelementid in (
select dataelementid from datasetelement where datasetid = 3141857);


begin;
-- delete tracker data 
-- 1) trackedentityattributevalueaudit

	delete from trackedentityattributevalueaudit where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 2930728); 
   
-- 2) trackedentityattributevalue

	delete from trackedentityattributevalue where trackedentityinstanceid in 
   ( select trackedentityinstanceid from programinstance where programid = 2930728); 

-- 3) relationship
	update relationshipitem set trackedentityinstanceid = null where relationshipid in ( select relationshipid from 
	relationship where to_relationshipitemid in ( select relationshipitemid from 
	relationshipitem where trackedentityinstanceid in ( select trackedentityinstanceid from programinstance where programid = 2930728 )));
	
	
-- 4) trackedentitydatavalue


-- 5) trackedentitydatavalueaudit 
    delete from trackedentitydatavalueaudit where programstageinstanceid in 
	( select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 2930728 )
	);

-- 6) programstageinstancecomments

    delete from programstageinstancecomments where programstageinstanceid in 
	(	select programstageinstanceid from programstageinstance where programstageid in 
		( select programstageid from programstage where programid = 2930728 )
	);

-- 7) programstageinstance 
	delete from programstageinstance where programstageid in 
	( select programstageid from programstage where programid = 2930728 );
	
-- 8) programinstancecomments 
	delete from programinstancecomments where programinstanceid in 
	( select programinstanceid from programinstance where programid = 2930728 );

-- 9) programinstance 
      delete from programinstance where programid = 2930728; 

-- 10) trackedentityinstance 
    delete from trackedentityinstance where trackedentityinstanceid in 
	( select trackedentityinstanceid from programinstance where programid = 2930728 ); 

end;

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

update trackedentityattribute set uid = 'EWQRiVxnLH2'
where uid = 'GnPRSF9cV3r';

update trackedentityattribute set uid = 'tsBbDQe3sGo'
where uid = 'Ju7MEdETxsV';

update trackedentityattribute set uid = 'GnPRSF9cV3r'
where uid = 'tsBbDQe3sGo';

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


