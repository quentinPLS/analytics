{{ config(materialized='table')}}


with order_items as (
    select 
    orderitems.order_id,
    orders.customer_id,
    orders.order_status,
    orders.order_date,
    orders.required_date,
    orders.shipped_date,
    orders.store_id,
    orders.staff_id,
    orderitems.item_id,
    orderitems.product_id,
    orderitems.quantity,
    orderitems.list_price,
    orderitems.discount,


    from {{ref('stg_order_items')}} as orderitems
    full join {{ref('stg_orders')}} as orders
    on orders.order_id = orderitems.order_id
)


select *
from order_items
