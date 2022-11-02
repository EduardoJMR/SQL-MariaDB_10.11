SELECT au_id, authors.city
  FROM authors
  INNER JOIN publishers
    ON authors.city = publishers.city;

