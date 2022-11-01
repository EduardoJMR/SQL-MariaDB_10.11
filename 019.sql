SELECT title_name,
       price * sales AS "Revenue"
  FROM titles
  WHERE price * sales > 1000000;
