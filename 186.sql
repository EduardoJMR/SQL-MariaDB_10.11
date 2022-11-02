SELECT name, test, score,
  AVG(score) OVER (PARTITION BY test) AS avgtest
FROM test_scores;
