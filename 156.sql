UPDATE titles
  SET pub_id =
    (SELECT pub_id
      FROM publishers
      WHERE pub_name = 'Abatis Publishers')
  WHERE pub_id = 
    (SELECT pub_id
      FROM publishers
      WHERE pub_name = 'Tenterhooks Press');

