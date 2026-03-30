/*
returns the segmentation of clients for
2023.
*/

select *
from {{ref('order_history')}}