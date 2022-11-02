SELECT empno, ename, deptno, sal,
       sal - MIN(sal) OVER (PARTITION BY deptno order by sal) AS diff_min
FROM   emp ;
