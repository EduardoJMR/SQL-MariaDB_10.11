SELECT empno, ename, deptno, sal,
       MIN(sal) OVER (PARTITION BY deptno order by sal) AS min_dept_sal
FROM emp ;

