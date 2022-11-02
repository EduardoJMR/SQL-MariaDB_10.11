SELECT
    type,
    SUM(sales),
    AVG(price)
  FROM titles
  WHERE pub_id IN ('P03', 'P04')
  GROUP BY type
  HAVING SUM(sales) > 10000
     AND AVG(price) < 20;
