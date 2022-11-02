SELECT
    t.title_id,
    t.title_name,
    p.state,
    p.country
  FROM titles t
  INNER JOIN publishers p
    ON t.pub_id = p.pub_id
  WHERE p.state = 'CA'
    OR p.country NOT IN
      ('USA', 'Canada', 'Mexico')
  ORDER BY t.title_id ASC;
