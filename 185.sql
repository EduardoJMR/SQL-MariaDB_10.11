DROP TABLE IF EXISTS test_scores ;
CREATE TABLE IF NOT EXISTS test_scores (
  name varchar(20),
  test varchar(20),
  score tinyint
);

INSERT INTO test_scores VALUES
  ("Steve", "SQL", 75),
  ("Robert", "SQL", 43),
  ("Tracy", "SQL", 56),
  ("Tatiana", "SQL", 87),
  ("Steve", "Tuning", 83),
  ("Robert", "Tuning", 31),
  ("Tracy", "Tuning", 88),
  ("Tatiana", "Tuning", 83);

