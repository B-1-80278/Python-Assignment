## Assignment 2

## 1. Create table "emp_staging" and load data from emp.csv in it.

CREATE TABLE emp_staging (
emp_id INT,
ename VARCHAR(20),
job VARCHAR(20),
mgr_id INT,
hire_date DATE,
salary DOUBLE,
commission DOUBLE,
dept_no INT)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/media/sumit1/SUMIT/DBDA/BigData/data/emp.csv' INTO TABLE emp_staging;


+---------------------+--------------------+------------------+---------------------+------------------------+---------------------+-------------------------+----------------------+
| emp_staging.emp_id  | emp_staging.ename  | emp_staging.job  | emp_staging.mgr_id  | emp_staging.hire_date  | emp_staging.salary  | emp_staging.commission  | emp_staging.dept_no  |
+---------------------+--------------------+------------------+---------------------+------------------------+---------------------+-------------------------+----------------------+
| 7369                | SMITH              | CLERK            | 7902                | 1980-12-17             | 800.0               | NULL                    | 20                   |
| 7499                | ALLEN              | SALESMAN         | 7698                | 1981-02-20             | 1600.0              | 300.0                   | 30                   |
| 7521                | WARD               | SALESMAN         | 7698                | 1981-02-22             | 1250.0              | 500.0                   | 30                   |
| 7566                | JONES              | MANAGER          | 7839                | 1981-04-02             | 2975.0              | NULL                    | 20                   |
| 7654                | MARTIN             | SALESMAN         | 7698                | 1981-09-28             | 1250.0              | 1400.0                  | 30                   |
| 7698                | BLAKE              | MANAGER          | 7839                | 1981-05-01             | 2850.0              | NULL                    | 30                   |
| 7782                | CLARK              | MANAGER          | 7839                | 1981-06-09             | 2450.0              | NULL                    | 10                   |
| 7788                | SCOTT              | ANALYST          | 7566                | 1982-12-09             | 3000.0              | NULL                    | 20                   |
| 7839                | KING               | PRESIDENT        | NULL                | 1981-11-17             | 5000.0              | NULL                    | 10                   |
| 7844                | TURNER             | SALESMAN         | 7698                | 1981-09-08             | 1500.0              | 0.0                     | 30                   |
| 7876                | ADAMS              | CLERK            | 7788                | 1983-01-12             | 1100.0              | NULL                    | 20                   |
| 7900                | JAMES              | CLERK            | 7698                | 1981-12-03             | 950.0               | NULL                    | 30                   |
| 7902                | FORD               | ANALYST          | 7566                | 1981-12-03             | 3000.0              | NULL                    | 20                   |
| 7934                | MILLER             | CLERK            | 7782                | 1982-01-23             | 1300.0              | NULL                    | 10                   |
+---------------------+--------------------+------------------+---------------------+------------------------+---------------------+-------------------------+----------------------+


## 2. Create table "dept_staging" and load data from dept.csv in it.

