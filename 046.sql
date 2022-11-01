SELECT title_id, type, pubdate
  FROM titles
  WHERE type = 'biography'
    AND pubdate IS NOT NULL;

