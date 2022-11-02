DROP TABLE IF EXISTS titles ;
CREATE TABLE titles (
  title_id   CHAR(3) NOT NULL PRIMARY KEY,
  title_name VARCHAR(40)  NOT NULL,
  type       VARCHAR(10),
  pub_id     CHAR(3)      NOT NULL
		REFERENCES publishers(pub_id) ,
  pages      INTEGER,
  price      DECIMAL(5,2),
  sales      INTEGER,
  pubdate    DATE,
  contract   SMALLINT NOT NULL
);

