SELECT
    COUNT(title_id) AS "COUNT(title_id)",
    COUNT(price) AS "COUNT(price)",
    COUNT(*) AS "COUNT(*)"
  FROM titles
  WHERE price IS NOT NULL;

