-- 15. CTE（WITH句）を用いた部署ごとの平均給与との差分抽出

-- employees テーブルから、以下の列を取得する SELECT 文を作成してください。

-- emp_id

-- emp_name

-- dept_id

-- salary

-- dept_avg_salary（各部署の平均給与）

-- 要件：

-- WITH句（CTE）を使って、まず部署ごとの平均給与を計算します。

-- その結果を employees テーブルと結合し、各社員の行に部署平均給与 (dept_avg_salary) を紐づけてください。



WITH dept_avg AS (
  SELECT
    dept_id,
    AVG(salary) AS dept_avg_salary
  FROM employees
  GROUP BY dept_id
)
SELECT
  e.emp_id,
  e.emp_name,
  e.dept_id,
  e.salary,
  da.dept_avg_salary
FROM employees e
JOIN dept_avg da
  ON da.dept_id = e.dept_id;
