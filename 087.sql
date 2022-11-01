SELECT AVG(sales) AS "AVG(sales)",
       SUM(sales) AS "SUM(sales)"
  FROM titles
  WHERE type = 'history';

