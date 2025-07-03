-- 問題26（改）
-- orders テーブルから、顧客ごとの注文件数 (order_count) を算出し、
-- 注文件数が 1 件のみ の顧客数を region ごとに集計せよ。





--回答1 
WITH ORDER_COUNT AS
(
	SELECT  CUST_ID
	       ,COUNT(*) AS CC
	FROM ORDERS
	GROUP BY  CUST_ID
)
SELECT  C.REGION
       ,COUNT(*)
FROM CUSTOMERS C
INNER JOIN ORDER_COUNT OC
ON C.CUST_ID = OC.CUST_ID
WHERE OC.CC = '1'
GROUP BY  C.REGION
;

--回答2 
SELECT  REGION
       ,COUNT(*)
FROM
(
	SELECT  C.CUST_ID
	       ,C.REGION
	       ,C.CUST_NAME
	       ,COUNT(*)OVER(PARTITION BY C.CUST_ID) AS ORDER_COUNT
	FROM ORDERS O
	INNER JOIN CUSTOMERS C
	ON O.CUST_ID = C.CUST_ID
)
WHERE ORDER_COUNT >= 2
GROUP BY REGION;