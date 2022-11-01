SET sql_mode := 'PIPES_AS_CONCAT';
SET sql_mode := 'PIPES_AS_CONCAT';
SELECT 'Title '
  || title_name
  || ' published on '
  || pubdate
  AS "Biography sales"
  FROM titles
  WHERE type = 'biography' AND pubdate IS NOT NULL
  ORDER BY pubdate DESC;

