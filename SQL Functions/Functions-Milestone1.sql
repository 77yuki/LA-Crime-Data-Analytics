# F1
SET SQL_SAFE_UPDATES = 0;
DELETE FROM `cs 338 project`.sample1
WHERE `Vict Age` > 18;
SET SQL_SAFE_UPDATES = 1;

# F2
SET SQL_SAFE_UPDATES = 0;

UPDATE `cs 338 project`.sample2
SET `Vict Sex` = 'Others'
WHERE `Vict Sex` = 'X';

SET SQL_SAFE_UPDATES = 1;

# F3
INSERT INTO `cs 338 project`.sample3 (`Crm Cd`, LAT, LON)
VALUES 
(510, 34, 118); #Use (510, 34, 118) for Tests, original codes that connect to HTML: ('{crm_cd}', '{lat}', '{lon}')

#F4
SELECT 
    HOUR, 
    COUNT(*) AS CrimeCount
FROM (
    SELECT 
        FLOOR(`TIME OCC` / 100) AS HOUR
    FROM 
        `cs 338 project`.sample4
    WHERE 
        `AREA NAME` = '{area_name}'
) AS HourlyCrimes
GROUP BY 
    HOUR
ORDER BY 
    HOUR;
    
    
    
SELECT NULL AS `DR_NO`, NULL AS `Date Rptd`, NULL AS `DATE OCC`, NULL AS `TIME OCC`, NULL AS `AREA`,
NULL AS `AREA NAME`,NULL AS `Rpt Dist No`, NULL AS `Part 1-2`, `Crm Cd`, `Vict Age`, `Vict Sex`, `Vict Descent`,
NULL AS `LAT`, NULL AS `LON`
FROM `cs 338 project`.sample1
UNION ALL
SELECT `DR_NO`, `Date Rptd`, `DATE OCC`,  `TIME OCC`,  `AREA`, `AREA NAME`, `Rpt Dist No`, `Part 1-2`, 
`Crm Cd`, `Vict Age`, `Vict Sex`, `Vict Descent`, `LAT`, `LON`
FROM `cs 338 project`.sample2 
UNION ALL
SELECT NULL AS `DR_NO`, NULL AS `Date Rptd`, NULL AS `DATE OCC`, NULL AS `TIME OCC`, NULL AS `AREA`,
NULL AS `AREA NAME`,NULL AS `Rpt Dist No`, NULL AS `Part 1-2`, `Crm Cd`, NULL AS `Vict Age`, NULL AS `Vict Sex`, 
NULL AS`Vict Descent`, `LAT`,  `LON`
FROM `cs 338 project`.sample3
UNION ALL
SELECT `DR_NO`, `Date Rptd`, `DATE OCC`,  `TIME OCC`,  `AREA`, `AREA NAME`, `Rpt Dist No`, `Part 1-2`, 
`Crm Cd`, NULL AS `Vict Age`, NULL AS `Vict Sex`, NULL AS `Vict Descent`, NULL AS `LAT`, NULL AS `LON`
FROM `cs 338 project`.sample4;


