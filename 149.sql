INSERT INTO publishers
  SELECT
      pub_id, pub_name, city, state, country
    FROM new_publishers
    WHERE city = 'Los Angeles';

