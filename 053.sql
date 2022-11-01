SET sql_mode := 'PIPES_AS_CONCAT';
SELECT au_fname || ' ' || au_lname
         AS "Author name"
  FROM authors
  ORDER BY au_lname ASC, au_fname ASC;
