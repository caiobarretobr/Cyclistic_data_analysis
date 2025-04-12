# Case study: How a bike sharing make a fast success being possible?
This case study was made to show my data analysis hard and soft skills based on the [Google data analytics certificate](https://www.coursera.org/learn/google-data-analytics-capstone) case study, simulating daily junior data analyst tasks.

## Tools used
- Bash CLI
- [MySql workbench](http://mysql.com/downloads/http://mysql.com/downloads/http://mysql.com/downloads/http://mysql.com/downloads/http://mysql.com/downloads/http://mysql.com/downloads/)
- [Tableau](https://online.tableau.com/)
- Python programming
- VS code

## Fictional scenario
In 2016, the fictitious company called Cyclistic has launched a succeed offer about bike sharing. Since then, the program increased to a 5,800 bicycles fleet with geografic traffic and almost 700 stations at Chicago. 

Until now, the marketing strategy was based on general awareness and wide customers range. What helped this idea get succeed was the flexibility in reference of price plans: `single trip pass`, `daily pass` and `annual plans`. Clients that purchase both single trip pass and daily pass are called **casual passengers** and clients that purchase annual plan are **cyclistic members**.

The financial analysts concluded that the cyclistic members are much more profitable than casual passengers. Despite the price flexibility helps the company to attract more clients, Lily Moreno (Marketing director) believes that maximizing the annual members number is the key to future company growth. 

Lily established a goal: create marketing strategies in order to convert casual passengers to annual members. But to do this, the marketing analyst team has four main business tasks
- Create marketing strategies to convert casual passengers to annual members
- Find the difference between annual members and casual passengers
- Why does casual passengers would like to get an annual plan
- How digital media would affect the marketing strategies

## Summary of all the phases
* Phase 1: [Ask](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-1-ask) - Marketing questions

* Phase 2: [Prepare](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-2-prepare) - Data source, organizing, combining

* Phase 3: [Process](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-3-process) - Exploring, cleaning, data integrity

* Phase 4: [Analyse](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-4-analyse) - Insights, Trends

* Phase 5: [Share](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-5-share) - Data visualizations

* Phase 6: [Act](https://github.com/caiobarretobr/cyclistic_case_study?tab=readme-ov-file#phase-6-act) - Final conclusions

### Phase 1: Ask 
There are three questions that will guide the marketing program future:
- How annual members and casual cyclist uses Cyclistic bicycles differently?
- Why does casual passengers would want to get Cyclistic annual plan?
- How does the Cyclistic can use digital media to influence casual passengers to become members?

### Phase 2: Prepare
#### Data source
The goal is to explore 1 year of the Cyclistic bike riding dataset, in which the data source is stored in a [AWS S3 Bucket](https://divvy-tripdata.s3.amazonaws.com/index.html), provided by Motivate International Inc, under [This](https://divvybikes.com/data-license-agreement) License. At this moment, the AWS source has datasets about 2020 to 2024, but the year used in this case study is 2021.

#### Data organizing
After creating the a SQL server and the schema in MySQL Workbench, the tables stored in `.csv` files wil be imported to it. Each `.csv` will be represented by one table. After that, all tables will combined into only one table, the main Dataset. With this dataset, representing the 2021 cyclistic data, the `Process` step can be continued.

As the MySQL Workbench server only allow one path for importing files (/var/lib/mysql-files/), i will copying all ".csv" files for this path, at the terminal:

```bash
$ sudo cp 202101-divvy-tripdata.csv /var/lib/mysql-files/ & sudo cp AllOtherDatasets
$ sudo ls /var/lib/mysql-files/
```

Finaly, all the files can be imported to the respective tables (SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/1.data_organizing.sql))

### Phase 3: Process

#### Data exploring
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/2.data_exploring.sql).

For familiarizing myself with the data, there are some characteristics about the data:

1. The dataset has rows
2. There is three types of bicycles: electric, classic and docked bikes
3. Number of trips in each bike:
![img](https://i.imgur.com/ZjpMdJX.png)
4. Trips during longer than a day: 1,041 rows
5. Trips during shorter than a minute: 59,369 rows
6. Number of trips from both casual customers and annual members:
![img](https://i.imgur.com/P87tWlm.png)
7. Also, there is more than 1 million rows with empty values in the columns `start_station_name`, `start_station_id`, `end_station_name`, `end_station_id`:
![img](https://i.imgur.com/fSwXmz7.png)


#### Data cleaning
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/3.data_cleaning.sql).

After data exploring, i created a new table with the cleaned data based on the already existing table, in which all the tasks involved was:
* Adding a column with the duration of each trips in minutes
* Adding a new column with each trip's day of week (Monday = 1, Tueday = 2, Wednesday = 3, etc)
* Adding a new column containing each trip's month
* Deleting trips during longer than a day and less than a minute
* The new table has 4,527,643 rows, totalizing 1,067,420 rows deleted:

![img](https://i.imgur.com/kvyDZdB.png)
                                             
### Phase 4: Analyse
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/4.data_analysis.sql)         

After done all the analysis calculations of the dataset, there is all the insights we got based on the queries:
* 
* 

maximo de insights
tentar diminuir o tamanho do código
começar a etapa da visualização

Calculations 
- average trip_duration OK
- average day_of_week OK
- max trip_duration OK
- average trip duration from member and casual customers OK
- average trip duration in each day of the week from member and casual customers Ok
- number of trips from each user from each day of the week OK
- all these calculations for each month

### Phase 5: Share
Now, using the Tableau, i used all the insights from the calculations, and making charts for getting trends, more insights and final conclusions. These are the data visualizations i did by the 2021 cyclistic dataset:


### Phase 6: Act
    1. Como os membros anuais e os ciclistas casuais usam as bicicletas da Cyclistic de forma diferente?    
    2. Por que os passageiros casuais iriam querer adquirir planos anuais da Cyclistic?
    3. Como a Cyclistic pode usar a mídia digital para influenciar os passageiros casuais a se tornarem membros?
