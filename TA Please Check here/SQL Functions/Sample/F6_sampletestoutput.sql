SET @target_lat = 34.052235;  
SET @target_lon = -118.243683; 
SET @radius = 500;  

SELECT COUNT(*) AS crime_count
FROM (
    SELECT 
        DR_NO, 
        (6371000 * ACOS(COS(RADIANS(@target_lat)) * COS(RADIANS(LAT)) * COS(RADIANS(LON) - RADIANS(@target_lon)) + SIN(RADIANS(@target_lat)) * SIN(RADIANS(LAT)))) AS distance
    FROM areadist_sample
) AS distances
WHERE distance <= @radius;
