SELECT
    title_id,
    pub_id,
    pub_name,
    advance
  FROM publishers
  NATURAL JOIN titles
  NATURAL JOIN royalties
  WHERE advance < 20000;

SELECT t.title_id, t.pub_id,
    p.pub_name, r.advance
  FROM publishers AS p
  INNER JOIN titles AS t
    ON p.pub_id = t.pub_id
  INNER JOIN royalties AS r
    ON t.title_id = r.title_id
  WHERE r.advance < 20000;

