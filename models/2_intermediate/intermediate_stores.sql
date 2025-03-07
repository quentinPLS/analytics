{{ config(materialized='table')}}


with order_items as (
    select 
    orderitems.order_id,
    stores.store_id,
    stores.store_name,
    orderitems.year_order,
    orderitems.item_id,
    orderitems.product_id,
    orderitems.quantity,
    orderitems.list_price,
    orderitems.discount


    from {{ref('intermediate_orders')}} as orderitems
    full join {{ref('stg_stores')}} as stores
    on stores.store_id = orderitems.store_id
)

,SUM_per_order as (
    select order_id, store_name, year_order, SUM(quantity*list_price*(1-discount)) as order_price
    from order_items
    group by order_id, store_name, year_order

)

,SUM_per_store as (
    select store_name, year_order, COUNT(order_id) as yearly_order, SUM(order_price) as CA_total, AVG(order_price) as mean_order
    from SUM_per_order
    group by store_name, year_order

)


select *
from SUM_per_store
order by store_name, year_order
