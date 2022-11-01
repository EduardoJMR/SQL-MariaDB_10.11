SET sql_mode := 'PIPES_AS_CONCAT';
SELECT
    price
      AS "price(DECIMAL)",
    CAST(price AS INTEGER)
      AS "price(INTEGER)",
    '<' || CAST(price AS CHAR(8)) || '>'
      AS "price(CHAR(8))"
  FROM titles;
