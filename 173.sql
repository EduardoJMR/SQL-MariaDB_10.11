DROP TABLE IF EXISTS titles ;
CREATE TABLE titles
  (
  title_id   CHAR(3)      NOT NULL,
  title_name VARCHAR(40)  NOT NULL,
  type       VARCHAR(10) ,
  pub_id     CHAR(3)      NOT NULL,
  pages      INTEGER
    CHECK (pages > 0)             ,
  price      DECIMAL(5,2)         ,
  sales      INTEGER              ,
  pubdate    DATE                 ,
  contract   SMALLINT     NOT NULL,

  CONSTRAINT pk_titles PRIMARY KEY (title_id),

  CONSTRAINT title_id_chk
    CHECK (
      (SUBSTR(title_id, 1, 1) = 'T')
    AND 
      (CAST(SUBSTR(title_id, 2, 2)
    AS SIGNED) BETWEEN 0 AND 99)),

  CONSTRAINT price_chk
    CHECK (price >= 0.00
      AND price < 100.00),

  CONSTRAINT sales_chk
    CHECK (sales >= 0), 

  CONSTRAINT pubdate_chk
    CHECK (pubdate >= '1950-01-01'),

  CONSTRAINT title_name_chk
    CHECK (title_name <> ''
      AND contract >= 0)
  );

ALTER TABLE titles ADD CONSTRAINT
  fk_titles_pub_id FOREIGN KEY (pub_id)
  references publishers(pub_id);
