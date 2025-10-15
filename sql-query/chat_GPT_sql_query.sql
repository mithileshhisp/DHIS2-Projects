
-- PMNP duplicate attributeValue query

SELECT value, COUNT(*) AS duplicate_count
FROM trackedentityattributevalue
GROUP BY value
HAVING COUNT(*) > 1;

SELECT tea_value.*
FROM trackedentityattributevalue tea_value
JOIN (
    SELECT value
    FROM trackedentityattributevalue
    GROUP BY value
    HAVING COUNT(*) > 1
) dup ON tea_value.value = dup.value
where tea_value.trackedentityattributeid = 2002;


SELECT trackedentityinstanceid, value, COUNT(*) AS duplicate_count
FROM trackedentityattributevalue

where trackedentityattributeid = 2002
GROUP BY trackedentityinstanceid, value
HAVING COUNT(*) > 1;








-- event datavalue and attribute value query 


SELECT tei.uid AS teiUID,tei.trackedentityinstanceid AS tei_id,
psi.uid AS eventUID, psi.executiondate::date AS event_date,
psi.created AS created_date,org.code AS orgUnitCode,org.name AS orgUnitName, 
interview.value::json ->> 'value' AS interview_result,
approval.value::json ->> 'value' AS approval_status,
teav.value AS house_hold_status, teav.created AS teav_created_date
FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'K2ySLF5Qnri'
) interview ON TRUE

-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'JzxYzLgo0P9'
) approval ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

-- Filtered TEA join
INNER JOIN trackedentityattributevalue teav 
       ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
      AND teav.trackedentityattributeid = 598541
      AND teav.value IN ('Pending','Submitted','Ongoing')

WHERE prg.uid = 'oSNoNtcmLXL' AND ps.uid = 'pzQalCsjr9F'
AND interview.value::json ->> 'value' = 'Completed'
AND approval.value::json ->> 'value' = 'Approved'

ORDER BY psi.executiondate::date DESC;






-- 2 event datavalue 
SELECT 
    
    psi.uid AS eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date AS event_date,

    interview.value::json ->> 'value' AS interview_date,
    int_id.value::json ->> 'value' AS interview_id
    

FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'oUi6zQUzT2S'
) interview ON TRUE

-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) int_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

where executiondate::date = '2025-03-01';


-- single event_dataValue

SELECT 
    
    psi.uid AS eventUID, 
    org.uid AS orgUnitUID,
    org.name AS orgUnitName, 
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date AS event_date,

    --interview.value::json ->> 'value' AS interview_date,
    int_id.value::json ->> 'value' AS interview_id
    

FROM programstageinstance psi

-- Extract interview_result



-- Extract approval_status
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) int_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

where psi.executiondate::date = '2025-03-01';




-- 2 dataElement event data value

SELECT  psi.uid AS eventUID, psi.executiondate::date AS event_date,
interview.value::json ->> 'value' AS interview_date,
int_id.value::json ->> 'value' AS interview_id

FROM programstageinstance psi

-- Extract interview_result
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'oUi6zQUzT2S'
) interview ON TRUE

-- Extract interview ID
INNER JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'RND5auPDknz'
) int_id ON TRUE

-- Program hierarchy
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
--INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
--INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid

where executiondate::date = '2025-03-01' and ps.uid = 'KR9p7PHH0DV'



SELECT 
    
    psi.uid AS eventUID,
    org.uid AS orgUnitUID,
    org.name AS orgUnitName,
    --de1.name AS de_name,
    prg.name AS prg_name,
    ps.name AS stage_name,
    psi.executiondate::date,
    (psi.eventdatavalues::json -> 'RND5auPDknz' ->> 'value') AS de_value
FROM programstageinstance psi
INNER JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
INNER JOIN organisationunit org ON org.organisationunitid = psi.organisationunitid
INNER JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN program prg ON prg.programid = pi.programid
INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
--INNER JOIN dataelement de1 ON de1.uid = 'lsdeQnuiFDT'
WHERE 
ORDER BY psi.executiondate::date DESC;


--- 16/09/2025

-- multiple attribute value query

SELECT 
    org.name AS org_name, 
    pi.enrollmentdate::date AS enrollment_date, 
    tei.uid AS tei_uid,
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid
WHERE prg.uid = 'VVLirjoOGbj' 
  AND org.path LIKE '%ItexOpdNKmR%'
GROUP BY org.name, pi.enrollmentdate, tei.uid;

-- 09/10/2025 for SOUNDEX algorithms
-- multiple attribute value query
-- Each loop, it get Firstname + Middlename + LastName + ExtName and generate soundexCode 
-- then add result into new attr called HHM Soundex Name (mDdoqGKJDOU)

SELECT 
    tei.trackedentityinstanceid AS trackedentityinstanceid,
    tei.uid AS tei_uid,
    
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS first_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS middle_name,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS last_name,
    MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS extension_name,

    
FROM trackedentityinstance tei
INNER JOIN organisationunit org 
    ON org.organisationunitid = tei.organisationunitid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid

WHERE tei.trackedentitytypeid = 6126 
  AND org.path LIKE '%ItexOpdNKmR%'

GROUP BY 
    tei.trackedentityinstanceid, 
    tei.uid;

-- 
SELECT 
    tei.trackedentityinstanceid AS trackedentityinstanceid,
    tei.uid AS tei_uid,
    
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN soundex( teav.value ) END) AS first_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN soundex( teav.value ) END) AS middle_name,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN soundex( teav.value ) END) AS last_name,
    MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN soundex( teav.value ) END) AS extension_name
    
