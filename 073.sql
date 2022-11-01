SELECT
    CAST(sales AS CHAR(8))
    || ' copies sold of '
    || CAST(title_name AS CHAR(20))
      AS "History and biography sales"
  FROM titles
  WHERE sales IS NOT NULL
    AND type IN ('history', 'biography')
  ORDER BY sales DESC;

