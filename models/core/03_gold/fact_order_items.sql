{{
    config(
        materialized = 'table',
        tags = ['gold', 'fact']
    )
}}

with order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    oi.order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,
    oi.inventory_item_id,
    oi.status,
    oi.created_at,
    oi.returned_at,
    oi.shipped_at,
    oi.delivered_at,
    oi.sale_price,
    p.cost as product_cost,
    round(oi.sale_price - p.cost, 2) as gross_profit
from order_items oi
left join products p on oi.product_id = p.product_id
