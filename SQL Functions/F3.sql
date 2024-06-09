SET @order_type = '{most_or_least}';  -- Change this value to 'Most' or 'Least' as needed

SELECT `AREA NAME`
FROM `cs 338 project`.sample
GROUP BY `AREA NAME`
ORDER BY 
    CASE 
        WHEN @order_type = 'Most' THEN COUNT(*) END DESC,
    CASE 
        WHEN @order_type = 'Least' THEN COUNT(*) END ASC
LIMIT 1;





