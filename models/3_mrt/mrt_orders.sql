{{ config(materialized='table')}}



with order_details as (
    select order_id, SUM(quantity*list_price*(1-discount)) as order_price
    from {{ref('intermediate_orders')}} 
    group by order_id

)

select *
from order_details
order by order_id
