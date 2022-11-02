SELECT
    e1.emp_name AS "Employee name",
    e2.emp_name AS "Boss name"
FROM employees e1
INNER JOIN employees e2
  ON e1.boss_id = e2.emp_id;

