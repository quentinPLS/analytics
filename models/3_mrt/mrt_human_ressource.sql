{{ config(materialized='table')}}

with count_employee as (

    select 
        count(staff_id) as staff_count , store_id as store
    from {{ref('intermediate_human_ressource')}}
    group by (store_id)
)


select *
from count_employee
order by (store) ASC
