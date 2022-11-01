SELECT
    title_id,
    CASE
      WHEN sales IS NULL     THEN 'Unknown'
      WHEN sales <= 1000     THEN 'Not more than 1,000'
      WHEN sales <= 10000    THEN 'Between 1,001 and 10,000'
      WHEN sales <= 100000   THEN 'Between 10,001 and 100,000'
      WHEN sales <= 1000000  THEN 'Between 100,001 and 1,000,000'
      ELSE                        'Over 1,000,000'
    END
      AS "Sales category"
  FROM titles
  ORDER BY sales ASC
