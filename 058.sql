SET sql_mode := 'PIPES_AS_CONCAT';
SELECT SUBSTR(au_fname, 1, 1)
       || '. '
       || au_lname
         AS "Author name",
       state
  FROM authors
  WHERE state IN ('NY', 'CO');

