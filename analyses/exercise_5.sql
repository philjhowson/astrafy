/*
This is completed in customer_segment, although
it still requires a filter to get the
selected date range.
*/

select *
from {{ref('int_customer_segment')}}
where order_date >= '2023-01-01'
    and order_date < '2024-01-01'