SELECT
    a1.au_fname, a1.au_lname,
    a2.au_fname, a2.au_lname
  FROM authors a1
  INNER JOIN authors a2
    ON a1.state = a2.state
    AND a1.au_id <> a2.au_id
  WHERE a1.state = 'NY'
  ORDER BY a1.au_id ASC, a2.au_id ASC;
