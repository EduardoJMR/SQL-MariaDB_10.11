SELECT
    COUNT(DISTINCT price)
      AS "COUNT(DISTINCT)",
    SUM(DISTINCT price)
      AS "SUM(DISTINCT)",
    AVG(DISTINCT price)
      AS "AVG(DISTINCT)"
  FROM titles;
