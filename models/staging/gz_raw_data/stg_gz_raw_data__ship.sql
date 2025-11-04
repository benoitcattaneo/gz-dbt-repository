with 

source as (

    select * from {{ source('gz_raw_data', 'ship') }}

),
renamed AS (
  SELECT
    orders_id,
    shipping_fee,
    SAFE_CAST(ship_cost AS FLOAT64) AS ship_cost
  FROM source
)
SELECT *
FROM renamed
-- LIMIT 1000 