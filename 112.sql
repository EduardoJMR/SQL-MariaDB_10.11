SELECT
    title_id,
    pub_id,
    pub_name
  FROM publishers
  NATURAL JOIN titles;

SELECT t.title_id, t.pub_id,
    p.pub_name
  FROM publishers p
  INNER JOIN titles t
    ON p.pub_id = t.pub_id;
