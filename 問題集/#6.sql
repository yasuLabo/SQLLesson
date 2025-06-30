-- 問題
-- -- order_items、product_master を結合して、「注文ID（order_id）」「商品名（prod_name）」「数量（quantity）」「単価（unit_price）」を取得し、数量が 100 個以上の注文のみ抽出する。
SELECT
  oi.order_id,
  pm.prod_name,
  oi.quantity,
  pm.unit_price
FROM order_items oi
JOIN product_master pm
  ON oi.prod_id = pm.prod_id
WHERE
  oi.quantity >= 100;
