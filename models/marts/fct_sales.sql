/*
this is a fact table for sales that has the net_sales
removed. I removed it so that the metrics will be
consistently taken from one source. The main point of this
table is so that detailed product analytics can be
performed in looker after exposing measures from this table. 
*/

SELECT order_date,
  customer_id,
  order_id,
  product_id,
  qty
FROM {{ref('stg_sales')}}