USE `cs 338 project`;

SET @target_lat = '{lat}'; #Use 34.052235 to test
SET @target_lon = '{lon}'; #Use -118.243683 to test
SET @radius = 500;  

SELECT COUNT(*) AS crime_count, @target_lat, @target_lon
FROM (
    SELECT 
        DR_NO, 
        (6371000 * ACOS(COS(RADIANS(@target_lat)) * COS(RADIANS(LAT)) * COS(RADIANS(LON) - RADIANS(@target_lon)) + SIN(RADIANS(@target_lat)) * SIN(RADIANS(LAT)))) AS distance
    FROM areadist_table
) AS distances
WHERE distance <= @radius;
