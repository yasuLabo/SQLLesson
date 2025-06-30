-- 問題
-- employees テーブルから、全社員の平均給与より高い給与をもらっている社員の社員ID（emp_id）、氏名（emp_name）、給与（salary）を取得する（サブクエリを使用）。
SELECT
  emp_id,
  emp_name,
  salary
FROM employees
WHERE salary > (
  SELECT AVG(salary)
  FROM employees
);
