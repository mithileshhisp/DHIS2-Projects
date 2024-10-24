-- M!th!lesh@123 links -- 172.105.47.164 96 4444
-- push orgUnit to dhis2 lvel 2 and 3 ( state and district )

-- take database backup before delete all tracker/aggregated data and import with new query
-- Dh!sUs3Rp@SS1
-- pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_08Dec2023_with104_Program.sql

-- pg_dump -U dhis -d piramal_240 -T analytics* > /home/mithilesh/piramal_240_08Dec2023_with_out_dataValue.sql


-- piramal new client server details 20/03/2024

-- vpn OpenVPN password -- H!$pad77^)
-- IP -- 192.168.45.170
-- port -- 22
-- username - psmri
-- password -- P$mr1@2023$
-- location -- /var/dhis/tomcat-amrit$
-- dhis2-home -- /var/dhis/tomcat-amrit/dhis2
-- production link -- http://14.97.12.103/amrit/dhis-web-commons/security/login.action


-- JHarkhand MMU ou list
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:FA0FFjw3TOX&level=3&paging=false

-- JHarkhand MMU event count
https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/wTsvzw1Zwg8/data?paging=false

-- 63038 -- start cron from 09/07/2024 at 16:10 PM == 63038  Lg7ilkJ2ZGe
-- 72608 -- start cron from 11/07/2024 at 18:15 PM == 63038 + 72608 == 135,646 done ( via xlsx)

-- search TEI across the program and orgUnit based on attributeValue
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&filter=HKw3ToP2354:eq:199337038&trackedEntityType=T10dZwFVdkz
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&trackedEntityType=T10dZwFVdkz&filter=HKw3ToP2354:eq:199337045


-- search event base on dataElement value -- Visitcode
https://samiksha.piramalswasthya.org/amrit/api/events.json?program=NMGbY2nXCKu&orgUnit=Ha9zvTKxGga&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30003000000491&skipPaging=true
https://samiksha.piramalswasthya.org/amrit/api/events.json?fields=*&program=NMGbY2nXCKu&orgUnit=Ha9zvTKxGga&ouMode=SELECTED&status=ACTIVE&filter=QRE1IBSOKdE:eq:30003000000494&skipPaging=true

-- JH MMU event count
-- https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/wTsvzw1Zwg8/data?paging=false
select count(*) from programstageinstance 
where programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') 
and organisationunitid in (9765212,9765210,9765213,
9765211,9765209,9765214,9765208,9765207,9765206,9765205);


-- JH MMU event final query with qunique Visitcode for python script schedular as on 21/07/2024

Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,referal.referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,
testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName

FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode


LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode


 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  db_iemr.t_benvisitdetail.providerservicemapid in (15,16,17,18,19) and db_iemr.t_benvisitdetail.createddate between '2024-07-01 00:00:00' and '2024-12-31 23:59:59' and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null) As Vital
