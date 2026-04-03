/*
Sums number of products orders are calculated for
each month.
*/

SELECT format_date('%Y-%m', order_date) AS month,
  sum(qty_product) AS total_quantity,
FROM {{ref('int_order_quantity')}}
WHERE order_date >= '2023-01-01'
    AND order_date < '2024-01-01'
GROUP BY month
ORDER BY month