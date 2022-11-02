SELECT
    t.type,
    t.pub_id,
    COUNT(r.advance) AS "COUNT",
    SUM(r.advance) AS "advance"
  FROM royalties r
  INNER JOIN titles t
    ON r.title_id = t.title_id
  WHERE r.advance IS NOT NULL
  GROUP BY t.type, t.pub_id
  ORDER BY t.type ASC, t.pub_id ASC;

