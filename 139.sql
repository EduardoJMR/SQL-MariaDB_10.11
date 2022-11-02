SELECT DISTINCT pub_id
  FROM titles
  WHERE type = 'biography';

SELECT pub_name
  FROM publishers
  WHERE pub_id IN ('P01', 'P03');

