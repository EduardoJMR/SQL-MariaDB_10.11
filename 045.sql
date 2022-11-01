SELECT pub_id, city, state, country
  FROM publishers
  WHERE state <> 'CA'
     OR state IS NULL;

