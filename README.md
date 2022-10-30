# SQL-MariaDB_10.11

###### Version 2, June 1991 
###### Copyright (C) 1989, 1991 Free Software Foundation, Inc

### Datasets

<h6> CREATE TABLE authors (
 au_id CHAR(3) NOT NULL,
 au_fname VARCHAR(15) NOT NULL,
 au_lname VARCHAR(15) NOT NULL,
 phone VARCHAR(12) ,
 address VARCHAR(20) ,
 city VARCHAR(15) ,
 state CHAR(2) ,
 zip CHAR(5) ,
 CONSTRAINT authors_pk
 PRIMARY KEY (au_id),
 CONSTRAINT authors_unique1
 UNIQUE (au_fname, au_lname)); </h6>
 
<h6>INSERT INTO authors(au_id,au_fname,au_lname,phone,address,city,state,zip)
 values ('A07','Paddy',"O'Furniture",'941-925-0752','1442 Main St','Sarasota','FL','34236'); </h6>

<h6>CREATE TABLE publishers (
 pub_id CHAR(3) NOT NULL,
 pub_name VARCHAR(20) NOT NULL,
 city VARCHAR(15) NOT NULL,
 state CHAR(2) ,
 country VARCHAR(15) NOT NULL,
 CONSTRAINT publishers_pk PRIMARY KEY (pub_id)); </h6>

<h6>INSERT INTO publishers (pub_id,pub_name,city,state,country)
values ('P04','Tenterhooks Press','Berkeley','CA','USA');</h6>

<h6>CREATE TABLE titles(
 title_id CHAR(3) NOT NULL,
 title_name VARCHAR(40) NOT NULL,
 type VARCHAR(10) ,
 pub_id CHAR(3) NOT NULL,
 pages INTEGER
 CHECK (pages > 0) ,
 price DECIMAL(5,2) ,
 sales INTEGER ,
 pubdate DATE ,
 contract SMALLINT NOT NULL,
 CONSTRAINT pk_titles PRIMARY KEY (title_id),
 CONSTRAINT title_id_chk
 CHECK (
  (SUBSTR(title_id, 1, 1) = 'T')
  AND (CAST(SUBSTR(title_id, 2, 2) AS SIGNED) BETWEEN 0 AND 99)),
 CONSTRAINT price_chk CHECK (price >= 0.00 AND price < 100.00),
 CONSTRAINT sales_chk CHECK (sales >= 0),
 CONSTRAINT pubdate_chk CHECK (pubdate >= '1950-01-01'),
 CONSTRAINT title_name_chk CHECK (title_name <> ''AND contract >= 0));</h6>
 
<h6> INSERT INTO titles (title_id,title_name,type,pub_id,pages,price,sales,pubdate,contract)
 values ('T13',"What Are The Civilian Applications?",'history','P03','802','29.99','10467','1999-05-31','1');</h6>
 
 <h6>CREATE TABLE title_authors (
 title_id CHAR(3) NOT NULL,
 au_id CHAR(3) NOT NULL,
 au_order SMALLINT NOT NULL,
 royalty_share DECIMAL(5,2) NOT NULL,
 CONSTRAINT title_authors_pk
 PRIMARY KEY (title_id, au_id),
 CONSTRAINT title_authors_fk1
 FOREIGN KEY (title_id)
 REFERENCES titles(title_id),
 CONSTRAINT title_authors_fk2
 FOREIGN KEY (au_id)
 REFERENCES authors (au_id));</h6>
 
<h6>INSERT INTO title_authors (title_id,au_id,au_order,royalty_share)
 values ('T13','A01',1,1.00);</h6>
 
 <h6>CREATE TABLE royalties (
 title_id CHAR(3) NOT NULL,
 advance DECIMAL(9,2),
 royalty_rate DECIMAL(5,2),
 CONSTRAINT royalties_pk PRIMARY KEY (title_id),
 CONSTRAINT royalties_title_id_fk
 FOREIGN KEY (title_id)
 REFERENCES titles(title_id));</h6>
 
 <h6>INSERT INTO royalties (title_id,advance,royalty_rate)
 values ('T13',20000.00,0.06);</h6>
 
 <h6>CREATE TABLE test_scores (
 name varchar(20), test varchar(20), score tinyint );</h6>
 
 <h6>INSERT INTO test_scores VALUES
 ("Steve", "SQL", 75),
 ("Robert", "SQL", 43),
 ("Tracy", "SQL", 56),
 ("Tatiana", "SQL", 87),
 ("Steve", "Tuning", 83),
 ("Robert", "Tuning", 31),
 ("Tracy", "Tuning", 88),
 ("Tatiana", "Tuning", 83);</h6>
 
 <h6>CREATE TABLE IF NOT EXISTS emp (
 empno DECIMAL(4), ename VARCHAR(10), job VARCHAR(9),
 mgr DECIMAL(4), hiredate CHAR(10), sal DECIMAL(7,2),
 comm DECIMAL(7,2), deptno DECIMAL(2),
 CONSTRAINT pk_emp PRIMARY KEY (empno));</h6>
 
 <h6>INSERT INTO emp VALUES
 (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
 (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
 (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
 (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
 (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400,30),
 (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
 (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
 (7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20),
 (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
 (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
 (7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100, NULL, 20),
 (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
 (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
 (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10) ;</h6>
 
 <h6>CREATE TABLE new_publishers (
 pub_id CHAR(3) NOT NULL,
 pub_name VARCHAR(20) NOT NULL,
 city VARCHAR(15) NOT NULL,
 state CHAR(2),
 country VARCHAR(15) NOT NULL,
 CONSTRAINT publishers_pk PRIMARY KEY (pub_id));</h6>
 
 <h6>INSERT INTO new_publishers (pub_id,pub_name,city,state,country)
 values ('P11','Community Press','Los Angeles','CA','USA'),
 ('P12','Wiley and Sons','Pittsburgh','PA','USA'),
 INSERT INTO new_publishers (pub_id,pub_name,city,country)
 VALUES ('P13','Verlang','Berlin','Germany'), ('P14','Springer','Berlin','Germany');</h6>

<h6>CREATE TABLE employee (
 emp_id CHAR(3) NOT NULL,
 emp_name VARCHAR(40) NOT NULL,
 boss_id CHAR(3),
 CONSTRAINT pk_employee PRIMARY KEY (emp_id),
 CONSTRAINT emp_id_chk
 CHECK ((SUBSTR(emp_id, 1, 1) = 'E') AND 
 (CAST(SUBSTR(emp_id, 2, 2) AS SIGNED) BETWEEN 0 AND 99)),
 CONSTRAINT boss_id_chk
 CHECK ((SUBSTR(boss_id, 1, 1) = 'E') AND (CAST(SUBSTR(boss_id, 2, 2)
 AS SIGNED) BETWEEN 0 AND 99)));</h6>
 
<h6>INSERT INTO employee (emp_id,emp_name)
 VALUES ('E01','Lord Copper');
INSERT INTO employee (emp_id,emp_name,boss_id)
 VALUES ('E02','Jocelyn Hitchcock','E01'), 
 ('E03','Mr. Salter','E01'),('E04','William Boot','E03'),('E05','Mr. Corker','E03');</h6>
 
 









<h5> </h5>
