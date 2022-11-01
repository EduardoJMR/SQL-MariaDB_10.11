SELECT title_id,
       price,
       0.10 AS "Discount",
       price * (1 - 0.10) AS "New price"
  FROM titles;
