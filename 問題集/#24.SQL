-- 以下の要件を満たす SQL を、必ず WITH句 を使って作成してください。

-- employees テーブルから、各部門（dept_id）ごとの平均給与（avg_salary）を計算

-- その平均給与を上回る従業員の emp_id、emp_name、salary、dept_id を取得


--回答1
WITH SALARY_AVG AS
(
SELECT 
    DEPT_ID,
    AVG(SALARY) AS SV
FROM EMPLOYEES
GROUP BY DEPT_ID
)
SELECT 
    E.EMP_ID,
    E.EMP_NAME,
    E.SALARY,
    E.DEPT_ID
FROM EMPLOYEES E
 INNER JOIN SALARY_AVG SA
    ON SA.DEPT_ID=E.DEPT_ID
    WHERE E.SALARY>SA.SV;



--回答２
SELECT 
 E1.*
 FROM EMPLOYEES E1
 WHERE E1.SALARY>
 (
 SELECT AVG(E2.SALARY)
 FROM EMPLOYEES E2
 WHERE E1.DEPT_ID=E2.DEPT_ID
 --GROUP BY E2.DEPT_ID
 );
