/*
this is the final fact table for orders that will
be used to expose measures and dimensions with
looker.
*/

SELECT o.order_date, 
  o.customer_id,
  s.segment AS order_segmentation,
  o.order_id,
  o.qty_product,
  o.net_sales
FROM {{ref('int_order_quantity')}} o
JOIN {{ref('int_customer_segment')}} s 
    USING(order_id)