FROM trackedentityinstance tei
INNER JOIN organisationunit org 
    ON org.organisationunitid = tei.organisationunitid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid

WHERE tei.trackedentitytypeid = 6126 
  AND org.path LIKE '%ItexOpdNKmR%'

GROUP BY 
    tei.trackedentityinstanceid, 
    tei.uid;


---

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    sub.extension_name,
    soundex(CONCAT(sub.first_name, sub.middle_name, sub.last_name)) AS full_name_soundex
FROM (
    SELECT 
        tei.trackedentityinstanceid AS trackedentityinstanceid,
        tei.uid AS tei_uid,
        
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS first_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS middle_name,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS last_name,
        MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid

    WHERE tei.trackedentitytypeid = 6126 
      AND org.path LIKE '%ItexOpdNKmR%'

    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub;


--

    SELECT 
        tei.trackedentityinstanceid AS trackedentityinstanceid,
        tei.uid AS tei_uid,
        
        soundex(CONCAT(
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END),
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END),
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END)
	)) AS full_name_soundex
    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid

    WHERE tei.trackedentitytypeid = 6126 
      AND org.path LIKE '%ItexOpdNKmR%'

    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid;



-- final soundex code generation query

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    sub.extension_name,
    CONCAT(soundex(sub.first_name), soundex(sub.middle_name), soundex(sub.last_name),soundex(sub.extension_name)) AS full_name_soundex,
	length(CONCAT(soundex(sub.first_name), soundex(sub.middle_name), soundex(sub.last_name),soundex(sub.extension_name))) AS code_len
FROM (
    SELECT 
        tei.trackedentityinstanceid AS trackedentityinstanceid,
        tei.uid AS tei_uid,
        
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS first_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS middle_name,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS last_name,
        MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid

    WHERE tei.trackedentitytypeid = 6126 
      AND org.path LIKE '%ItexOpdNKmR%'

    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub;

-- final soundex code generation query with extension_name null

-- Enable soundex support
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    --sub.extension_name,
	sub.extension_name_temp,
    CONCAT(
        soundex(sub.first_name),
        soundex(sub.middle_name),
        soundex(sub.last_name),
        CASE 
            WHEN sub.extension_name = '0000' THEN '0000'
            ELSE soundex(sub.extension_name)
        END
    ) AS full_name_soundex,
    LENGTH(
        CONCAT(
            soundex(sub.first_name),
            soundex(sub.middle_name),
            soundex(sub.last_name),
            CASE 
                WHEN sub.extension_name = '0000' THEN '0000'
                ELSE soundex(sub.extension_name)
            END
        )
    ) AS code_len
FROM (
    SELECT 
        tei.trackedentityinstanceid AS trackedentityinstanceid,
        tei.uid AS tei_uid,
        
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS first_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS middle_name,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS last_name,
		MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END) AS extension_name_temp,
        
        -- If extension name is null, assign literal '0000'
        COALESCE(
            MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END),
            '0000'
        ) AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid

    WHERE tei.trackedentitytypeid = 6126 
      AND org.path LIKE '%ItexOpdNKmR%'

    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub;




--  for soundex code generation add EXTENSION
SELECT soundex('mithilesh');

CREATE EXTENSION fuzzystrmatch SCHEMA public;

-- 
-- final soundex code generation query with extension_name null

-- Enable soundex support
-- 14/10/2025
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    sub.extension_name,

    CONCAT(
        soundex(sub.first_name),
        soundex(sub.middle_name),
        soundex(sub.last_name),
        soundex(sub.extension_name)
    ) AS soundex_temp,

    CONCAT(
        CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
        CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
        CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
        CASE WHEN sub.extension_name = '00' THEN '00' ELSE soundex(sub.extension_name) END
    ) AS full_name_soundex,

    LENGTH(
        CONCAT(
            CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
            CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
            CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
            CASE WHEN sub.extension_name = '00' THEN '00' ELSE soundex(sub.extension_name) END
        )
    ) AS code_len

