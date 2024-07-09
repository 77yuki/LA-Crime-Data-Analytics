USE `cs 338 project`;

CREATE TABLE F1 AS
SELECT
    t1.LAT,
    t1.LON,
    t2.`Crm Cd`
FROM AREADIST_TABLE t1
JOIN TYPE_TABLE t2 ON t1.DR_NO = t2.DR_NO;

SELECT `LAT`, `LON`
FROM F1
WHERE `Crm Cd` = '{crime_code}'; #Use 756 to test to get F1_sampleoutput.out, and use 420 to test and get F1_sampleoutput2


