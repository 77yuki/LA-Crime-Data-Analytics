USE `cs 338 project`;

CREATE TABLE F4 AS
SELECT
    t1.`AREA NAME`,
    t2.`TIME OCC`
FROM AREADIST t1
JOIN DATETIME t2 ON t1.DR_NO = t2.DR_NO;

SELECT 
    HOUR, 
    COUNT(*) AS CrimeCount
FROM (
    SELECT 
        FLOOR(`TIME OCC` / 100) AS HOUR
    FROM 
        F4
    WHERE 
        `AREA NAME` = '{area_name}' #Use Newton to test
) AS HourlyCrimes
GROUP BY 
    HOUR
ORDER BY 
    HOUR;
