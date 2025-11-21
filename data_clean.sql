/*
Data Cleaning Script
Create: trips_clean (cleaned dataset)
Author: Jinixu
Purpose: Produce a clean dataset for analysis
*/

Use mydb;

/*
Step 1: Drop Old Cleaned Table (if exists)
*/

Drop TABLE IF EXISTS trips_clean;

/*
Step 2: Create Cleaned Table
*/

/*
Cleaning rule:
1. What should reserve: 
   - all rows with missing start/end station

2. What should remove:
   - started_at / ended_at is NULL
   - duration <= 0 & duration <= 60 seconds & duration > 24 hours
   - coordinates are 0
   - latitude / longitude is out of range
   - member_casual is not 'member' or 'casual'
*/

CREATE TABLE trips_clean AS
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual,
    TIMESTAMPDIFF(SECOND, started_at, ended_at) AS duration_seconds
FROM trips
WHERE 
      -- valid time
      started_at IS NOT NULL 
  AND ended_at IS NOT NULL
      -- duration > 0 & duration > 60s & duration <= 24h
  AND TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0
  AND TIMESTAMPDIFF(SECOND, started_at, ended_at) > 60
  AND TIMESTAMPDIFF(SECOND, started_at, ended_at) <= 86400
      -- valid coordinate
  AND start_lat IS NOT NULL
  AND start_lng IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL
  AND start_lat BETWEEN -90 AND 90
  AND end_lat BETWEEN -90 AND 90
  AND start_lng BETWEEN -180 AND 180
  AND end_lng BETWEEN -180 AND 180
      -- valid type of user
  AND member_casual IN ('member', 'casual');

/*
Step 3: Check Cleaned Table Size
*/

SELECT COUNT(*) AS total_clean_row
FROM trips_clean;

/*
Step 4: Summary Duration & User Type Distribution to Verify Cleaning Effort
*/

SELECT 
    ROUND(MIN(duration_seconds) / 3600, 2) AS min_duration_hours,
    ROUND(AVG(duration_seconds) / 3600, 2) AS avg_duration_hours,
    ROUND(MAX(duration_seconds) / 3600, 2) AS max_duration_hours
FROM trips_clean;

SELECT member_casual, COUNT(*) AS user_count
FROM trips_clean
GROUP BY member_casual;

/*
Step 5: Export Cleaned Data
*/

-- SHOW VARIABLES LIKE 'secure_file_priv';

(
SELECT
	'ride_id', 'rideable_type', 
	'started_at', 'ended_at',
	'start_station_name', 'start_station_id',
	'end_station_name', 'end_station_id',
	'start_lat', 'start_lng', 'end_lat', 'end_lng',
	'member_casual', 'duration_seconds'
)
UNION ALL
SELECT *
FROM trips_clean
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/trips_clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
-- after exporting, copy and paste cleaned data file in the target folder 

/*
End of Cleaning Script
*/