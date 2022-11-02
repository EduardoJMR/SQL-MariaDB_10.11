DROP TABLE IF EXISTS title_authors;
CREATE TABLE title_authors (
  title_id      CHAR(3)     ,
  au_id         CHAR(3)     ,
  au_order      SMALLINT    ,
  royalty_share DECIMAL(5,2)
);

