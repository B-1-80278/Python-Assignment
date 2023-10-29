-- 1. Write a query that counts the number of salespeople registering orders for eachday.
-- (If a salesperson has more than one order on a given day, he or she should be counted only once.).

SELECT odate, COUNT(DISTINCT(snum)) AS count FROM orders GROUP BY odate;
+------------+-------+
| odate      | count |
+------------+-------+
| 1990-10-03 |     4 |
| 1990-10-04 |     3 |
+------------+-------+

-- 2. Write a query on the Customers table that will find the highest rating in each city. Put
-- the output in this form: For the city (city), the highest rating is : (rating).
SELECT CONCAT("For the ", city," the highest rating is: ", max(rating)) FROM customers GROUP BY city;
+------------------------------------------------------------------+
| CONCAT("For the ", city," the highest rating is: ", max(rating)) |
+------------------------------------------------------------------+
| For the London the highest rating is: 100                        |
| For the Rome the highest rating is: 200                          |
| For the San Jose the highest rating is: 300                      |
| For the Berlin the highest rating is: 300                        |
+------------------------------------------------------------------+
-- 3. Write a query that totals the orders for each day and places the results -- in descending order.
SELECT odate, SUM(amt) AS total_sale
FROM orders
GROUP BY odate
ORDER BY total_sale desc;
+------------+------------+
| odate      | total_sale |
+------------+------------+
| 1990-10-04 |   16713.81 |
| 1990-10-03 |    8944.59 |
+------------+------------+

-- 4. Write a query that selects the total amount in orders for each salesperson for whom
-- this total is greater than the average amount of the order in the table.
-- (Note Use the average amount value directly →2565.84)
SELECT snum, SUM(amt)
FROM orders
GROUP BY snum
HAVING SUM(amt) > 2565.84;

+------+----------+
| snum | SUM(amt) |
+------+----------+
| 1001 | 15382.07 |
| 1002 |  5546.15 |
+------+----------+


-- 5. Write a query that selects the highest rating in each city.

SELECT city, max(rating) FROM customers GROUP BY city;
+----------+-------------+
| city     | max(rating) |
+----------+-------------+
| London   |         100 |
| Rome     |         200 |
| San Jose |         300 |
| Berlin   |         300 |
+----------+-------------+

-- 6. Largest order taken by each salesperson with order value more than Rs.3000.

SELECT snum, MAX(amt)
FROM orders
GROUP BY snum
HAVING MAX(amt)>3000;

+------+----------+
| snum | MAX(amt) |
+------+----------+
| 1001 |  9891.88 |
| 1002 |  5160.45 |
+------+----------+

-- 7. Select each customer smallest order.
SELECT cnum, MIN(amt)
FROM orders
GROUP BY cnum;

+------+----------+
| cnum | MIN(amt) |
+------+----------+
| 2008 |    18.69 |
| 2001 |   767.19 |
| 2007 |  1900.10 |
| 2003 |  5160.45 |
| 2002 |  1713.23 |
| 2004 |    75.75 |
| 2006 |  4723.00 |
+------+----------+


-- Note : To solve below queries use “hr” database
-- 1. Display manager ID and number of employees managed by the manager.
SELECT MANAGER_ID, COUNT(EMPLOYEE_ID)
FROM employees
GROUP BY MANAGER_ID;
+------------+--------------------+
| MANAGER_ID | COUNT(EMPLOYEE_ID) |
+------------+--------------------+
|          0 |                  1 |
|        100 |                 14 |
|        101 |                  5 |
|        102 |                  1 |
|        103 |                  4 |
|        108 |                  5 |
|        114 |                  5 |
|        120 |                  8 |
|        121 |                  8 |
|        122 |                  8 |
|        123 |                  8 |
|        124 |                  8 |
|        145 |                  6 |
|        146 |                  6 |
|        147 |                  6 |
|        148 |                  6 |
|        149 |                  6 |
|        201 |                  1 |
|        205 |                  1 |
+------------+--------------------+


-- 2. Display the country ID and number of cities we have in the country.
SELECT COUNTRY_ID, COUNT(CITY)
FROM locations
GROUP BY COUNTRY_ID;
+------------+-------------+
| COUNTRY_ID | COUNT(CITY) |
+------------+-------------+
| "          |           1 |
| AU         |           1 |
| BR         |           1 |
| CA         |           2 |
| CH         |           2 |
| CN         |           1 |
| DE         |           1 |
| IN         |           1 |
| IT         |           2 |
| JP         |           2 |
| NL         |           1 |
| Ox         |           1 |
| SG         |           1 |
| UK         |           2 |
| US         |           4 |
+------------+-------------+

-- 3. Display average salary of employees in each department who have commission percentage.

