DROP TABLE IF EXISTS titles; 
CREATE TABLE titles (
  title_id   CHAR(3)     ,
  title_name VARCHAR(40) ,
  type       VARCHAR(10) ,
  pub_id     CHAR(3)     ,
  pages      INTEGER     ,
  price      DECIMAL(5,2),
  sales      INTEGER     ,
  pubdate    DATE        ,
  contract   SMALLINT
);

