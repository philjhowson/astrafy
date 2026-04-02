/*
here, I basically join the results for 5, taking only
the segment column as order_segmentation and joining
with the orders table.
*/

select o.order_date, 
  o.customer_id,
  s.segment as order_segmentation,
  o.order_id,
  o.net_sales
from {{ref('int_order_quantity')}} o
left join {{ref('int_customer_segment')}} s
  using(order_id)
where o.order_date >= '2023-01-01'
    and o.order_date < '2024-01-01'