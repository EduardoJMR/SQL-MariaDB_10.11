# SQL-MariaDB_10.11

###### Version 2, June 1991 
###### Copyright (C) 1989, 1991 Free Software Foundation, Inc

### Datasets

#### Table authors

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

#### Table publishers

<h6>CREATE TABLE publishers (
 pub_id CHAR(3) NOT NULL,
 pub_name VARCHAR(20) NOT NULL,
 city VARCHAR(15) NOT NULL,
 state CHAR(2) ,
 country VARCHAR(15) NOT NULL,
 CONSTRAINT publishers_pk PRIMARY KEY (pub_id)); </h6>

<h6>INSERT INTO publishers (pub_id,pub_name,city,state,country)
values ('P04','Tenterhooks Press','Berkeley','CA','USA');</h6>

#### Table titles

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
 
 #### Table title_authors
 
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
 
 #### Table royalties
 
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
 
 #### Table test_scores
 
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
 
 #### Table emp
 
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
  
 #### Table new_publishers
 
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

#### Table employee

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
 
### Getting data from a dataset
 
#### SELECT y FROM 
 
##### 1.	List the cities in which the authors live
 
###### SELECT city FROM authors;
 
##### 2.	List the name, surname, city, and state of the authors.

###### SELECT au_fname, au_lname, city, state FROM authors;
 
##### 3.	List city, state, country of publisher 
 
###### SELECT city, state, country FROM publishers;
 
##### 4. List all columns of the originator table.
 
###### SELECT * FROM authors;
 
#### Creating aliases with AS 
 
##### 5.	List authors' first name, last name, city, state, and postcode by changing the name of all columns except state. 

######	SELECT au_fname AS "First name",au_lname AS "Last name",city AS "City", state, zip "Postal code" FROM authors;
 
#### Elimination of duplicates with DISTINCT

##### 6.	List states in which the authors live
 
######	SELECT state FROM authors;
 
##### 7.	List states where authors live with no duplicates
 
######	SELECT DISTINCT state FROM authors; 
 
##### 8.	List cities and states in which the authors live
 
######	SELECT city, state FROM authors;

##### 9.	List cities and states where authors live without duplicates.
 
######	SELECT DISTINCT city, state FROM authors;

#### Sorting by ORDER BY 
 
##### 10.	List name, surname, city, and state of the authors in ascending order.

######	SELECT au_fname, au_lname, city, state FROM authors ORDER BY au_lname ASC;

##### 11.	List name, surname, city, and state of the authors in descending order of precedence.

######	SELECT au_fname, au_lname, city, state FROM authors ORDER BY au_lname DESC;

##### 12.	List name, surname, city, and state of authors in ascending order by state and descending order by city.

######	SELECT au_fname, au_lname, city, state FROM authors ORDER BY state ASC, city DESC;

##### 13.	Sort by a column that does not appear in the table (zip)

######	SELECT city, state FROM authors ORDER BY zip ASC;

##### 14.	Sort by an expression associated with a column

######	SELECT title_id, price, sales, price * sales AS Revenue FROM titles ORDER BY Revenue DESC;

##### 15. Sort by an expression associated with a column with leading nulls

######	SELECT title_id, price,sales, price * sales AS Revenue FROM titles ORDER BY Revenue IS NULL DESC, Revenue DESC;

#### Row filtering with WHERE

##### 16.	List authors whose surname is not Hull

######	SELECT au_id, au_fname, au_lname FROM authors WHERE au_lname <> 'Hull';

##### 17.	Listing books without a signed contract

######	SELECT title_name, contract FROM titles WHERE contract = 0

##### 18.	List titles published since 2001

######	SELECT title_name, pubdate FROM titles WHERE pubdate >= '2001-01-01';

##### 19.	List securities that have produced a profit in excess of 1,000,000. 

######	SELECT title_name, price * sales AS "Revenue" FROM titles WHERE price * sales > 1000000;

##### 20.	Error: An alias is made in the SELECT and referenced in WHERE. 

######	SELECT sales AS copies_sold FROM titles WHERE copies_sold > 100000;

#### Combination and negation of conditions with AND, OR, and NOT 

##### 21.	Combination and negation of conditions with AND, OR, and NOT

######	SELECT title_name, type, price FROM titles WHERE type = 'biography' AND price < 20;

##### 22.	List authors whose surname begins with a letter between H and Z and whose status is not in California.

######	SELECT au_fname, au_lname FROM authors WHERE au_lname >= 'H' AND au_lname <= 'Zz' AND state <> 'CA';

##### 23.	List authors who live in New York State, Colorado, or San Francisco City.

######	SELECT au_fname, au_lname, city, state FROM authors WHERE state in ('NY', 'CO') OR city='San Francisco';

##### 24.	List all publishers

######	SELECT pub_id, pub_name, state, country FROM publishers;

##### 25.	List editors living or not living in California 

######	SELECT pub_id, pub_name, state, country FROM publishers WHERE (state = 'CA') OR (state <> 'CA');

##### 26.	List authors who do not live in California

######	SELECT au_fname, au_lname, state FROM authors WHERE state <> 'CA';

##### 27.	List books whose price is not less than 20 and which have sold more than 15,000 copies

######	SELECT title_name, sales, price FROM titles WHERE NOT (price < 20) AND (sales > 15000);

##### 28.	List books 1) whose topic is history or 2) whose topic is biography and their price is under 20

######	SELECT title_id, type, price FROM titles WHERE type = 'history' OR type = 'biography' AND price < 20;

