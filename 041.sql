SELECT title_id, advance
  FROM royalties
  WHERE advance IN
        (0.00, 1000.00, 5000.00);

