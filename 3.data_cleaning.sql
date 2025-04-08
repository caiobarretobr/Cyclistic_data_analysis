DELETE FROM 2021_data WHERE started_at < ended_at - INTERVAL 1 DAY;
DELETE FROM 2021_data WHERE TIMESTAMPDIFF(SECOND, inicio, fim) < 60;

CREATE TABLE 2021_cleaned_data (
    SELECT 
        ride_id,
        rideable_type,
        started_at, 
        ended_at,
        timediff(ended_at, started_at) AS trip_duration,
        CASE
            WHEN DAYOFWEEK(started_at) = 1 THEN 'sun'
            WHEN DAYOFWEEK(started_at) = 2 THEN 'mon'
            WHEN DAYOFWEEK(started_at) = 3 THEN 'tue'
            WHEN DAYOFWEEK(started_at) = 4 THEN 'wed'
            WHEN DAYOFWEEK(started_at) = 5 THEN 'thu'
            WHEN DAYOFWEEK(started_at) = 6 THEN 'fri'
            WHEN DAYOFWEEK(started_at) = 7 THEN 'sat'
        END AS day_of_week,
        CASE
            WHEN MONTH(started_at) = 1 THEN 'jan'
            WHEN MONTH(started_at) = 2 THEN 'feb'
            WHEN MONTH(started_at) = 3 THEN 'mar'
            WHEN MONTH(started_at) = 4 THEN 'apr'
            WHEN MONTH(started_at) = 5 THEN 'may'
            WHEN MONTH(started_at) = 6 THEN 'jun'
            WHEN MONTH(started_at) = 7 THEN 'jul'
            WHEN MONTH(started_at) = 8 THEN 'ago'
            WHEN MONTH(started_at) = 9 THEN 'set'
            WHEN MONTH(started_at) = 10 THEN 'out'
            WHEN MONTH(started_at) = 11 THEN 'nov'
            WHEN MONTH(started_at) = 12 THEN 'dez'
        END AS month_,
        start_station_name,
        start_station_id,
        end_station_name,
        end_station_id,
        start_lng,
        start_lat,
        end_lng,
        end_lat,
        member_casual
    FROM 2021_data
    WHERE
        start_station_name != "" AND
        start_station_id != "" AND
        end_station_name != "" AND
        end_station_id != ""
);

-- Count row many rows were deleted
SELECT (SELECT COUNT(*) FROM 2021_data) AS first_table, COUNT(*) AS cleaned_table FROM 2021_cleaned_data;