USE `cs 338 project`;

SET @radius = 500;  

#Use 34.052235 to test as lat, Use -118.243683 to test as lon
SELECT COUNT(*) AS crime_count, '{lat}', '{lon}' 
FROM (
    SELECT 
        DR_NO, 
        (6371000 * ACOS(COS(RADIANS('{lat}')) * COS(RADIANS(LAT)) * COS(RADIANS(LON) - RADIANS('{lon}' )) + SIN(RADIANS('{lat}')) * SIN(RADIANS(LAT)))) AS distance
    FROM areadist_table
) AS distances
WHERE distance <= @radius;
