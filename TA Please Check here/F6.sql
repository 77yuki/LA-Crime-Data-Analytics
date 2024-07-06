SET @target_lat = '{lat}';  
SET @target_lon = '{lon}'; 
SET @radius = 500;  

SELECT COUNT(*) AS crime_count
FROM (
    SELECT 
        DR_NO, 
        (6371000 * ACOS(COS(RADIANS(@target_lat)) * COS(RADIANS(LAT)) * COS(RADIANS(LON) - RADIANS(@target_lon)) + SIN(RADIANS(@target_lat)) * SIN(RADIANS(LAT)))) AS distance
    FROM areadist_sample
) AS distances
WHERE distance <= @radius;
