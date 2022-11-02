SELECT
    a.au_id,
    a.au_fname,
    a.au_lname,
    a.city,
    a.state
  FROM authors a
  INNER JOIN publishers p
    ON a.city = p.city
    AND a.state = p.state
  ORDER BY a.au_id ASC;