FROM (
    SELECT 
        tei.trackedentityinstanceid,
        tei.uid AS tei_uid,

        COALESCE(MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS first_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS middle_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS last_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '00') AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE 
        tei.trackedentitytypeid = 6126 
        AND org.path LIKE '%g6OKJ39e5pV%'
    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub;


-- final query with extension name 14 digits code and first name not null

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

SELECT 
    sub.trackedentityinstanceid,
    sub.tei_uid,
    sub.first_name,
    sub.middle_name,
    sub.last_name,
    sub.extension_name,

    CONCAT(
        CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
        CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
        CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
        CASE 
            WHEN sub.extension_name = 'Sr' THEN 'SR' 
            WHEN sub.extension_name = 'Jr' THEN 'JR'
            WHEN sub.extension_name = 'I' THEN '01'
            WHEN sub.extension_name = 'II' THEN '02'
            WHEN sub.extension_name = 'III' THEN '03'
            WHEN sub.extension_name = 'IV' THEN '04'
            WHEN sub.extension_name = 'V' THEN '05'
            WHEN sub.extension_name = '00' THEN '00'
        END
    ) AS full_name_soundex,

    LENGTH(
        CONCAT(
            CASE WHEN sub.first_name = '0000' THEN '0000' ELSE soundex(sub.first_name) END,
            CASE WHEN sub.middle_name = '0000' THEN '0000' ELSE soundex(sub.middle_name) END,
            CASE WHEN sub.last_name = '0000' THEN '0000' ELSE soundex(sub.last_name) END,
            CASE 
                WHEN sub.extension_name = 'Sr' THEN 'SR' 
                WHEN sub.extension_name = 'Jr' THEN 'JR'
                WHEN sub.extension_name = 'I' THEN '01'
                WHEN sub.extension_name = 'II' THEN '02'
                WHEN sub.extension_name = 'III' THEN '03'
                WHEN sub.extension_name = 'IV' THEN '04'
                WHEN sub.extension_name = 'V' THEN '05'
                WHEN sub.extension_name = '00' THEN '00'
            END
        )
    ) AS code_len

FROM (
    SELECT 
        tei.trackedentityinstanceid,
        tei.uid AS tei_uid,

        COALESCE(MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS first_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS middle_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN UPPER(SUBSTRING(teav.value FROM 1 FOR 4)) END), '0000') AS last_name,
        COALESCE(MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN teav.value END), '00') AS extension_name

    FROM trackedentityinstance tei
    INNER JOIN organisationunit org 
        ON org.organisationunitid = tei.organisationunitid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE 
        tei.trackedentitytypeid = 6126 
        AND org.path LIKE '%spXTh9hs5dz%'
    GROUP BY 
        tei.trackedentityinstanceid, 
        tei.uid
) AS sub
WHERE sub.first_name IS NOT NULL 
  AND sub.first_name <> ''
  AND sub.first_name <> '0000';


-- 15/10/2025
---Your SQL query is valid and logically consistent — it’s selecting tracked entity instances (TEIs) and their corresponding events (psi.uid) 
-- under specific DHIS2 programs and stages, 
--but only for TEIs that don’t have a value for a particular attribute (trackedentityattributeid = 2004).
-- list of TEI and its events which has no first name attribute value
SELECT 
    tei.uid AS tei_uid,
    psi.uid AS event_uid
FROM trackedentityinstance tei
JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
JOIN program prg ON prg.programid = pi.programid
JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
JOIN programstage ps ON ps.programstageid = psi.programstageid
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    AND teav.trackedentityattributeid = 2004
WHERE prg.uid = 'VVLirjoOGbj'
  AND ps.uid = 'LRJrFeDNEdT'
  AND tei.trackedentitytypeid = 6126
  AND teav.trackedentityattributevalueid IS NULL;  
  
  
-- delete tei with limit
DELETE FROM trackedentityinstance
WHERE ctid IN (
  SELECT ctid
  FROM trackedentityinstance
  WHERE deleted = 'true'
  LIMIT 10000
);  

















-- final query for attribute value and dataelement value

SELECT 
    parent_org.name AS parent_name, 
    org.name AS org_name, 
    pi.enrollmentdate::date AS enrollment_date, 
    tei.uid AS tei_uid,

    -- TE attributes (pivoted)
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    -- Event DEs
    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum,
	CASE 
    	WHEN HHM_Postpartum_de.value::json ->> 'value' = 'true' THEN 'Yes'
    	WHEN HHM_Postpartum_de.value::json ->> 'value' = 'false' THEN 'No'
    	ELSE NULL
	END AS HHM_Postpartum_final

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN organisationunit parent_org 
    ON parent_org.organisationunitid = org.parentid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid

-- TE attributes once
LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid

-- Event DEs (LEFT JOIN so missing values don’t drop rows)
LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE '%mkvLp2ySTPb%'
GROUP BY parent_org.name, org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;





--- with condition true false to yes no

SELECT 
    
    org.name AS org_name, 
   
   
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    --HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum,

	CASE 
    	WHEN HHM_Postpartum_de.value::json ->> 'value' = 'true' THEN 'Yes'
    	WHEN HHM_Postpartum_de.value::json ->> 'value' = 'false' THEN 'No'
    	ELSE NULL
	END AS HHM_Postpartum

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid

INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid


LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid


LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE '%mkvLp2ySTPb%'
GROUP BY org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;


--- final query with out parent

SELECT 
    
    org.name AS org_name, 
   
   
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid

INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid


LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid


LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE '%spXTh9hs5dz%'
GROUP BY org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;
		 
		 
		 
		 
-- indicator calculation 

SELECT 
    org.name AS org_name, 
    COUNT(DISTINCT tei.trackedentityinstanceid) AS tei_count
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'wqR0L5WGV6S'
) Prenatal_care_de ON TRUE
WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT'
  AND org.path LIKE '%DcGhhRsspFX%'
  AND Prenatal_care_de.value::json ->> 'value' = 'true'
GROUP BY org.name;

-- 2nd query

SELECT 
    org.name AS org_name,
    COUNT(*) FILTER (WHERE Prenatal_care_de.value::json ->> 'value' = 'true') AS prenatal_yes,
    COUNT(*) FILTER (WHERE Prenatal_care_de.value::json ->> 'value' = 'false') AS prenatal_no
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'wqR0L5WGV6S'
) Prenatal_care_de ON TRUE
WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT'
  AND org.path LIKE '%spXTh9hs5dz%'
GROUP BY org.name;

--- links sql view for report Municipality wise - Eligible HH list

https://links.hispindia.org/pmnpis_dev/api/sqlViews/NfVH8OoioBF/data?paging=false&var=orgunit:BWxQgke5tHf
https://pmnpis.org.ph/app/api/sqlViews/NfVH8OoioBF/data?paging=false&var=orgunit:BWxQgke5tHf

