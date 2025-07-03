-- 11. HAVING 句
-- -- employees テーブルと departments テーブルを結合し、部署（dept_id、dept_name）ごとに平均給与（AVG(salary)）を avg_salary という別名で取得し、その平均給与が 60000 以上の部署のみを抽出するSELECT文を作成してください。（GROUP BY と HAVING を使用）
SELECT
  dt.dept_id,
  dt.dept_name,
  AVG(et.salary) AS avg_salary
FROM employees et
JOIN departments dt
  ON et.dept_id = dt.dept_id
GROUP BY
  dt.dept_id,
  dt.dept_name
HAVING
  AVG(et.salary) >= 60000;