SELECT department_id, AVG(salary) AS average_salary
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id
ORDER BY department_id;

+---------------+----------------+
| department_id | average_salary |
+---------------+----------------+
|             0 |    7000.000000 |
|            10 |    4400.000000 |
|            20 |    9500.000000 |
|            30 |    4150.000000 |
|            40 |    6500.000000 |
|            50 |    3475.555556 |
|            60 |    5760.000000 |
|            70 |   10000.000000 |
|            80 |    8955.882353 |
|            90 |   19333.333333 |
|           100 |    8600.000000 |
|           110 |   10150.000000 |
+---------------+----------------+


-- 4. Display job ID, number of employees, sum of salary, and difference between highest
-- salary and lowest salary of the employees of the job.
SELECT job_id, SUM(EMPLOYEE_ID) AS TOTAL_EMPLOYEE, SUM(SALARY), MAX(SALARY)-MIN(SALARY) AS DIFFERENCE_MAX_MIN_SALARY
FROM employees
GROUP BY job_id;

+------------+----------------+-------------+---------------------------+
| job_id     | TOTAL_EMPLOYEE | SUM(SALARY) | DIFFERENCE_MAX_MIN_SALARY |
+------------+----------------+-------------+---------------------------+
| AC_ACCOUNT |            206 |     8300.00 |                      0.00 |
| AC_MGR     |            205 |    12000.00 |                      0.00 |
| AD_ASST    |            200 |     4400.00 |                      0.00 |
| AD_PRES    |            100 |    24000.00 |                      0.00 |
| AD_VP      |            203 |    34000.00 |                      0.00 |
| FI_ACCOUNT |            555 |    39600.00 |                   2100.00 |
| FI_MGR     |            108 |    12000.00 |                      0.00 |
| HR_REP     |            203 |     6500.00 |                      0.00 |
| IT_PROG    |            525 |    28800.00 |                   4800.00 |
| MK_MAN     |            201 |    13000.00 |                      0.00 |
| MK_REP     |            202 |     6000.00 |                      0.00 |
| PR_REP     |            204 |    10000.00 |                      0.00 |
| PU_CLERK   |            585 |    13900.00 |                    600.00 |
| PU_MAN     |            114 |    11000.00 |                      0.00 |
| SA_MAN     |            735 |    61000.00 |                   3500.00 |
| SA_REP     |           4935 |   250500.00 |                   5400.00 |
| SH_CLERK   |           3790 |    64300.00 |                   1700.00 |
| ST_CLERK   |           2690 |    55700.00 |                   1500.00 |
| ST_MAN     |            610 |    36400.00 |                   2400.00 |
+------------+----------------+-------------+---------------------------+

-- 5. Display job ID for jobs with average salary more than 10000.

SELECT job_id, AVG(salary) AS AVERAGE_SALARY
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 10000;
+---------+----------------+
| job_id  | AVERAGE_SALARY |
+---------+----------------+
| AC_MGR  |   12000.000000 |
| AD_PRES |   24000.000000 |
| AD_VP   |   17000.000000 |
| FI_MGR  |   12000.000000 |
| MK_MAN  |   13000.000000 |
| PU_MAN  |   11000.000000 |
| SA_MAN  |   12200.000000 |
+---------+----------------+

-- 6. Display years in which more than 10 employees joined.

SELECT YEAR(hire_date) AS years, COUNT(YEAR(Hire_date)) AS count_of_employees_hired
FROM employees
GROUP BY years
HAVING count_of_employees_hired > 10;

+-------+--------------------------+
| years | count_of_employees_hired |
+-------+--------------------------+
|  1987 |                      107 |
+-------+--------------------------+

7. Display departments in which more than five employees have commission percentage.

mysql> SELECT DEPARTMENT_ID,COUNT(COMMISSION_PCT) COMM_COUNT
    -> FROM employees
    -> GROUP BY 1
    -> HAVING COMM_COUNT > 5;
+---------------+------------+
| DEPARTMENT_ID | COMM_COUNT |
+---------------+------------+
|            30 |          6 |
|            50 |         45 |
|            80 |         34 |
|           100 |          6 |
+---------------+------------+
4 rows in set (0.01 sec)




8. Display employee ID for employees who did more than one job in the past.

mysql> SELECT EMPLOYEE_ID,COUNT(JOB_ID) JOBS_COUNT
    -> FROM job_history
    -> GROUP BY 1 
    -> HAVING JOBS_COUNT>1;
+-------------+------------+
| EMPLOYEE_ID | JOBS_COUNT |
+-------------+------------+
|         101 |          2 |
|         176 |          2 |
|         200 |          2 |
+-------------+------------+
3 rows in set (0.00 sec)




