SELECT au_fname, au_lname, phone
  FROM authors
  WHERE SUBSTR(phone, 1, 3)='415';

