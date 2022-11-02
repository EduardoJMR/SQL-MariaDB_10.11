DROP TABLE IF EXISTS royalties ;
CREATE TABLE royalties (
  title_id CHAR(3) NOT NULL,
  advance DECIMAL(9,2),
  royalty_rate DECIMAL(5,2),
  CONSTRAINT royalties_pk PRIMARY KEY (title_id),
  CONSTRAINT royalties_title_id_fk
    FOREIGN KEY (title_id)
    REFERENCES titles(title_id)
);

