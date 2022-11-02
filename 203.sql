SELECT empno, hiredate, ename, sal,
       MAX(sal) OVER (order by hiredate) AS max
FROM   emp ;

