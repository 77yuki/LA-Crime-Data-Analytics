-- Disable safe updates
SET SQL_SAFE_UPDATES = 0;

-- Update the Vict Sex to 'Others' where it is currently 'X'
UPDATE `cs 338 project`.sample
SET `Vict Sex` = 'Others'
WHERE `Vict Sex` = 'X';

-- View the count of rows where Vict Sex is 'Others'
SELECT COUNT(*) AS total_others FROM `cs 338 project`.sample WHERE `Vict Sex` = 'Others';

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;