LEFT JOIN
    (SELECT 
       visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;


-- for live python script -- JH MMU event final query with qunique Visitcode for python script schedular as on 21/07/2024

Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,

testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName

FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_ancdiagnosis anc on anc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode


LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode


 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  db_iemr.t_benvisitdetail.providerservicemapid in (15,16,17,18,19)  AND ( db_iemr.t_benvisitdetail.createddate between '{oneDayBeforeTodayStartDate}' and '{todayEndDate}' OR db_iemr.t_benvisitdetail.synceddate between '{oneDayBeforeTodayStartDate}' and '{todayEndDate}' ) AND
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null order by db_iemr.t_benvisitdetail.Visitcode ASC) As Vital
LEFT JOIN
    (SELECT 
       visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;




-- for live python script -- STFC MMU event final query with qunique Visitcode for python script schedular as on 21/07/2024

-- stfc Van ID organisationUnits list API through orgUnit attributeValue
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:dxsfy49ePQY&level=3&paging=false

-- stfc Van ID organisationUnits list API through orgUnit attributeValue and level
https://samiksha.piramalswasthya.org/amrit/api/organisationUnits?fields=id,name,level,attributeValues&filter=attributeValues.attribute.id:eq:dxsfy49ePQY&level=4&paging=false&filter=attributeValues.value:eq:65
-- 

https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances/query.json?ou=NQjElqVFZTm&ouMode=DESCENDANTS&program=NMGbY2nXCKu&filter=trackedEntityAttributes.attribute.id:eq:HKw3ToP2354&skipPaging=true

-- stfc tei enrollment check API
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ou=Gjmru6TZHHh&ouMode=SELECTED&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:448983
https://samiksha.piramalswasthya.org/amrit/api/trackedEntityInstances.json?ouMode=ALL&program=NMGbY2nXCKu&filter=HKw3ToP2354:eq:448983

-- STFC MMU event count

https://samiksha.piramalswasthya.org/amrit/api/29/sqlViews/H7CoTXMw1dh/data?paging=false



SELECT psi.uid as eventUID,de.uid as dataElementUID,psi.organisationunitid,org.uid as orgUID,
cast(data.value::json ->> 'value' AS VARCHAR) AS de_value,psi.created::date FROM programstageinstance psi
JOIN json_each_text(psi.eventdatavalues::json) data ON TRUE 
INNER JOIN programinstance pi ON  pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
-- INNER JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN dataelement de ON de.uid = data.key
where de.uid = 'QRE1IBSOKdE' and psi.organisationunitid 
in (7774555,7774550,7774558,7774560,7774551,7774554,
7774548,7774549,7774553,7774556,7774552,7774557,7774559,7774561,7774547)
and  psi.programstageid in ( select programstageid
from programstage where uid = 'qJbHjQBuG3G') and 
cast(data.value::json ->> 'value' AS VARCHAR)  in( '30003100303064',
'30003100303438','30003200303585','30003200303601',
'30003200303593','30003300303293','30003300303295','30003200303600',
'30003300303132','30003300303281','30003300303162','30003300303370',
'30003300303271','30003300303435','30003300303444','30003300303380');




Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,
-- if(Com.ComorbidCondition_Fulltext like '%hyperten%' and Com.ComorbidCondition_Fulltext like '%diabet%','HTN & DBM',
-- if(Com.ComorbidCondition_Fulltext like '%hyperten%' ,'Hypertension',
-- if(Com.ComorbidCondition_Fulltext like '%diabet%','Diabetes Mellitus',
case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,

-- testorder.ProcedureID, testorder.ProcedureName,testresult.TestResultValue,,testresult.visitcode As Labtest_Prescribed_Done,
 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
-- LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where ( db_iemr.t_benvisitdetail.createddate between '{oneDayBeforeTodayStartDate}' and '{todayEndDate}' OR db_iemr.t_benvisitdetail.synceddate between '{oneDayBeforeTodayStartDate}' and '{todayEndDate}' ) AND
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
       visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;
	
	
	
	

-- assam_saksham_tmc Saksham HWC Event query DHIS2 event final query with qunique Visitcode for python script schedular as on 03/08/2024

Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,

 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
-- LEFT JOIN db_iemr.t_pncdiagnosis pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  ( db_iemr.t_benvisitdetail.createddate between '2022-01-01 00:00:00' and '2024-07-31 23:59:59' or db_iemr.t_benvisitdetail.SyncedDate between '2022-01-01 00:00:00' and '2024-07-31 23:59:59') and db_iemr.t_benvisitdetail.visitcode is not null 
and db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.providerservicemapid in (21,1717) order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
       visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode ;	
	
	
	
-- digwal Digwal SJVN MMU event Event query DHIS2 event final query with qunique Visitcode for python script schedular as on as on 07/08/2024		
	
Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.ProviderServiceMapID As BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,

 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  (db_iemr.t_benvisitdetail.createddate between '2018-01-01 00:00:00' and '2024-08-02 23:59:59' or db_iemr.t_benvisitdetail.SyncedDate between '2018-01-01 00:00:00' and '2024-08-02 23:59:59') and db_iemr.t_benvisitdetail.ProviderServiceMapID in (5,6,7) and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
      distinct visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;	
	
	
	
-- APL MMU event Event query DHIS2 event final query with qunique Visitcode for python script schedular as on 07/08/2024	
Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.ProviderServiceMapID As BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,

 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.VanSerialNo = i_ben_mapping.BenDetailsId and i_ben_details.vanid=i_ben_mapping.vanid)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  (db_iemr.t_benvisitdetail.createddate between '2024-06-28 00:00:00' and '2024-08-06 23:59:59' or db_iemr.t_benvisitdetail.SyncedDate between '2024-06-28 00:00:00' and '2024-08-06 23:59:59') and db_iemr.t_benvisitdetail.ProviderServiceMapID=10 and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
       visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;
	
	
	
	
	
	
	
	
-- 	sehtok MMU event Event query DHIS2 event final query with qunique Visitcode for python script schedular as on 10/08/2024	
Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,

 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId)

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
  
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  ( db_iemr.t_benvisitdetail.createddate between '2024-08-06 00:00:00' and '2024-08-10 23:59:59' or db_iemr.t_benvisitdetail.SyncedDate between '2024-08-06 00:00:00' and '2024-08-08 10:59:59') and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null and db_iemr.t_benvisitdetail.ProviderServiceMapID=3 order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
       visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode ;
	
	
-- 	APL TMC event Event query DHIS2 event final query with qunique Visitcode for python script schedular as on 16/08/2024

Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.ProviderServiceMapID As BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,

year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,

db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,


testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,

if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName,
(case when habit.TobaccoUseStatus like '%no%' then 'No'
when habit.TobaccoUseStatus like '%Yes%' then 'Yes'
when habit.TobaccoUseStatus like '%Discontinued%' then 'Discontinued'
end) As TobaccoUseStatus,
(case when habit.AlcoholIntakeStatus like '%no%' then 'No'
when habit.AlcoholIntakeStatus like '%Yes%' then 'Yes'
when habit.AlcoholIntakeStatus like '%Discontinued%' then 'Discontinued'
end) As AlcoholIntakeStatus,
upper(trim(ad.PermServicePoint)) As Servicepoint
FROM db_iemr.t_benvisitdetail

LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID

LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId)
LEFT JOIN db_identity.i_beneficiaryaddress_vtbl ad on i_ben_mapping.BenAddressId=ad.BenAddressID

LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN ( select visitcode,group_concat(distinct TobaccoUseStatus) As TobaccoUseStatus,group_concat(distinct AlcoholIntakeStatus) As AlcoholIntakeStatus from db_iemr.t_benpersonalhabit where Deleted=0 group by visitcode) As habit ON habit.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  (db_iemr.t_benvisitdetail.createddate between '{start_date} 00:00:00' and '{end_date} 23:59:59'  
or db_iemr.t_benvisitdetail.SyncedDate between '{start_date} 00:00:00' and '{end_date} 23:59:59' ) 
and db_iemr.t_benvisitdetail.ProviderServiceMapID in (1,2,3,4,5) and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null 
order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
(SELECT 
visitcode As Labtest_Done_Visitcode,
((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
+ (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
+(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
+(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
+(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
+(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
) AS Total_lab_test,
Random_Blood_Sugar,
Hemoglobin,
UrineAlbumin,
UrineSugar,
Urine_Pregnancy_test,
Malaria,
ECG,
HbA1c,
Liver_Function_Test,
Liverfunctiontest_Direct_Bilirubin,
Liverfunctiontest_SGPT,
Liverfunctiontest_SGOT,
Liverfunctiontest_Total_Serum_Bilirubin,
Liverfunctiontest_Blood_Urea,
Liverfunctiontest_Serum_Creatinine,
Renal_function_test,
Renalfunctiontest_Serum_Creatinine,
Renalfunctiontest_Blood_Urea,
Lipid_profile,
Lipidprofile_Serum_Total_Cholesterol,
Lipidprofile_Serum_HDL,
Lipidprofile_LDL,
Lipidprofile_Serum_Triglycerides,
Post_Lunch_Blood_Sugar,
Fasting_Blood_Sugar,
Complete_Blood_Picture,
CBP_ESR,
CBP_Monocytes,
CBP_Hemoglobin,
CBP_RBC,
CBP_Lymphocytes,
CBP_Neutrophils,
CBP_Basophils,
CBP_Eosinophils,
CBP_MCV,
CBP_MCH,
CBP_MCHC,
CBP_Hematocrit,
CBP_Platelet_Count,
CBP_Total_Leucocyte_Count,
Widal_Test,
Sputum_AFB_Test,
Sickle_Cell_Disease_Test,
HBsAg,
Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
CASE
WHEN Random_Blood_Sugar < 140 THEN '1'
WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
WHEN Random_Blood_Sugar>=200 then '3'
END AS RBS_Status
FROM
(SELECT 
tr.visitcode,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
END) Random_Blood_Sugar,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
END) Hemoglobin,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
END) UrineAlbumin,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
END) UrineSugar,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
END) Urine_Pregnancy_test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
END) Malaria,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
END) ECG,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
END) HbA1c,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
END) Liver_Function_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
END) Liverfunctiontest_Direct_Bilirubin,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
END) Liverfunctiontest_SGPT,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
END) Liverfunctiontest_SGOT,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
END) Liverfunctiontest_Total_Serum_Bilirubin,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
END) Liverfunctiontest_Blood_Urea,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
END) Liverfunctiontest_Serum_Creatinine,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
END) Renalfunctiontest_Serum_Creatinine,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
END) Renalfunctiontest_Blood_Urea,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
END) As Lipid_profile,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
END) As Lipidprofile_Serum_Total_Cholesterol,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
END) As Lipidprofile_Serum_HDL,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
END) As Lipidprofile_LDL,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
END) As Lipidprofile_Serum_Triglycerides,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
END) Post_Lunch_Blood_Sugar,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
END) Fasting_Blood_Sugar,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
END)  Complete_Blood_Picture,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
END) As CBP_ESR,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
END) As CBP_Monocytes,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
END) As CBP_Hemoglobin,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
END) As CBP_RBC,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
END) CBP_Lymphocytes,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
END) CBP_Neutrophils,  
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
END) CBP_Basophils,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
END) CBP_Eosinophils,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
END) CBP_MCV,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
END) CBP_MCH,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
END) CBP_MCHC,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
END) CBP_Hematocrit,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
END) CBP_Platelet_Count,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
END) CBP_Total_Leucocyte_Count,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
END) Widal_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
END) Sputum_AFB_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
END) Sickle_Cell_Disease_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
END) HBsAg,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
END) Complete_Urine_Examination,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
END) Complete_Urine_Examination_Total_Leucocyte_Count,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
END) Chikungunya,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
END) Hb_Electrophoresis,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
END) Dengue_NS1_Antigen,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
END) Dengue_Antibody_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
END) HIV1_HIV2_RDT,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
END) Visual_Acuity_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
END) Blood_Group,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
END) VDRL_Test,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
END) Syphilis,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
END) Serum_Uric_Acid,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
END) Serum_Total_Cholesterol,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
END) Hepatitis_B,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
END) Hepatitis_C,
GROUP_CONCAT(distinct CASE
WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
END) ESR
FROM
db_iemr.t_lab_testresult tr 
inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
where mp.deleted=0
GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;
	
