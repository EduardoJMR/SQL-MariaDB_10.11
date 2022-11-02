SELECT
    a.au_id,
    COUNT(ta.title_id) AS "Num books"
  FROM authors a
  INNER JOIN title_authors ta
    ON a.au_id = ta.au_id
  GROUP BY a.au_id
  ORDER BY a.au_id ASC;