-- with unique tei_uid take latest event_uid sql query -- sql -- id NfVH8OoioBF

-- Option 2 (latest event per TEI only)?

WITH ranked_events AS (
    SELECT 
        tei.uid AS tei_uid,
        org.name AS org_name,
        psi.uid AS event_uid,
        psi.executiondate,
		psi.status,
        psi.eventdatavalues,

        -- TEA values (same across events for a TEI, so use windowed MAX)
        MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS PMNP_ID,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Last_name,
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS First_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Middle_name,
        MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Sex,
        MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Date_of_Birth,

        ROW_NUMBER() OVER (
            PARTITION BY tei.uid 
            ORDER BY psi.executiondate DESC, psi.created DESC
        ) AS rn

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi 
        ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg 
        ON prg.programid = pi.programid
    INNER JOIN organisationunit org 
        ON org.organisationunitid = pi.organisationunitid
    INNER JOIN programstageinstance psi 
        ON psi.programinstanceid = pi.programinstanceid
    INNER JOIN programstage ps 
        ON ps.programstageid = psi.programstageid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE prg.uid = 'VVLirjoOGbj' 
      AND ps.uid = 'LRJrFeDNEdT' 
     AND org.path LIKE  '%${orgunit}%'
)
SELECT 
    tei_uid,
    org_name,
    event_uid,
    executiondate::date AS event_date,
	status AS event_status,
	

    PMNP_ID, Last_name, First_name, Middle_name, Sex, Date_of_Birth,

    --eventdatavalues::jsonb ->> 'Rb0k4fOdysI' AS Household_Member_Status,
	eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' AS Household_Member_Status,
	eventdatavalues::jsonb -> 'rvv5Hfyczyh' ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    --eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' AS HHM_Pregnancy_status,
    
	CASE 
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '1' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '2' THEN 'No'
		WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '3' THEN 'I don''t know'
	END AS HHM_Pregnancy_status,
	
	--eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' AS HHM_Postpartum,
	

    CASE 
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'true' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'false' THEN 'No'
        ELSE NULL
    END AS HHM_Postpartum

FROM ranked_events
WHERE rn = 1;

-- for going with Option 1: aggregate across all events per TEI. This way you’ll always get one row per TEI, regardless of how many events they have. Event data values are aggregated using MAX() (you could also use MIN() depending on your preference).

-- for going with Option 1 Option 1 (any event values aggregated per TEI)


-- final query as on  18/09/2025 for option code to option name and male/female
WITH ranked_events AS (
    SELECT 
        tei.uid AS tei_uid,
        org.name AS org_name,
        psi.uid AS event_uid,
        psi.executiondate,
        psi.status,
        psi.eventdatavalues,

        -- TEA values (same across events for a TEI, so use windowed MAX)
        MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS PMNP_ID,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Last_name,
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS First_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Middle_name,
        MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Sex_Code,   -- store raw code here

        MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Date_of_Birth,

        ROW_NUMBER() OVER (
            PARTITION BY tei.uid 
            ORDER BY psi.executiondate DESC, psi.created DESC
        ) AS rn

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi 
        ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg 
        ON prg.programid = pi.programid
    INNER JOIN organisationunit org 
        ON org.organisationunitid = pi.organisationunitid
    INNER JOIN programstageinstance psi 
        ON psi.programinstanceid = pi.programinstanceid
    INNER JOIN programstage ps 
        ON ps.programstageid = psi.programstageid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE prg.uid = 'VVLirjoOGbj' 
      AND ps.uid = 'LRJrFeDNEdT' 
      AND org.path LIKE '%BWxQgke5tHf%' 
)
SELECT 
    tei_uid,
    org_name,
    event_uid,
    executiondate::date AS event_date,
    status AS event_status,

    PMNP_ID, Last_name, First_name, Middle_name,
    
    CASE 
        WHEN Sex_Code = '1' THEN 'Female'
        WHEN Sex_Code = '2' THEN 'Male'
        --WHEN Sex_Code = '3' THEN 'Other'
        ELSE NULL
    END AS Sex,

    Date_of_Birth,

    --eventdatavalues::jsonb ->> 'Rb0k4fOdysI' AS Household_Member_Status,

	
	--eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' AS Household_Member_Status,

	CASE 
        WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '000' THEN 'Currently part of the household'
        WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '001' THEN 'Deceased'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '002' THEN 'Not part of the household'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '003' THEN 'Formed a new household'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '004' THEN 'Migrated to non PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '005' THEN 'Migrated to PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '006' THEN 'Migrated from non PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '007' THEN 'Migrated from other PMNP area'
		WHEN eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' = '008' THEN 'Duplicate'
	END AS household_member_status,

	eventdatavalues::jsonb -> 'rvv5Hfyczyh' ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    --eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' AS HHM_Pregnancy_status,

	CASE 
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '1' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '2' THEN 'No'
		WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '3' THEN 'I don''t know'
	END AS HHM_Pregnancy_status,
	
	--eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' AS HHM_Postpartum,
	
    CASE 
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'true' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'false' THEN 'No'
        ELSE NULL
    END AS HHM_Postpartum,
	
    eventdatavalues::jsonb -> 'Hc9Vgt4LXjb' ->> 'value' AS Age_in_years,
    eventdatavalues::jsonb -> 'RoSxLAB5cfo' ->> 'value' AS Age_in_months,
    eventdatavalues::jsonb -> 'Gds5wTiXoSK' ->> 'value' AS Age_in_weeks,
	eventdatavalues::jsonb -> 'ICbJBQoOsVt' ->> 'value' AS Age_in_days

