WITH source as (
    SELECT * FROM {{ source('looker_ecommerce_source', 'products') }}
),

renamed AS (
    SELECT
        id AS product_id,
        category,
        name,
        brand,
        department,
        sku,
        distribution_center_id,
        ROUND(cost, 2) AS cost,
        ROUND(retail_price, 2) AS retail_price
    FROM
        source
)

SELECT * FROM renamed
