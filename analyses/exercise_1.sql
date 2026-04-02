/*
counts the number of orders in year 2023 by
applying a date filter.
*/

SELECT COUNT(*) AS total_orders
FROM {{ref('int_order_quantity')}}
WHERE order_date >= '2023-01-01'
    AND order_date < '2024-01-01'