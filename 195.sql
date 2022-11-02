SELECT
   name, test, score,
   lead(score) OVER (partition by test order BY score DESC)
     AS next
FROM test_scores;

