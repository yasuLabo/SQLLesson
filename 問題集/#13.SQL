-- 13. トップNの抽出（ROW_NUMBER）
-- employees と departments を結合し、各部署（dept_id）ごとに給与（salary）が最も高い社員の以下の列を取得する SELECT 文を作成してください。

-- dept_id

-- dept_name

-- emp_id

-- emp_name

-- salary



--1
SELECT
  dept_id,
  dept_name,
  emp_id,
  emp_name,
  salary
FROM (
  SELECT
    e.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name,
    e.salary,
    ROW_NUMBER() OVER (
      PARTITION BY e.dept_id
      ORDER BY e.salary DESC
    ) AS rn
  FROM employees e
  JOIN departments d
    ON e.dept_id = d.dept_id
) sub
WHERE sub.rn = 1;



--2
WITH ranked AS (
  SELECT
    e.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name,
    e.salary,
    ROW_NUMBER() OVER (
      PARTITION BY e.dept_id
      ORDER BY e.salary DESC
    ) AS rn
  FROM employees e
  JOIN departments d
    ON e.dept_id = d.dept_id
)
SELECT
  dept_id,
  dept_name,
  emp_id,
  emp_name,
  salary
FROM ranked
WHERE rn = 1;

