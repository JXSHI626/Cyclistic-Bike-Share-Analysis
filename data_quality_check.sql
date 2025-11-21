/* 
Quality Check Script
Dataset: Cyclistic Divvy Trips (2024)
Author: Jinxiu
Purpose: Pre-cleaning data quality diagnostics
*/

/* 
Step 0: Basic Overview
*/

-- Total row count
SELECT COUNT(*)
FROM trips;  

-- Preview first 10 rows
SELECT *
FROM trips
LIMIT 10;

/*
Step 1: Column-level Missing Value Check
*/

-- Count missing (NULL + empty) for each text field
SELECT 
    SUM(CASE WHEN ride_id IS NULL OR ride_id = '' 
             THEN 1 ELSE 0 END) AS missing_ride_id,
	SUM(CASE WHEN rideable_type IS NULL OR rideable_type = '' 
             THEN 1 ELSE 0 END) AS missing_rideable_type,
	SUM(CASE WHEN start_station_name IS NULL OR start_station_name = '' 
             THEN 1 ELSE 0 END) AS missing_start_station_name,
	SUM(CASE WHEN start_station_id IS NULL OR start_station_id = '' 
             THEN 1 ELSE 0 END) AS missing_start_station_id,
    SUM(CASE WHEN end_station_name IS NULL OR end_station_name = '' 
             THEN 1 ELSE 0 END) AS missing_end_station_name,
    SUM(CASE WHEN end_station_id IS NULL OR end_station_id = '' 
             THEN 1 ELSE 0 END) AS missing_end_station_id,
    SUM(CASE WHEN member_casual IS NULL OR member_casual = '' 
             THEN 1 ELSE 0 END) AS missing_member_casual
FROM trips;

-- Numeric missing check
SELECT 
    SUM(start_lat IS NULL) AS missing_start_lat,
    SUM(start_lng IS NULL) AS missing_start_lng,
    SUM(end_lat IS NULL) AS missing_end_lat,
	SUM(end_lng IS NULL) AS missing_end_lng
FROM trips;

/*
Step 2: Time Validity Check
*/

-- NULL timestamps
SELECT 
    SUM(started_at IS NULL) AS missing_started_at,
    SUM(ended_at IS NULL) AS missing_ended_at
FROM trips;

-- Invalid trips: end time ealier than start time
SELECT COUNT(*) AS negative_duration
FROM trips
WHERE ended_at < started_at;

-- Trip duration analysis
SELECT
    SUM(TIMESTAMPDIFF(SECOND, started_at, ended_at) <= 0) AS duration_minus_zero,
    SUM(TIMESTAMPDIFF(SECOND, started_at, ended_at) < 60) AS duration_too_short,
    SUM(TIMESTAMPDIFF(SECOND, started_at, ended_at) > 86400) AS duration_too_long
FROM trips;

/*
Step 3: Location Validity Check
*/

-- Zero coordinates
SELECT COUNT(*) AS zero_coordinate
FROM trips
WHERE start_lat = 0 
OR start_lng = 0 
OR end_lat = 0 
OR end_lng = 0;

-- Out-of-range coordinates
SELECT COUNT(*) AS invalid_coordinate
FROM trips
WHERE start_lat NOT BETWEEN -90 AND 90
OR end_lat NOT BETWEEN -90 AND 90
OR start_lng NOT BETWEEN -180 AND 180
OR end_lng NOT BETWEEN -180 AND 180;

/*
Step 4: Station Information Check
*/

-- Missing station name/id 
SELECT 
    SUM(start_station_name = '') AS empty_start_name,
    SUM(end_station_name = '') AS empty_end_name,
    SUM(start_station_id = '') AS empty_start_id,
    SUM(end_station_id = '') AS empty_end_id
FROM trips;

/*
Step 5: Categorical Consistency Check
*/

-- Unique categories for type of bike
SELECT DISTINCT rideable_type
FROM trips;

-- Unique categories for type of user
SELECT DISTINCT member_casual
FROM trips;

/*
Step 6: Outlier Check (Duration Distribution)
*/

SELECT 
    ROUND(MIN(TIMESTAMPDIFF(SECOND, started_at, ended_at)) / 3600, 2) AS min_duration,
    ROUND(AVG(TIMESTAMPDIFF(SECOND, started_at, ended_at)) /3600, 2) AS avg_duration,
    ROUND(MAX(TIMESTAMPDIFF(SECOND, started_at, ended_at)) /3600, 2) AS max_duration
FROM trips;

/*
Step 7: Missing Value Check by Month
*/

-- Monthly missing for start station
SELECT
    DATE_FORMAT(started_at, '%y-%m') AS month_2024,
    COUNT(*) AS total_rides,
    SUM(start_station_name = '') AS empty_start_station,
    ROUND(SUM(start_station_name = '') * 100 / COUNT(*), 2) AS missing_rate_start,
    SUM(end_station_name = '') AS empty_end_station,
    ROUND(SUM(end_station_name = '') * 100 / COUNT(*), 2) AS missing_rate_end
FROM trips
GROUP BY month_2024
ORDER BY month_2024 ASC;

/*
End of Quality Check Script
*/