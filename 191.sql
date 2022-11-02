SELECT
  dense_rank() OVER (order BY score DESC) AS pos,
  name, test, score
FROM test_scores;

