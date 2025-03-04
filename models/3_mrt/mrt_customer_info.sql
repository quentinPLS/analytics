{{ config(materialized='table') }}

WITH order_detail AS (
    SELECT 
        order_id, 
        customer_id, 
        SUM(quantity * list_price * (1 - discount)) AS order_price
    FROM {{ ref('intermediate_orders') }} 
    GROUP BY order_id, customer_id
),

total_order_client AS (
    SELECT 
        customer_id, 
        COUNT(DISTINCT order_id) AS order_count, 
        SUM(order_price) AS total_depense 
    FROM order_detail
    GROUP BY customer_id
)

SELECT *
FROM total_order_client
ORDER BY customer_id ASC
