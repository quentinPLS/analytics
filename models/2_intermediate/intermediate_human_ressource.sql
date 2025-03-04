{{ config(materialized='view')}}

with employee_per_store as (
    select 
        staff_id,
        store_id,
    from {{ref('stg_human_ressource')}}
    where active = 1
)

select *
from employee_per_store