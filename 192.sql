SELECT
  row_number() OVER (partition by test order BY score DESC)
  AS pos,
  name, test, score
FROM test_scores;

