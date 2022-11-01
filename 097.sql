SELECT
    state,
    COUNT(state) AS "COUNT(state)",
    COUNT(*)     AS "COUNT(*)"
  FROM publishers
  GROUP BY state;