FROM ranked_events
WHERE rn = 1;


-- second query

WITH ranked_events AS (
    SELECT 
        tei.uid AS tei_uid,
        org.name AS org_name,
        psi.uid AS event_uid,
        psi.executiondate,
		psi.status,
        psi.eventdatavalues,

        -- TEA values (same across events for a TEI, so use windowed MAX)
        MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS PMNP_ID,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Last_name,
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS First_name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Middle_name,
        MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Sex,
        MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) 
            OVER (PARTITION BY tei.uid) AS Date_of_Birth,

        ROW_NUMBER() OVER (
            PARTITION BY tei.uid 
            ORDER BY psi.executiondate DESC, psi.created DESC
        ) AS rn

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi 
        ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg 
        ON prg.programid = pi.programid
    INNER JOIN organisationunit org 
        ON org.organisationunitid = pi.organisationunitid
    INNER JOIN programstageinstance psi 
        ON psi.programinstanceid = pi.programinstanceid
    INNER JOIN programstage ps 
        ON ps.programstageid = psi.programstageid
    LEFT JOIN trackedentityattributevalue teav 
        ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea 
        ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE prg.uid = 'VVLirjoOGbj' 
      AND ps.uid = 'LRJrFeDNEdT' 
      AND org.path LIKE '%BWxQgke5tHf%' 
)
SELECT 
    tei_uid,
    org_name,
    event_uid,
    executiondate::date AS event_date,
	status AS event_status,
	

    PMNP_ID, Last_name, First_name, Middle_name, Sex, Date_of_Birth,

    --eventdatavalues::jsonb ->> 'Rb0k4fOdysI' AS Household_Member_Status,
	eventdatavalues::jsonb -> 'Rb0k4fOdysI' ->> 'value' AS Household_Member_Status,
	eventdatavalues::jsonb -> 'rvv5Hfyczyh' ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    --eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' AS HHM_Pregnancy_status,
    
	CASE 
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '1' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '2' THEN 'No'
		WHEN eventdatavalues::jsonb -> 'ycBIHr9bYyw' ->> 'value' = '3' THEN 'I don''t know'
	END AS HHM_Pregnancy_status,
	
	--eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' AS HHM_Postpartum,
	

    CASE 
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'true' THEN 'Yes'
        WHEN eventdatavalues::jsonb -> 'se8TXlLUzh8' ->> 'value' = 'false' THEN 'No'
        ELSE NULL
    END AS HHM_Postpartum

FROM ranked_events
WHERE rn = 1;











-- with duplicate tei_uid multiple events uid sql query -- sql -- id NfVH8OoioBF 

SELECT org.name AS org_name, 
    MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
    MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
    MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
    MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
    MAX(CASE WHEN tea.uid = 'Qt4YSwPxw0X' THEN teav.value END) AS Sex,
    MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

    hh_member_status_de.value::json ->> 'value' AS Household_Member_Status,
    hhm_Date_of_Delivery_de.value::json ->> 'value' AS HHM_Date_of_Delivery_Postpartum,
    HHM_Pregnancy_status_de.value::json ->> 'value' AS HHM_Pregnancy_status,
    HHM_Postpartum_de.value::json ->> 'value' AS HHM_Postpartum

FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid

INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid


LEFT JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
LEFT JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid


LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Rb0k4fOdysI'
) hh_member_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'rvv5Hfyczyh'
) hhm_Date_of_Delivery_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'ycBIHr9bYyw'
) HHM_Pregnancy_status_de ON TRUE

LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'se8TXlLUzh8'
) HHM_Postpartum_de ON TRUE

WHERE prg.uid = 'VVLirjoOGbj' 
  AND ps.uid = 'LRJrFeDNEdT' 
  AND org.path LIKE  '%${orgunit}%'
GROUP BY org.name, pi.enrollmentdate, tei.uid, 
         hh_member_status_de.value, hhm_Date_of_Delivery_de.value, 
         HHM_Pregnancy_status_de.value, HHM_Postpartum_de.value;
		 
		 
-- PMNP indicators calculation 22/09/2025

-- 1) indicators -- Age Appropriate Immunization -- qyGMqtUeUBz

SELECT 
    org.name AS org_name,org.uid AS org_uid, -- psi.executiondate::date,
    COUNT(*) FILTER (WHERE Prenatal_care_de.value::json ->> 'value' = '1') AS tei_count
    
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
LEFT JOIN LATERAL (
    SELECT value 
    FROM json_each_text(psi.eventdatavalues::json) 
    WHERE key = 'Kl5LLsA10rk'
) Prenatal_care_de ON TRUE
WHERE prg.uid = 'oSNoNtcmLXL' 
  AND ps.uid = 'gKsusTMmABW'
  and psi.executiondate::date between '2025-09-01' and '2025-12-31'
  --AND org.path LIKE '%spXTh9hs5dz%'
GROUP BY org.name, org.uid --, psi.executiondate::date;


-- 2) indicators -- Attendance to FDS/SBCC Session on Health and Nutrition -- Uh7vWH7yf7y

