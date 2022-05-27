-- For this task, you will be fetching some metrics about weekend 
-- taxi rides in New York City use this link: 
-- https://www.kaggle.com/datasets/elemento/nyc-yellow-taxi-trip-data 
-- download the dataset and upload it on your Postgresql data base.

-- Write an SQL query to fetch the following monthly metrics from the dataset for the:
-- ●	The average number of trips on Saturdays
-- ●	The average fare (fare_amount) per trip on Saturdays
-- ●	The average duration per trip on Saturdays
-- ●	The average number of trips on Sundays
-- ●	The average fare (fare_amount) per trip on Sundays
-- ●	The average duration per trip on Sundays




-- ●	The average number of trips on Saturdays

select avg("no_vendorID"), "day_of_pickup"
from
(select count("VendorID") as "no_vendorID", to_char("tpep_pickup_datetime", 'day') as "day_of_pickup", "tpep_dropoff_datetime"
from "taxi"
group by "tpep_pickup_datetime", "tpep_dropoff_datetime"
order by 1 desc, 2 desc) as table1
where "day_of_pickup" like 'sat%'
group by "day_of_pickup";


-- ●	The average fare (fare_amount) per trip on Saturdays

select avg("fare_amount") as "avg_fare_amount"
from
(select to_char("tpep_pickup_datetime", 'day') as "day", "fare_amount"
from "taxi"
group by "day", "fare_amount") as table2
where "day" like 'sat%';


-- ●	The average duration per trip on Saturdays

select avg("diff") as "avg_diff"
from
(select ("tpep_dropoff_datetime" - "tpep_pickup_datetime") as "diff", to_char("tpep_pickup_datetime", 'day') as "day"
from "taxi"
group by "tpep_pickup_datetime", "tpep_dropoff_datetime") as table3
where "day" like 'sat%';



-- ●	The average number of trips on Sundays
select avg("no_vendorID"), "day_of_pickup"
from
(select count("VendorID") as "no_vendorID", to_char("tpep_pickup_datetime", 'day') as "day_of_pickup", "tpep_dropoff_datetime"
from "taxi"
group by "tpep_pickup_datetime", "tpep_dropoff_datetime"
order by 1 desc, 2 desc) as table1
where "day_of_pickup" like 'sun%'
group by "day_of_pickup";


-- ●	The average fare (fare_amount) per trip on Sundays

select avg("fare_amount") as "avg_fare_amount"
from
(select to_char("tpep_pickup_datetime", 'day') as "day", "fare_amount"
from "taxi"
group by "day", "fare_amount") as table2
where "day" like 'sun%';





