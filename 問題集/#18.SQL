-- 18. ROLLUP を使った部署別＋全社平均給与の集計
-- departments と employees を結合し、部署ごとの平均給与と、最後に全社平均給与をまとめて取得するクエリを作成してください。以下の要件を満たしてください。

-- dept_id

-- dept_name

-- avg_salary（各部署平均もしくは全社平均）

-- GROUP BY ROLLUP(dept_id, dept_name) を使うこと


WITH ROLLUP_AVG AS 
(
SELECT 
    D.DEPT_ID,
    ROUND(AVG(E.SALARY),0) AS AVG_SALARY
FROM DEPARTMENTS D
    INNER JOIN EMPLOYEES E
        ON D.DEPT_ID=E.DEPT_ID
    GROUP BY ROLLUP(D.DEPT_ID)
)
SELECT 
    COALESCE(TO_CHAR(R.DEPT_ID),'合計行') AS DEPT_CODE,
    CASE WHEN R.DEPT_ID IS NULL 
        THEN '合計行' 
        ELSE D.DEPT_NAME END,
        AVG_SALARY
FROM 
    ROLLUP_AVG R
LEFT JOIN DEPARTMENTS D 
    ON R.DEPT_ID=D.DEPT_ID;