CREATE VIEW cities
  (au_id, au_city, pub_id, pub_city)
  AS
  SELECT a.au_id, a.city, p.pub_id, p.city
    FROM authors a
    INNER JOIN publishers p
      ON a.city = p.city;

