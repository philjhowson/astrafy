/*
This is completed in customer_segment, although
it still requires a filter to get the selected
date range.
*/

SELECT *
FROM {{ref('int_customer_segment')}}
WHERE order_date >= '2023-01-01'
    AND order_date < '2024-01-01'