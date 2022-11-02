INSERT INTO publishers(
    pub_id, pub_name, city, state, country)
  SELECT
      pub_id, pub_name, city, state, country
    FROM new_publishers
    WHERE country <> 'USA';

