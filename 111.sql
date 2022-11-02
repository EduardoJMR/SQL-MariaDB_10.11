SELECT
    au_id,
    pub_id,
    a.state AS "au_state",
    p.state AS "pub_state"
  FROM authors a
  CROSS JOIN publishers p
  ORDER BY au_id, pub_id;

