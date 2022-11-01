SELECT
    title_id,
    contract,
    NULLIF(contract, 0) AS "Null contract"
  FROM titles;