##### 29.	List books 1) whose topic is history or biography AND 2) their price is under 20

######	SELECT title_id, type, price FROM titles WHERE (type = 'history' OR type = 'biography') AND price < 20;

##### 30.	For debugging

######	SELECT type, type = 'history' AS "Hist?", type = 'biography' AS "Bio?", price, price < 20 AS "<20?" FROM titles;

#### Pattern matching using LIKE

##### 31.	List authors whose surname begins with Kel

######	SELECT au_fname, au_lname FROM authors WHERE au_lname LIKE 'Kel%';

##### 32.	List authors whose surnames have ll (ele, ele) in the third and fourth positions.

######	SELECT au_fname, au_lname FROM authors WHERE au_lname LIKE '__ll%';

##### 33.	List authors whose postcode starts with 94 

######	SELECT au_fname, au_lname, city, state, zip FROM authors WHERE zip LIKE '94___';

##### 34.	List authors whose phone does not begin with 212, 415, or 303.

######	SELECT au_fname, au_lname, phone FROM authors WHERE phone NOT LIKE '212-___-____' AND phone NOT LIKE '415-___-%' AND phone NOT LIKE '303-%';

##### 35.	List books whose title contains a %.

######	SELECT title_name FROM titles WHERE title_name LIKE '%!%%' ESCAPE '!';

#### Range filtering with BETWEEN

##### 36.	Print names of books containing MO independently of upper/lower case letters

######	SELECT au_fname, au_lname, zip FROM authors WHERE zip NOT BETWEEN '20000' AND '89999';

#### Trimming characters with TRIM

##### 37.	List authors' surnames, removing any capital H at the beginning.
	
######	SELECT title_id, price FROM titles WHERE price BETWEEN 10 AND 19.95;

##### 38.	From the titles table, print the title_id columns starting with T1 and having another character, ignoring possible leading and trailing spaces.

######	SELECT title_id, pubdate FROM titles WHERE pubdate BETWEEN '2000-01-01' AND '2000-12-31';

##### 39.	List books whose price is strictly above 10 and strictly below 19,95 less than 19.95

######	SELECT title_id, price FROM titles WHERE (price > 10) AND (price < 19.95);

#### List filtering with IN 

##### 40.	List authors who do not live in any of these states: New York (NY), New Jersey (NJ), or California (CA). (NY), New Jersey (NJ), or California (CA).

######	SELECT au_fname, au_lname, stateFROM authors WHERE state NOT IN ('NY', 'NJ', 'CA');

##### 41.	List the title of the books together with their length for those books whose length is less than 30. The list has to be sorted by the length of the title. 

######	SELECT title_id, advance FROM royalties WHERE advance IN (0.00, 1000.00, 5000.00);

#### Find substrings with POSITION (LOCATE)

##### 42.	 List books that were published on the first day of the year 2000, 2001, or 2002. 

######	SELECT title_id, pubdate FROM titles WHERE pubdate IN ('2000-01-01', '2001-01-01', '2002-01-01');

##### 43.	List 1) the titles that contain the letter u in their first 10 positions and 2) the position of the letter u itself. The resulting table has to be sorted in descending order by the position of the letter u.

######	SELECT pub_id, city, state, country FROM publishers WHERE state = 'CA';

#### Date Arithmetic

##### 44.	 Print books that have been published in the first 6 months of the year 2001 or 2002.  The output has to be sorted in descending order of date. 

######	SELECT pub_id, city, state, country FROM publishers WHERE state <> 'CA';

##### 45.	Listar editores que no viven en California o cuyo estado es null

######	SELECT pub_id, city, state, country FROM publishers WHERE state <> 'CA';

##### 46.	List books whose subject is biography and their publication date is not null

######	SELECT title_id, type, pubdate FROM titles WHERE type = 'biography' AND pubdate IS NOT NULL;

### Operators and Functions

#### Creation of derived columns

##### 47.	Creation of an artificial derived columna

######	SELECT au_id, 2 + 3 FROM authors;

##### 48.	List books with a 10% discount

######	SELECT title_id, price, 0.10 AS "Discount", price * (1 - 0.10) AS "New price" FROM titles;

##### 49.	List book advances with negative value

######	SELECT title_id, advance AS "Advance" FROM royalties;

##### 50.	Listar libros de biografías junto con las ventas que han generado (venta = price*sales) en orden descendiente

######	SELECT title_id,price * sales AS Revenue FROM titles WHERE type = 'biography' ORDER BY Revenue DESC;

##### 51.	List books with the number of pages divided by 10 as integers and as decimals

######	SELECT title_id,pages,pages DIV 10 AS "pages/10",pages/10.0 AS "pages/10.0" FROM titles;

#### Order of evaluation

##### 52.	Example of precedence of arithmetic operators

######	SELECT 2 + 3 * 4 AS "2+3*4", (2 + 3) * 4 AS "(2+3)*4", 6 / 2 * 3 AS "6/2*3", 6 / (2 * 3) AS "6/(2*3)" ;

##### 53.	List authors with first name and surname concatenated in a single column

######	SELECT au_fname || ' ' || au_lname AS "Author name" FROM authors ORDER BY au_lname ASC, au_fname ASC;

##### 54.	List sales of biographies in descending order of sales

######	SELECT SALES || ' copies sold of title ' || title_id AS 'Biography sales' FROM titles WHERE type = 'biography' AND sales IS NOT NULL ORDER BY sales DESC;

##### 55.	List biographies in descending order of publication date

