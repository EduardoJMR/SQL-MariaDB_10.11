SELECT pub_id,
	SUBSTR(pub_id, 1, 1) AS "Alpha part",
	SUBSTR(pub_id, 2) AS "Num part"
  FROM publishers;

