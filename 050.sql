SELECT title_id,
       price * sales AS "Revenue"
  FROM titles
  WHERE type = 'biography'
  ORDER BY "Revenue" DESC;

