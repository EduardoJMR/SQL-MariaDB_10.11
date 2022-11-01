SELECT au_fname, au_lname, state
  FROM authors
  WHERE NOT (state = 'CA');

SELECT au_fname, au_lname, state
  FROM authors
  WHERE state <> 'CA';

