SELECT
    type,
    COUNT(price) AS "COUNT(price)",
    AVG(price * sales) AS "AVG revenue"
  FROM titles
  GROUP BY type
  HAVING AVG(price * sales) > 1000000;

