SELECT
    a.au_id,
    a.au_fname,
    a.au_lname,
    ta.title_id
  FROM authors a
  INNER JOIN title_authors ta
    ON a.au_id = ta.au_id
  ORDER BY a.au_id ASC, ta.title_id ASC;

SELECT a.au_id, a.au_fname,
    a.au_lname, ta.title_id
  FROM authors a, title_authors ta
  WHERE a.au_id = ta.au_id
  ORDER BY a.au_id ASC,
    ta.title_id ASC;

