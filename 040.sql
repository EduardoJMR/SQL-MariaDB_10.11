SELECT au_fname, au_lname, state
  FROM authors
  WHERE state NOT IN ('NY', 'NJ', 'CA');

