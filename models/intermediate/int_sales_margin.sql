WITH sales AS (
  SELECT
    orders_id,
    products_id,
    quantity,
    revenue
  FROM  ref('stg_gz_raw_data__sales') 
),
product AS (
  SELECT
    products_id,
    purchase_price
  FROM  ref('stg_gz_raw_data__product') 
)
SELECT
  s.orders_id,
  s.products_id,
  s.quantity,
  s.revenue,
  p.purchase_price,
  s.quantity * p.purchase_price AS purchase_cost,
  s.revenue - (s.quantity * p.purchase_price) AS margin,
  SAFE_DIVIDE(
    s.revenue - (s.quantity * p.purchase_price),
    NULLIF(s.quantity * p.purchase_price, 0)
  ) AS margin_rate
FROM sales s
INNER JOIN product p
  ON p.products_id = s.products_id