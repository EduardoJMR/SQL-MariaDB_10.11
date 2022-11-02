SELECT 
    au_id,
    COUNT(*) AS "num_books"
  FROM title_authors
  GROUP BY au_id
  HAVING COUNT(*) >= 3;

