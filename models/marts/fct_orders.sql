/*
this is the final fact table for orders that will
be used to expose metrics and dimensions with
looker.
*/

select o.order_date, 
  o.customer_id,
  s.segment as order_segmentation,
  o.order_id,
  o.qty_product,
  o.net_sales
from {{ref('int_order_quantity')}} o
join {{ref('int_customer_segment')}} s 
    using(order_id)
where order_date between '2022-01-01'
    and '2023-12-31'