SELECT 
    org.name AS org_name,
    org.uid  AS org_uid,
    
    COUNT(*) FILTER (
        WHERE 
            (psi.eventdatavalues::json -> 'dxag8YT8w46' ->> 'value' = '1')
        AND (
            psi.eventdatavalues::json -> 'yZXpvusfhSC' ->> 'value' = '1'
            OR psi.eventdatavalues::json -> 'LNTl0FjkMaD' ->> 'value' = '1'
            OR psi.eventdatavalues::json -> 'Ud7pdtnOz0p' ->> 'value' = '1'
        )
        AND tea.uid = 'CNqaoQva9S2'
        AND teav.value = 'Approved'
    ) AS tei_count
    
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
INNER JOIN programstage ps 
    ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid	

WHERE prg.uid = 'oSNoNtcmLXL' 
  AND ps.uid = 'gKsusTMmABW'
  AND psi.executiondate::date BETWEEN '2025-09-01' AND '2025-12-31'
  --AND org.path LIKE '%spXTh9hs5dz%'
GROUP BY org.name, org.uid;


-- 2nd query -- indicators -- Attendance to FDS/SBCC Session on Health and Nutrition -- Uh7vWH7yf7y

SELECT 
    org.name AS org_name,
    org.uid  AS org_uid,

    COUNT(DISTINCT tei.uid) FILTER (
        WHERE 
            (psi.eventdatavalues::json -> 'dxag8YT8w46' ->> 'value' = 'true')
        AND (
            psi.eventdatavalues::json -> 'yZXpvusfhSC' ->> 'value' = 'true'
            OR psi.eventdatavalues::json -> 'LNTl0FjkMaD' ->> 'value' = 'true'
            OR psi.eventdatavalues::json -> 'Ud7pdtnOz0p' ->> 'value' = 'true'
        )
        AND tea.uid = 'CNqaoQva9S2'
        AND teav.value = 'Approved'
    ) AS tei_count
    
FROM trackedentityinstance tei
INNER JOIN programinstance pi 
    ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
--INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
INNER JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid	

WHERE prg.uid = 'oSNoNtcmLXL' 
--AND ps.uid = 'gKsusTMmABW'
  AND psi.executiondate::date BETWEEN '2025-07-01' AND '2025-09-30'
  --AND org.path LIKE '%spXTh9hs5dz%'
  --AND org.uid = 'mkvLp2ySTPb';
 GROUP BY org.name, org.uid;
		 
--- 
SELECT 
    org.name AS org_name,
    org.uid  AS org_uid,

    COUNT(DISTINCT pi.trackedentityinstanceid) FILTER (
        WHERE 
            (psi.eventdatavalues::json -> 'dxag8YT8w46' ->> 'value' = 'true')
        AND (
            psi.eventdatavalues::json -> 'yZXpvusfhSC' ->> 'value' = 'true'
            OR psi.eventdatavalues::json -> 'LNTl0FjkMaD' ->> 'value' = 'true'
            OR psi.eventdatavalues::json -> 'Ud7pdtnOz0p' ->> 'value' = 'true'
        )
        AND tea.uid = 'CNqaoQva9S2'
        AND teav.value = 'Approved'
    ) AS tei_count
    
--FROM trackedentityinstance tei
FROM programinstance pi 

INNER JOIN program prg 
    ON prg.programid = pi.programid
INNER JOIN organisationunit org 
    ON org.organisationunitid = pi.organisationunitid
INNER JOIN programstageinstance psi 
    ON psi.programinstanceid = pi.programinstanceid
--INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
INNER JOIN trackedentityattributevalue teav 
    ON teav.trackedentityinstanceid = pi.trackedentityinstanceid
INNER JOIN trackedentityattribute tea 
    ON tea.trackedentityattributeid = teav.trackedentityattributeid	

WHERE prg.uid = 'oSNoNtcmLXL' 
--AND ps.uid = 'gKsusTMmABW'
  AND psi.executiondate::date BETWEEN '2025-07-01' AND '2025-09-30'
  AND org.path LIKE '%spXTh9hs5dz%'
  --AND org.uid = 'mkvLp2ySTPb'
 GROUP BY org.name, org.uid;		 
		 
		 
--- from production

WITH household AS (
    SELECT 
        tei.uid AS tei_uid,
        MAX(org.organisationunitid) AS org_unit_id,
        MAX(teav.value) FILTER (WHERE tea.uid = 'IKOSsYJJZis') AS Household_ID,
        COALESCE(
            MAX(psi.eventdatavalues::json -> 'oUi6zQUzT2S' ->> 'value'),
            MAX(teav.value) FILTER (WHERE tea.uid = 'oUi6zQUzT2S')
        ) AS INT_Interview_date,
        COALESCE(
            MAX(psi.eventdatavalues::json -> 'K2ySLF5Qnri' ->> 'value'),
            MAX(teav.value) FILTER (WHERE tea.uid = 'K2ySLF5Qnri')
        ) AS INT_Interview_result,
        MAX(teav.value) FILTER (WHERE tea.uid = 'CNqaoQva9S2') AS HH_Status,
        MAX(psi.eventdatavalues::json -> 'JzxYzLgo0P9' ->> 'value') AS Approval_Status,
        MAX(teav.value) FILTER (WHERE tea.uid = 'J2KmQw53CRl') AS Sitio_Purok,
        MAX(teav.value) FILTER (WHERE tea.uid = 'HYNM3CJYLje') AS Street_Address,
        CASE
            WHEN MAX(teav.value) FILTER (WHERE tea.uid = 'CNqaoQva9S2') = 'Approved' THEN 'Approved'
            ELSE
                CASE
                    WHEN MAX(psi.eventdatavalues::json -> 'JzxYzLgo0P9' ->> 'value') = 'Approved' THEN 'Approved'
                    ELSE NULL
                END
        END AS HH_Approved

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg ON prg.programid = pi.programid
    INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
    LEFT JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
    LEFT JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
    WHERE prg.uid = 'oSNoNtcmLXL' 
        AND org.path LIKE '%F5ZXHcmBIJa%' 
    GROUP BY tei.uid
),

