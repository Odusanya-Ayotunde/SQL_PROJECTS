select *
from "Brewery_data";

select "BRANDS","PLANT_COST"
from "Brewery_data"
where "PLANT_COST"=150;

select *
from "Brewery_data";

select "COUNTRIES","PROFIT","QUANTITY"
from "Brewery_data"
order by "PROFIT" desc, "QUANTITY" asc;