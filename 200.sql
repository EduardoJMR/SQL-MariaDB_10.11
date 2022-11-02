SELECT empno, ename, deptno, sal,
       AVG(sal) OVER () AS avg_dept_sal
FROM emp;