9. Display job ID of jobs that were done by more than 3 employees for more than 100 days.
SELECT JOB_ID,COUNT(EMPLOYEE_ID) EMP_COUNT 
FROM employees 
WHERE DATEDIFF(DATE(NOW()),HIRE_DATE) > 100 
GROUP BY 1 
HAVING EMP_COUNT > 3;
+------------+-----------+
| JOB_ID     | EMP_COUNT |
+------------+-----------+
| FI_ACCOUNT |         5 |
| IT_PROG    |         5 |
| PU_CLERK   |         5 |
| SA_MAN     |         5 |
| SA_REP     |        30 |
| SH_CLERK   |        20 |
| ST_CLERK   |        20 |
| ST_MAN     |         5 |
+------------+-----------+
8 rows in set (0.01 sec)




10. Display department ID, year, and Number of employees joined.
mysql> SELECT DEPARTMENT_ID,YEAR(HIRE_DATE) YEAR_HIRE,COUNT(EMPLOYEE_ID) EMP_COUNT
    -> FROM employees
    -> GROUP BY 1,2;
+---------------+-----------+-----------+
| DEPARTMENT_ID | YEAR_HIRE | EMP_COUNT |
+---------------+-----------+-----------+
|            90 |      1987 |         3 |
|            60 |      1987 |         5 |
|           100 |      1987 |         6 |
|            30 |      1987 |         6 |
|            50 |      1987 |        45 |
|            80 |      1987 |        34 |
|             0 |      1987 |         1 |
|            10 |      1987 |         1 |
|            20 |      1987 |         2 |
|            40 |      1987 |         1 |
|            70 |      1987 |         1 |
|           110 |      1987 |         2 |
+---------------+-----------+-----------+
12 rows in set (0.00 sec)



11. Display how many employees joined in each month.
mysql> SELECT COUNT(EMPLOYEE_ID) EMP_COUNT,MONTH(HIRE_DATE) HIRE_MONTH
    -> FROM employees
    -> GROUP BY 2;
+-----------+------------+
| EMP_COUNT | HIRE_MONTH |
+-----------+------------+
|        14 |          6 |
|        31 |          7 |
|        31 |          8 |
|        30 |          9 |
|         1 |         10 |
+-----------+------------+
5 rows in set (0.00 sec)





12. Display details of departments in which the maximum salary is more than 10000.

mysql> SELECT DEPARTMENT_ID,MAX(SALARY) MAX_SAL
    -> FROM employees
    -> GROUP BY 1
    -> HAVING MAX_SAL > 10000;
+---------------+----------+
| DEPARTMENT_ID | MAX_SAL  |
+---------------+----------+
|            20 | 13000.00 |
|            30 | 11000.00 |
|            80 | 14000.00 |
|            90 | 24000.00 |
|           100 | 12000.00 |
|           110 | 12000.00 |
+---------------+----------+
6 rows in set (0.00 sec)

SELECT * 
FROM employees 
WHERE DEPARTMENT_ID IN
     ( SELECT DEPARTMENT_ID 
       FROM employees 
       GROUP BY 1 
       HAVING MAX(SALARY) > 10000
      );
      
 
