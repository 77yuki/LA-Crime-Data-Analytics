USE `cs 338 project`;

CREATE TABLE F3 AS
SELECT
    t1.LAT,
    t1.LON,
    t2.`DATE OCC`
FROM AREADIST_TABLE t1
JOIN DATETIME_TABLE t2 ON t1.DR_NO = t2.DR_NO;

SELECT `LAT`, `LON`
FROM F3
WHERE `DATE OCC` BETWEEN '{ini_date}' AND '{end_date}'; #Use 04/06/2020 and 04/25/2020 to test to get F3_sampleoutput.out, and use '03/24/2020' AND '06/24/2020' to test and get F3_sampleoutput2.out
