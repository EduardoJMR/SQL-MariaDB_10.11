SELECT
    type,
    SUM(sales)/COUNT(sales)
      		   AS "SUM/COUNT(sales)",
    SUM(sales)/COUNT(*)
      		   AS "SUM/COUNT(*)",
    AVG(sales)   AS "AVG(sales)"
  FROM titles
  GROUP BY type;
