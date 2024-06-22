USE `cs 338 project`;
SELECT `LAT`, `LON`
FROM `cs 338 project`.sample
WHERE `DATE OCC` BETWEEN '{ini_date}' AND '{end_date}'; 