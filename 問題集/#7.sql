-- 問題
-- customers テーブルを地域（region）ごとにグループ化し、各地域の顧客数を customer_count という別名で取得する。
SELECT
  region,
  COUNT(*) AS customer_count
FROM customers
GROUP BY
  region;
