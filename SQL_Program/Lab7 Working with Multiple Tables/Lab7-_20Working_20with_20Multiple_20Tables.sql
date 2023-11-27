--Accessing Multiple Tables With Sub-Queries 
SELECT * FROM JOBS;
SELECT * FROM EMPLOYEES;

SELECT * FROM EMPLOYEES 
WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);

SELECT * FROM EMPLOYEES 
WHERE JOB_ID IN (
SELECT JOB_IDENT FROM JOBS 
WHERE JOB_TITLE = 'Jr. Designer');

select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from 
jobs where JOB_IDENT IN (
select JOB_ID from employees where SALARY > 70000 );

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY FROM JOBS 
WHERE JOB_IDENT IN (
SELECT JOB_ID FROM EMPLOYEES 
WHERE YEAR(B_DATE)>1976);

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY FROM JOBS 
WHERE JOB_IDENT IN (
SELECT JOB_ID FROM EMPLOYEES 
WHERE YEAR(B_DATE)>1976 AND SEX='F');
--
select * from employees, jobs;
SELECT * FROM EMPLOYEES, JOBS 
WHERE EMPLOYEES.JOB_ID= JOBS.JOB_IDENT;

--SHORT ALIASES 
SELECT * FROM EMPLOYEES E, JOBS J 
WHERE E.JOB_ID= J.JOB_IDENT;

SELECT EMP_ID, F_NAME,L_NAME, JOB_TITLE 
FROM EMPLOYEES E, JOBS J 
WHERE E.JOB_ID=J.JOB_IDENT;

select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE 
from employees E, jobs J 
where E.JOB_ID = J.JOB_IDENT;