/*
Simple staging area for some column renames.
*/

SELECT date_date AS order_date,
  customer_id,
  order_id,
  products_id AS product_id,
  net_sales,
  qty
FROM {{source('astrafy','sales')}}