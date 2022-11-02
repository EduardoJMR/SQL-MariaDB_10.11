DROP TABLE IF EXISTS titles ;
CREATE TABLE titles (
  title_id   CHAR(3)      NOT NULL                     ,
  title_name VARCHAR(40)  NOT NULL DEFAULT ''          ,
  type       VARCHAR(10)           DEFAULT 'undefined' ,
  pub_id     CHAR(3)      NOT NULL                     ,
  pages      INTEGER               DEFAULT NULL        ,
  price      DECIMAL(5,2) NOT NULL DEFAULT 0.00        ,
  sales      INTEGER                                   ,
  pubdate    DATE                  DEFAULT CURRENT_DATE,
  contract   SMALLINT     NOT NULL DEFAULT 0
);

