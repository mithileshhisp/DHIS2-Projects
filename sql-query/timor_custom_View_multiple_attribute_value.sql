CREATE OR REPLACE VIEW public.referral_list
AS SELECT t.uid AS instance,
    uic.value AS "UIC",
    name.value AS "Name",
    age.value AS "Age (in years)",
    t.created AS date,
    score.value AS "Vulnerability Score",
    household.value AS "Type of Registration",
    o.organisationunitid,
    pp.uid AS prguid,
    o.uid AS orguid
   FROM trackedentityinstance t
     JOIN programinstance p ON t.trackedentityinstanceid = p.trackedentityinstanceid AND p.programid = 73132
     JOIN trackedentityattributevalue score ON t.trackedentityinstanceid = score.trackedentityinstanceid AND score.trackedentityattributeid = 89333 
     AND score.value::integer >= 4
     JOIN trackedentityattributevalue household ON t.trackedentityinstanceid = household.trackedentityinstanceid 
     AND household.trackedentityattributeid = 89344 AND household.value::text <> 'Household'::text
     LEFT JOIN trackedentityattributevalue uic ON t.trackedentityinstanceid = uic.trackedentityinstanceid 
     AND uic.trackedentityattributeid = 89298
     LEFT JOIN trackedentityattributevalue name ON t.trackedentityinstanceid = name.trackedentityinstanceid 
     AND name.trackedentityattributeid = 89337
     LEFT JOIN trackedentityattributevalue age ON t.trackedentityinstanceid = age.trackedentityinstanceid 
     AND age.trackedentityattributeid = 89311
     JOIN program pp ON p.programid = pp.programid
     JOIN organisationunit o ON o.organisationunitid = t.organisationunitid;