-- 	Digwal TMC event Event query DHIS2 event final query with qunique Visitcode for python script schedular as on 18/08/2024	

Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.ProviderServiceMapID As BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(i_ben_details.DOB IS NOT NULL, DATE_FORMAT(i_ben_details.DOB, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,


 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName,
(case when habit.TobaccoUseStatus like '%no%' then 'No'
when habit.TobaccoUseStatus like '%Yes%' then 'Yes'
when habit.TobaccoUseStatus like '%Discontinued%' then 'Discontinued'
end) As TobaccoUseStatus,
(case when habit.AlcoholIntakeStatus like '%no%' then 'No'
when habit.AlcoholIntakeStatus like '%Yes%' then 'Yes'
when habit.AlcoholIntakeStatus like '%Discontinued%' then 'Discontinued'
end) As AlcoholIntakeStatus,
trim(upper(ad.PermServicePoint)) As Servicepoint
FROM db_iemr.t_benvisitdetail
 
LEFT JOIN  db_identity.i_beneficiarymapping i_ben_mapping ON 
i_ben_mapping.BenRegId = db_iemr.t_benvisitdetail.BeneficiaryRegID
 
LEFT JOIN  db_identity.i_beneficiarydetails_vtbl i_ben_details ON 
(i_ben_details.BeneficiaryDetailsId = i_ben_mapping.BenDetailsId)
LEFT JOIN db_identity.i_beneficiaryaddress_vtbl ad on i_ben_mapping.BenAddressId=ad.BenAddressID
LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN ( select visitcode,group_concat(distinct TobaccoUseStatus) As TobaccoUseStatus,group_concat(distinct AlcoholIntakeStatus) As AlcoholIntakeStatus from db_iemr.t_benpersonalhabit where Deleted=0 group by visitcode) As habit ON habit.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  (db_iemr.t_benvisitdetail.createddate between '{oneDayBeforeTodayStartDate}' and '{todayEndDate}' or db_iemr.t_benvisitdetail.SyncedDate between '{oneDayBeforeTodayStartDate}' and '{todayEndDate}' ) and db_iemr.t_benvisitdetail.ProviderServiceMapID=3 and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
      distinct visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode;
	


-- 	Digwal MMU event Event query DHIS2 event final query with qunique Visitcode for python script schedular as on 20/08/2024


Select * from 
(SELECT distinct db_iemr.t_benvisitdetail.Visitcode,db_iemr.t_benvisitdetail.ProviderServiceMapID As BenVisitID, db_iemr.t_benvisitdetail.BeneficiaryRegID,
db_iemr.t_benvisitdetail.VisitNo,db_iemr.t_benvisitdetail.CreatedDate,db_iemr.t_benvisitdetail.vanid,
 
year(db_iemr.t_benvisitdetail.CreatedDate) - 
year(IF(bfo.ben_dob IS NOT NULL, DATE_FORMAT(bfo.ben_dob, '%Y-01-01'), NULL)) as AgeOnVisit,
 
db_iemr.t_benvisitdetail.VisitReason,db_iemr.t_benvisitdetail.VisitCategory, db_iemr.t_benvisitdetail.PregnancyStatus,
referal.Visitcode As Referal_Visitcode,trim(referal.referredToInstituteName) As referredToInstituteName,referal.referralreason,
pnc.ProvisionalDiagnosis,phyanthropometry.BMI AS phyanthropometry_bmi,phy.rbs nurse_rbs,phyanthropometry.Weight_Kg,phyanthropometry.Height_cm,phyanthropometry.WaistCircumference_cm,phy.Temperature,
phy.SystolicBP_1stReading,phy.DiastolicBP_1stReading,
 Com.ComorbidCondition_Fulltext,

case when Com.ComorbidCondition_Fulltext like '%Diabetes%' then 'Diabetes Mellitus' end As Comobrid_Diabetes,
case when Com.ComorbidCondition_Fulltext like '%Hyperten%' then 'Hypertension' end As Comobrid_Hypertension,
case when Com.ComorbidCondition_Fulltext like '%Asthma%' then 'Asthma' end As Comobrid_Asthma,
case when Com.ComorbidCondition_Fulltext like '%Epilepsy%' then 'Epilepsy' end As Comobrid_Epilepsy,
case when Com.ComorbidCondition_Fulltext like '%Heart Disease%' then 'Heart Disease' end As Comobrid_Heart_Disease,
case when Com.ComorbidCondition_Fulltext like '%Kidney Disease%' then 'Kidney Disease' end As Comobrid_Kidney_Disease,
case when Com.ComorbidCondition_Fulltext like '%Sickle cell disease%' then 'Sickle Cell Disease' end As Comobrid_Sickle_cell,


 testorder.VisitCode As Labtest_Prescribed,
prescription.visitcode As Drug_Prescribedcode,patient.Visitcode As Drug_Dispensecode,
diagnosisprovided as diagnosisprovided_full_text,
if(diagnosisprovided like '%hyperten%' and diagnosisprovided like '%diabet%','HTN & DBM',
if(diagnosisprovided like '%hyperten%' ,'Hypertension',
if( diagnosisprovided like '%diabet%','Diabetes Mellitus',
if( diagnosisprovided is null ,'NULL','Others')))) as DiagnosisProvided1,
 
if(ncd.ncd_condition like '%hyperten%' and ncd.ncd_condition like '%diabet%','HTN & DBM',
if(ncd.ncd_condition like '%hyperten%' ,'Hypertension',
if( ncd.ncd_condition like '%diabet%','Diabetes Mellitus',
if( ncd.ncd_condition is null ,'NULL','Others')))) as NCD_Condition,
ncd.ncd_condition as ncd_condition_full_text,phy.PulseRate,phy.spo2,ft.visitCode as feto_Visitcode,ft.TestName,drug.GenericDrugName,
(case when habit.TobaccoUseStatus like '%no%' then 'No'
when habit.TobaccoUseStatus like '%Yes%' then 'Yes'
when habit.TobaccoUseStatus like '%Discontinued%' then 'Discontinued'
end) As TobaccoUseStatus,
(case when habit.AlcoholIntakeStatus like '%no%' then 'No'
when habit.AlcoholIntakeStatus like '%Yes%' then 'Yes'
when habit.AlcoholIntakeStatus like '%Discontinued%' then 'Discontinued'
end) As AlcoholIntakeStatus,
trim(upper(bfo.servicePoint)) As Servicepoint
FROM db_iemr.t_benvisitdetail
 

left join db_iemr.i_ben_flow_outreach_vtbl bfo on bfo.beneficiary_visit_code=db_iemr.t_benvisitdetail.visitcode
LEFT JOIN db_iemr.t_phy_vitals phy on phy.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN db_iemr.t_phy_anthropometry phyanthropometry ON phyanthropometry.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct ProvisionalDiagnosis) As ProvisionalDiagnosis from db_iemr.t_pncdiagnosis where Deleted=0 group by visitcode) pnc on pnc.Visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct NCD_Condition) As NCD_Condition from db_iemr.t_ncddiagnosis 
where Deleted=0 group by visitcode) As ncd on ncd.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct ComorbidCondition) As ComorbidCondition_Fulltext from db_iemr.t_bencomorbiditycondition where Deleted=0 group by visitcode) As Com on Com.visitcode=db_iemr.t_benvisitdetail.Visitcode

