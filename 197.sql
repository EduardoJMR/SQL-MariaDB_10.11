SELECT
   name, test,
   lag(score) OVER (partition by test order BY score DESC)
     AS prev,
   score,
   lead(score) OVER (partition by test order BY score DESC)
     AS next
FROM test_scores;

