/*
Question #3:
this simply takes the data from the joined table
made in question_4 and filters it for 2023.
*/

select format_date('%Y-%m', order_date) as month,
  round(avg(qty_product), 3) as average_quantity
from {{ref('product_quantity')}}
where date_date >= '2023-01-01' -- filter for 2023
  and date_date <  '2024-01-01'
group by month
order by month