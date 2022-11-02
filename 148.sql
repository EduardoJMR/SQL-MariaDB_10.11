INSERT INTO authors(
    au_id, au_fname, au_lname, phone)
  VALUES(
    'A11', 'Max', 'Allard', '212-502-0955');

SELECT * FROM authors WHERE au_id = 'A11'

