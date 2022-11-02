DELETE FROM title_authors
  WHERE title_id IN
    (SELECT title_id
      FROM titles
      WHERE pub_id IN ('P01', 'P04'));

