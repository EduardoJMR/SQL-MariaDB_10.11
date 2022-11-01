SELECT au_fname, au_lname, zip
  FROM authors
  WHERE zip NOT BETWEEN '20000' AND '89999';

