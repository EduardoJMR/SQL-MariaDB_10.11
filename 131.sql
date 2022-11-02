SELECT a.au_id, a.au_fname, a.au_lname
  FROM authors a
  LEFT OUTER JOIN title_authors ta
    ON a.au_id = ta.au_id
  WHERE ta.au_id IS NULL;

