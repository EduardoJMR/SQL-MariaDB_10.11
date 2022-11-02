SELECT
    ta.title_id,
    COUNT(ta.au_id) AS "authors"
  FROM authors a
  INNER JOIN title_authors ta
    ON a.au_id = ta.au_id
  GROUP BY ta.title_id
  HAVING COUNT(ta.au_id) > 1
  ORDER BY ta.title_id ASC;

