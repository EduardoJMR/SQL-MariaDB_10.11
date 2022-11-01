SELECT type,
         type = 'history' AS "Hist?",
         type = 'biography' AS "Bio?",
         price,
         price < 20 AS "<20?"
    FROM titles;

