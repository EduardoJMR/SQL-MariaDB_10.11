SELECT DISTINCT pub_name
  FROM publishers p
  INNER JOIN titles t
    ON p.pub_id = t.pub_id
  WHERE t.type = 'biography';

