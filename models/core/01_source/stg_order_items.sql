{{
    config(
        materialized='table',
        tags='order_items'
    )
}}


WITH source AS (
    SELECT * FROM {{ source('looker_ecommerce_source', 'order_items') }}
) 
,
renamed AS (
    SELECT
        id AS order_item_id,
        order_id,
        user_id,
        product_id,
        inventory_item_id,
        status,
        created_at,
        returned_at,
        shipped_at,
        delivered_at,
        ROUND(sale_price, 2) AS sale_price
    FROM
        source
)

SELECT * FROM renamed
