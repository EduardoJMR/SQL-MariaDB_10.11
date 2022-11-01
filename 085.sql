SELECT
    SUM(price) AS "Total price",
    SUM(sales) AS "Total sales",
    SUM(price * sales) AS "Total revenue"
  FROM titles;
