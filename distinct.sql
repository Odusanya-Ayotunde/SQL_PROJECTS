select * from "orders" limit 10;

select *
from "orders"
join "accounts"
on orders.account_id = accounts.id
limit 40;

select r.name "region_name", a.name "accounts_name", s.id "sales_rep_id", (o.poster_amt_usd - o.total) as "difference total"
from "region" r
join "orders" o
on r.id = o.id
join "accounts" a
on o.account_id = a.id
join "sales_reps" s
on a.sales_rep_id = s.id;

select r.name "region_name", a.name "accounts_name", o.standard_qty, (o.total_amt_usd/o.total) as "Unit_price"
from "region" r
join "orders" o
on r.id = o.id
join "accounts" a
on o.account_id = a.id
join "sales_reps" s
on a.sales_rep_id = s.id
where o.standard_qty > 100;

select distinct a.name "account_name", a.id "account_id", w.channel "channel"
from "accounts" a
join "web_events" w
on a.id = w.account_id
where a.id = 1001;