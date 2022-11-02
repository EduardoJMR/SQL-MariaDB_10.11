SELECT a.au_fname, a.au_lname, p.pub_name
  FROM authors a
  FULL OUTER JOIN publishers p
    ON a.city = p.city
  ORDER BY p.pub_name ASC,
    a.au_lname ASC, a.au_fname ASC;
