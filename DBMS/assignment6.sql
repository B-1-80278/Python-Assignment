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

-- 7. Display departments in which more than five employees have commission percentage.

SELECT department_id, 
-- 8. Display employee ID for employees who did more than one job in the past.

SELECT employee_id, job_id
FROM job_history;



-- 9. Display job ID of jobs that were done by more than 3 employees for more than 100 days.
-- 10. Display department ID, year, and Number of employees joined.
-- 11. Display how many employees joined in each month of the current year.
-- 12. Display details of departments in which the maximum salary is more than 10000.
