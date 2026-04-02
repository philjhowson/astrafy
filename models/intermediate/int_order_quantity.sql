/*
CTE for readability, but it basically just takes
every order and groups them by id and sums how
many products are ordered in total for this order.
*/

WITH product_quantity AS (
  SELECT order_id,
    sum(qty) AS qty_product
  FROM {{ref('stg_sales')}}
  GROUP BY order_id
)

/*
this joins the product_quantity table to the
orders table to get the total order quantity
for each order as a column.
*/

SELECT o.order_date, 
  o.customer_id,
  o.order_id,
  p.qty_product,
  o.net_sales
FROM {{ref('stg_orders')}} o
LEFT JOIN product_quantity p
  ON o.order_id = p.order_id