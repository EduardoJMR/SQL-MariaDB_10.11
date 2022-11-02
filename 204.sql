SELECT
  empno,
  hiredate,
  ename,
  sal,
  AVG(sal) OVER
    (order by hiredate, empno rows between 1 preceding and 1 following ) AS avg
FROM emp ;

