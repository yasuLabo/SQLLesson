-- 問題
-- -- customers テーブルから、入会日（join_date）が 2025-01-01 以降の顧客の顧客ID（cust_id）、氏名（cust_name）、入会日（join_date）を取得する。
SELECT
  cust_id,
  cust_name,
  join_date
FROM customers
WHERE join_date >= DATE '2025-01-01';
