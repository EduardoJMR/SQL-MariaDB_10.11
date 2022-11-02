INSERT INTO authors(
	au_id, au_fname, au_lname, phone,
	address, city, state, zip)
  VALUES(
    'A09', 'Irene', 'Bell', '415-225-4689',
	'810 Throckmorton Ave', 'Mill Valley', 'CA', '94941');

SELECT * FROM authors WHERE au_id='A09' ;

INSERT INTO authors(
    zip, phone, address, au_lname,
    au_fname, state, au_id, city)
  VALUES(
    '60614', '312-998-0020', '1937 N. Clark St', 'Weston',
    'Dianne', 'IL', 'A10', 'Chicago');

SELECT * FROM authors WHERE au_id='A10' ;
