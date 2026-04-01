/*
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

with orders as (
  select
    order_id,
    customer_id,
    order_date
  from {{ref('stg_orders')}}
)

select
  o1.order_id,
  o1.customer_id,
  o1.order_date,

  (
    select count(*)
    from orders o2
    where o2.customer_id = o1.customer_id
      and o2.order_date < o1.order_date
      and o2.order_date >= date_sub(o1.order_date, interval 12 month)
  ) as orders_last_12m,

  case
    when (
      select count(*)
      from orders o2
      where o2.customer_id = o1.customer_id
        and o2.order_date < o1.order_date
        and o2.order_date >= date_sub(o1.order_date, interval 12 month)
    ) = 0 then 'New'

    when (
      select count(*)
      from orders o2
      where o2.customer_id = o1.customer_id
        and o2.order_date < o1.order_date
        and o2.order_date >= date_sub(o1.order_date, interval 12 month)
    ) between 1 and 3 then 'Returning'

    else 'VIP'
  end as segment

from orders o1