CREATE TABLE dept_staging (
dept_no INT,
dept_name VARCHAR(20),
location VARCHAR(20)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/media/sumit1/SUMIT/DBDA/BigData/data/dept.csv' INTO TABLE dept_staging;
+-------------+-----------------+
|  dept_name  | employee_count  |
+-------------+-----------------+
| ACCOUNTING  | 3               |
| OPERATIONS  | 0               |
| RESEARCH    | 5               |
| SALES       | 6               |
+-------------+-----------------+



## 3. Display dept name and number of emps in each dept.

SELECT d.dept_name dept_name, COUNT(e.emp_id) employee_count
FROM emp_staging e
JOIN dept_staging d
ON e.dept_no = d.dept_no
GROUP BY d.dept_name; 
+-------------+-----------------+
|  dept_name  | employee_count  |
+-------------+-----------------+
| ACCOUNTING  | 3               |
| OPERATIONS  | 0               |
| RESEARCH    | 5               |
| SALES       | 6               |
+-------------+-----------------+


## 4. Display emp name and his dept name.

SELECT e.ename employee_Name, d.dept_name department
FROM emp_staging e
JOIN dept_staging d
ON e.dept_no = d.dept_no;

+----------------+-------------+
| employee_name  | department  |
+----------------+-------------+
| SMITH          | RESEARCH    |
| ALLEN          | SALES       |
| WARD           | SALES       |
| JONES          | RESEARCH    |
| MARTIN         | SALES       |
| BLAKE          | SALES       |
| CLARK          | ACCOUNTING  |
| SCOTT          | RESEARCH    |
| KING           | ACCOUNTING  |
| TURNER         | SALES       |
| ADAMS          | RESEARCH    |
| JAMES          | SALES       |
| FORD           | RESEARCH    |
| MILLER         | ACCOUNTING  |
+----------------+-------------+


5. Display all emps (name, job, deptno) with their manager (name, job, deptno), who are not in their department.
SELECT m.ename manager, m.dept_no dept_no
FROM emp_staging e
JOIN emp_staging m
ON e.emp_id = m.mgr_id
WHERE e.dept_no != m.dept_no;
+-----------+------------+----------+---------+----------+----------+
| emp_name  |    job     | dept_no  | mgr_id  | manager  | dept_no  |
+-----------+------------+----------+---------+----------+----------+
| KING      | PRESIDENT  | 10       | 7839    | JONES    | 20       |
| KING      | PRESIDENT  | 10       | 7839    | BLAKE    | 30       |
+-----------+------------+----------+---------+----------+----------+

6. Display all manager names with list of all dept names (where they can work).
SELECT e.ename MANAGER, d.dept_name DEPARTMENT
FROM emp_staging e
JOIN dept_staging d
ON e.dept_no = d.dept_no
WHERE e.job = "MANAGER";
+----------+-------------+
| manager  | department  |
+----------+-------------+
| JONES    | RESEARCH    |
| BLAKE    | SALES       |
| CLARK    | ACCOUNTING  |
+----------+-------------+


8. Display job-wise total salary.
SELECT job, SUM(salary) job_wise_total
FROM emp_staging
GROUP BY job;
+------------+-----------------+
|    job     | job_wise_total  |  |
+------------+-----------------+
| ANALYST    | 6000.0          |         
| CLERK      | 4150.0          |       
| MANAGER    | 8275.0          | 
| PRESIDENT  | 5000.0          | 
| SALESMAN   | 5600.0          | 
+------------+-----------------+


9. Display dept-wise total salary.
SELECT d.dept_name, SUM(e.salary) dpet_wise_total
FROM emp_staging e
JOIN dept_staging d
ON e.dept_no = d.dept_no
GROUP BY d.dept_name;
+--------------+------------------+
| d.dept_name  | dpet_wise_total  |
+--------------+------------------+
| ACCOUNTING   | 8750.0           |
| RESEARCH     | 10875.0          |
| SALES        | 9400.0           |
+--------------+------------------+


10. Display per dept job-wise total salary.
SELECT d.dept_name, e.job, SUM(e.salary) dept_wise_total
FROM emp_staging e
JOIN dept_staging d
ON e.dept_no = d.dept_no
GROUP BY d.dept_name, e.job;

+--------------+------------+------------------+
| d.dept_name  |   e.job    | dept_wise_total  |
+--------------+------------+------------------+
| RESEARCH     | ANALYST    | 6000.0           |
| ACCOUNTING   | CLERK      | 1300.0           |
| RESEARCH     | CLERK      | 1900.0           |
| SALES        | CLERK      | 950.0            |
| ACCOUNTING   | MANAGER    | 2450.0           |
| RESEARCH     | MANAGER    | 2975.0           |
| SALES        | MANAGER    | 2850.0           |
| ACCOUNTING   | PRESIDENT  | 5000.0           |
| SALES        | SALESMAN   | 5600.0           |
+--------------+------------+------------------+


11. Display number of employees recruited per year in descending order of employee count.
SELECT YEAR(hire_date), COUNT(emp_id) total_employees_hired
FROM emp_staging
GROUP BY YEAR(hire_date)
ORDER BY total_employees_hired DESC;
+-------+------------------------+
|  _c0  | total_employees_hired  |
+-------+------------------------+
| 1981  | 10                     |
| 1982  | 2                      |
| 1983  | 1                      |
| 1980  | 1                      |
+-------+------------------------+


12. Display unique job roles who gets commission.
SELECT DISTINCT job
FROM emp_staging
WHERE commission IS NOT NULL;
+-----------+
|    job    |
+-----------+
| SALESMAN  |
+-----------+


13. Display dept name in which there is no employee (using sub-query).

SELECT dept_name
FROM dept_staging 
WHERE dept_no NOT IN
(SELECT dept_no 
FROM emp_staging);
+-------------+
|  dept_name  |
+-------------+
| OPERATIONS  |
+-------------+


14. Display emp-name, dept-name, salary, total salary of that dept (using sub-query).
SELECT e.ename,d.dname,e.sal, 
(SELECT sum(sal) FROM emp_staging WHERE deptno=e.deptno) AS total_salary
FROM emp_staging e 
JOIN dept_staging d 
ON e.deptno=d.deptno
;
+----------+-------------+---------+---------------+
| e.ename  |   d.dname   |  e.sal  | total_salary  |
+----------+-------------+---------+---------------+
| SMITH    | RESEARCH    | 800.0   | 10875.0       |
| ALLEN    | SALES       | 1600.0  | 9400.0        |
| WARD     | SALES       | 1250.0  | 9400.0        |
| JONES    | RESEARCH    | 2975.0  | 10875.0       |
| MARTIN   | SALES       | 1250.0  | 9400.0        |
| BLAKE    | SALES       | 2850.0  | 9400.0        |
| CLARK    | ACCOUNTING  | 2450.0  | 8750.0        |
| SCOTT    | RESEARCH    | 3000.0  | 10875.0       |
| KING     | ACCOUNTING  | 5000.0  | 8750.0        |
| TURNER   | SALES       | 1500.0  | 9400.0        |
| ADAMS    | RESEARCH    | 1100.0  | 10875.0       |
| JAMES    | SALES       | 950.0   | 9400.0        |
| FORD     | RESEARCH    | 3000.0  | 10875.0       |
| MILLER   | ACCOUNTING  | 1300.0  | 8750.0        |
+----------+-------------+---------+---------------+

15. Display all managers and presidents along with number of (immediate) subbordinates.

SELECT e.ename,e.job,
(SELECT count(ename) FROM emp_staging WHERE mgrid=e.empno)
fr emp_staging e
where job ="MANAGER" OR job="PRESIDENT";
+----------+------------+------+
| e.ename  |   e.job    | _c2  |
+----------+------------+------+
| JONES    | MANAGER    | 2    |
| BLAKE    | MANAGER    | 5    |
| CLARK    | MANAGER    | 1    |
| KING     | PRESIDENT  | 3    |
+----------+------------+------+
