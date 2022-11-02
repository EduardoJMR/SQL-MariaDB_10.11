SELECT
    t.title_id,
    t.type,
    t.sales
  FROM titles AS t
  WHERE sales >=
    (SELECT AVG(sales)
      FROM titles AS av
      WHERE av.type = t.type);

