{{
    config(
        materialized = 'table',
        tags = ['gold', 'dimension']
    )
}}

with users as (
    select * from {{ ref('stg_users') }}
)

select
    user_id,
    first_name,
    last_name,
    concat(first_name, ' ', last_name) as full_name,
    user_email,
    user_age,
    user_gender,
    user_state,
    street_address,
    postal_code,
    city,
    country,
    latitude,
    longitude,
    traffic_source,
    created_at
from users