######	SELECT 'Title '|| title_name || ' published on ' || pubdate AS "Biography sales" FROM titles WHERE type = 'biography' AND pubdate IS NOT NULL ORDER BY pubdate DESC;

##### 56.	List authors whose first and last name is Klee Hull

SELECT au_id, au_fname, au_lname FROM authors WHERE au_fname || ' ' || au_lname = 'Klee Hull';

#### Substring extraction with Substring (Substr)

##### 57.	Split the primary key of the editors into alphabetical and numerical parts.

######	SELECT pub_id,SUBSTR(pub_id, 1, 1) AS "Alpha part", SUBSTR(pub_id, 2) AS "Num part" FROM publishers;

##### 58.	List the initial letter of the first and last name of authors whose state is NY or CO.

######	SELECT SUBSTR(au_fname, 1, 1) || '. ' || au_lname AS "Author name", state FROM authorsm WHERE state IN ('NY', 'CO');

##### 59.	List authors whose phone number starts with 415

######	SELECT au_fname, au_lname, phone FROM authors WHERE SUBSTR(phone, 1, 3)='415';

### LOWER and UPPER

##### 60.	For each author, print first name in lower case and surname in upper case.

######	SELECT LOWER(au_fname) AS "Lower", UPPER(au_lname) AS "Upper" FROM authors;

##### 61.	Imprimir nombre de libros que contengan MO independientemente de mayúculas y minúsculas

######	SELECT title_name FROM titles WHERE UPPER(title_name) LIKE '%MO%';
	
### Trimming characters with TRIM

##### 62.	Remove spaces from ' AAA ' at the beginning, at the end, at the beginning and at the end.

######	SELECT '<' || ' AAA ' || '>' AS "Untrimmed", '<' || TRIM(LEADING FROM ' AAA ') || '>' AS "Leading", '<' || TRIM(TRAILING FROM ' AAA ') || '>' AS "Trailing", '<' || TRIM('AAA ') || '>' AS "Both" ;

##### 63.	List authors' surnames, removing any capital H at the beginning of the name at the beginning

######	SELECT au_lname, TRIM(LEADING 'H' FROM au_lname) AS "Trimmed name" FROM authors;

##### 64.	From the titles table, print the title_id columns starting with T1 and have another character ignoring possible leading and trailing spaces. End

######	SELECT title_id FROM titles WHERE TRIM(title_id) LIKE 'T1_';

#### String length with CHARACTER_LENGTH (LENGTH)
	
##### 65.	Print the name of the authors next to their length

######	SELECT au_fname, LENGTH(au_fname) AS "Len" FROM authors;
	
##### 66.	List the title of the books together with their length for those books whose length is less than 30.whose length is less than 30. The list has to be sorted by the length of the title.

######	SELECT title_name,LENGTH(title_name) AS "Len" FROM titles WHERE LENGTH(title_name) < 30 ORDER BY LENGTH(title_name) ASC;
										       
#### Finding substrings with POSITION (LOCATE)
										       
##### 67.	List the position of the substring e in the author's first name and the position of the substring ma in the author's last name.

######	SELECT au_fname, LOCATE('e', au_fname) AS "Pos e", au_lname, LOCATE('ma', au_lname) AS "Pos ma" FROM authors;

##### 68.	List 1. the titles containing the letter u in their first 10 positions and 2) the position of the letter u itself. The resulting table has to be sorted in descending order by the position of the letter u.

######	SELECT title_name, LOCATE('u', title_name) AS "Pos" FROM titles WHERE LOCATE('u', title_name) BETWEEN 1 AND 10 ORDER BY LOCATE('u', title_name) DESC;

#### Date Arithmetic
										       
##### 69.	Print books that have been published in the first 6 months of the years 2001 or 2002. The output has to be sorted in descending order of date.

######	SELECT title_id, pubdate FROM titles WHERE YEAR(pubdate) BETWEEN 2001 AND 2002 AND MONTH(pubdate) BETWEEN 1 AND 6 ORDER BY pubdate DESC;

##### 70.	Obtaining current date and time

######	SELECT CURRENT_DATE AS "Date", CURRENT_TIME AS "Time", CURRENT_TIMESTAMP AS "Timestamp";

#### User information with USERS

##### 71.	Print the username logged in to the database

######	SELECT CURRENT_USER AS "User";
	
#### Type conversion with CAST
										       
##### 72.	Convert price of books to INTEGER and CHAR(8)

######	SELECT price AS "price(DECIMAL)", CAST(price AS INTEGER) AS "price(INTEGER)", '<' || CAST(price AS CHAR(8)) || '>' AS "price(CHAR(8))" FROM titles;
										       
##### 73.	In the titles table, convert the column sales to CHAR(8) and the column title_-.name column to CHAR(20) for use in a concatenation with characters.

#### Evaluation of conditional values with CASE
										       
##### 74.	Increase the price of books: history books by 10%, psychology books by 20%, and leave the rest unchanged.
								       
######	SELECT title_id, type, price, CASE WHEN type = 'history' THEN price * 1.10 WHEN type = 'psychology' THEN price * 1.20 ELSE price END AS "New price" FROM titles WHERE price is NOT NULL ORDER BY type ASC, title_id ASC;

##### 75.	List the books with a sales category of type characters depending on the value of the sales column.

