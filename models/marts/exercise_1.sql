/*
counts the number of orders in year 2023 by
applying a date filter.
*/
select count(*)
from {{ref('product_quantity')}}
where order_date >= '2023-01-01'
    and order_date < '2024-01-01'