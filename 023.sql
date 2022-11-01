SELECT au_fname, au_lname, city, state
  FROM authors
  WHERE (state = 'NY')
     OR (state = 'CO')
     OR (city = 'San Francisco');

SELECT au_fname, au_lname, city, state
  FROM authors
  WHERE state in ('NY', 'CO') OR city='San Francisco';