######	SELECT title_id, CASE WHEN sales IS NULL THEN 'Unknown' WHEN sales <= 1000 THEN 'Not more than 1,000' WHEN sales <= 10000 THEN 'Between 1,001 and 10,000' WHEN sales <= 100000 THEN 'Between 10,001 and 100,000' WHEN sales <= 1000000 THEN 'Between 100,001 and 1,000,000' ELSE 'Over 1,000,000' END AS "Sales category" FROM titles ORDER BY sales ASC;

#### Null testing with COALESCE

##### 76.	Lists the state column of the editors. If the value is null print N/A

######	SELECT pub_id, city, COALESCE(state, 'N/A') AS "state", country FROM publishers;

#### Checking nulls with NULLIF

##### 77.	In this query if the value of the contract column of the titles table is 0 it is set to NULL

######	SELECT title_id, contract, NULLIF(contract, 0) AS "Null contract" FROM titles;

### Summary and Aggregation of Data

#### Find minima with MIN

##### 78.	Print the lowest price of books

######	SELECT MIN(price) AS "Min price" from titles;

##### 79.	Print the earliest date of publication of a book

######	SELECT MIN(pubdate) AS "Earliest pubdate" from titles;

##### 80.	From history books print the number of pages of the one with the lowest number

######	SELECT MIN(pages) AS "Min history pages" FROM titles WHERE type = 'history';

#### Find maximums with MAX

##### 81.	Print the lowest book price, the highest, and the difference range

SELECT MIN(price) AS "Min price", MAX(price) AS "Max price",MAX(price) - MIN(price) AS "Range" FROM titles;

######	82.	History books print the maximum price value multiplied by salts

######	SELECT title_name, MAX(price * sales) AS "Max history revenue" FROM titles WHERE type = 'history';

#### Calculation of sums with SUM

##### 83.	Print the sum of all advances paid to authors

######	SELECT SUM(advance) AS "Total advances" FROM royalties;

##### 84.	Print sales of all books published in 2000

######	SELECT SUM(sales) AS "Total sales (2000 books)" FROM titles WHERE year(pubdate) = 2000;

##### 85.	Print the sum of 1) prices, 2) sales, and 3) multiplying prices by sales for all books

######	SELECT SUM(price) AS "Total price", SUM(sales) AS "Total sales", SUM(price * sales) AS "Total revenue"  FROM titles;

#### Cálculo de medias con AVG

##### 86.	Print the average of the book prices multiplied by 2.

######	SELECT AVG(price * 2) AS "AVG(price * 2)" FROM titles;

##### 87.	Print average and sum of history book sales

######	SELECT AVG(sales) AS "AVG(sales)",SUM(sales) AS "SUM(sales)" FROM titles WHERE type = 'history';

##### 88.	Print the books and their sales for all books whose sales are above average sales exceed the average.

######	SELECT title_id, sales FROM titles WHERE sales > (SELECT AVG(sales) FROM titles) ORDER BY sales DESC;

##### 89.	Print the average sales of the biographies considering the nulls as 0.

######	SELECT AVG(COALESCE(sales, 0)) AS AvgSales FROM titles WHERE type = 'biography';

#### Calculation of number of rows with COUNT

##### 90.	Print the count of book titles, their price, and quantity
	
######	SELECT COUNT(title_id) AS "COUNT(title_id)", COUNT(price) AS "COUNT(price)", COUNT(*) AS "COUNT(*)" FROM titles;

##### 91.	Print the count of the book titles, their price, and the quantity excluding books whose price is null 

######	SELECT COUNT(title_id) AS "COUNT(title_id)", COUNT(price) AS "COUNT(price)", COUNT(*) AS "COUNT(*)" FROM titles WHERE price IS NOT NULL;

##### 92.	Print the count of the book titles, their price, and the quantity for those books whose price is null

######	SELECT COUNT(title_id) AS "COUNT(title_id)", COUNT(price) AS "COUNT(price)", COUNT(*) AS "COUNT(*)" FROM titles WHERE price IS NULL;

#### Sum of distinct values with DISTINCT

##### 93.	Print the total number of books in the table titles.

######	SELECT COUNT(*) AS "COUNT(*)" FROM titles;

##### 94.	Consider the books that do not have NULL as a price and print 1) the number of them, 2) the sum of their prices, and 3) the average of their prices.

######	SELECT COUNT(price) AS "COUNT(price)",SUM(price) AS "SUM(price)", AVG(price) AS "AVG(price)" FROM titles;

##### 95.	Consider the books that do not have NULL as a price and print 1) the number of them, 2) the sum of their prices, and 3) the average of their prices.

######	SELECT COUNT(DISTINCT price) AS "COUNT(DISTINCT)", SUM(DISTINCT price) AS "SUM(DISTINCT)", AVG(DISTINCT price) AS "AVG(DISTINCT)" FROM titles;

##### 96.	For each author, print the number of books he/she wrote, including those in which he/she is a co-author.

######	SELECT au_id,COUNT(*) AS "num_books" FROM title_authors GROUP BY au_id;

##### 97.	Illustrates the difference between COUNT(state) and COUNT(*).

######	SELECT state, COUNT(state) AS "COUNT(state)", COUNT(*) AS "COUNT(*)" FROM publishers GROUP BY state;

##### 98.	In order to have consistent mathematical results, it is necessary to use COUNT(sales) instead of COUNT(*).

######	SELECT type, SUM(sales)/COUNT(sales) AS "SUM/COUNT(sales)", SUM(sales)/COUNT(*) AS "SUM/COUNT(*)", AVG(sales) AS "AVG(sales)" FROM titles GROUP BY type;

