# Case study: How a bike sharing make a fast success being possible?
This case study describes a scenario in which a junior data analyst needs to get insights that helps a company to increase the number of annual plan of bikes.

## Environment
For this scenario, i will be using MySQL at my linux terminal to query the bicycle datasets for exploring, combining and cleaning tasks and Tableau for data visualization. At least, i looked at other's people case study for inspiration, two of these are the following:
- https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study
- https://github.com/vwainman/cyclistic-case-study

## Scenario
The fictional company called Cyclistic has launched a succeed offer about bike sharing. Since then, the program increase to a 5,800 bicycles fleet with geografic traffic and almost 700 stations at Chicago. 

## Objective
The goal is to convert casual passengers to annual members.

## Tasks
- Create marketing strategies to conver casual passengers to annual member
- Find the difference between annual members and casual passengers
- Why does casual passengers would like to get a plan
- How digital media would affect the marketing strategies

# All Data analysis steps
1. Ask: Marketing questions
2. Prepare: Data Source, Organizing, Combining
3. Process: Exploring, Cleaning, Data Integrity
4. Analyse: Analysing, Insights, Trends
5. Share: Data visualizations
6. Act or Conclusion: Final conclusions

## Ask
---
There are three questions that will guide the marketing program future:
- How annual members and casual cyclist uses Cyclistic bicycles differently?
- Why does casual passengers would want to get Cyclistic annual plan?
- How does the Cyclistic can use digital media to influence casual passengers to become members?

## Prepare
---
From that, there are some questions just to get oriented in what to do:

