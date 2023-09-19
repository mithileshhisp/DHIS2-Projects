
-- push orgUnit to dhis2 lvel 2 and 3 ( state and district )

select * from organisationunit; 788 ( 36 + 751 + 1)

delete from organisationunit where hierarchylevel in(2,3);
select * from organisationunit where hierarchylevel = 2;
select * from organisationunit where hierarchylevel = 3;



-- // MY-sql installer
--https://dev.mysql.com/downloads/installer/
--https://downloads.mysql.com/archives/community/


-- My-SQL
SELECT VERSION();

SELECT USER(), CURRENT_USER;

SHOW GRANTS;

SHOW TABLE STATUS FROM db_iemr;


172.104.206.140 3306
hisp_web
GRgfW1@GRWg

hisp
GRgfW1@GRWg

Server IP : 172.104.206.140
User: piramal_dev
Pass: gWRE!@Fq1e$G
mysql root pass: @gWRE!Fq1e@$G#
Ye hai sir detail

CREATE USER 'hisp'@'%' IDENTIFIED BY 'GRgfW1G@RWg';
GRANT ALL PRIVILEGES ON *.*TO 'hisp'@'%';

-- 31/08/2023
-- from database name shared by client -- iemr

SHOW VARIABLES WHERE variable_name = 'port';
SELECT VERSION();

SELECT USER(), CURRENT_USER;

SHOW GRANTS;

SHOW TABLE STATUS FROM db_iemr;

SELECT USER FROM mysql.user;



-- 13/09/2023

 select * from `m_district`
 
 select * from `m_districtblock`;
 
 select * from `m_state`;
 
select VisitNo,CreatedDate,VisitCode from t_benvisitdetail;

SELECT * FROM t_benvisitdetail;  30002100000003
 
select * from `m_van`

SELECT * FROM `m_facility`

select * from `m_chiefcomplaint`;

select * from `t_benchiefcomplaint`


select * from `m_vantype`;

select * from `m_bloodgroup`;

`db_iemr`


-- master data -- 14/09/2023
select * from m_visitreason;
select * from m_visitcategory; 
select * from m_subvisitcategory;
select * from t_prescription;
select * from m_diagnosisprovided; SELECT * FROM t_diagnosisprovided; -- not present
select * from m_procedurename;  SELECT * FROM m_procedure;
select * from t_lab_testorder;
select * from m_highriskstatus; SELECT * FROM t_highriskstatus; SELECT * FROM m_highriskstatus; -- NOT present
select * from m_highriskcondition; -- not present
select * from t_benreferdetails;

SELECT * FROM `m_chiefcomplaint`;

SELECT * FROM t_benreferdetails;


SELECT * FROM `t_benreferdetails`;

SELECT * FROM i_ben_flow_outreach;
 
SELECT * FROM t_benvisitdetail;
 
SELECT DISTINCT(beneficiary_id) FROM i_ben_flow_outreach;

SELECT DISTINCT(*) FROM i_ben_flow_outreach;
 
 
 SELECT * FROM t_ancdiagnosis;
 
 SELECT * FROM `m_gender`;
 
 SELECT * FROM `m_procedure`;
 
 SELECT * FROM `m_referralreason`;
 
 SELECT * FROM t_phy_vitals;
 
 SELECT * FROM `m_labtests`;
 
https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:4
https://links.hispindia.org/amrit/api/organisationUnits.json?fields=id,displayName,shortName,code,level,attributeValues[attribute[id,displayName,code],value]&sortOrder=ASC&paging=false&filter=level:eq:3

-- orgUnit post to dhis2 query

-- dhis 2 url -- https://links.hispindia.org/amrit/dhis-web-commons/security/login.action
-- version -- 2.40.0.1
-- database name -- piramal_240

-- level - 2
SELECT StateID, StateName, StateCode,GovtStateID Language FROM m_state;

-- level - 3

SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE, md.StateID FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID


SELECT md.DistrictID , md.DistrictName , md.GovtDistrictID, md.GovtStateID,
ms.StateCode, ms.LANGUAGE FROM m_district md
INNER JOIN m_state ms ON ms.StateID = md.StateID where md.GovtDistrictID is null;

select * from `m_districtblock`

-- level - 4

SELECT mdb.BlockID, mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID

SELECT mdb.BlockID , mdb.BlockName, mdb.GovSubDistrictID, md.DistrictID, 
md.GovtDistrictID FROM m_districtblock mdb
INNER JOIN m_district md ON md.DistrictID = mdb.DistrictID
where md.GovtDistrictID is null;




 
 
 


SELECT * FROM i_beneficiaryaccount;

SELECT IsOutbound FROM t_bencall;

SELECT  ReceivedRoleName, CZcallStartTime, CZcallEndTime,
isCallAnswered,isCallDisconnected,IsOutbound,CreatedDate FROM t_bencall;

SELECT * FROM i_beneficiaryaddress;

SELECT * FROM t_outboundcallrequest;

SELECT * FROM t_104benmedhistory;

SELECT DiseaseSummaryID,DiseaseSummary FROM t_104benmedhistory;

SELECT * FROM t_104benmedhistory;

SELECT DiseaseSummaryID,DiseaseSummary FROM t_104benmedhistory;

SELECT * FROM i_beneficiaryaddress;

SELECT * FROM m_104diseasesummary;

SELECT * FROM t_feedback;

SELECT * FROM m_agegroup;

SELECT * FROM t_feedback;

SELECT * FROM t_104benmedhistory;

SELECT DISTINCT beneficiary_reg_id,beneficiary_id,ben_name,date(ben_dob),ben_gender  
FROM i_ben_flow_outreach;

SELECT DISTINCT beneficiary_reg_id,beneficiary_id,ben_name,date(ben_dob),ben_gender,
districtID, date(created_date) FROM i_ben_flow_outreach;