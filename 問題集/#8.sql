-- 問題
-- order_items と product_master を結合して、各商品ごとの売上額合計（quantity × unit_price の合計）を total_sales という別名で取得し、商品ID（prod_id）と商品名（prod_name）も合わせて取得する。

SELECT
  oi.prod_id,
  pm.prod_name,
  SUM(oi.quantity * oi.unit_price) AS total_sales
FROM order_items oi
JOIN product_master pm
  ON oi.prod_id = pm.prod_id
GROUP BY
  oi.prod_id,
  pm.prod_name;
