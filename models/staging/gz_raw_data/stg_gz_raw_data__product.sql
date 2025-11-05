-- models/staging/gz_raw_data/stg_gz_raw_data__product.sql
 config(alias='stg_raw_data__product') 

with source as (
  select *
  from  source('gz_raw_data', 'product') 
),
renamed as (
  select
    products_id,
    cast(purchase_price as float64) as purchase_price
  from source
)
select *
from renamed