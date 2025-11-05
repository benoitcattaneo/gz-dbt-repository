-- models/intermediate/int_sales_margin.sql
select
  products_id,
  date_date,
  orders_id,
  revenue,
  quantity,
  purchase_price,
  round(s.quantity * p.purchase_price, 2) as purchase_cost,
  round(s.revenue - s.quantity * p.purchase_price, 2) as margin
from  ref('stg_gz_raw_data__sales')  as s
left join  ref('stg_gz_raw_data__product')  as p
  using (products_id)

  