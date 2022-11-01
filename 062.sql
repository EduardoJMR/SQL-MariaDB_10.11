SET sql_mode := 'PIPES_AS_CONCAT';
SELECT
  '<' || '  AAA  ' || '>'
    AS "Untrimmed",
  '<' || TRIM(LEADING FROM '  AAA  ') || '>'
    AS "Leading",
  '<' || TRIM(TRAILING FROM '  AAA  ') || '>'
    AS "Trailing",
  '<' || TRIM('  AAA  ') || '>'
     AS "Both" ;