##### 99.	For each type of book, calculate statistics on total sales, average, and number of books.

######	SELECT type, SUM(sales) AS "SUM(sales)", AVG(sales) AS "AVG(sales)", COUNT(sales) AS "COUNT(sales)" FROM titles GROUP BY type;

##### 100.	For each type of book, calculate the following statistics: (1) total sales, 2) average sales, and 3) number of books. The result has to be sorted by total sales. In addition, only books with a price equal to or higher than only those books whose price is equal to or greater than 13. (Use WHERE and ORDER BY).

######	SELECT type, SUM(sales) AS "SUM(sales)", AVG(sales) AS "AVG(sales)", COUNT(sales) AS "COUNT(sales)" FROM titles WHERE price >= 13 GROUP BY type ORDER BY SUM(sales) DESC;

##### 101.	For each publisher and type of book it lists the number of books sorted in ascending order by publisher and in descending order by number of books.

######	SELECT pub_id, type, COUNT(title_id) AS count FROM titles GROUP BY pub_id, type ORDER BY pub_id ASC, count DESC;

##### 102.	Print the different types of books.

######	SELECT DISTINCT type FROM titles;

##### 103.	Lists the average sales for each of the prices sorted by ascending price ascending.

######	SELECT price, AVG(sales) FROM titles WHERE price IS NOT NULL GROUP BY price ORDER BY price ASC;

#### Group filtering with HAVING

##### 104.	List the number of books written per author as long as he/she has written more than 3 books.

######	SELECT au_id,COUNT(*) AS "num_books" FROM title_authors GROUP BY au_id HAVING COUNT(*) >= 3;

##### 105.	For each type of book, it prints the number of books and the average profit (price*sales), but only for those types with an average sale of more than 1,000,000.

######	SELECT type, COUNT(price) AS "COUNT(price)", AVG(price * sales) AS "AVG revenue" FROM titles GROUP BY type HAVING AVG(price * sales) > 1000000;

##### 106.	For each publisher, list the number of books of each type, for publishers with more than one book per type.

######	SELECT pub_id, type, COUNT(*) AS count FROM titles
GROUP BY pub_id, type HAVING COUNT(*) > 1 ORDER BY pub_id ASC, count DESC;

##### 107.	For books from publishers P03 and P04, list total sales and average price by type, for types with more than 10,000 total sales and less than 20 average.

######	SELECT type, SUM(sales) AS "SUM(sales)", AVG(price) AS "AVG(price)" FROM titles WHERE pub_id IN ('P03', 'P04') GROUP BY type HAVING SUM(sales) > 10000 AND AVG(price) < 20;

### Joins

#### Qualification of column names

##### 108.	Selecting authors who live in a city where a publisher also lives
publisher.

######	SELECT au_id, authors.city FROM authors INNER JOIN publishers ON authors.city = publishers.city;

### Creation of table aliases using AS

##### 109.	Select first and last names of authors who live in a city where at least one publisher also lives.

######	SELECT au_fname, au_lname, a.city FROM authors AS a INNER JOIN publishers p ON a.city = p.city;

#### joins with JOIN or WHERE

##### 110.	Select first name (au_fname), last name (au_lname), and city (au_lname) for authors who live in a city in which at least one publisher also lives.

###### SELECT au_fname, au_lname, a.city FROM authors a INNER JOIN publishers p ON a.city = p.city;

#### CROSS JOIN

##### 111.	Displays the selected columns of all possible combinations of rows of the authors and publishers tables.

###### SELECT au_id, pub_id, a.state AS "au_state", p.state AS "pub_state" FROM authors a CROSS JOIN publishers p ORDER BY au_id, pub_id;

#### NATURAL JOIN

##### 112.	For each book (titles table) prints the name (pub_name) of its publisher.

###### SELECT title_id, pub_id, pub_name FROM publishers NATURAL JOIN titles;

###### 113.	For each book, list the name of the publisher (pub_name) and the advance (advance) as long as the advance is less than 20,000. Tables publishers, titles, and royalties.

###### SELECT title_id, pub_id, pub_name, advance FROM publishers NATURAL JOIN titles NATURAL JOIN royalties WHERE advance < 20000;

#### INNER JOIN

#### 114.	Join two tables (authors and title_authors) using the au_id column to list the title_id of the books each author wrote.

###### SELECT a.au_id, a.au_fname, a.au_lname, ta.title_id FROM authors a INNER JOIN title_authors ta ON a.au_id = ta.au_id ORDER BY a.au_id ASC, ta.title_id ASC;

#### 115.	Join three tables (authors, title_authors, and titles) using the column au_id and title_id to list the title_name of the books each author wrote.

###### SELECT a.au_id, a.au_fname, a.au_lname, t.title_name FROM authors a INNER JOIN title_authors ta ON a.au_id = ta.au_id INNER JOIN titles t ORDER BY a.au_id ASC, ta.title_id ASC;

#### 116.	Join two tables (titles and publishers) by means of the pub_id column to list 1) the title_id of the book, 2) the title_name of the book, 3) the pub_id of the publisher, and 4) the publisher's pub_name.

###### SELECT t.title_id, t.title_name, t.pub_id, p.pub_name FROM titles t INNER JOIN publishers p ON p.pub_id = t.pub_id ORDER BY t.title_name ASC;

#### 117.	Lists authors who live in the same city (city) and state (state) as a publisher.

###### SELECT a.au_id, a.au_fname, a.au_lname, a.city, a.state FROM authors a INNER JOIN publishers p ON a.city = p.city AND a.state = p.state ORDER BY a.au_id ASC;

