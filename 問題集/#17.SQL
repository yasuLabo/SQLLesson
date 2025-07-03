-- 17. アンチ結合／NOT EXISTS
-- departments テーブルから、社員が一人も所属していない部署を抽出してください。返す列は以下の通りです。

-- dept_id

-- dept_name

-- ポイント：

-- NOT EXISTS を使う方法

-- あるいは LEFT JOIN と WHERE e.dept_id IS NULL を使う方法


--解1
SELECT
  d.dept_id,
  d.dept_name
FROM departments d
WHERE NOT EXISTS (
  SELECT 1
  FROM employees e
  WHERE e.dept_id = d.dept_id
);

--解2
SELECT
  d.dept_id,
  d.dept_name
FROM departments d
LEFT JOIN employees e
  ON e.dept_id = d.dept_id
WHERE e.dept_id IS NULL;
