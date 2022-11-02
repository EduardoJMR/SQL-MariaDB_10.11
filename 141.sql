SELECT pub_name
  FROM publishers
  WHERE pub_id IN
    (SELECT pub_id
      FROM titles
      WHERE type = 'biography');

