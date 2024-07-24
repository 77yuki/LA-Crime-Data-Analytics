USE `cs 338 project`;

SELECT `LAT`, `LON`
FROM AREADIST_TABLE t1
JOIN STATUS_TABLE t2 ON t1.DR_NO = t2.DR_NO
WHERE t1.`AREA NAME` = '{area_name}' 
  AND t2.`Status` = '{status}'; #Use 'West LA', IC' to test
