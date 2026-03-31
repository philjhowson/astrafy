/*
Creates an intermediate table with the quantity
of products for each order for downstream use.
*/

with product_quantity as (
  select order_id,
    sum(quantity) as qty_product
  from {{ref('stg_sales')}}
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

select o.order_date, 
  o.customer_id,
  o.order_id,
  p.qty_product,
  o.net_sales
from {{ref('stg_orders')}} o
left join product_quantity p
  on o.order_id = p.order_id
where order_date >= '2022-01-01'
    and order_date < '2024-01-01'