/*
Creates an intermediate table with the quantity
of products for each order for downstream use.
*/

with product_quantity as (
  select order_id,
    sum(qty) as qty_product
  from {{ source('astrafy','sales') }}
  group by order_id
)

/*
joins product_quantity and orders tables to yeild the number of
products per order for every order from 2022-2023. I applied
a date filter for this because the question asks for 2022-2023,
even though the data only goes from 2022-2023 because of
theoretical cases where orders from 2021 or after 2023 are
later added.
*/

select o.date_date, 
  o.customers_id,
  o.orders_id,
  p.qty_product,
  o.net_sales
from {{source('astrafy', 'orders')}} o
join product_quantity p
  on o.orders_id = p.order_id
where o.date_date >= '2022-01-01'
  and o.date_date < '2024-01-01'