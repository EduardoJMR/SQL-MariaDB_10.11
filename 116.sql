SELECT
    t.title_id,
    t.title_name,
    t.pub_id,
    p.pub_name
  FROM titles t
  INNER JOIN publishers p
    ON p.pub_id = t.pub_id
  ORDER BY t.title_name ASC;

