USE `cs 338 project`;

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

