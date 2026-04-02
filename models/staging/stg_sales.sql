/*
Simple staging area for some column renames.
*/

select date_date as order_date,
  customer_id,
  order_id,
  products_id as product_id,
  net_sales,
  qty
from {{source('astrafy','sales')}}