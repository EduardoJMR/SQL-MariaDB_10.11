SELECT t1.title_id, t1.sales,
    t2.title_id AS "Better seller",
    t2.sales AS "Higher sales"
  FROM titles t1
  INNER JOIN titles t2
    ON t1.sales < t2.sales
  WHERE t1.type = 'biography'
    AND t2.type = 'biography'
  ORDER BY t1.title_id ASC, t2.sales ASC;

