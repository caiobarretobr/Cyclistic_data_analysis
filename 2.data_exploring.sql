-- Show the number of rows of the `2021_divvy_tripdata` dataset:
SELECT COUNT(*) AS Number_of_rows FROM 2021_divvy_tripdata; -- 5,595,063 rows

-- Show null values of each column
SELECT COUNT(*) AS Null_values FROM 2021_divvy_tripdata WHERE COALESCE(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat and end_lng) = NULL;
-- No Null values exists

-- ride_id - length of 16
-- Check for longer or shorter values than the right data LENGTH (16 characters)
SELECT COUNT(ride_id) FROM 2021_divvy_tripdata WHERE LENGTH(ride_id) <> 16; -- 384 shorter or longer values

-- rideable_type: 3 different data types
SELECT DISTINCT rideable_type FROM 2021_divvy_tripdata; --electric, classic and docked bikes

-- Searching for empty data types
SELECT COUNT(rideable_type) FROM 2021_divvy_tripdata WHERE rideable_type=""; -- no empty values

SELECT rideable_type, COUNT(rideable_type) AS no_of_trips FROM 2021_divvy_tripdata GROUP BY rideable_type;

-- started_at, ended_at - DATETIME - YYYY-MM-DD HH:MI:SS

-- Trips during longer than a day
SELECT COUNT(*) AS trips_longer_than_a_day
FROM 2021_data
WHERE timediff(ended_at, started_at) > "24:00:00"; -- total rows = 1,041

-- Trips during shorter than a minute
SELECT COUNT(*) AS trips_shorter_than_a_minute
FROM 2021_data
WHERE timediff(ended_at, started_at) < "00:01:00"; -- total rows = 59,369

-- start_station_name, start_station_id, end_station_name, end_station_id

-- Empty values
SELECT COUNT(ride_id) AS empty_station_name_or_id
FROM 2021_divvy_tripdata
WHERE start_station_name="" OR start_station_id="" OR end_station_name="" OR end_station_id="";
-- The result shows 1,006,756 rows missing values in this four columns

-- member_casual - 2 unique values - members and casual riders
SELECT member_casual, COUNT(member_casual) AS no_of_trips
FROM 2021_divvy_tripdata
GROUP BY member_casual;