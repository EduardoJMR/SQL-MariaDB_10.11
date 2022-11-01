SELECT
    au_fname,
    LOCATE('e', au_fname) AS "Pos e",
    au_lname,
    LOCATE('ma', au_lname) AS "Pos ma"
  FROM authors;

