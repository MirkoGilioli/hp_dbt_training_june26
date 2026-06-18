{{
    config(
        materialized = 'table',
        tags = ['gold', 'dimension']
    )
}}

with products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    category,
    name as product_name,
    brand,
    department,
    sku,
    distribution_center_id,
    cost,
    retail_price
from products
