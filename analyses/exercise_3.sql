/*
The average is calculated for each month to 
3 decimal places to maintain precision for any
potential downstream tasks. I used format_date()
because it's slightly easier to read.
*/

SELECT format_date('%Y-%m', order_date) AS month,
  round(avg(qty_product), 3) AS average_quantity,
FROM {{ref('int_order_quantity')}}
WHERE order_date >= '2023-01-01'
    AND order_date < '2024-01-01'
GROUP BY month
ORDER BY month



