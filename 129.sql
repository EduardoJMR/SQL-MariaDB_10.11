SELECT a.au_fname, a.au_lname, p.pub_name
  FROM authors a
  LEFT OUTER JOIN publishers p
    ON a.city = p.city
UNION DISTINCT
SELECT a.au_fname, a.au_lname, p.pub_name
  FROM authors a
  RIGHT OUTER JOIN publishers p
    ON a.city = p.city 
ORDER BY pub_name ASC,
    au_lname ASC, au_fname ASC ;
