SELECT
    t.title_id,
    t.title_name,
    r.advance
  FROM royalties r
  INNER JOIN titles t
    ON r.title_id = t.title_id
  WHERE t.type = 'biography'
    AND r.advance IS NOT NULL
  ORDER BY r.advance DESC;
