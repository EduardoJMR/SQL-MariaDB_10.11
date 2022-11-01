SELECT
    title_id,
    pubdate
  FROM titles
  WHERE YEAR(pubdate)
          BETWEEN 2001 AND 2002
    AND MONTH(pubdate)
          BETWEEN 1 AND 6
  ORDER BY pubdate DESC;

