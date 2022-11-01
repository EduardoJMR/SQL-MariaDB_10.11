SELECT
    title_id,
    type,
    price,
    CASE 
      WHEN type = 'history'
        THEN price * 1.10
      WHEN type = 'psychology'
        THEN price * 1.20
      ELSE price
    END
      AS "New price"
  FROM titles
  WHERE price is NOT NULL
  ORDER BY type ASC, title_id ASC;

