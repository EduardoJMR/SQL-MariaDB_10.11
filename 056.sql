SET sql_mode := 'PIPES_AS_CONCAT';
SELECT au_id, au_fname, au_lname
  FROM authors
  WHERE au_fname || ' ' || au_lname
        = 'Klee Hull';

