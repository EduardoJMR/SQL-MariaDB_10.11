SELECT
    pub_id,
    city,
    COALESCE(state, 'N/A') AS "state",
    country
  FROM publishers;

