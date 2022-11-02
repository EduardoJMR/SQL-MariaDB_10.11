CREATE VIEW IF NOT EXISTS ranked as
SELECT
  dense_rank() OVER( ORDER BY hiredate ) rank,
  empno, hiredate, ename, sal
FROM emp ;

SELECT * FROM ranked ;


SELECT
  empno,
  hiredate,
  ename,
  sal,
  AVG(sal) OVER
    (order by rank range between 1 preceding and 1 following ) AS avg
FROM ranked ;

