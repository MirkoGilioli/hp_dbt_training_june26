{{
    config(
        materialized = 'table',
        tags = ['gold', 'dimension']
    )
}}

with orders as (
    select * from {{ ref('stg_orders') }}
)

select
    order_id,
    user_id,
    status,
    gender,
    created_at,
    returned_at,
    shipped_at,
    delivered_at,
    num_of_item
from orders
