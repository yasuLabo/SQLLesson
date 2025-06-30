-- 問題
-- employees と departments を結合し、社員氏名（emp_name）と所属部署名（dept_name）を取得する。
SELECT
  e.emp_name,
  d.dept_name
FROM employees e
JOIN departments d
  ON e.dept_id = d.dept_id;
