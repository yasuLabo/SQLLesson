-- 12. 相関サブクエリ
-- customers テーブルから、各顧客が最後に行った注文の日付を last_order_date という別名で取得してください。

-- 返す列：cust_id、cust_name、last_order_date

-- last_order_date はサブクエリ内で orders テーブルを参照し、当該顧客の最大注文日（MAX(order_date)）を取得するようにしてください。


--補足例①：相関サブクエリを SELECT 句で書く方法
SELECT
  c.cust_id,
  c.cust_name,
  (
    SELECT MAX(o.order_date)
    FROM orders o
    WHERE o.cust_id = c.cust_id
  ) AS last_order_date
FROM customers c;
--こちらは JOIN を使わず、customers の各行に対してサブクエリで注文日の最大値を紐づけます。


--補足例②：注文がない顧客も含めたい場合
SELECT
  c.cust_id,
  c.cust_name,
  MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
  ON c.cust_id = o.cust_id
GROUP BY
  c.cust_id,
  c.cust_name;
--LEFT JOIN＋GROUP BY で、まだ注文のない顧客は last_order_date が NULL になります。