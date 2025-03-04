{{ config(materialized='view')}}

select *
from {{source('local_bike','staffs')}}
