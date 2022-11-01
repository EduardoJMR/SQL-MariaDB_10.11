SELECT au_fname, au_lname, phone
  FROM authors
  WHERE phone NOT LIKE '212-___-____'
    AND phone NOT LIKE '415-___-%'
    AND phone NOT LIKE '303-%';

