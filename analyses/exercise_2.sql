/*
Sum number of products orders are calculated for
each month.
*/

select format_date('%Y-%m', order_date) as month,
  sum(qty_product) as total_quantity,
from {{ref('int_order_quantity')}}
where order_date >= '2023-01-01'
    and order_date < '2024-01-01'
group by month
order by month