SELECT price, AVG(sales)
  FROM titles
  WHERE price IS NOT NULL
  GROUP BY price
  ORDER BY price ASC;