#### 118.	Combines an inner join with WHERE conditions to list books published in the state of California (CA) or outside the North American countries (USA, Canada, Mexico).

###### SELECT t.title_id, t.title_name, p.state, p.country FROM titles t INNER JOIN publishers p ON t.pub_id = p.pub_id WHERE p.state = 'CA' OR p.country NOT IN ('USA', 'Canada', 'Mexico') ORDER BY t.title_id ASC;

#### 119.	Combines an inner join with the COUNT aggregate function and a GROUP BY clause to list the number of books an author wrote (or co-wrote).

###### SELECT a.au_id, COUNT(ta.title_id) AS "Num books" FROM authors a INNER JOIN title_authors ta ON a.au_id = ta.au_id GROUP BY a.au_id ORDER BY a.au_id ASC;

#### 120.	Use WHERE conditions to list the advance paid for each biography. Royalty and title tables.

###### SELECT t.title_id, t.title_name, r.advance FROM royalties r INNER JOIN titles t ON r.title_id = t.title_id WHERE t.type = 'biography' AND r.advance IS NOT NULL ORDER BY r.advance DESC;

#### 121.	Use aggregate functions and the GROUP BY clause to list the amount and the advance paid for each type of book the advance paid for each type of book. Royalty and title tables.

###### SELECT t.type, COUNT(r.advance) AS "COUNT", SUM(r.advance) AS "advance" FROM royalties r INNER JOIN titles t ON r.title_id = t.title_id WHERE r.advance IS NOT NULL GROUP BY t.type ORDER BY t.type ASC;

#### 122.	Use aggregate functions and the GROUP BY clause to list the amount and advance paid for each book type and publisher.Tables royalties and titles.

###### SELECT t.type, t.pub_id, COUNT(r.advance) AS "COUNT", SUM(r.advance) AS "advance" FROM royalties r INNER JOIN titles t ON r.title_id = t.title_id WHERE r.advance IS NOT NULL GROUP BY t.type, t.pub_id ORDER BY t.type ASC, t.pub_id ASC;

#### 123.	List title_id and number of co-authors of all books written by 2 or more authors by 2 or more authors.

###### SELECT ta.title_id, COUNT(ta.au_id) AS "authors" FROM authors a INNER JOIN title_authors ta ON a.au_id = ta.au_id GROUP BY ta.title_id HAVING COUNT(ta.au_id) > 1 ORDER BY ta.title_id ASC;

#### 124.	List all books whose income (price * sales) exceeds at least 10 times the advance received.

###### SELECT t.title_id, t.title_name, r.advance, t.price * t.sales AS "Revenue" FROM titles t INNER JOIN royalties r ON t.price * t.sales > r.advance * 10 AND t.title_id = r.title_id ORDER BY t.price * t.sales DESC;

#### OUTER JOIN

#### 125.	List authors living in cities where there is a publisher

###### SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a INNER JOIN publishers p ON a.city = p.city ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC;

#### 126.	Left outer join to include all authors in the result regardless of whether there is an editor living in the same city. whether or not there is an editor living in the same city.

###### SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a LEFT OUTER JOIN publishers p ON a.city = p.city ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC;

###### SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a RIGHT OUTER JOIN publishers p  ON a.city = p.city ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC;

#### 127.	Right outer join to include all publishers in the result regardless of whether there is an author living in the same city.

###### SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a RIGHT OUTER JOIN publishers p  ON a.city = p.city ORDER BY p.pub_name ASC, a.au_lname ASC, a.au_fname ASC;

#### 128.	Full outer join to include all authors and publishers in the result regardless of whether an author lives in the same city as a publisher.

###### FULL OUTER JOIN is not implemented in MariaDB.

#### 129.	Equivalent to full outer join

###### SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a LEFT OUTER JOIN publishers p ON a.city = p.city UNION DISTINCT SELECT a.au_fname, a.au_lname, p.pub_name FROM authors a RIGHT OUTER JOIN publishers p ON a.city = p.city ORDER BY pub_name ASC, au_lname ASC, au_fname ASC;

#### 130.	Lists the number of books written by each author including authors who have not written any books

###### SELECT a.au_id, COUNT(ta.title_id) AS "Num books" FROM authors a LEFT OUTER JOIN title_authors ta ON a.au_id = ta.au_id GROUP BY a.au_id ORDER BY a.au_id ASC;

#### 131.	List of authors who have not written any books

###### SELECT a.au_id, a.au_fname, a.au_lname FROM authors a LEFT OUTER JOIN title_authors ta ON a.au_id = ta.au_id WHERE ta.au_id IS NULL;

#### 132.	It combines an inner join and a left outer join to list all authors and any possible books they have written along with their sales. But it shows sales only for those books that sold more than 100,000 copies.

###### SELECT a.au_id aid, a.au_fname fname, a.au_lname lname, COALESCE(tta.title_id, 'N/A') t_id, COALESCE(tta.title_name, 'N/A') name, COALESCE(tta.sales, 'N/A') sales FROM authors a LEFT OUTER JOIN (SELECT ta.au_id, t.title_id, t.title_name, t.sales FROM title_authors ta INNER JOIN titles t ON t.title_id = ta.title_id WHERE sales > 100000) tta ON a.au_id = tta.au_id ORDER BY a.au_id ASC, tta.title_id ASC;

