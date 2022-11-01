SET sql_mode := 'PIPES_AS_CONCAT';
SELECT CAST(sales AS CHAR(7))
       || ' copies sold of title '
       || title_id
         AS "Biography sales"
  FROM titles
  WHERE type = 'biography'
    AND sales IS NOT NULL
  ORDER BY sales DESC;

