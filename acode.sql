-- SECTION A NUMBER 1. Within the space of the last three years, what was the profit worth of the breweries,
-- inclusive of the anglophone and the francophone territories?

select "YEARS", sum("PROFIT") as "PROFIT_FOR_2017"
from "Brewery_data"
where "YEARS" = 2017
GROUP BY "YEARS";


select "YEARS", sum("PROFIT") as "PROFIT_FOR_2018"
from "Brewery_data"
where "YEARS" = 2018
GROUP BY "YEARS";

select "YEARS", sum("PROFIT") as "PROFIT_FOR_2019"
from "Brewery_data"
where "YEARS" = 2019
GROUP BY "YEARS";


select "YEARS", sum("PROFIT") as "PROFIT_FOR_2019"
from "Brewery_data"
where "YEARS" in (2017,2018,2019)
GROUP BY "YEARS";


-- SECTION A NUMBER 2. Compare the total profit between these two territories in order for the territory manager, Mr. Stone made a strategic decision that will aid profit maximization in 2020.
select *
from "Brewery_data";

select distinct "COUNTRIES"
from "Brewery_data";


select "TERRITORIES", sum ("PROFIT") as "TERRITORIAL_PROFIT"
from
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORIES"
from "Brewery_data") as "Table1"
group by "TERRITORIES";

-- SECTION A NUMBER 3. Country that generated the highest profit in 2019

select "COUNTRIES", sum("PROFIT") as "GRAND_PROFIT", "YEARS"
from "Brewery_data"
where "YEARS" = 2019
group by "COUNTRIES", "YEARS"
limit 1;

-- SECTION A NUMBER 4. Help him find the year with the highest profit.
select "YEARS", sum("PROFIT") as "NEW_PROFIT"
from "Brewery_data"
group by "YEARS" 
order by "NEW_PROFIT" desc
limit 1;

-- SECTION A NUMBER 5. Which month in the three years was the least profit generated?

select "MONTHS", sum("PROFIT") as "MONTH_THAT_GENERATED_LEAST_PROFIT_IN_3_YEARS"
from "Brewery_data"
group by "MONTHS" 
order by "MONTH_THAT_GENERATED_LEAST_PROFIT_IN_3_YEARS" asc
limit 1;

-- SECTION A NUMBER 6. What was the minimum profit in the month of December 2018?

select "MONTHS", "PROFIT" as "MINIMUM_PROFIT", "YEARS"
from "Brewery_data"
where "MONTHS" = 'December' and "YEARS" = 2018
order by "PROFIT" asc
limit 1;

-- SECTION A NUMBER 7. Compare the profit in percentage for each of the month in 2019

select "MONTHS", (sum("PROFIT")/sum("COST")*100) as "PERCENTAGE_FOR_EACH_MONTH_IN_2019"
from "Brewery_data"
where "YEARS" = 2019
group by "MONTHS"
order by "PERCENTAGE_FOR_EACH_MONTH_IN_2019";

-- SECTION A NUMBER 8. Which particular brand generated the highest profit in Senegal?

select "BRANDS", "PROFIT", "COUNTRIES"
from "Brewery_data"
where "COUNTRIES" = 'Senegal'
order by "PROFIT" desc
limit 1;


-- session B number 1. Within the last two years, the brand manager wants to know the top three brands consumed in the francophone countries

select distinct "COUNTRIES", "BRANDS", "YEARS", "QUANTITY"
from "Brewery_data"
where "COUNTRIES" 
in ('Benin','Senegal','Togo') 
and "YEARS" in (2017,2018)
order by "QUANTITY" desc
limit 3;

-- session B number 2. Find out the top two choice of consumer brands in Ghana

select "BRANDS", "COUNTRIES", "QUANTITY"
from "Brewery_data"
where "COUNTRIES" in ('Ghana')
order by "QUANTITY" desc
limit 2;

-- session B number3. Find out the details of beers consumed in the past three years in the most oil reached country in West Africa.

select distinct "BRANDS", sum ("QUANTITY") as "GRAND_QUANTITY"
from "Brewery_data"
where "COUNTRIES" = 'Nigeria' and "BRANDS" not in ('beta malt', 'grand malt')
group by "BRANDS";

-- section B number 4.  Favorites malt brand in Anglophone region between 2018 and 2019

-- section B no 4
select distinct "BRANDS", "COUNTRIES","YEARS"
from "Brewery_data"
where "COUNTRIES" in ('Ghana', 'Nigeria') 
and "YEARS" in ('2018', '2019')
and "BRANDS" in ('beta malt','grand malt')
group by "BRANDS", "COUNTRIES", "YEARS"
order by "BRANDS" desc
limit 10;


-- section B no 5
select distinct "BRANDS", sum ("QUANTITY") as "QUANTITIES","COUNTRIES" 
from  "Brewery_data"
where "YEARS" = 2019
and "COUNTRIES" = 'Nigeria'
group by "BRANDS", "YEARS", "COUNTRIES"
Order by "QUANTITIES"  desc
limit 1;


-- section B no 6
select "BRANDS", sum ("QUANTITY") as "GRAND_TOTAL"
from "Brewery_data"
where "REGION " = 'southsouth' and "COUNTRIES" = 'Nigeria'
group by "BRANDS"
order by "GRAND_TOTAL" desc
limit 1;


-- section B no 7
select distinct "BRANDS", "COUNTRIES"
from "Brewery_data"
where "COUNTRIES" = 'Nigeria'
and "BRANDS" not in ('beta malt','grand malt')
group by "BRANDS", "COUNTRIES"
order by "BRANDS" desc
limit 10;


-- selection B no 8
select distinct "REGION ", sum ("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Nigeria'
group by "REGION "
limit 20;


-- section B no 9
select distinct "REGION ", sum ("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "YEARS" = 2019
and "BRANDS" = 'budweiser'
and "COUNTRIES" = 'Nigeria'
group by "REGION ";

-- section C no 1
select distinct "COUNTRIES", sum ("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" 
not in ('beta malt', 'grand malt')
group by "COUNTRIES"
order by "QUANTITIES" desc
limit 1;


-- section C no 2
select distinct "SALES_REP", sum ("QUANTITY") as "QUANTITIES"
from "Brewery_data"
where "BRANDS" = 'budweiser'
AND "COUNTRIES" = 'Senegal'
group by "SALES_REP"
order by "QUANTITIES" desc
limit 1;


-- section c no 3
select  distinct "COUNTRIES", "PROFIT", "YEARS", "MONTHS"
from "Brewery_data"
where "MONTHS" in ('October','November','December')
and "YEARS" = 2019
order by "PROFIT" desc
limit 1;

-- section c: 1. Country with the highest consumption of beer. 2. Highest sales personnel of Budweiser in Senegal 3. Country with the highest profit of the fourth quarter in 2019

select *,
case when "MONTHS" in ('January', 'February', 'March') then 'Q1'
when "MONTHS" in ('April', 'May', 'June') then 'Q2'
when "MONTHS" in ('July', 'August', 'September') then 'Q3'
else 'Q4' end as "QUARTELY"
from "Brewery_data";

select "QUARTELY", sum("PROFIT") as "TOTAL_PROFIT"
from
(select *,
case when "MONTHS" in ('January', 'February', 'March') then 'Q1'
when "MONTHS" in ('April', 'May', 'June') then 'Q2'
when "MONTHS" in ('July', 'August', 'September') then 'Q3'
else 'Q4' end as "QUARTELY"
from "Brewery_data"
 where "YEARS" = 2019) as "Table2"
 group by "QUARTELY"
 order by "TOTAL_PROFIT" desc;
