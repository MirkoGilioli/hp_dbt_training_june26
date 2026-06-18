WITH source as (
    SELECT * FROM {{ source('looker_ecommerce_source', 'orders') }}
)
,
renamed AS (
    SELECT
        order_id,
        user_id,
        status,
        gender,
        created_at,
        returned_at,
        shipped_at,
        delivered_at,
        num_of_item
    FROM
        source
)

SELECT * FROM renamed
