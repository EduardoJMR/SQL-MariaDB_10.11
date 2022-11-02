SELECT
  empno,
  hiredate,
  ename,
  avg(sal) OVER
    (order by hiredate, empno rows between unbounded preceding and 1 preceding ) AS avgBefore,
  sal,
  avg(sal) OVER
    (order by hiredate, empno rows between 1 following and unbounded following ) AS avgAfter
FROM emp ;
