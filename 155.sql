UPDATE titles
  SET pubdate = '2003-01-01'
  WHERE title_id IN
    (SELECT title_id
      FROM title_authors
      WHERE au_id IN
        (SELECT au_id
           FROM authors
           WHERE au_fname = 'Sarah'
             AND au_lname = 'Buchman'));
