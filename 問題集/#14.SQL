-- 14. CASE 式による分類
-- employees テーブルから、以下の列を取得する SELECT 文を作成してください。

-- emp_id

-- emp_name

-- salary

-- salary_grade（新規列）

-- salary_grade は CASE 式を使い、給与 (salary) が

-- 70,000 以上 → 'High'

-- 50,000 以上 70,000 未満 → 'Medium'

-- それ以外（50,000 未満） → 'Low'



SELECT 
    EMP_ID,
    EMP_NAME,
    SALARY,
    CASE WHEN SALARY>=400000
        THEN 'High'
        WHEN SALARY >=300000 AND SALARY<400000
        THEN 'Medium'
        ELSE 'Low' END AS SALARY_GRADE
    FROM EMPLOYEES;