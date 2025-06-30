-- 問題
-- orders と customers を結合し、「顧客名（cust_name）」「注文ID（order_id）」「注文日（order_date）」を、注文日の降順で取得する。
SELECT
  c.cust_name,
  o.order_id,
  o.order_date
FROM customers c
JOIN orders o
  ON c.cust_id = o.cust_id
ORDER BY
  o.order_date DESC;
