WITH source AS (
    SELECT * FROM {{ source('looker_ecommerce_source', 'users') }}
),

renamed AS (
    SELECT
        cast(id AS int64) AS user_id,
        cast(first_name AS string) AS first_name,
        cast(last_name AS string) AS last_name,
        cast(email AS string) AS user_email,
        cast(age AS int64) AS user_age,
        cast(gender AS string) AS user_gender,
        cast(state AS string) AS  user_state,
        street_address,
        postal_code,
        city,
        country,
        latitude,
        longitude,
        traffic_source,
        created_at
    FROM
      source
)

SELECT * FROM renamed
