/*
this simply takes the data from the joined table
made and filters it for 2023. I kept
3 decimal places for percision in any downstream
tasks, even though you can't have a part of a product
in a real order.
*/

select format_date('%Y-%m', order_date) as month,
  round(avg(qty_product), 3) as average_quantity
from {{ref('product_quantity')}}
where order_date >= '2023-01-01'
    and order_date < '2024-01-01'
group by month
order by month