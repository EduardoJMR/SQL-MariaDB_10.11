DROP TABLE IF EXISTS publishers ;
CREATE TABLE publishers (
  pub_id   CHAR(3)     PRIMARY KEY,
  pub_name VARCHAR(20) NOT NULL   ,
  city     VARCHAR(15) NOT NULL   ,
  state    CHAR(2)                ,
  country  VARCHAR(15) NOT NULL
);


DROP TABLE IF EXISTS publishers ;
CREATE TABLE publishers (
  pub_id   CHAR(3)     NOT NULL,
  pub_name VARCHAR(20) NOT NULL,
  city     VARCHAR(15) NOT NULL,
  state    CHAR(2)             ,
  country  VARCHAR(15) NOT NULL,
  PRIMARY KEY (pub_id)
);

DROP TABLE IF EXISTS publishers ;
CREATE TABLE publishers (
  pub_id   CHAR(3)     NOT NULL,
  pub_name VARCHAR(20) NOT NULL,
  city     VARCHAR(15) NOT NULL,
  state    CHAR(2)             ,
  country  VARCHAR(15) NOT NULL,
  CONSTRAINT publishers_pk PRIMARY KEY (pub_id)
  );
