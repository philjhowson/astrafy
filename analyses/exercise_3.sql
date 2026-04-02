/*
Then the average is calculated for each month to 
3 decimal places to maintain precision for any
potential downstream tasks.
*/

select format_date('%Y-%m', order_date) as month,
  round(avg(qty_product), 3) as average_quantity,
from {{ref('int_order_quantity')}}
where order_date >= '2023-01-01'
    and order_date < '2024-01-01'
group by month
order by month