+-------------+-------------+------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME  | EMAIL    | PHONE_NUMBER       | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+-------------+------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King       | SKING    | 515.123.4567       | 1987-06-17 | AD_PRES    | 24000.00 |           0.00 |          0 |            90 |
|         101 | Neena       | Kochhar    | NKOCHHAR | 515.123.4568       | 1987-06-18 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         102 | Lex         | De Haan    | LDEHAAN  | 515.123.4569       | 1987-06-19 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         108 | Nancy       | Greenberg  | NGREENBE | 515.124.4569       | 1987-06-25 | FI_MGR     | 12000.00 |           0.00 |        101 |           100 |
|         109 | Daniel      | Faviet     | DFAVIET  | 515.124.4169       | 1987-06-26 | FI_ACCOUNT |  9000.00 |           0.00 |        108 |           100 |
|         110 | John        | Chen       | JCHEN    | 515.124.4269       | 1987-06-27 | FI_ACCOUNT |  8200.00 |           0.00 |        108 |           100 |
|         111 | Ismael      | Sciarra    | ISCIARRA | 515.124.4369       | 1987-06-28 | FI_ACCOUNT |  7700.00 |           0.00 |        108 |           100 |
|         112 | Jose Manuel | Urman      | JMURMAN  | 515.124.4469       | 1987-06-29 | FI_ACCOUNT |  7800.00 |           0.00 |        108 |           100 |
|         113 | Luis        | Popp       | LPOPP    | 515.124.4567       | 1987-06-30 | FI_ACCOUNT |  6900.00 |           0.00 |        108 |           100 |
|         114 | Den         | Raphaely   | DRAPHEAL | 515.127.4561       | 1987-07-01 | PU_MAN     | 11000.00 |           0.00 |        100 |            30 |
|         115 | Alexander   | Khoo       | AKHOO    | 515.127.4562       | 1987-07-02 | PU_CLERK   |  3100.00 |           0.00 |        114 |            30 |
|         116 | Shelli      | Baida      | SBAIDA   | 515.127.4563       | 1987-07-03 | PU_CLERK   |  2900.00 |           0.00 |        114 |            30 |
|         117 | Sigal       | Tobias     | STOBIAS  | 515.127.4564       | 1987-07-04 | PU_CLERK   |  2800.00 |           0.00 |        114 |            30 |
|         118 | Guy         | Himuro     | GHIMURO  | 515.127.4565       | 1987-07-05 | PU_CLERK   |  2600.00 |           0.00 |        114 |            30 |
|         119 | Karen       | Colmenares | KCOLMENA | 515.127.4566       | 1987-07-06 | PU_CLERK   |  2500.00 |           0.00 |        114 |            30 |
|         145 | John        | Russell    | JRUSSEL  | 011.44.1344.429268 | 1987-08-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners   | KPARTNER | 011.44.1344.467268 | 1987-08-02 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz  | AERRAZUR | 011.44.1344.429278 | 1987-08-03 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault  | GCAMBRAU | 011.44.1344.619268 | 1987-08-04 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey    | EZLOTKEY | 011.44.1344.429018 | 1987-08-05 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker     | PTUCKER  | 011.44.1344.129268 | 1987-08-06 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein  | DBERNSTE | 011.44.1344.345268 | 1987-08-07 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall       | PHALL    | 011.44.1344.478968 | 1987-08-08 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen      | COLSEN   | 011.44.1344.498718 | 1987-08-09 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault  | NCAMBRAU | 011.44.1344.987668 | 1987-08-10 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault    | OTUVAULT | 011.44.1344.486508 | 1987-08-11 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King       | JKING    | 011.44.1345.429268 | 1987-08-12 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully      | PSULLY   | 011.44.1345.929268 | 1987-08-13 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen     | AMCEWEN  | 011.44.1345.829268 | 1987-08-14 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith      | LSMITH   | 011.44.1345.729268 | 1987-08-15 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran      | LDORAN   | 011.44.1345.629268 | 1987-08-16 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall     | SSEWALL  | 011.44.1345.529268 | 1987-08-17 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney    | CVISHNEY | 011.44.1346.129268 | 1987-08-18 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene     | DGREENE  | 011.44.1346.229268 | 1987-08-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins    | MMARVINS | 011.44.1346.329268 | 1987-08-20 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee        | DLEE     | 011.44.1346.529268 | 1987-08-21 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande       | SANDE    | 011.44.1346.629268 | 1987-08-22 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda      | ABANDA   | 011.44.1346.729268 | 1987-08-23 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer       | LOZER    | 011.44.1343.929268 | 1987-08-24 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom      | HBLOOM   | 011.44.1343.829268 | 1987-08-25 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox        | TFOX     | 011.44.1343.729268 | 1987-08-26 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith      | WSMITH   | 011.44.1343.629268 | 1987-08-27 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates      | EBATES   | 011.44.1343.529268 | 1987-08-28 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar      | SKUMAR   | 011.44.1343.329268 | 1987-08-29 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel       | EABEL    | 011.44.1644.429267 | 1987-08-30 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton     | AHUTTON  | 011.44.1644.429266 | 1987-08-31 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor     | JTAYLOR  | 011.44.1644.429265 | 1987-09-01 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston | JLIVINGS | 011.44.1644.429264 | 1987-09-02 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         179 | Charles     | Johnson    | CJOHNSON | 011.44.1644.429262 | 1987-09-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         201 | Michael     | Hartstein  | MHARTSTE | 515.123.5555       | 1987-09-26 | MK_MAN     | 13000.00 |           0.00 |        100 |            20 |
|         202 | Pat         | Fay        | PFAY     | 603.123.6666       | 1987-09-27 | MK_REP     |  6000.00 |           0.00 |        201 |            20 |
|         205 | Shelley     | Higgins    | SHIGGINS | 515.123.8080       | 1987-09-30 | AC_MGR     | 12000.00 |           0.00 |        101 |           110 |
|         206 | William     | Gietz      | WGIETZ   | 515.123.8181       | 1987-10-01 | AC_ACCOUNT |  8300.00 |           0.00 |        205 |           110 |
+-------------+-------------+------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
53 rows in set (0.00 sec)
