SELECT
    t.title_id,
    t.title_name,
    r.advance,
    t.price * t.sales AS "Revenue"
  FROM titles t
  INNER JOIN royalties r
    ON t.price * t.sales > r.advance * 10
    AND t.title_id = r.title_id
  ORDER BY t.price * t.sales DESC;