LEFT JOIN (select visitcode,group_concat(distinct benReferID) As Benreferid,group_concat(distinct referredToInstituteName) As referredToInstituteName,group_concat(distinct referralreason) As referralreason from db_iemr.t_benreferdetails where Deleted=0 group by visitcode) As referal ON referal.Visitcode=db_iemr.t_benvisitdetail.Visitcode
 LEFT JOIN (select visitcode,group_concat(distinct ProcedureName) As Labtest from db_iemr.t_lab_testorder testorder where Deleted=0 group by visitcode) As testorder on testorder.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN ( select visitcode,group_concat(distinct TobaccoUseStatus) As TobaccoUseStatus,group_concat(distinct AlcoholIntakeStatus) As AlcoholIntakeStatus from db_iemr.t_benpersonalhabit where Deleted=0 group by visitcode) As habit ON habit.Visitcode=db_iemr.t_benvisitdetail.Visitcode   
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct DiagnosisProvided) As DiagnosisProvided from db_iemr.t_prescription where Deleted=0 group by visitcode) As prescription ON prescription.Visitcode=db_iemr.t_benvisitdetail.Visitcode
LEFT JOIN (select visitcode,group_concat(distinct PatientIssueID) As PatientIssueID from db_iemr.t_patientissue where Deleted=0 group by visitcode) As patient on patient.Visitcode=db_iemr.t_benvisitdetail.Visitcode 
LEFT JOIN ( select visitcode,group_concat(distinct PrescriptionID) As PrescriptionID,group_concat(distinct GenericDrugName) As GenericDrugName from db_iemr.t_prescribeddrug where Deleted=0 group by visitcode) As drug ON drug.Visitcode=db_iemr.t_benvisitdetail.Visitcode
left join (select visitcode,group_concat(distinct fetosenseID) As fetosenseID,group_concat(distinct testName) As Testname from db_iemr.t_fetosensedata where visitcode is not null and Deleted=0 group by visitcode)As ft on ft.visitcode=db_iemr.t_benvisitdetail.Visitcode
where  (db_iemr.t_benvisitdetail.createddate between '2024-08-17 00:00:00' and '2024-08-20 23:59:59' or db_iemr.t_benvisitdetail.SyncedDate between '2018-01-01 00:00:00' and '2024-08-17 23:59:59') and db_iemr.t_benvisitdetail.ProviderServiceMapID=4 and
db_iemr.t_benvisitdetail.beneficiaryregid is not null and db_iemr.t_benvisitdetail.visitcode is not null order by db_iemr.t_benvisitdetail.visitcode asc) As Vital
LEFT JOIN
    (SELECT 
      distinct visitcode As Labtest_Done_Visitcode,
            ((Random_Blood_Sugar IS NOT NULL) + (Hemoglobin IS NOT NULL) + (Urine_Pregnancy_test is not null) + (UrineSugar is not null)+ (UrineAlbumin IS NOT NULL) + (Malaria IS NOT NULL) + (ECG is not null)
            + (HbA1c is not null)+(Liver_Function_Test is not null)+(Renal_function_test is not null)+(Lipid_profile is not null)+(Post_Lunch_Blood_Sugar is not null)
            +(Fasting_Blood_Sugar is not null)+(Complete_Blood_Picture is not null)+(Widal_Test is not null)+(Sputum_AFB_Test is not null)
           +(Sickle_Cell_Disease_Test is not null)+(HBsAg is not null)
            +(Complete_Urine_Examination is not null)+(Chikungunya is not null)+(Hb_Electrophoresis is not null)+(Dengue_NS1_Antigen is not null)+(Dengue_Antibody_Test is not null)+(HIV1_HIV2_RDT is not null)
            +(Visual_Acuity_Test is not null)+(Blood_Group is not null)+(VDRL_Test is not null)+(Syphilis is not null)+(Serum_Uric_Acid is not null)+(Serum_Total_Cholesterol is not null)+(Hepatitis_B is not null)+(Hepatitis_C is not null)+(ESR is not null)
            ) AS Total_lab_test,
            Random_Blood_Sugar,
            Hemoglobin,
            UrineAlbumin,
            UrineSugar,
                        Urine_Pregnancy_test,
                        Malaria,
            ECG,
            HbA1c,
            Liver_Function_Test,
            Liverfunctiontest_Direct_Bilirubin,
            Liverfunctiontest_SGPT,
            Liverfunctiontest_SGOT,
            Liverfunctiontest_Total_Serum_Bilirubin,
            Liverfunctiontest_Blood_Urea,
            Liverfunctiontest_Serum_Creatinine,
            Renal_function_test,
            Renalfunctiontest_Serum_Creatinine,
            Renalfunctiontest_Blood_Urea,
            Lipid_profile,
            Lipidprofile_Serum_Total_Cholesterol,
            Lipidprofile_Serum_HDL,
            Lipidprofile_LDL,
            Lipidprofile_Serum_Triglycerides,
            Post_Lunch_Blood_Sugar,
            Fasting_Blood_Sugar,
            Complete_Blood_Picture,
            CBP_ESR,
            CBP_Monocytes,
            CBP_Hemoglobin,
            CBP_RBC,
            CBP_Lymphocytes,
            CBP_Neutrophils,
            CBP_Basophils,
            CBP_Eosinophils,
            CBP_MCV,
            CBP_MCH,
            CBP_MCHC,
            CBP_Hematocrit,
            CBP_Platelet_Count,
            CBP_Total_Leucocyte_Count,
            Widal_Test,
            Sputum_AFB_Test,
            Sickle_Cell_Disease_Test,
            HBsAg,
            Complete_Urine_Examination,
Complete_Urine_Examination_Total_Leucocyte_Count,
Complete_Urine_Examination_Urine_for_Nitrite,
Chikungunya,
Hb_Electrophoresis,
Dengue_NS1_Antigen,
Dengue_Antibody_Test,
HIV1_HIV2_RDT,
Visual_Acuity_Test,
Blood_Group,
VDRL_Test,
Syphilis,
Serum_Uric_Acid,
Serum_Total_Cholesterol,
Hepatitis_B,Hepatitis_C,ESR,
                       CASE
                WHEN Random_Blood_Sugar < 140 THEN '1'
                WHEN Random_Blood_Sugar>=140 and Random_Blood_Sugar < 200 THEN '2'
                WHEN Random_Blood_Sugar>=200 then '3'
            END AS RBS_Status
    FROM
        (SELECT 
        tr.visitcode,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Random Blood Glucose (RBS)','Random Blood Sugar','Blood Glucose') THEN tr.TestResultValue
            END) Random_Blood_Sugar,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName in ('Hemoglobin (Hb)','Hemoglobin for Male','Hemoglobin for Female','Haemoglobin Estimation') THEN tr.TestResultValue
            END) Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Albumin' THEN tr.TestResultValue
            END) UrineAlbumin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Sugar' THEN tr.TestResultValue
            END) UrineSugar,
                                   GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Urine Pregnancy Test (UPT)' THEN tr.TestResultValue
            END) Urine_Pregnancy_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RDT Malaria Test' THEN tr.TestResultValue
            END) Malaria,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='ECG' THEN tr.TestResultValue
            END) ECG,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HbA1c' THEN tr.TestResultValue
            END) HbA1c,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' THEN tr.TestResultValue
            END) Liver_Function_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Direct Bilirubin (DB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Direct_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGPT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGPT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='SGOT' THEN tr.TestResultValue
            END) Liverfunctiontest_SGOT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Total Serum Bilirubin (TSB)' THEN tr.TestResultValue
            END) Liverfunctiontest_Total_Serum_Bilirubin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Liverfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Liver Function Test (LFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Liverfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' THEN tr.TestResultValue END) Renal_function_test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Serum Creatinine' THEN tr.TestResultValue
            END) Renalfunctiontest_Serum_Creatinine,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Renal Function Test (RFT)' and mt.TestComponentName='Blood Urea' THEN tr.TestResultValue
            END) Renalfunctiontest_Blood_Urea,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' THEN tr.TestResultValue
            END) As Lipid_profile,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum Total Cholesterol' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='Serum HDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_HDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_LDL,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Lipid Profile' and mt.TestComponentName='LDL' THEN tr.TestResultValue
            END) As Lipidprofile_Serum_Triglycerides,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Post Lunch Blood Sugar (PLBS)' THEN tr.TestResultValue
            END) Post_Lunch_Blood_Sugar,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Fasting Blood Sugar (FBS)' THEN tr.TestResultValue
            END) Fasting_Blood_Sugar,
          GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' THEN tr.TestResultValue
            END)  Complete_Blood_Picture,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) As CBP_ESR,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Monocytes (%)' THEN tr.TestResultValue
            END) As CBP_Monocytes,
           GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hemoglobin (Hb)' THEN tr.TestResultValue
            END) As CBP_Hemoglobin,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='RBC Count' THEN tr.TestResultValue
            END) As CBP_RBC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Lymphocytes (%)' THEN tr.TestResultValue
            END) CBP_Lymphocytes,
      GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Neutrophils (%)' THEN tr.TestResultValue
            END) CBP_Neutrophils,  
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Basophils (%)' THEN tr.TestResultValue
            END) CBP_Basophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Eosinophils (%)' THEN tr.TestResultValue
            END) CBP_Eosinophils,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCV' THEN tr.TestResultValue
            END) CBP_MCV,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCH' THEN tr.TestResultValue
            END) CBP_MCH,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='MCHC' THEN tr.TestResultValue
            END) CBP_MCHC,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Hematocrit (Hct)' THEN tr.TestResultValue
            END) CBP_Hematocrit,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Platelet Count' THEN tr.TestResultValue
            END) CBP_Platelet_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Blood Picture (CBP)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) CBP_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Widal Test' THEN tr.TestResultValue
            END) Widal_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sputum AFB Test' THEN tr.TestResultValue
            END) Sputum_AFB_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Sickling / Solubility Test (Sickle Cell Disease Test)' THEN tr.TestResultValue
            END) Sickle_Cell_Disease_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HBsAg (RDT)' THEN tr.TestResultValue
            END) HBsAg,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' THEN tr.TestResultValue
            END) Complete_Urine_Examination,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Total Leucocyte Count (TLC)' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Total_Leucocyte_Count,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Complete Urine Examination (CUE)' and mt.TestComponentName='Urine for Nitrite' THEN tr.TestResultValue
            END) Complete_Urine_Examination_Urine_for_Nitrite,
GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Chikungunya'  THEN tr.TestResultValue
            END) Chikungunya,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Hb Electrophoresis'  THEN tr.TestResultValue
            END) Hb_Electrophoresis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue NS-1 Antigen'  THEN tr.TestResultValue
            END) Dengue_NS1_Antigen,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Dengue Ig M Antibody Test'  THEN tr.TestResultValue
            END) Dengue_Antibody_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%HIV%'  THEN tr.TestResultValue
            END) HIV1_HIV2_RDT,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Visual Acuity Test' THEN tr.TestResultValue
            END) Visual_Acuity_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Blood Group%' THEN tr.TestResultValue
            END) Blood_Group,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='VDRL Test' THEN tr.TestResultValue
            END) VDRL_Test,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='RPR Card Test for Syphilis' THEN tr.TestResultValue
            END) Syphilis,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like'%Uric Acid%' THEN tr.TestResultValue
            END) Serum_Uric_Acid,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName like '%Cholesterol%' THEN tr.TestResultValue
            END) Serum_Total_Cholesterol,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP B' THEN tr.TestResultValue
            END) Hepatitis_B,
                        GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='HEP C' THEN tr.TestResultValue
            END) Hepatitis_C,
            GROUP_CONCAT(distinct CASE
                WHEN mp.ProcedureName='Erythrocyte Sedimentation Rate (ESR)' THEN tr.TestResultValue
            END) ESR
    FROM
        db_iemr.t_lab_testresult tr 
        inner join db_iemr.m_procedure mp on mp.ProcedureID = tr.ProcedureID
        inner join db_iemr.m_testcomponent mt on mt.TestComponentID=tr.TestComponentID
        where mp.deleted=0
    GROUP BY 1) AS temp) l ON Vital.visitcode = l.Labtest_Done_Visitcode ;
	
	
