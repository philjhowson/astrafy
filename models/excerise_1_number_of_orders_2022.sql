/*
counts the number of orders in year 2022 by
applying a date filter.
*/
select count(*)
from {{ source('astrafy','orders') }}
where date_date >= '2022-01-01' -- query for year 2022
  and date_date < '2023-01-01'