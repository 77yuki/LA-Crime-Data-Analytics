USE `cs 338 project`;

WITH RECURSIVE Hours AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR + 1 FROM Hours WHERE HOUR < 23
)
    
SELECT 
    h.HOUR,
    COALESCE(CrimeCount, 0) AS CrimeCount
FROM 
    Hours h
LEFT JOIN (
    SELECT 
        FLOOR(t2.`TIME OCC` / 100) AS HOUR,
        COUNT(*) AS CrimeCount
    FROM 
        AREADIST_TABLE t1
    JOIN 
        DATETIME_TABLE t2 ON t1.DR_NO = t2.DR_NO
    WHERE 
        t1.`AREA NAME` = '{area_name}'  #Use 'Newton' to test to get F4_sampleoutput.out, and use 'Hollywood' to test to get F4_sampleoutput2.out  
    GROUP BY 
        FLOOR(t2.`TIME OCC` / 100)
) AS HourlyCrimes ON h.HOUR = HourlyCrimes.HOUR
ORDER BY 
    h.HOUR;

