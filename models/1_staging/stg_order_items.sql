{{ config(materialized='table')}}


select *
from {{source('local_bike','order-items')}}
order by order_id
