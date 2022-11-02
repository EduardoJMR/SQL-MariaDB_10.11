SELECT au_id, au_fname, au_lname, state
  FROM authors
  WHERE state IN
    (SELECT state
      FROM authors
      WHERE au_id = 'A04');

SELECT a1.au_id, a1.au_fname,
    a1.au_lname, a1.state
  FROM authors a1
  INNER JOIN authors a2
    ON a1.state = a2.state
  WHERE a2.au_id = 'A04';

