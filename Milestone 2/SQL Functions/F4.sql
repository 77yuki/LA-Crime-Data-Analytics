USE `cs 338 project`;


SELECT 
    h.HOUR,
    COALESCE(CrimeCount, 0) AS CrimeCount
FROM 
    (SELECT 0 AS HOUR UNION ALL
     SELECT 1 UNION ALL
     SELECT 2 UNION ALL
     SELECT 3 UNION ALL
     SELECT 4 UNION ALL
     SELECT 5 UNION ALL
     SELECT 6 UNION ALL
     SELECT 7 UNION ALL
     SELECT 8 UNION ALL
     SELECT 9 UNION ALL
     SELECT 10 UNION ALL
     SELECT 11 UNION ALL
     SELECT 12 UNION ALL
     SELECT 13 UNION ALL
     SELECT 14 UNION ALL
     SELECT 15 UNION ALL
     SELECT 16 UNION ALL
     SELECT 17 UNION ALL
     SELECT 18 UNION ALL
     SELECT 19 UNION ALL
     SELECT 20 UNION ALL
     SELECT 21 UNION ALL
     SELECT 22 UNION ALL
     SELECT 23) AS h
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



