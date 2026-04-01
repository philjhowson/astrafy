/*
this is a fact table for sales that has been filtered
for 2023. The main point of this table is so that
detailed product analytics can be performed in looker
after exposing measures from this table. 
*/

select order_date,
  customer_id,
  order_id,
  product_id,
  qty
from {{ref('stg_sales')}}
where order_date between '2023-01-01'
    and '2023-12-31'