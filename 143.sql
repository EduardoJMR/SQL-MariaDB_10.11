SELECT au_id, au_fname, au_lname
  FROM authors
  WHERE au_id NOT IN
     (SELECT au_id FROM title_authors);

SELECT au_id, au_fname, au_lname
  FROM authors a
  WHERE NOT EXISTS
    (SELECT *
      FROM title_authors ta
      WHERE a.au_id = ta.au_id);

SELECT a.au_id, a.au_fname, a.au_lname
  FROM authors a
  LEFT OUTER JOIN title_authors ta
    ON a.au_id = ta.au_id
  WHERE ta.au_id IS NULL;

