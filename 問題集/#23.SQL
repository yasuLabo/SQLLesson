-- パーセンタイルって、難しそうに聞こえるけど、要するに「みんなを小さい順に並べて、100等分したときの位置だよ」ということなんだ。たとえば…

-- 百人組手ならぬ十人テストで考えてみよう
-- テストの点数が１０人分あるとするよ。点数を小さい順に並べると：

-- コピーする
-- 編集する
-- 55, 60, 62, 68, 70, 75, 80, 85, 90, 95
-- 50パーセンタイル（中央値）は、下から５番目・上から５番目の点。ちょうど真ん中だから 70点。

-- 90パーセンタイル は、下から９番目の点。つまり 90点。

-- 「90点より低い人が全体の90％いるよ」という意味。

-- PERCENT_RANK() の数字の見方
-- Oracle の PERCENT_RANK() は、このパーセンタイルを０〜１の数に直してくれる。たとえば：

-- 一番点数が低い人 → 0.00

-- 真ん中（70点）の人 → 0.44（(5–1)/(10–1)）

-- 上から２番目（90点）の人 → 0.89（(9–1)/9）

-- 一番高い人 → 1.00

-- ここで「上位10％の人」を取りたければ、

-- パーセンタイルでいう 90パーセンタイル以上

-- PERCENT_RANK() >= 0.9 とすれば OK！

-- たったこれだけだよ。みんなを並べて、100等分した90より上（上位10％）を取るイメージ。難しく考えず、 “100人並んだときに上から10人目まで” を取るようなもの、と思っておくと分かりやすいはず！





WITH SALES AS
(
 SELECT 
    PM.PROD_ID,
    PM.PROD_NAME,
    SUM(OI.QUANTITY*OI.UNIT_PRICE) AS TOTAL_SALES
 FROM PRODUCT_MASTER PM
    INNER JOIN ORDER_ITEMS OI
        ON PM.PROD_ID=OI.PROD_ID
    GROUP BY PM.PROD_ID,PM.PROD_NAME
),
RANKED AS
(
SELECT
    S.*,
    PERCENT_RANK()
        OVER(ORDER BY S.TOTAL_SALES) AS SALES_RANK
        FROM SALES S
)
SELECT 
    PROD_ID,
    PROD_NAME,
    TOTAL_SALES
FROM RANKED
WHERE SALES_RANK >=0.9
ORDER BY TOTAL_SALES;


