DROP TABLE IF EXISTS title_authors ;
CREATE TABLE title_authors (
  title_id      CHAR(3)      NOT NULL,
  au_id         CHAR(3)      NOT NULL,
  au_order      SMALLINT     NOT NULL,
  royalty_share DECIMAL(5,2) NOT NULL,
  CONSTRAINT title_authors_pk
    		PRIMARY KEY (title_id, au_id),
  CONSTRAINT title_authors_fk1
    		FOREIGN KEY (title_id)
    		REFERENCES titles(title_id),
  CONSTRAINT title_authors_fk2
    		FOREIGN KEY (au_id)
    		REFERENCES authors (au_id)
);

