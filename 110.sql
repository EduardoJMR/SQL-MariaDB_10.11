SELECT au_fname, au_lname, a.city
  FROM authors a
  INNER JOIN publishers p
    ON a.city = p.city;

SELECT au_fname, au_lname, a.city
  FROM authors a, publishers p
  WHERE a.city = p.city;