What is the Data Source?
: The goal is to explore 1 year of the Cyclistic bike riding dataset, in which the data source is stored in a [AWS S3 Bucket](https://divvy-tripdata.s3.amazonaws.com/index.html). At this moment, the data source has datasets about 2020 to 2024 feb. Personally, i will choose the datasets from January of 2021 to December 2021. Each month represent one dataset including thousands of rows related to the columns: `ride_id`, `rideable_type`, `started_at`, `endend_at`, `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`, `start_lat`, `start_ing`, `end_lat` and `end_ing`.
> Observation: The data source was provided by Motivate International Inc, under [This](https://divvybikes.com/data-license-agreement) License.

How's my data organized?
: I will import all `.csv` files in a database from MySql using MySQl Command Line in the Server-side. Each `.csv` will be represented by one table. After that, all tables will turned into one table, the main Dataset. From this dataset, the `Process` Analysing step can be continued.


#### Step 1: Hands-on
### Process
1. Connect the terminal to the SQL-server:
```SQL
mysql -u UserName -p
```

2. Create and use a database:
```SQL
create database 2021_divvy_tripdata; use 2021_divvy_tripdata;
```

3. Create 12 tables:
> Access to full code [here](cyclistic_tables.sql)

```SQL
CREATE TABLE 202101_divvy_tripdata (
            ride_id TEXT NULL,
            rideable_type TEXT NULL,
            started_at TEXT NULL,
            ended_at TEXT NULL,
            start_station_name TEXT NULL,
            start_station_id TEXT NULL,
            end_station_name TEXT NULL,
            end_station_id TEXT NULL,
            start_lat DOUBLE NULL,
            start_lng DOUBLE NULL,
            end_lat DOUBLE NULL,
            end_lng DOUBLE NULL,
            member_casual TEXT NULL
);
```

4. Import 12 `.csv` files to its respective table:
> Access to full code [here](cyclistic_import.sql)
```SQL
LOAD DATA LOCAL INFILE '/path/to/your/file/202101-divvy-tripdata.csv'
INTO TABLE 202101_divvy_tripdata 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
```

5. Combining all tables into one
> Access to full code [here](cyclistic_combining.sql)
> For this case, i will use the `UNION ALL` statement for combining all 12 `2021_divvy_tripdata` tables into a single one called `2021_divvy_tripdata` representing 1 year of data

6. After that, i deleted all 12 datasets, since they are no longer necessary:
```SQL
DROP TABLES 202101_divvy_tripdata, 202102_divvy_tripdata, 202103_divvy_tripdata, 202104_divvy_tripdata, 202105_divvy_tripdata, 202106_divvy_tripdata, 202107_divvy_tripdata, 202108_divvy_tripdata, 202109_divvy_tripdata, 202110_divvy_tripdata, 202111_divvy_tripdata, 202112_divvy_tripdata;
```

## Process
---
How to know if my dataset has any biased, uncomplete or inconsistent data?
: First of all, the dataset need to be explored. Explore observations like the number of columns, number of rows, data types, etc. After that, i will do a query referring to each observation i want know and show all the results

How to guarantee the data integrity?
: After the data exploration, find a solution for the respective dataset problem, for each solution, i'll do a query, validating that data values conform to the expected format, range and type. in other words, cleaning the data.


##### Hands on

1. Show the number of rows of the `2023_divvy_tripdata` dataset:
```SQL
SELECT COUNT(*) AS Number_of_rows FROM 2023_divvy_tripdata;
```
Result: 
: The dataset has `2,859,942` rows:

![count](https://i.imgur.com/cxP5C7w.png)

2. Show all the columns and its respective data type:
```SQL
SELECT COLUMN_NAME AS Column_name, DATA_TYPE AS Data_type FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = '2023_divvy_tripdata' ORDER BY DATA_TYPE DESC;
```
Result:
: The dataset has 13 columns.

![columns](https://i.imgur.com/zFEUx9I.png)

3. Show null values of each column:
```SQL
SELECT COUNT(*) AS Null_values from 2023_divvy_tripdata where COALESCE(ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat and end_lng) = NULL;
```

Result:
: The dataset has no null values.

![columns](https://i.imgur.com/a0PzzOz.png)

4. After this, i want to know if the table has any empty, inconsistent, wrong or incomplete data. I decided to search one column at a time. To do this, we have a few questions:
- The column has generalized data, like bike type or member type? Or has specific informations, like station id, lattitude, longitude?
- If the column values are generalized, is there any row in the column with inconsistent data? 
- How many values the column has?
- Which are these values?
- If the column has specific informations, each value is typed within the standards?
- If the column has one or more inconsistent data type, how can we correct this?

To continue the data exploring is important to know the answer for all these questions. So the next steps i will search for inconsistent values, passing through each 13 columns present in the cyclistic table

Obs: The table has many different data types, like date, string, number, id, etc. But when the table was imported to the SQL, the data types was limited only to `mediumtext`and `double` so to garantee all rows has the complete value, i queried the command

#### First column: `ride_id`

* The standard typing for all the values is an id containing numbers and uppercase letters, which it has 16 characters of length
* To show if it has any value with more or less of 16 characters in the column, i typed the following command in the SQL-Server:

```SQL
SELECT COUNT(ride_id) FROM 2023_divvy_tripdata WHERE length(ride_id) = 16;
```

So the result shows that 2,859,942, the exact same number of rows, concluding that the column `ride_id` has no inconsistent values, so no need to data cleaning

--- 
#### Second column: `rideable_type`

* To show how many possible values the column has, i queried the following command:

```SQL
SELECT DISTINCT rideable_type from 2023_divvy_tripdata;
```

Showing this output, the column has three possibilities values: `electric_bike`, `classic_bike` and `docked_bike`:

![columns](https://i.imgur.com/cCPkcUu.png)

#### Third and Fourth column: `started_at` & `ended_at`

* This two columns has a DATE data type, but since the `2023_divvy_tripdata` is imported, this column type was converted to `mediumtext`. Because of this, i couldn't check for values which are not in DATE type. But i could check if there are any values with more or less than 19 characters, the right length of the values in the column. I typed the command:

```SQL
SELECT COUNT(started_at and ended_at) FROM 2023_divvy_tripdata WHERE length(started_at) <> 19;
```

Again, no inconsistent values

#### Fifth: `start_station_name`

- This column show the stations where the members started a trip. To query the column, first i typed the command, to show the possible stations in all the rows:
    
    ```SQL
    SELECT DISTINCT start_station_name FROM 2023_divvy_tripdata;
    ```
    - The result shows the members started the trip in 1,541 possible stations, and scrolling through these values i found two problems:
        1. An empty station:

            ![columns](https://i.imgur.com/zffTQrJ.png)
        2. An station with only the number 410:
        
            ![columns](https://i.imgur.com/AVIMMfR.png)

##### _Empty station_
1. The following query shows me that the empty row is not a null value:

    ```SQL
    SELECT start_station_name FROM 2023_divvy_tripdata where start_station_name IS NULL;
    ```
* But when i put the filter `WHERE start_station_name = ""`, there is an empty station with empty space in the `start_station_name`. This query show that there is 437,747 rows with this empty values, in other words with empty starting stations:

    ```SQL
    SELECT COUNT(*) FROM 2023_divvy_tripdata WHERE start_station_name = "";
    ```

> Most of the values with empty stations has electric bikes consulting the following query, resulting on 437,734 rows with empty stations with electric bikes, missing 13 rows of the total rows with empty stations, meaning that i can delete this 13 rows, since the final goal of this data is to check the overview, so this only 13 rows will don't affect heavily the data. In contrast, i can't delete more than 400,000 rows just because it has empty stations, so i need somehow discover the name of each row station.

* delete all rows with empty stations and classic bikes (13 rows):
    ```SQL
    DELETE * FROM 2023_divvy_tripdata WHERE start_station_name = "" AND rideable_type = "classic_bike";
    ```

* For the rest of the 400,000  rows missing, one possible solution is to check for other columns with full and clean data, like `start_lat`, `end_lat`, `start_lng` and `end_lng`.
* For the 437,734 trips with empty starting stations, i need to discover something in common with any other row. I will 
    ```SQL
    
    ```
  
##### _An station with only the number 410_
* When i check the following query to the table, it returns only 6 rows, referring to the number of rows with the start station name called "410", so it can be deleted:
    ```SQL
    DELETE FROM 2023_divvy_tripdata WHERE start_station_name="410";
    ```

##### Sixth: `start_station_id`
##### Seventh: `end_station_name`
##### Eigth: `end_station_id`

---
`start_lat`

---
`start_lng`

---
`end_lat`

---
`end_lng`

---
`member_casual`

##### Data Cleaning

After data combining, exploring and cleaning all 12 months of `.csv` files, the process can get a step foward: the Analyse phase.

## Analyse
My goal now is to identify relationships within the data, so i can accurately answer the analysis questions, which is:
- How annual members and casual cyclist uses Cyclistic bicycles differently?
- Why does casual passengers would want to get Cyclistic annual plan?
- How does the Cyclistic can use digital media to influence casual passengers to become members?

For this 3 questions, i will de using the programming language R, that will help me get insights from graphic visualizations

### _How annual members and casual cyclists uses Cyclistic bicycles differently?_

To answer these qustion...

### _Why does casual passengers would want to get Cyclistic annual plan?_

To answer these qustion...

### _How does the Cyclistic can use digital media to influence casual passengers to become members?_

To answer these qustion...

## Share

Any data Visualization using Tableau hehuehauhauhauhau

## Conclusions

- etc
- etc
- etc
