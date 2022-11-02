SELECT name, test, score,
  AVG(score) OVER (PARTITION BY test) AS avgtest,
  AVG(score) OVER (PARTITION BY name) AS avgname
FROM test_scores;