-- bihar 104 event-1 final query

SELECT DISTINCT 
    t.BenCallID,
    t.CallID,
    t.BeneficiaryRegID,
        t.CallTime,
        t.CreatedDate,
       -- t.CZcallDuration As CallDuration,
         TIME_TO_SEC(TIMEDIFF(t.CallEndTime, t.CallTime)) AS CallDuration, 
	     --concat(mu.UserName,"-",t.CallReceivedUserID) As Received_username,    
         --concat(mu.UserName,"-",t.CallReceivedUserID) As End_username,
		 
		 concat(trim(rmu.UserName),"-",t.CallReceivedUserID) As Received_username,
         concat(trim(emu.UserName),"-",t.CallEndUserID) As End_username,
       -- CONCAT( UPPER(SUBSTRING(trim(concat(trim(rmu.UserName),"-",t.CallReceivedUserID)), 1, 1)), LOWER(SUBSTRING(trim(concat(trim(rmu.UserName),"-",t.CallReceivedUserID)), 2))) As Received_username,
       -- CONCAT( UPPER(SUBSTRING(trim(concat(trim(emu.UserName),"-",t.CallEndUserID)), 1, 1)), LOWER(SUBSTRING(trim(concat(trim(emu.UserName),"-",t.CallEndUserID)), 2))) As End_username, 

            t.ReceivedAgentID AS AgentID,
            t.ReceivedRoleName,
        t.IsCalledEarlier,
    t.EmergencyType,
    t.IsOutbound, 
    mct.CallGroupType,
    mct.CallType,
    dt.Call_Status,
