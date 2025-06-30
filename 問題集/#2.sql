-- employees テーブルから給与（salary）が 50,000 以上の社員の社員ID（emp_id）、氏名（emp_name）、給与（salary）を取得する。
SELECT
  emp_id,
  emp_name,
  salary
FROM employees
WHERE salary >= 50000;
