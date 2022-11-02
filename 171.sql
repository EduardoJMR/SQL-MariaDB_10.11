DROP TABLE IF EXISTS titles ;
CREATE TABLE titles (
  title_id   CHAR(3)      NOT NULL,
  title_name VARCHAR(40)  NOT NULL,
  type       VARCHAR(10)          ,
  pub_id     CHAR(3)      NOT NULL,
  pages      INTEGER              ,
  price      DECIMAL(5,2)         ,
  sales      INTEGER              ,
  pubdate    DATE                 ,
  contract   SMALLINT     NOT NULL,
  CONSTRAINT titles_pk
    PRIMARY KEY (title_id),
  CONSTRAINT titles_unique1 UNIQUE (title_name)
);

