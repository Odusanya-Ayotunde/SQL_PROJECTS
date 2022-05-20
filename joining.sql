--to join 3 tables together

SELECT *
from "region"
join "orders"
on region.id = orders.id;

select *
from "accounts"
join "web_events"
on accounts.id = web_events.id
join "sales_reps"
on web_events.id = sales_reps.id;
