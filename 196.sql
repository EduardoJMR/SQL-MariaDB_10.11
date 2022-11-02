SELECT
   name, test,
   lag(score) OVER (partition by test order BY score DESC)
     AS prev,
   score
FROM test_scores;

