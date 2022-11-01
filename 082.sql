SELECT MAX(price * sales)
         AS "Max history revenue"
  FROM titles
  WHERE type = 'history';

