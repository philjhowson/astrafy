/*
I tkae the segment column as order_segmentation
and join with the orders table. Filtered on date.
*/

SELECT o.order_date, 
  o.customer_id,
  s.segment AS order_segmentation,
  o.order_id,
  o.net_sales
FROM {{ref('int_order_quantity')}} o
LEFT JOIN {{ref('int_customer_segment')}} s
  USING(order_id)
WHERE o.order_date >= '2023-01-01'
    AND o.order_date < '2024-01-01'