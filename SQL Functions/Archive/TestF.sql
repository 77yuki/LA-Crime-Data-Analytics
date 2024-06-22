USE `cs 338 project`;
SELECT COUNT(*) AS number_of_victims
FROM sample
WHERE `Vict Age` BETWEEN '{ini_age}' AND '{end_age}'; 