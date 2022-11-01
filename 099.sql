SELECT
    type,
    SUM(sales)   AS "SUM(sales)",
    AVG(sales)   AS "AVG(sales)",
    COUNT(sales) AS "COUNT(sales)"
  FROM titles
  GROUP BY type;

