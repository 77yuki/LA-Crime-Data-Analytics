
SET SQL_SAFE_UPDATES = 0;


UPDATE `cs 338 project`.sample
SET `Vict Sex` = 'Others'
WHERE `Vict Sex` = 'X';

SELECT COUNT(*) AS total_others FROM `cs 338 project`.sample WHERE `Vict Sex` = 'Others';


SET SQL_SAFE_UPDATES = 1;
