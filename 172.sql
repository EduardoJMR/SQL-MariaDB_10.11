DROP TABLE IF EXISTS authors ;
CREATE TABLE authors (
  au_id    CHAR(3)     NOT NULL,
  au_fname VARCHAR(15) NOT NULL,
  au_lname VARCHAR(15) NOT NULL,
  phone    VARCHAR(12)         ,
  address  VARCHAR(20)         ,
  city     VARCHAR(15)         ,
  state    CHAR(2)             ,
  zip      CHAR(5)             ,
  CONSTRAINT authors_pk
    PRIMARY KEY (au_id),
  CONSTRAINT authors_unique1
    UNIQUE (au_fname, au_lname)
);