###### SELECT ta.au_id, t.title_id, t.title_name, t.sales FROM title_authors ta INNER JOIN titles t ON t.title_id = ta.title_id WHERE sales > 100000;

#### 133.	List the name of each employee along with the name of his or her manager.

###### SELECT e1.emp_name AS "Employee name", e2.emp_name AS "Boss name" FROM employee e1 INNER JOIN employee e2 ON e1.boss_id = e2.emp_id;

#### 134.	Select authors who live in the same state as the author A04

###### SELECT a1.au_id, a1.au_fname, a1.au_lname, a1.state FROM authors a1 INNER JOIN authors a2 ON a1.state = a2.state WHERE a2.au_id = 'A04';

#### 135.	For each biography, it lists its id (title_id), its sales, and the other biographies that sold more than it. biographies that sold more than it.

###### SELECT t1.title_id, t1.sales, t2.title_id AS "Better seller", t2.sales AS "Higher sales" FROM titles t1 INNER JOIN titles t2 ON t1.sales < t2.sales WHERE t1.type = 'biography' AND t2.type = 'biography' ORDER BY t1.title_id ASC, t2.sales ASC;

#### 136.	List the different pairs of authors who live in New York City.

###### SELECT a1.au_fname, a1.au_lname, a2.au_fname, a2.au_lname FROM authors a1INNER JOIN authors a2 ON a1.state = a2.state WHERE a1.state = 'NY' ORDER BY a1.au_id ASC, a2.au_id ASC;

#### 137.	Lists the different pairs of authors living in New York without redundancy.

###### SELECT a1.au_fname, a1.au_lname, a2.au_fname, a2.au_lname FROM authors a1 INNER JOIN authors a2 ON a1.state = a2.state AND a1.au_id <> a2.au_id WHERE a1.state = 'NY' ORDER BY a1.au_id ASC, a2.au_id ASC;

#### 138.	Lists the different pairs of authors living in New York without redundancies and without duplicate pairs.

###### SELECT a1.au_fname, a1.au_lname, a2.au_fname, a2.au_lname FROM authors a1 INNER JOIN authors a2 ON a1.state = a2.state AND a1.au_id < a2.au_id WHERE a1.state = 'NY' ORDER BY a1.au_id ASC, a2.au_id ASC;

#### 139.	List the names of publishers that publish biographies (manual).

###### SELECT DISTINCT pub_id FROM titles WHERE type = 'biography';

#### 140.	List the names of publishers who publish biographies (inner join).

###### SELECT DISTINCT pub_name FROM publishers p INNER JOIN titles t ON p.pub_id = t.pub_id WHERE t.type = 'biography';

#### 141.	List the names of publishers who publish biographies (Sub-query).

###### SELECT pub_name FROM publishers WHERE pub_id IN (SELECT pub_id FROM titles WHERE type = 'biography');

#### 142.	Selecting authors who live in the same city as a publisher.

###### SELECT au_id, city FROM authors WHERE city IN (SELECT DISTINCT city FROM publishers);

#### 143.	List authors who have not written any books.

###### SELECT au_id, au_fname, au_lname FROM authors WHERE au_id NOT IN (SELECT au_id FROM title_authors);

#### Simple sub-queries

#### 144.	List authors who live in the same state as the author with au_id = A04

###### SELECT au_id, au_fname, au_lname, state FROM authors WHERE state IN (SELECT state FROM authors WHERE au_id = 'A04');

#### Correlated sub-queries

#### 145.	Lists books whose sales are equal to or exceed the average sales in their category.

###### SELECT t.title_id, t.type, t.sales FROM titles AS t WHERE sales >= (SELECT AVG(sales) FROM titles AS av WHERE av.type = t.type);

#### 146-150 Inserting, Updating, and Deleting of Rows

#### UPDATE

#### 151.	Changes the contract value to 0 for all rows in the titles table.

###### UPDATE titles SET contract = 0 ;

#### 152.	Double the price of history books

###### UPDATE titles SET price = price * 2.0 WHERE type = 'history';

#### 153.	Update the type and pages columns for psychology books.

###### UPDATE titles SET type = 'self help', pages = NULL WHERE type = 'psychology';

#### 154.	Halve the sales of all books whose sales are above average.

###### UPDATE titles SET sales = sales * 0.5 WHERE sales > ( SELECT upper FROM ( SELECT AVG(sales) as upper FROM titles) as avgg );

#### 155.	Change the publication date of all books by Sarah Buchman.

###### UPDATE titles SET pubdate = '2003-01-01' WHERE title_id IN (SELECT title_id FROM title_authors WHERE au_id IN (SELECT au_id FROM authors WHERE au_fname = 'Sarah' AND au_lname = 'Buchman'));

#### 156.	Change the publisher of all Tenterhooks Press books to Abatis Publishers.

###### UPDATE titles SET pub_id = (SELECT pub_id FROM publishers WHERE pub_name = 'Abatis Publishers') WHERE pub_id = (SELECT pub_id FROM publishers WHERE pub_name = 'Tenterhooks Press');

#### 157-159 Delete

#### 160-178 Creating, Altering, and Deleting Tables 

#### 179-182 Indexes

### Vistas

#### 183.	Create views with only some columns of the table authors.

###### CREATE VIEW au_names AS SELECT au_id, au_fname, au_lname FROM authors;

#### 184.	Create a view with authors living in a city where there is at least one publisher. at least one publisher.

###### CREATE VIEW cities (au_id, au_city, pub_id, pub_city) AS SELECT a.au_id, a.city, p.pub_id, p.city FROM authors a INNER JOIN publishers p ON a.city = p.city;

