/*
This is used to generate order history for users in 2023 and assign each
order 'new', 'returning', 'VIP'.
*/

WITH orders AS (
  SELECT
    order_id,
    customer_id,
    date(order_date) AS order_date
  FROM {{ref('stg_orders')}}
),

history AS (
  SELECT
    o1.*,

    (
      SELECT count(*)
      FROM orders o2
      WHERE o2.customer_id = o1.customer_id
        AND o2.order_date < o1.order_date
        AND o2.order_date >= date_sub(o1.order_date, INTERVAL 12 MONTH)
    ) AS orders_last_12m

  FROM orders o1
)

SELECT
  *,
  CASE
    WHEN orders_last_12m = 0 THEN 'New'
    WHEN orders_last_12m BETWEEN 1 AND 3 THEN 'Returning'
    ELSE 'VIP'
  END AS segment
FROM history