dt.SessionID,
dt.Agent_Disposition_Category,
dt.Agent_Disposition,
dt.DID_Number,
dt.Queue_time,
dt.Wrapup_time,
dt.Wait_Time,
dt.Actual_Talk_Time,
dt.Channel,
dt.Wrapped_By

    FROM 
    db_iemr.t_detailedcallreport_vtbl dt 
    left join
    db_iemr.t_bencall_vtbl t on (t.callid=dt.SessionID and t.ReceivedAgentID=dt.agentid)
    
    LEFT JOIN 
    db_iemr.m_calltype mct ON mct.CallTypeID = t.CallTypeID
LEFT JOIN 
    db_iemr.m_user_vtbl rmu on rmu.UserID=t.CallReceivedUserID
left join db_iemr.m_user_vtbl emu on emu.UserID=t.CallEndUserID
 
WHERE 
    t.IsOutbound IS NOT TRUE 
    AND t.calltypeid IS NOT NULL 
    AND (dt.Call_Start_Time between '2024-09-01 00:00:00' and '2024-09-09 23:59:59') 
    AND t.BeneficiaryRegID IS NOT NULL;
	


-- Assam 104 event 1 query

SELECT DISTINCT 
t.BenCallID,
t.CallID,
t.BeneficiaryRegID,
t.CallTime,
t.CreatedDate,
--  t.CZcallDuration As CallDuration,
TIME_TO_SEC(TIMEDIFF(t.CallEndTime, t.CallTime)) AS CallDurationInSeconds, 
CONCAT( 'AS-',UPPER(SUBSTRING(trim(concat(trim(rmu.UserName),"-",t.CallReceivedUserID)), 1, 1)), LOWER(SUBSTRING(trim(concat(trim(rmu.UserName),"-",t.CallReceivedUserID)), 2))) As Received_username,
if(emu.UserName IS NULL , 'AS-Not Assigned-99999',CONCAT('AS-', UPPER(SUBSTRING(trim(concat(trim(emu.UserName),"-",t.CallEndUserID)), 1, 1)), LOWER(SUBSTRING(trim(concat(trim(emu.UserName),"-",t.CallEndUserID)), 2))) ) As End_username,
t.ReceivedAgentID AS AgentID,
t.ReceivedRoleName,
t.IsCalledEarlier,
t.IsOutbound, 
mct.CallGroupType,
mct.CallType,
dt.Call_Status,
dt.SessionID,
dt.Agent_Disposition_Category,
dt.Agent_Disposition,
dt.DID_Number,
dt.Queue_time,
dt.Wrapup_time,
dt.Wait_Time,
dt.Actual_Talk_Time,
dt.Channel,
dt.Wrapped_By
FROM 
db_iemr.t_detailedcallreport dt     left join
db_iemr.t_bencall_vtbl t  on (t.callid=dt.SessionID and t.ReceivedAgentID=AgentID)
LEFT JOIN db_iemr.m_calltype mct ON mct.CallTypeID = t.CallTypeID
LEFT JOIN db_iemr.m_user_vtbl rmu on rmu.UserID=t.CallReceivedUserID
left join db_iemr.m_user_vtbl emu on emu.UserID=t.CallEndUserID
WHERE t.BeneficiaryRegID IS NOT NULL AND t.IsOutbound IS NOT TRUE AND t.calltypeid IS NOT NULL 
AND (dt.Call_Start_Time between '2024-09-01 00:00:00' and '2024-09-01 23:59:59')

	
	
