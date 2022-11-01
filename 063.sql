SELECT au_lname,
       TRIM(LEADING 'H' FROM au_lname)
         AS "Trimmed name"
  FROM authors;
