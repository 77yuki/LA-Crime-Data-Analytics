USE `cs 338 project`;

SELECT `LAT`, `LON`
FROM AREADIST_TABLE t1
JOIN DATETIME_TABLE t2 ON t1.DR_NO = t2.DR_NO
JOIN STATUS_TABLE t3 ON t1.DR_NO = t3.DR_NO
WHERE t2.`DATE OCC` BETWEEN '{init_date}' AND '{end_date}' #Use '04/06/2020' AND '04/25/2020' to test
  AND t3.`Status` = '{status}'; #Use 'IC' to test
