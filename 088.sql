SELECT title_id, sales
  FROM titles
  WHERE sales >
        (SELECT AVG(sales) FROM titles)
  ORDER BY sales DESC;