member AS (
    SELECT 
         tei.uid AS tei_uid,
         parent_org.name AS parent_name, 
        org.name AS org_name, 
        org.organisationunitid AS org_unit_id,
        pi.enrollmentdate::date AS enrollment_date, 

        MAX(CASE WHEN tea.uid = 'NOKzq4dAKF7' THEN teav.value END) AS PMNP_ID,
        MAX(CASE WHEN tea.uid = 'IENWcinF8lM' THEN teav.value END) AS Last_name,
        MAX(CASE WHEN tea.uid = 'PIGLwIaw0wy' THEN teav.value END) AS First_name,
        MAX(CASE WHEN tea.uid = 'nyVsU3fTk2b' THEN teav.value END) AS Extension_Name,
        MAX(CASE WHEN tea.uid = 'WC0cShCpae8' THEN teav.value END) AS Middle_name,
        
        CASE
            WHEN MAX(teav.value) FILTER (WHERE tea.uid = 'Qt4YSwPxw0X') = '1' THEN 'F'
            WHEN MAX(teav.value) FILTER (WHERE tea.uid = 'Qt4YSwPxw0X') = '2' THEN 'M'
        END AS Sex,

        MAX(CASE WHEN tea.uid = 'fJPZFs2yYJQ' THEN teav.value END) AS Date_of_Birth,

        CASE MAX(psi.eventdatavalues::json -> 'Rb0k4fOdysI' ->> 'value')
            WHEN '000' THEN 'Currently part of the household'
            WHEN '001' THEN 'Deceased'
            WHEN '002' THEN 'Not part of the household'
            WHEN '003' THEN 'Formed a new household'
            WHEN '004' THEN 'Migrated to non PMNP area'
            WHEN '005' THEN 'Migrated to PMNP area'
            WHEN '006' THEN 'Migrated from non PMNP area'
            WHEN '007' THEN 'Migrated from other PMNP area'
            WHEN '008' THEN 'Duplicate'
        END AS Household_Member_Status,

        MAX(psi.eventdatavalues::json -> 'rvv5Hfyczyh' ->> 'value') AS HHM_Date_of_Delivery_Postpartum,

        CASE MAX(psi.eventdatavalues::json -> 'ycBIHr9bYyw' ->> 'value')
            WHEN '1' THEN 'Yes'
            WHEN '2' THEN 'No'
            WHEN '3' THEN 'I don''t know'
        END AS HHM_Pregnancy_status,

        CASE MAX(psi.eventdatavalues::json -> 'se8TXlLUzh8' ->> 'value')
            WHEN 'true' THEN 'Yes'
            WHEN 'false' THEN 'No'
        END AS HHM_Postpartum,

        EXTRACT(YEAR FROM AGE(MAX(psi.executiondate)::date, MAX(teav.value) FILTER (WHERE tea.uid = 'fJPZFs2yYJQ')::date))::integer AS Recomputed_Age_in_years,
        (EXTRACT(YEAR FROM AGE(MAX(psi.executiondate)::date, MAX(teav.value) FILTER (WHERE tea.uid = 'fJPZFs2yYJQ')::date)) * 12 + 
         EXTRACT(MONTH FROM AGE(MAX(psi.executiondate)::date, MAX(teav.value) FILTER (WHERE tea.uid = 'fJPZFs2yYJQ')::date)))::integer AS Recomputed_Age_in_months,
        (MAX(psi.executiondate)::date - MAX(teav.value) FILTER (WHERE tea.uid = 'fJPZFs2yYJQ')::date)::integer AS Recomputed_Age_in_days,
        FLOOR((MAX(psi.executiondate)::date - MAX(teav.value) FILTER (WHERE tea.uid = 'fJPZFs2yYJQ')::date) / 7)::integer AS Recomputed_Age_in_weeks,


        MAX(psi.executiondate)::date AS Event_Date,
        MAX(psi.status) AS Event_Status

    FROM trackedentityinstance tei
    INNER JOIN programinstance pi ON pi.trackedentityinstanceid = tei.trackedentityinstanceid
    INNER JOIN program prg ON prg.programid = pi.programid
    INNER JOIN organisationunit org ON org.organisationunitid = pi.organisationunitid
    INNER JOIN organisationunit parent_org ON parent_org.organisationunitid = org.parentid
    INNER JOIN programstageinstance psi ON psi.programinstanceid = pi.programinstanceid
    INNER JOIN programstage ps ON ps.programstageid = psi.programstageid
    LEFT JOIN trackedentityattributevalue teav ON teav.trackedentityinstanceid = tei.trackedentityinstanceid
    LEFT JOIN trackedentityattribute tea ON tea.trackedentityattributeid = teav.trackedentityattributeid
    WHERE prg.uid = 'VVLirjoOGbj' 
      AND ps.uid = 'LRJrFeDNEdT' 
      AND org.path LIKE '%F5ZXHcmBIJa%' 
  
      AND psi.eventdatavalues::json -> 'Rb0k4fOdysI' ->> 'value' = '000'
      AND psi.status = 'COMPLETED'   
    GROUP BY parent_org.name, org.name, org.organisationunitid, pi.enrollmentdate, tei.uid, psi.executiondate, psi.created
),

