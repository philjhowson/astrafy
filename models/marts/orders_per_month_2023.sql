/*
Question #2:
extracts each month in 2023 as month and groups
orders by month and counts them. Returns
the counts by month in order. I used format_date()
here because it's a slightly more readable output,
instead of extract.
*/

select format_date('%Y-%m', order_date) as month,
  count(*) as total_orders
from {{ref('stg_orders')}}
where order_date >= '2023-01-01'
  and order_date < '2024-01-01'
group by month
order by month