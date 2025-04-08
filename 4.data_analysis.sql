------------ RESULTS -----------

-- Average trip duration for member customers
-- RESULT: 
-- Sunday - 15.44m
-- Monday - 12.90m
-- Tuesday - 12.55m
-- Wednesday - 12.62m
-- Thursday - 12.51m
-- Friday - 12.9m
-- Saturday - 15.04m

-- Average trip duration for casual customers
-- RESULT: 
-- Sunday - 32.70m
-- Monday - 29.02m
-- Tuesday - 26.11m
-- Wednesday - 24.61m
-- Thursday - 24.33
-- Friday - 26.42m
-- Saturday - 30.76m

-- Number of trips for member customers
-- RESULT:
-- Sunday - 305,872
-- Monday - 341,151
-- Tuesday - 382,507
-- Wednesday - 392,000
-- Thursday - 368,070
-- Friday - 360,221
-- Saturday - 351,151

-- Number of trips for casual customers
-- RESULT:
-- Sunday - 399,263
-- Monday - 226,464
-- Tuesday - 212,697
-- Wednesday - 215,878
-- Thursday - 221,935
-- Friday - 287,030
-- Saturday - 463,404

-- number of member trips along the week
SELECT day_of_week, count(ride_id) AS annual_members
FROM 2021_cleaned_data
WHERE member_casual = "member"
GROUP BY day_of_week

-- number of casual trips along the week
SELECT day_of_week, count(ride_id) AS casual_customers
FROM 2021_cleaned_data
WHERE member_casual = "casual"
GROUP BY day_of_week;

-- average member trip duration along the week
SELECT day_of_week, AVG(
        EXTRACT(HOUR from trip_duration) * 60 +
        EXTRACT(MINUTE from trip_duration) +
        EXTRACT(SECOND from trip_duration) / 60
    ) AS avg_trip_duration
FROM 2021_cleaned_data
WHERE member_casual = "member"
GROUP BY day_of_week;

-- average casual trip duration along the week
SELECT day_of_week, AVG(
        EXTRACT(HOUR from trip_duration) * 60 +
        EXTRACT(MINUTE from trip_duration) +
        EXTRACT(SECOND from trip_duration) / 60
    ) AS avg_trip_duration
FROM 2021_cleaned_data
WHERE member_casual = "casual"
GROUP BY day_of_week;

-- member trip numbers along the year
SELECT month_, count(ride_id) AS member_trips
FROM 2021_cleaned_data
WHERE member_casual='member'
GROUP BY month_;

-- casual trip numbers along the year
SELECT month_, count(ride_id) AS casual_trips
FROM 2021_cleaned_data
WHERE member_casual='casual'
GROUP BY month_;

-- the 10 most acessed stations for users
SELECT start_station_name, count(ride_id)
FROM 2021_cleaned_data
GROUP BY start_station_name
ORDER BY COUNT(ride_id) DESC
LIMIT 10;

-- ranking of most used bikes for members
SELECT rideable_type, COUNT(ride_id) AS member_bikes
FROM 2021_cleaned_data
WHERE member_casual = 'member'
GROUP BY rideable_type
ORDER BY COUNT(ride_id) DESC;

-- ranking of most used bikes for casual customers
SELECT rideable_type, COUNT(ride_id) AS casual_bikes
FROM 2021_cleaned_data
WHERE member_casual = 'casual'
GROUP BY rideable_type
ORDER BY COUNT(ride_id) DESC;

-- Maximum trip duration
SELECT MAX(trip_duration)
FROM 2021_cleaned_data;