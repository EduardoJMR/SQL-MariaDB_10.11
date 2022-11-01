SELECT
    type,
    SUM(sales)   AS "SUM(sales)",
    AVG(sales)   AS "AVG(sales)",
    COUNT(sales) AS "COUNT(sales)"
  FROM titles
  WHERE price >= 13
  GROUP BY type
  ORDER BY SUM(sales) DESC;
