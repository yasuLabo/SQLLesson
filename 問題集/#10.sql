-- 問題
-- employees テーブルで、部署（dept_id）ごとに給与（salary）の高い順にランクをつけた結果を取得する。返す列は社員ID（emp_id）、氏名（emp_name）、部署ID（dept_id）、給与（salary）、および salary_rank（ランク）。
SELECT
  emp_id,
  emp_name,
  dept_id,
  salary,
  RANK() OVER (
    PARTITION BY dept_id
    ORDER BY salary DESC
  ) AS salary_rank
FROM employees;
