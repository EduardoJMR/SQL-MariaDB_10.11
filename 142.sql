SELECT au_id, city
  FROM authors
  WHERE city IN
    (SELECT city FROM publishers);

SELECT DISTINCT a.au_id, a.city
  FROM authors a
  INNER JOIN publishers p
    ON a.city = p.city;