-- 1097 event-1 query

SELECT DISTINCT 
    t.BenCallID,
    t.CallID,
    t.BeneficiaryRegID,
        t.CallTime,
        t.CreatedDate,
      --  t.CZcallDuration As CallDuration,
         TIME_TO_SEC(TIMEDIFF(t.CallEndTime, t.CallTime)) AS CallDurationInSeconds, 
       CONCAT( UPPER(SUBSTRING(trim(concat(trim(rmu.UserName),"-",t.CallReceivedUserID)), 1, 1)), LOWER(SUBSTRING(trim(concat(trim(rmu.UserName),"-",t.CallReceivedUserID)), 2))) As Received_username,
       CONCAT( UPPER(SUBSTRING(trim(concat(trim(emu.UserName),"-",t.CallEndUserID)), 1, 1)), LOWER(SUBSTRING(trim(concat(trim(emu.UserName),"-",t.CallEndUserID)), 2))) As End_username, 
            t.ReceivedAgentID AS AgentID,
            t.ReceivedRoleName,
        t.IsCalledEarlier,
    t.IsOutbound, 
    mct.CallGroupType,
    mct.CallType,
    dt.Call_Status,
dt.SessionID,
dt.Agent_Disposition_Category,
dt.Agent_Disposition,
dt.DID_Number,
dt.Queue_time,
dt.Wrapup_time,
dt.Wait_Time,
dt.Actual_Talk_Time,
dt.Channel,
dt.Wrapped_By
    FROM 
	db_iemr.t_detailedcallreport dt     left join
    db_iemr.t_bencall_vtbl t  on (t.callid=dt.SessionID and t.ReceivedAgentID=AgentID)
    
    LEFT JOIN 
    db_iemr.m_calltype mct ON mct.CallTypeID = t.CallTypeID
LEFT JOIN 
    db_iemr.m_user_vtbl rmu on rmu.UserID=t.CallReceivedUserID
left join db_iemr.m_user_vtbl emu on emu.UserID=t.CallEndUserID
     
WHERE 
    t.IsOutbound IS NOT TRUE 
    AND t.calltypeid IS NOT NULL 
    AND (dt.Call_Start_Time between '2024-09-01 00:00:00' and '2024-09-17 23:59:59') 
    AND t.BeneficiaryRegID IS NOT NULL;
	
	
	
-- call count for beneficiries null
select date(vt.createddate) As Createddate,m.CallGroupType,m.CallType,count(distinct vt.bencallid) As Call_Count from db_iemr.t_bencall_vtbl vt
inner join db_iemr.m_calltype m on m.CallTypeID = vt.CallTypeID
where vt.IsOutbound is not true and vt.beneficiaryregid is null 

and vt.createddate between '2019-01-01 00:00:00' and '2023-12-31 23:59:59' and vt.calltypeid is not null 
group by 1,2,3;	

select date(vt.createddate) As Createddate, m.CallGroupType, m.CallType,
count(distinct vt.bencallid) As Call_Count from db_iemr.t_bencall_vtbl vt
inner join db_iemr.m_calltype m on m.CallTypeID = vt.CallTypeID
where vt.IsOutbound is not true and vt.beneficiaryregid is null and vt.createddate between '2019-01-01 00:00:00' and '2023-12-31 23:59:59' and vt.calltypeid is not null 
group by 1,2,3;


select date_format(vt.createddate,'%Y%m%d')  As Period , 'NA' AS Call_Status , date(vt.createddate) As Createddate, m.CallGroupType, m.CallType, 
count(distinct vt.bencallid) As Call_Count from db_iemr.t_bencall_vtbl vt
inner join db_iemr.m_calltype m on m.CallTypeID = vt.CallTypeID
where vt.IsOutbound is not true and vt.beneficiaryregid is null 
and vt.createddate between '2019-01-01 00:00:00' and '2023-12-31 23:59:59' and 
vt.calltypeid is not null 
group by 1,2,3;

select date_format(vt.createddate,'%Y%m%d')  As isoPeriod, m.CallGroupType,
m.CallType, 'NA' AS Call_Status, count(distinct vt.bencallid) As Call_Count 
from db_iemr.t_bencall_vtbl vt
inner join db_iemr.m_calltype m on m.CallTypeID = vt.CallTypeID
where vt.IsOutbound is not true and vt.beneficiaryregid is null 
and vt.createddate between '2019-01-01 00:00:00' and '2023-12-31 23:59:59' and 
vt.calltypeid is not null group by 1,2,3;