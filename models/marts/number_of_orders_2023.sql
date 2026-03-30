/*
Question #1:
counts the number of orders in year 2023 by
applying a date filter.
*/
select count(*)
from {{ ref('stg_orders') }}
where order_date >= '2023-01-01' -- query for year 2023
  and order_date < '2024-01-01'