ranked_member AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY 
                COALESCE(PMNP_ID, First_name || Last_name || Date_of_Birth)
            ORDER BY 
                Event_Date DESC, 
                enrollment_date DESC
        ) as rn
    FROM member
),

org_unit as
(
    SELECT
        MAX(org.organisationunitid) AS org_unit_id,
        org.namelevel2 as regParent,
        org.namelevel3 as provParent,
        org.namelevel4 as munParent
    FROM _orgunitstructure org
    GROUP BY org.namelevel2, org.namelevel3, org.namelevel4, org.organisationunitid
)

SELECT 
    ou.regParent,
    ou.provParent,
    ou.munParent,
    m.org_name,
    m.enrollment_date,
    hh.Household_ID,
    hh.INT_Interview_date,
    m.PMNP_ID,
    UPPER(m.Last_name) AS Last_name,
    UPPER(m.First_name) AS First_name,
    UPPER(m.Middle_name) AS Middle_name,
    UPPER(m.Extension_Name) AS Extension_Name,
    UPPER(hh.Sitio_Purok) AS Sitio_Purok,
    UPPER(hh.Street_Address) AS Street_Address,
    m.Sex,
    (m.Date_of_Birth::timestamp)::date AS Date_of_Birth,
    m.Household_Member_Status,    
    m.HHM_Pregnancy_status,
    m.HHM_Postpartum,
    (m.HHM_Date_of_Delivery_Postpartum::timestamp)::date AS Date_of_Delivery_Postpartum,
    -- Computation: Days between Date of Delivery and Interview Date
    (hh.INT_Interview_date::date - m.HHM_Date_of_Delivery_Postpartum::date) AS Days_Postpartum,
    m.Recomputed_Age_in_years AS age_in_years,
    m.Recomputed_Age_in_months AS age_in_months,
    m.Recomputed_Age_in_weeks AS age_in_weeks,
    m.Recomputed_Age_in_days AS age_in_days,
    -- m.Event_Status,
    -- m.Event_Date,
    hh.INT_Interview_result,
    hh.HH_Approved
    
FROM ranked_member m
LEFT JOIN org_unit ou ON ou.org_unit_id = m.org_unit_id
LEFT JOIN household hh
    ON hh.Household_ID = split_part(m.PMNP_ID, '-', 3)
   AND hh.org_unit_id = m.org_unit_id
WHERE 
  hh.HH_Approved= 'Approved'
  AND hh.INT_Interview_result = 'Completed' 
  AND m.rn = 1
  AND (hh.INT_Interview_date between '2025-08-01' and '2025-09-30');		 



-- user_list with multiple_user_roles and orgunit level wise
SELECT ui.userinfoid,
    org.organisationunitid AS org_unit_id,
    ou.uid AS orgunituid,
    ou.code AS psgc,
    ou.name AS orgunitname,
    org.level AS orgunitlevel,
    org.namelevel2 AS region_name,
    org.namelevel3 AS province_name,
    org.namelevel4 AS municipal_name,
    org.namelevel5 AS brgy_name,
    ui.uid AS user_uid,
    ui.username,
    ui.created AS created_at,
    array_agg(DISTINCT urole.name ORDER BY urole.name) AS userrolenames
   FROM (((((userinfo ui
     JOIN userrolemembers usrmem ON ((usrmem.userid = ui.userinfoid)))
     JOIN userrole urole ON ((urole.userroleid = usrmem.userroleid)))
     LEFT JOIN userdatavieworgunits uou ON ((uou.userinfoid = ui.userinfoid)))
     LEFT JOIN _orgunitstructure org ON ((org.organisationunitid = uou.organisationunitid)))
    LEFT JOIN organisationunit ou ON ((ou.organisationunitid = uou.organisationunitid)))
   GROUP BY
       ui.userinfoid,
       org.organisationunitid,
       ou.uid,
       ou.code,
       ou.name,
       org.level,
       org.namelevel2,
       org.namelevel3,
       org.namelevel4,
       org.namelevel5,
       ui.uid,
       ui.username,
       ui.created
   ORDER BY
       org.namelevel2,
       org.namelevel3,
       org.namelevel4,
       org.namelevel5,
       ui.username;


-- read string to CHARACTER

SELECT regexp_split_to_table('hello', '');

SELECT 
    i AS position,
    substring('hello' FROM i FOR 1) AS char
FROM generate_series(1, length('hello')) AS s(i);

SELECT 
    substring('hello' FROM i FOR 1) AS char
	
	SELECT 
    substring('mithilesh kumar thakur' FROM i FOR 1) AS char
FROM generate_series(1, length('mithilesh kumar thakur')) AS s(i);


-- event count

WITH base AS (
  SELECT tei.uid, org.name, COUNT(*) AS event_count
  FROM programstageinstance psi
  JOIN programinstance pi ON pi.programinstanceid = psi.programinstanceid
  JOIN trackedentityinstance tei ON tei.trackedentityinstanceid = pi.trackedentityinstanceid
  JOIN organisationunit org ON org.organisationunitid = tei.organisationunitid
  GROUP BY tei.uid, org.name
)
SELECT * FROM base WHERE event_count > 1;