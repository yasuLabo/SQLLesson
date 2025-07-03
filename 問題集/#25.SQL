-- 問題24-改（WITH句必須）
-- employees テーブルの各従業員について、

-- 部門（dept_id）ごとの平均給与を算出し、

-- 各従業員の給与との差分（salary - avg_salary）を diff_from_avg として表示、

-- 結果を dept_id, emp_id, emp_name, salary, diff_from_avg の順で取得し、

-- diff_from_avg の降順でソート


--回答1
WITH SALARY_AVG AS
(
SELECT 
    DEPT_ID,
    AVG(SALARY) AS SALARY
FROM EMPLOYEES
GROUP BY DEPT_ID
)
SELECT 
    E.DEPT_ID,
    E.EMP_ID,
    E.EMP_NAME,
    E.SALARY,
    (E.SALARY-SA.SALARY)
FROM EMPLOYEES E
    INNER JOIN SALARY_AVG SA
     ON E.DEPT_ID=SA.DEPT_ID;
--WHERE E.SALARY>SA.SALARY;

--回答2
SELECT
    DEPT_ID
    EMP_ID,
    EMP_NAME,
    SALARY,
    SALARY
        -AVG(SALARY)OVER(PARTITION BY DEPT_ID) AS DIFF
FROM EMPLOYEES
ORDER BY DIFF DESC;
