-- create a database to store tables for Cyclistic
CREATE DATABASE mydb;
USE mydb;
-- create a table to import data in whole year
-- DROP TABLE IF EXISTS trips;

CREATE TABLE trips(
    ride_id VARCHAR(50),
    rideable_type VARCHAR(50),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(50),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(50),
    start_lat DECIMAL(10,6),
    start_lng DECIMAL(10,6),
    end_lat DECIMAL(10,6),
    end_lng DECIMAL(10,6),
    member_casual VARCHAR(20)
);
SET GLOBAL local_infile = 1;
-- import data from 12 CSV files
LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202401-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202402-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202403-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202404-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202405-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202406-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202407-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202408-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202409-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202410-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202411-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);

LOAD DATA LOCAL INFILE 'D:/CaseStudy_Cyclistic/01_data_raw/202412-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(ride_id, rideable_type, started_at, ended_at, 
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual);