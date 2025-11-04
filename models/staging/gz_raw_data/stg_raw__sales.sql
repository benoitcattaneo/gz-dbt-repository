with 

source as (

    select * from {{ source('gz_raw_data', 'sales') }}
),
renamed AS (
  SELECT
    date_date,
    orders_id,
    pdt_id AS products_id,
    revenue,
    quantity
  FROM source
)
SELECT *
FROM renamed
