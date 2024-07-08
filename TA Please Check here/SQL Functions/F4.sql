USE `cs 338 project`;

CREATE TABLE IF NOT EXISTS Hours (
    HOUR INT PRIMARY KEY
);

INSERT INTO Hours (HOUR)
VALUES 
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), 
(11), (12), (13), (14), (15), (16), (17), (18), 
(19), (20), (21), (22), (23);

CREATE TABLE F4 AS
SELECT
    t1.`AREA NAME`,
    t2.`TIME OCC`
FROM AREADIST t1
JOIN DATETIME t2 ON t1.DR_NO = t2.DR_NO;

SELECT 
    h.HOUR,
    COALESCE(CrimeCount, 0) AS CrimeCount
FROM 
    Hours h
LEFT JOIN (
    SELECT 
        FLOOR(`TIME OCC` / 100) AS HOUR,
        COUNT(*) AS CrimeCount
    FROM 
        F4
    WHERE 
        `AREA NAME` = '{area_name}'  #Use 'Newton' to test
    GROUP BY 
        HOUR
) AS HourlyCrimes ON h.HOUR = HourlyCrimes.HOUR
ORDER BY 
    h.HOUR;




