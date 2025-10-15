-- female list based on age between count

SELECT
  org.name AS orgUnit,
  teav2.value AS gender,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) BETWEEN 16 AND 18
  ) AS age_16_18,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) > 18
      AND EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) <= 40
  ) AS age_18_40,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) > 40
      AND EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) <= 60
  ) AS age_40_60,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) > 60
  ) AS age_above_60,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) >= 16
  ) AS total_16_plus
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei
  ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav2
  ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
  AND teav2.trackedentityattributeid = 139 -- Gender attribute
INNER JOIN programinstance pi
  ON pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org
  ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg
  ON prg.programid = pi.programid
WHERE teav1.trackedentityattributeid = 138 -- Date of Birth
  AND prg.uid = 'TcaMMqHJxK5'
  AND teav2.value = 'Female'
GROUP BY org.name, teav2.value
ORDER BY org.name;










-- with total count based on age gender orgunit total 
SELECT
  COALESCE(org.name, 'All Org Units') AS orgUnit,
  COALESCE(teav2.value, 'Total') AS gender,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) BETWEEN 16 AND 18
  ) AS age_16_18,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) > 18
      AND EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) <= 40
  ) AS age_18_40,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) > 40
      AND EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) <= 60
  ) AS age_40_60,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) > 60
  ) AS age_above_60,
  COUNT(*) FILTER (
    WHERE EXTRACT(YEAR FROM AGE(current_date, teav1.value::date)) >= 16
  ) AS total_16_plus
FROM trackedentityattributevalue teav1
INNER JOIN trackedentityinstance tei
  ON tei.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN trackedentityattributevalue teav2
  ON teav1.trackedentityinstanceid = teav2.trackedentityinstanceid
  AND teav2.trackedentityattributeid = 139 -- Gender attribute
INNER JOIN programinstance pi
  ON pi.trackedentityinstanceid = teav1.trackedentityinstanceid
INNER JOIN organisationunit org
  ON org.organisationunitid = pi.organisationunitid
INNER JOIN program prg
  ON prg.programid = pi.programid
WHERE teav1.trackedentityattributeid = 138 -- Date of Birth
  AND prg.uid = 'TcaMMqHJxK5'
GROUP BY GROUPING SETS (
    (org.name, teav2.value), -- breakdown per gender per org
    (org.name),              -- total per org
    ()                       -- grand total for all orgs
)
ORDER BY 
  GROUPING(org.name),  -- ensures 'All Org Units' comes last
  orgUnit,
  gender;