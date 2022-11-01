SELECT title_id, type, price
  FROM titles
  WHERE  (type  = 'history'
     OR  type  = 'biography')
     AND price < 20;

