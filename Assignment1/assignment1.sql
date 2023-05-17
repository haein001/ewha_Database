2.

INSERT INTO DEPARTMENTAHI VALUES(1,'영업',8);
INSERT INTO DEPARTMENTAHI VALUES(2,'기획',10);
INSERT INTO DEPARTMENTAHI VALUES(3,'개발',9);
INSERT INTO DEPARTMENTAHI VALUES(4,'총무',7);

INSERT INTO EMPLOYEEAHI VALUES(4377, '이성래', '사장',NULL,5000000,'1996-01-05',2);
INSERT INTO EMPLOYEEAHI VALUES(3011,'이수민','부장',4377,4300000,'1996-04-30',3);
INSERT INTO EMPLOYEEAHI VALUES(3228, '김주훈', '부장', 4377,4000000,'1997-03-06',2);
INSERT INTO EMPLOYEEAHI VALUES(1234, '장건호', '부장', 4377 ,4200000,'1996-11-23',1);
INSERT INTO EMPLOYEEAHI VALUES(2468, '조범수', '과장', 3011,3500000,'1998-12-17',3);
INSERT INTO EMPLOYEEAHI VALUES(2544, '오준석', '대리',2468 ,2700000,'2001-08-25',3);
INSERT INTO EMPLOYEEAHI VALUES(1003,'조민희','대리',2468,2600000,'2001-02-19',2);
INSERT INTO EMPLOYEEAHI VALUES(2106,'김창섭','대리',3228,2500000,'2000-03-05',2);
INSERT INTO EMPLOYEEAHI VALUES(3426,'박영권','과장',1234,3000000,'1998-07-20',1);
INSERT INTO EMPLOYEEAHI VALUES(1365,'김상원','사원',3426,1600000,'2004-02-26',1);
INSERT INTO EMPLOYEEAHI VALUES(1099, '이재원', '사원',3426 ,1800000,'2003-12-21',1);
INSERT INTO EMPLOYEEAHI VALUES(3427,'최종철','사원',1003,1500000,'2005-10-28',3);

3.
SELECT DISTINCT TITLE 
FROM EMPLOYEEAHI
WHERE HIREDATE>'20010101' and HIREDATE<'20031231'


4.

SELECT DEPTNAME,TITLE,AVG(SALARY)*1.15 AS '평균급여'
FROM EMPLOYEEAHI,DEPARTMENTAHI
GROUP BY DEPTNAME,TITLE,DEPTNO,DNO
HAVING DEPTNO=DNO
ORDER BY DEPTNAME, '평균급여' 

5.
SELECT TOP 1 DNO, MIN(SALARY) as ' 부서의 최저 급여'
FROM EMPLOYEEAHI
GROUP BY DNO
ORDER BY AVG(SALARY) DESC

6.
SELECT EMPNAME,TITLE,MANAGER
FROM EMPLOYEEAHI
WHERE MANAGER=(
SELECT MANAGER
FROM EMPLIYEEAHI
WHERE EMPNAME='김상원') and DNO=(SELECT DNO
FROM EMPLIYEEAHI
WHERE EMPNAME='김상원')

7.
SELECT DEPTNO,DEPTNAME,FLOOR
FROM DEPARTMENTAHI
WHERE DEPTNO NOT IN (
SELECT DNO
FROM EMPLOYEEAHI
WHERE DEPTNO IS NOT NULL
)

8.
SELECT DEPTNAME, COUNT(DNO)AS '부서인원', AVG(SALARY) AS AVGSALARY
FROM DEPARTMENTAHI D, EMPLOYEEAHI E
GROUP BY DNO,DEPTNAME,DEPTNO
HAVING AVG(SALARY)>=3000000 AND AVG(SALARY)<= 5000000 AND DNO=DEPTNO


9.
SELECT E.EMPNAME,E.TITLE,M.EMPNAME as '매니저이름' ,DEPTNAME,E.SALARY
FROM EMPLOYEEAHI E,EMPLOYEEAHI M,DEPARTMENTAHI
WHERE E.SALARY>(
SELECT AVG(SALARY)
FROM EMPLOYEEAHI
WHERE TITLE=E.TITLE AND DEPTNO=E.DNO) AND E.MANAGER=M.EMPNO
ORDER BY SALARY DESC


10.
ALTER TABLE EMPLOYEEAHI ADD CONSTRAINT  EMDNO
FOREIGN KEY (DNO) REFERENCES DEPARTMENTAHI(DEPTNO) ON UPDATE CASCADE

UPDATE DEPARTMENTAHI
SET DEPTNO=5
WHERE DEPTNO=1

SELECT DNO, EMPNAME
FROM EMPLOYEEAHI
