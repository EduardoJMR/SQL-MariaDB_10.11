SELECT
  AVG(COALESCE(sales, 0)) AS AvgSales
  FROM titles
  WHERE type = 'biography';
