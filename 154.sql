UPDATE titles
  SET sales = sales * 0.5
  WHERE sales >
    (SELECT AVG(sales)
      FROM titles);

