USE `cs 338 project`;

SELECT t1.LAT, t1.LON
FROM AREADIST_TABLE t1
JOIN TYPE_TABLE t2 ON t1.DR_NO = t2.DR_NO
WHERE t2.`Crm Cd` = 420; 
