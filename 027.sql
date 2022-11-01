SELECT title_name, sales, price
  FROM titles
  WHERE NOT (price < 20)
     AND (sales > 15000);

