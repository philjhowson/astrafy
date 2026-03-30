/*
Question #5:
This is used to generate order history for users in 2023 and assign each
order the following details:

New: it's the 1st order of the customer (client_id) in the past 12 months.
In the 12 months prior to this order, the customer did not place any orders.

Returning: it's between the 2nd and the 4th order of the customer in the
past 12 months. In the 12 months prior to this order, the customer had
already placed between 1 and 3 orders

VIP: it's the 5th or more order of the customer in the past 12 months. In
the 12 months prior to this order, the customer had already placed at
least 4 orders or more
*/

with orders_2023 as (
  select *
  from {{ref('stg_orders')}}
  where order_date >= '2023-01-01'
    and order_date < '2024-01-01'
),

history as (
  select
    o1.order_id,
    o1.customer_id,
    o1.order_date,
    count(o2.orders_id) as orders_last_12m
  from orders_2023 o1
  left join {{ref('stg_orders')}} o2
    on o1.customers_id = o2.customers_id
    and o2.order_date < o1.order_date
    and o2.order_date >= date_sub(o1.order_date, interval 12 month)
  group by o1.order_id, o1.customer_id, o1.order_date
)

select
  *,
  case
    when orders_last_12m = 0 then 'New'
    when orders_last_12m between 1 and 3 then 'Returning'
    else 'VIP'
  end as order_segmentation

from history