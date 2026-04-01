/*
This is completed in customer_segment, although
it still requires a where filter to get the
selected date range.
*/

select *
from {{ref('customer_segment')}}
where order_date >= '2023-01-01'
    and order_date < '2024-01-01'