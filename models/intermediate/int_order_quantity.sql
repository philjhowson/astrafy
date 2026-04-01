/*
CTE for readability, but it basically just takes
every order and groups them by id and sums how
many products are ordered in total for this order.
*/

with product_quantity as (
  select order_id,
    sum(qty) as qty_product
  from {{ref('stg_sales')}}
  group by order_id
)

/*
this joins the product_quantity table to the
orders table to get the total order quantity
for each order as a column.
*/

select o.order_date, 
  o.customer_id,
  o.order_id,
  p.qty_product,
  o.net_sales
from {{ref('stg_orders')}} o
left join product_quantity p
  on o.order_id = p.order_id