### Analytical functions

#### 185.	Example table

###### CREATE TABLE test_scores (
 name varchar(20), test varchar(20), score tinyint );

###### INSERT INTO test_scores VALUES ("Steve", "SQL", 75), ("Robert", "SQL", 43), ("Tracy", "SQL", 56), ("Tatiana", "SQL", 87), ("Steve", "Tuning", 83), ("Robert", "Tuning", 31), ("Tracy", "Tuning", 88), ("Tatiana", "Tuning", 83);

#### 186.	Average per test

###### SELECT name, test, score, AVG(score) OVER (PARTITION BY test) AS avgtest FROM test_scores;

#### 187.	Average by name.

SELECT name, test, score, AVG(score) OVER (PARTITION BY name) AS avgname FROM test_scores;

#### 188.	Average by test and name

###### SELECT name, test, score, AVG(score) OVER (PARTITION BY test) AS avgtest, AVG(score) OVER (PARTITION BY name) AS avgname FROM test_scores;

#### 189.	Order by score (row_number).

###### SELECT row_number() OVER (order BY score DESC) AS pos, name, test, score FROM test_scores;

#### 190.	Order by rank

###### SELECT rank() OVER (order BY score DESC) AS pos, name, test, score FROM test_scores;

#### 191.	Order by score (dense_rank).

###### SELECT dense_rank() OVER (order BY score DESC) AS pos, name, test, score FROM test_scores;

#### 192.	Order by test and score (row_number).

###### SELECT row_number() OVER (partition by test order BY score DESC) AS pos, name, test, score FROM test_scores;

#### 193.	Order by test and rank.

###### SELECT rank() OVER (partition by test order BY score DESC) AS pos, name, test, score FROM test_scores;

#### 194.	Order by test and score (dense_rank).

###### SELECT dense_rank() OVER (partition by test order BY score DESC) AS pos, name, test, score FROM test_scores;

#### 195.	Compare score with the next (lead).

###### SELECT name, test, score, lead(score) OVER (partition by test order BY score DESC) AS next FROM test_scores;

#### 196.	Compare score with previous (lag).

###### SELECT name, test, lag(score) OVER (partition by test order BY score DESC) AS prev, score FROM test_scores;

#### 197.	Compare score with previous score (lag) and next score (lead).

###### SELECT name, test, lag(score) OVER (partition by test order BY score DESC) AS prev, score, lead(score) OVER (partition by test order BY score DESC) AS next FROM test_scores;

#### 198.	Table example.

###### CREATE TABLE IF NOT EXISTS emp ( empno DECIMAL(4), ename VARCHAR(10), job VARCHAR(9), mgr DECIMAL(4), hiredate CHAR(10), sal DECIMAL(7,2), comm DECIMAL(7,2), deptno DECIMAL(2), CONSTRAINT pk_emp PRIMARY KEY (empno));

###### ###### INSERT INTO emp VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20), (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30), (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30), (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20), (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400,30), (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30), (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10), (7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20), (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10), (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30), (7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100, NULL, 20), (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30), (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20), (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10) ;

#### 199.	Salary of an employee together with the average salary of his or her department.

###### SELECT empno, ename, deptno, sal, AVG(sal) OVER (PARTITION BY deptno) AS avg_dept_sal FROM emp;

#### 200.	Salary of an employee together with the average salary of all employees.

###### SELECT empno, ename, deptno, sal, AVG(sal) OVER () AS avg_dept_sal FROM emp;

#### 201.	Salary of an employee together with the department's minimum wage.

###### SELECT empno, ename, deptno, sal, MIN(sal) OVER (PARTITION BY deptno order by sal) AS min_dept_sal FROM emp ;

#### 202.	Salary of an employee together with the difference between his or her salary and the department's minimum wage.

###### SELECT empno, ename, deptno, sal, sal - MIN(sal) OVER (PARTITION BY deptno order by sal) AS diff_min FROM emp ;

#### 203.	Salary of an employee together with the highest salary of all employees hired up to that day.

###### SELECT empno, hiredate, ename, sal, MAX(sal) OVER (order by hiredate) AS max FROM emp ;

#### 204.	Salary of an employee together with the average between the salary 1) of the employee hired before, 2) of the employee himself/herself, and 3) of the employee hired after.

###### SELECT empno, hiredate, ename, sal, AVG(sal) OVER (order by hiredate rows between 1 preceding and 1 following ) AS avg FROM emp ;

#### 205.	Salary of an employee together with the average between the salary 1) of the employees hired on the last date that there was hiring prior to the employee's 2) of the employee himself/herself and the employees hired on the same day, and 3) of the employees hired on the next date of hire after the employee's date of hire.

###### CREATE VIEW IF NOT EXISTS ranked as SELECT dense_rank() OVER( ORDER BY hiredate ) rank, empno, hiredate, ename, sal FROM emp ;

###### SELECT * FROM ranked ;

###### SELECT empno, hiredate, ename, sal, AVG(sal) OVER (order by rank range between 1 preceding and 1 following ) AS avg FROM ranked ;

#### 206.	For each employee, average wages of employees hired before, employee's wages, average wages of employees hired after.

###### SELECT empno, hiredate, ename, avg(sal) OVER (order by hiredate rows between unbounded preceding and 1 preceding ) AS avgBefore, sal, avg(sal) OVER (order by hiredate rows between 1 following and unbounded following ) AS avgAfter FROM emp ;
