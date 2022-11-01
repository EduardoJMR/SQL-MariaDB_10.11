SELECT title_name,
       POSITION('u' IN title_name) AS "Pos"
  FROM titles
  WHERE POSITION('u' IN title_name)
        BETWEEN 1 AND 10
  ORDER BY POSITION('u' IN title_name) DESC;

SELECT title_name,
       LOCATE('u', title_name) AS "Pos"
  FROM titles
  WHERE LOCATE('u', title_name)
        BETWEEN 1 AND 10
  ORDER BY LOCATE('u', title_name) DESC;

