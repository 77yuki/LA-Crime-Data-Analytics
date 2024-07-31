SET @target_lat = 34.1018;  
SET @target_lon = -118.3035; 
SET @radius = 500;  


SELECT @target_lat AS LAT, @target_lon AS LON, COUNT(*) AS crime_count
FROM (
    SELECT 
        DR_NO, 
        (6371000 * ACOS(COS(RADIANS(@target_lat)) * COS(RADIANS(LAT)) * COS(RADIANS(LON) - RADIANS(@target_lon)) + SIN(RADIANS(@target_lat)) * SIN(RADIANS(LAT)))) AS distance
    FROM areadist_table
) AS distances
WHERE distance <= @radius; 
