/*
Simple staging area for some column renames.
*/

select date_date as order_date,
  customers_id as customer_id,
  orders_id as order_id,
  net_sales
from {{ source('astrafy','orders') }}