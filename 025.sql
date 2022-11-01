SELECT pub_id, pub_name, state, country
  FROM publishers
  WHERE (state = 'CA')
     OR (state <> 'CA');

SELECT pub_id, pub_name, state, country
  FROM publishers
  where state IS NOT NULL;

