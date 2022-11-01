SELECT title_id,
       price,
       sales,
       price * sales AS Revenue
  FROM titles
  ORDER BY Revenue DESC;

