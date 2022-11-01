SELECT SUM(sales)
         AS "Total sales (2000 books)"
  FROM titles
  WHERE pubdate
  BETWEEN '2000-01-01' AND '2000-12-31';
