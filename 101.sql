SELECT
    pub_id,
    type,
    COUNT(title_id) AS count
  FROM titles
  GROUP BY pub_id, type
  ORDER BY pub_id ASC, count DESC;

