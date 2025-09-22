# Case study: How a bike sharing make a fast success being possible?

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
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/1.data_organizing.sql)

The goal is to explore 1 year of the Cyclistic bike riding dataset, in which the data source is stored in a [AWS S3 Bucket](https://divvy-tripdata.s3.amazonaws.com/index.html), provided by Motivate International Inc, under [This](https://divvybikes.com/data-license-agreement) License. The data containing in it is stored in `.csv` files.
After connecting to a SQL server and creating a database, the tables stored in `.csv` files wil be imported to it, becoming 12 tables, then combined into only one table.

### Phase 3: Process

#### Data exploring
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/2.data_exploring.sql).

Exploring the facts about the Data:

1. Number of rows: 5,595,043
2. There is three types of bicycles: electric, classic and docked bikes
3. Trips for each bike type: 
- 3,2 million trips in `classic bikes`
- 2 million trips in `electric bikes`
- 300k trips in `docked bikes`

4. 3k trips during longer than a day
5. 85k trips during shorter than a minute
6. Number of trips for each user type:
- 3 million of trips by member riders
- 2,5 million of trips by casual riders

7. More than 1 million rows missing values in at least one column
8. Almost 400 rows with 

#### Data cleaning
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/3.data_cleaning.sql).

After data exploring, i created a new table with cleaned data based on the existing table, in which all the tasks involved was:
* Adding a column with the duration of each trips in minutes
* Adding a new column with each trip's day of week (Monday = 1, Tueday = 2, Wednesday = 3, etc)
* Adding a new column containing each trip's month
* Deleting trips during longer than a day and less than a minute
* The new table has 4,5 million rows, totalizing 1 million rows deleted
                                             
### Phase 4: Analyse
> SQL query [here](https://github.com/caiobarretobr/Cyclistic_data_analysis/blob/main/4.data_analysis.sql)         

Here's some helpful facts about Member customers and Casual riders, which will bring the valious insights and data visualizations:

* Most of riders both for casual and member take trips for leisure, at while 30% uses bike to dislocating for work
* Both users are more propense to ride longer at weekends
* Casual customers rides longer than member customers along the week
* The average number of trips for member customers are bigger than casual customers along the week
    - At weekends, the number of trips for casual customers are more (`Friday 287k` | `Sunday, 399k` | `Saturday 460k`)
    - Member customers has more trips at Tuesday and Wednesday (`Tuesday 382k` | `Wednesday 391k`, indicating that the chances of member customers to use bikes for work are more than casual customers)
* Member customers along the year:
    - Months of less trips `January 68k`  `February 33k` | Months of more trips `August 327k` `September 323k`
* Casual customers along the year:
    - Months of less trips `January 14k` `February 8k` | Months of more tripsMore trips `Jule 364k` `August 338k`
* Both clients take more trips in the months:
* Both clients usually take more trips using CLassic bikes, while Docked bike is less used

### Phase 5: Data visualizations
> Python code [here](Github.com/python.py)

By the Analysis Insights and Statistics, there is the Visualizations made with Python:


- 
### Phase 6: Act
Concluding this case study, the possible strategies aiming for attract Casual users to pay annual plans are the following:

* 30 days trial
* Decreasing the number of docked bike making, and invest more in classic and electric bikes
* Create personalized plans with different prices, thinking in the casual user needs (Probably leisure than work, accordingly the data insights already seen) for an annual plan, adding some restrictions for cheaper plans and more benefits for full plans,consequently (Ex: copper, silver and golden plans)
* Create an app or site that monitor which stations are lotting which are not, preview the peak time in each station
* A newsletter about Chicago Stations and Region
* Ask for refund whenever the user want
