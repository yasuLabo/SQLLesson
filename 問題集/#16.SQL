-- 16. 月別売上推移と前月比（LAG 関数）
-- orders と order_items を結合し、以下の列を返す SELECT 文を作成してください。

-- year_month：注文日 (order_date) を 'YYYY-MM' 形式で切り出したもの

-- monthly_sales：当月の売上合計（quantity * unit_price の合計）

-- prev_month_sales：前月の売上合計（monthly_sales を LAG() で取得）

-- diff：売上差分（monthly_sales - prev_month_sales）

-- rate：売上増減率（(monthly_sales - prev_month_sales)/prev_month_sales * 100 を小数点第2位まで丸めたもの）


WITH monthly AS (
  SELECT
    TO_CHAR(o.order_date, 'YYYY-MM') AS year_month,
    SUM(oi.quantity * oi.unit_price) AS monthly_sales
  FROM orders o
  JOIN order_items oi
    ON o.order_id = oi.order_id
  GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
)
SELECT
  year_month,
  monthly_sales,
  LAG(monthly_sales) OVER (ORDER BY year_month)         AS prev_month_sales,
  monthly_sales 
    - LAG(monthly_sales) OVER (ORDER BY year_month)      AS diff,
  ROUND(
    (monthly_sales 
       - LAG(monthly_sales) OVER (ORDER BY year_month)
    )
    / NULLIF(
        LAG(monthly_sales) OVER (ORDER BY year_month),
        0
      )
    * 100,
    2
  )                                                      AS rate
FROM monthly
ORDER BY year_month;

