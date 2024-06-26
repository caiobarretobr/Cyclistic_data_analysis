# Case study: How a bike sharing make a fast success being possible?
Hello! My name is Caio, i'm a beginner Data Analyst and this case study was made to show my data analysis hard and soft skills and it was based on the [Google data analytics certificate](https://www.coursera.org/learn/google-data-analytics-capstone) case study, so i applied all the knowledge i acquired in the whole course.
> Disclaimer: this case study was made using all the knowledge i have, but i used some other repositories as inspirations, like [this](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study), by SomiaNasir, in GitHub

## Tools used
- MySql
- SQL-server on CommandLine
- Tableau

## Fictional scenario
In 2016, the fictitious company called Cyclistic has launched a succeed offer about bike sharing. Since then, the program increased to a 5,800 bicycles fleet with geografic traffic and almost 700 stations at Chicago. 

Until now, the marketing strategy was based on general awareness and wide customers range. What helped this idea get succeed was the flexibility in reference of price plans: `single trip pass`, `daily pass` and `annual plans`. Clients that purchase both single trip pass and daily pass are called **casual passengers** and clients that purchase annual plan are **cyclistic members**.

The financial analysts concluded that the cyclistic members are much more profitable than casual passengers. Despite the price flexibility helps the company to attract more clients, Lily Moreno (Marketing director) believes that maximizing the annual members number is the key to future company growth. 

Lily established a goal: create marketing strategies in order to convert casual passengers to annual members. But to do this, the marketing analyst team has four main business tasks
- Create marketing strategies to convert casual passengers to annual members
- Find the difference between annual members and casual passengers
- Why does casual passengers would like to get an annual plan
- How digital media would affect the marketing strategies

## Index
* Phase 1: [Ask](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#ask)

* Phase 2: [Prepare](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-2-prepare)

    - 2.1 - [Create a database](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#21---create-a-database)
    - 2.2 - [Test one table importing](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#22---test-one-table-importing)
    - 2.3 - [Create 12 tables](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#23---create-12-tables)
    - 2.4 - [Import 12 excel sheets to respective tables](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#24---import-12-excel-sheets-to-respective-tables)
    - 2.5 - [Merge 12 tables into one table](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#25---merge-12-tables-into-one-table)

* Phase 3: [Process](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-3-process)

    - 3.1 - [Data exploring](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#31---data-exploring)
    - 3.2 - [Data cleaning](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#32---data-cleaning)

* Phase 4: [Analyse](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-4-analyse)

* Phase 5: [Share](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-5-share)

* Phase 6: [Act](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-6-act)

### Phase 1: Ask 
There are three questions that will guide the marketing program future:
- How annual members and casual cyclist uses Cyclistic bicycles differently?
- Why does casual passengers would want to get Cyclistic annual plan?
- How does the Cyclistic can use digital media to influence casual passengers to become members?

### Phase 2: Prepare
_**Where's the Data Source?**_

The goal is to explore 1 year of the Cyclistic bike riding dataset, in which the data source is stored in a [AWS S3 Bucket](https://divvy-tripdata.s3.amazonaws.com/index.html), provided by Motivate International Inc, under [This](https://divvybikes.com/data-license-agreement) License. At this moment, the AWS source has datasets about 2020 to 2024, but the year used in this case study is 2021.

_**How's the data organized?**_
> SQL query [here](SQL/data_organizing.sql).

The tables are stored in `.csv` files, and it wil be imported to a MySQL database using MySQL-server command line. Each `.csv` will be represented by one table. After that, all tables will turn into one table, the main Dataset. With this dataset, representing all the 2021 cyclistic data, the `Process` step can be continued.

### Phase 3: Process - Exploring, cleaning and manipulation

The `Process` function is to cleaning the data, ensuring data integrity, a data with no bias, errors, by exploring the data particulars and cleaning any inconsistency for a more efficient working.

### Data exploring
> SQL query [here](SQL/data_exploring.sql).

By exploring the data, we found some inconsistencies:
* 384 rows with wrong values in "ride_id"
* 11,151 trips during more than a day
* 58,325 trips during less than a minute
* 690,805 empty rows in "start_station_name" column
* 739,167 empty rows in both "end_station_name" and "end_station_id"
* 690,802 empty rows in "start_station_id" column

### Data cleaning
> SQL query [here](SQL/data_cleaning.sql).

**Cleaning tasks**
* Remove rows with empty stations
* Remove rows called "351"
---
### Phase 4: Analyse - Analysing, Insights, Trends
---
### Phase 5: Share - Data Visualizations 
---
### Phase 6: Act: Final conclusions
