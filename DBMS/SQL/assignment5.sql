--Note : To solve below queries use “hr” database
USE hr;

--1. Display first name and last name after converting the first letter of each name to upper case and the rest to lower case.
SELECT 
  CONCAT(
    UPPER(LEFT(FIRST_NAME,1)),
    LOWER(SUBSTR(FIRST_NAME,2))
  ) CAPITALIZED_NAME
FROM employees;
+------------------+
| CAPITALIZED_NAME |
+------------------+
| Ellen            |
| Sundar           |
| Mozhe            |
| David            |
| Hermann          |
| Shelli           |
| Amit             |
| Elizabeth        |
| Sarah            |
| David            |
| Laura            |
| Harrison         |
| Alexis           |
| Anthony          |
| Gerald           |
| Nanette          |
| John             |
| Kelly            |
| Karen            |
| Curtis           |
| Lex              |
| Julia            |
| Jennifer         |
| Louise           |
| Bruce            |
| Alberto          |
| Britney          |
| Daniel           |
| Pat              |
| Kevin            |
| Jean             |
| Tayler           |
| Adam             |
| Timothy          |
| Ki               |
| Girard           |
| William          |
| Douglas          |
| Kimberely        |
| Nancy            |
| Danielle         |
| Peter            |
| Michael          |
| Shelley          |
| Guy              |
| Alexander        |
| Alyssa           |
| Charles          |
| Vance            |
| Payam            |
| Alexander        |
| Janette          |
| Steven           |
| Neena            |
| Sundita          |
| Renske           |
| James            |
| David            |
| Jack             |
| Diana            |
| Jason            |
| Steven           |
| James            |
| Mattea           |
| Randall          |
| Susan            |
| Samuel           |
| Allan            |
| Irene            |
| Kevin            |
| Julia            |
| Donald           |
| Christopher      |
| Tj               |
| Lisa             |
| Karen            |
| Valli            |
| Joshua           |
| Randall          |
| Hazel            |
| Luis             |
| Trenna           |
| Den              |
| Michael          |
| John             |
| Nandita          |
| Ismael           |
| John             |
| Sarath           |
| Lindsey          |
| William          |
| Stephen          |
| Martha           |
| Patrick          |
| Jonathon         |
| Winston          |
| Sigal            |
| Peter            |
| Oliver           |
| Jose manuel      |
| Peter            |
| Clara            |
| Shanta           |
| Alana            |
| Matthew          |
| Jennifer         |
| Eleni            |
+------------------+
107 rows in set (0.00 sec)



--2. Display the first word in job title.
SELECT     
    CASE WHEN POSITION(' ' IN JOB_TITLE)=0 THEN JOB_TITLE      
         ELSE LEFT(JOB_TITLE,POSITION(' ' IN JOB_TITLE))    
    END AS JOB_TITLE_FIRST_WORDS 
FROM jobs;
+-----------------------+
| JOB_TITLE_FIRST_WORDS |
+-----------------------+
| President             |
| Administration        |
| Administration        |
| Finance               |
| Accountant            |
| Accounting            |
| Public                |
| Sales                 |
| Sales                 |
| Purchasing            |
| Purchasing            |
| Stock                 |
| Stock                 |
| Shipping              |
| Programmer            |
| Marketing             |
| Marketing             |
| Human                 |
| Public                |
+-----------------------+
19 rows in set (0.00 sec)




--3. Display the length of first name for employees where last name contain character ‘b’ after 3rd position.
SELECT LENGTH(FIRST_NAME) FIRST_NAME_LENGTH 
FROM employees 
WHERE LAST_NAME LIKE '__%B%';
+-------------------+
| FIRST_NAME_LENGTH |
+-------------------+
|                 7 |
|                 6 |
|                 7 |
|                 5 |
|                 5 |
|                 5 |
+-------------------+
6 rows in set (0.00 sec)




--4. Display first name in upper case and email address in lower case for employees where the first name and email address are same irrespective of the case.
mysql> SELECT UPPER(FIRST_NAME), LOWER(EMAIL)
    -> FROM employees
    -> WHERE UPPER(FIRST_NAME)=UPPER(EMAIL);
Empty set (0.01 sec)




--5. Display first name, salary, and round the salary to thousands.
mysql> SELECT FIRST_NAME,ROUND(SALARY,-3) ROUNDED_SAL_K
    -> FROM employees;
+-------------+---------------+
| FIRST_NAME  | ROUNDED_SAL_K |
+-------------+---------------+
| Steven      |         24000 |
| Neena       |         17000 |
| Lex         |         17000 |
| Alexander   |          9000 |
| Bruce       |          6000 |
| David       |          5000 |
| Valli       |          5000 |
| Diana       |          4000 |
| Nancy       |         12000 |
| Daniel      |          9000 |
| John        |          8000 |
| Ismael      |          8000 |
| Jose Manuel |          8000 |
| Luis        |          7000 |
| Den         |         11000 |
| Alexander   |          3000 |
| Shelli      |          3000 |
| Sigal       |          3000 |
| Guy         |          3000 |
| Karen       |          3000 |
| Matthew     |          8000 |
| Adam        |          8000 |
| Payam       |          8000 |
| Shanta      |          7000 |
| Kevin       |          6000 |
| Julia       |          3000 |
| Irene       |          3000 |
| James       |          2000 |
| Steven      |          2000 |
| Laura       |          3000 |
| Mozhe       |          3000 |
| James       |          3000 |
| TJ          |          2000 |
| Jason       |          3000 |
| Michael     |          3000 |
| Ki          |          2000 |
| Hazel       |          2000 |
| Renske      |          4000 |
| Stephen     |          3000 |
| John        |          3000 |
| Joshua      |          3000 |
| Trenna      |          4000 |
| Curtis      |          3000 |
| Randall     |          3000 |
| Peter       |          3000 |
| John        |         14000 |
| Karen       |         14000 |
| Alberto     |         12000 |
| Gerald      |         11000 |
| Eleni       |         11000 |
| Peter       |         10000 |
| David       |         10000 |
| Peter       |          9000 |
| Christopher |          8000 |
| Nanette     |          8000 |
| Oliver      |          7000 |
| Janette     |         10000 |
| Patrick     |         10000 |
| Allan       |          9000 |
| Lindsey     |          8000 |
| Louise      |          8000 |
| Sarath      |          7000 |
| Clara       |         11000 |
| Danielle    |         10000 |
| Mattea      |          7000 |
| David       |          7000 |
| Sundar      |          6000 |
| Amit        |          6000 |
| Lisa        |         12000 |
| Harrison    |         10000 |
| Tayler      |         10000 |
| William     |          7000 |
| Elizabeth   |          7000 |
| Sundita     |          6000 |
| Ellen       |         11000 |
| Alyssa      |          9000 |
| Jonathon    |          9000 |
| Jack        |          8000 |
| Kimberely   |          7000 |
| Charles     |          6000 |
| Winston     |          3000 |
| Jean        |          3000 |
| Martha      |          3000 |
| Girard      |          3000 |
| Nandita     |          4000 |
| Alexis      |          4000 |
| Julia       |          3000 |
| Anthony     |          3000 |
| Kelly       |          4000 |
| Jennifer    |          4000 |
| Timothy     |          3000 |
| Randall     |          3000 |
| Sarah       |          4000 |
| Britney     |          4000 |
| Samuel      |          3000 |
| Vance       |          3000 |
| Alana       |          3000 |
| Kevin       |          3000 |
| Donald      |          3000 |
| Douglas     |          3000 |
| Jennifer    |          4000 |
| Michael     |         13000 |
| Pat         |          6000 |
| Susan       |          7000 |
| Hermann     |         10000 |
| Shelley     |         12000 |
| William     |          8000 |
+-------------+---------------+
107 rows in set (0.00 sec)




--6. Display employee ID and the date on which he ended his previous job.
mysql> SELECT EMPLOYEE_ID,END_DATE
    -> FROM job_history;
+-------------+------------+
| EMPLOYEE_ID | END_DATE   |
+-------------+------------+
|         102 | 1998-07-24 |
|         101 | 1993-10-27 |
|         101 | 1997-03-15 |
|         201 | 1999-12-19 |
|         114 | 1999-12-31 |
|         122 | 1999-12-31 |
|         200 | 1993-06-17 |
|         176 | 1998-12-31 |
|         176 | 1999-12-31 |
|         200 | 1998-12-31 |
|           0 | 0000-00-00 |
+-------------+------------+
11 rows in set (0.01 sec)



--7. Display first name and date of first salary of the employees.
--(Consider 1st day of month as salary day) HINT: LAST_DAY.
SELECT FIRST_NAME, HIRE_DATE, 
	DATE_ADD(LAST_DAY(HIRE_DATE),INTERVAL 1 DAY) AS FIRST_SAL_DAY FROM employees;
+-------------+------------+---------------+
| FIRST_NAME  | HIRE_DATE  | FIRST_SAL_DAY |
+-------------+------------+---------------+
| Steven      | 1987-06-17 | 1987-07-01    |
| Neena       | 1987-06-18 | 1987-07-01    |
| Lex         | 1987-06-19 | 1987-07-01    |
| Alexander   | 1987-06-20 | 1987-07-01    |
| Bruce       | 1987-06-21 | 1987-07-01    |
| David       | 1987-06-22 | 1987-07-01    |
| Valli       | 1987-06-23 | 1987-07-01    |
| Diana       | 1987-06-24 | 1987-07-01    |
| Nancy       | 1987-06-25 | 1987-07-01    |
| Daniel      | 1987-06-26 | 1987-07-01    |
| John        | 1987-06-27 | 1987-07-01    |
| Ismael      | 1987-06-28 | 1987-07-01    |
| Jose Manuel | 1987-06-29 | 1987-07-01    |
| Luis        | 1987-06-30 | 1987-07-01    |
| Den         | 1987-07-01 | 1987-08-01    |
| Alexander   | 1987-07-02 | 1987-08-01    |
| Shelli      | 1987-07-03 | 1987-08-01    |
| Sigal       | 1987-07-04 | 1987-08-01    |
| Guy         | 1987-07-05 | 1987-08-01    |
| Karen       | 1987-07-06 | 1987-08-01    |
| Matthew     | 1987-07-07 | 1987-08-01    |
| Adam        | 1987-07-08 | 1987-08-01    |
| Payam       | 1987-07-09 | 1987-08-01    |
| Shanta      | 1987-07-10 | 1987-08-01    |
| Kevin       | 1987-07-11 | 1987-08-01    |
| Julia       | 1987-07-12 | 1987-08-01    |
| Irene       | 1987-07-13 | 1987-08-01    |
| James       | 1987-07-14 | 1987-08-01    |
| Steven      | 1987-07-15 | 1987-08-01    |
| Laura       | 1987-07-16 | 1987-08-01    |
| Mozhe       | 1987-07-17 | 1987-08-01    |
| James       | 1987-07-18 | 1987-08-01    |
| TJ          | 1987-07-19 | 1987-08-01    |
| Jason       | 1987-07-20 | 1987-08-01    |
| Michael     | 1987-07-21 | 1987-08-01    |
| Ki          | 1987-07-22 | 1987-08-01    |
| Hazel       | 1987-07-23 | 1987-08-01    |
| Renske      | 1987-07-24 | 1987-08-01    |
| Stephen     | 1987-07-25 | 1987-08-01    |
| John        | 1987-07-26 | 1987-08-01    |
| Joshua      | 1987-07-27 | 1987-08-01    |
| Trenna      | 1987-07-28 | 1987-08-01    |
| Curtis      | 1987-07-29 | 1987-08-01    |
| Randall     | 1987-07-30 | 1987-08-01    |
| Peter       | 1987-07-31 | 1987-08-01    |
| John        | 1987-08-01 | 1987-09-01    |
| Karen       | 1987-08-02 | 1987-09-01    |
| Alberto     | 1987-08-03 | 1987-09-01    |
| Gerald      | 1987-08-04 | 1987-09-01    |
| Eleni       | 1987-08-05 | 1987-09-01    |
| Peter       | 1987-08-06 | 1987-09-01    |
| David       | 1987-08-07 | 1987-09-01    |
| Peter       | 1987-08-08 | 1987-09-01    |
| Christopher | 1987-08-09 | 1987-09-01    |
| Nanette     | 1987-08-10 | 1987-09-01    |
| Oliver      | 1987-08-11 | 1987-09-01    |
| Janette     | 1987-08-12 | 1987-09-01    |
| Patrick     | 1987-08-13 | 1987-09-01    |
| Allan       | 1987-08-14 | 1987-09-01    |
| Lindsey     | 1987-08-15 | 1987-09-01    |
| Louise      | 1987-08-16 | 1987-09-01    |
| Sarath      | 1987-08-17 | 1987-09-01    |
| Clara       | 1987-08-18 | 1987-09-01    |
| Danielle    | 1987-08-19 | 1987-09-01    |
| Mattea      | 1987-08-20 | 1987-09-01    |
| David       | 1987-08-21 | 1987-09-01    |
| Sundar      | 1987-08-22 | 1987-09-01    |
| Amit        | 1987-08-23 | 1987-09-01    |
| Lisa        | 1987-08-24 | 1987-09-01    |
| Harrison    | 1987-08-25 | 1987-09-01    |
| Tayler      | 1987-08-26 | 1987-09-01    |
| William     | 1987-08-27 | 1987-09-01    |
| Elizabeth   | 1987-08-28 | 1987-09-01    |
| Sundita     | 1987-08-29 | 1987-09-01    |
| Ellen       | 1987-08-30 | 1987-09-01    |
| Alyssa      | 1987-08-31 | 1987-09-01    |
| Jonathon    | 1987-09-01 | 1987-10-01    |
| Jack        | 1987-09-02 | 1987-10-01    |
| Kimberely   | 1987-09-03 | 1987-10-01    |
| Charles     | 1987-09-04 | 1987-10-01    |
| Winston     | 1987-09-05 | 1987-10-01    |
| Jean        | 1987-09-06 | 1987-10-01    |
| Martha      | 1987-09-07 | 1987-10-01    |
| Girard      | 1987-09-08 | 1987-10-01    |
| Nandita     | 1987-09-09 | 1987-10-01    |
| Alexis      | 1987-09-10 | 1987-10-01    |
| Julia       | 1987-09-11 | 1987-10-01    |
| Anthony     | 1987-09-12 | 1987-10-01    |
| Kelly       | 1987-09-13 | 1987-10-01    |
| Jennifer    | 1987-09-14 | 1987-10-01    |
| Timothy     | 1987-09-15 | 1987-10-01    |
| Randall     | 1987-09-16 | 1987-10-01    |
| Sarah       | 1987-09-17 | 1987-10-01    |
| Britney     | 1987-09-18 | 1987-10-01    |
| Samuel      | 1987-09-19 | 1987-10-01    |
| Vance       | 1987-09-20 | 1987-10-01    |
| Alana       | 1987-09-21 | 1987-10-01    |
| Kevin       | 1987-09-22 | 1987-10-01    |
| Donald      | 1987-09-23 | 1987-10-01    |
| Douglas     | 1987-09-24 | 1987-10-01    |
| Jennifer    | 1987-09-25 | 1987-10-01    |
| Michael     | 1987-09-26 | 1987-10-01    |
| Pat         | 1987-09-27 | 1987-10-01    |
| Susan       | 1987-09-28 | 1987-10-01    |
| Hermann     | 1987-09-29 | 1987-10-01    |
| Shelley     | 1987-09-30 | 1987-10-01    |
| William     | 1987-10-01 | 1987-11-01    |
+-------------+------------+---------------+
107 rows in set (0.00 sec)






--8. Display first name and experience of the employees.
SELECT FIRST_NAME,YEAR(NOW())-YEAR(HIRE_DATE) EXP_YR 
FROM employees;
+-------------+--------+
| FIRST_NAME  | EXP_YR |
+-------------+--------+
| Steven      |     36 |
| Neena       |     36 |
| Lex         |     36 |
| Alexander   |     36 |
| Bruce       |     36 |
| David       |     36 |
| Valli       |     36 |
| Diana       |     36 |
| Nancy       |     36 |
| Daniel      |     36 |
| John        |     36 |
| Ismael      |     36 |
| Jose Manuel |     36 |
| Luis        |     36 |
| Den         |     36 |
| Alexander   |     36 |
| Shelli      |     36 |
| Sigal       |     36 |
| Guy         |     36 |
| Karen       |     36 |
| Matthew     |     36 |
| Adam        |     36 |
| Payam       |     36 |
| Shanta      |     36 |
| Kevin       |     36 |
| Julia       |     36 |
| Irene       |     36 |
| James       |     36 |
| Steven      |     36 |
| Laura       |     36 |
| Mozhe       |     36 |
| James       |     36 |
| TJ          |     36 |
| Jason       |     36 |
| Michael     |     36 |
| Ki          |     36 |
| Hazel       |     36 |
| Renske      |     36 |
| Stephen     |     36 |
| John        |     36 |
| Joshua      |     36 |
| Trenna      |     36 |
| Curtis      |     36 |
| Randall     |     36 |
| Peter       |     36 |
| John        |     36 |
| Karen       |     36 |
| Alberto     |     36 |
| Gerald      |     36 |
| Eleni       |     36 |
| Peter       |     36 |
| David       |     36 |
| Peter       |     36 |
| Christopher |     36 |
| Nanette     |     36 |
| Oliver      |     36 |
| Janette     |     36 |
| Patrick     |     36 |
| Allan       |     36 |
| Lindsey     |     36 |
| Louise      |     36 |
| Sarath      |     36 |
| Clara       |     36 |
| Danielle    |     36 |
| Mattea      |     36 |
| David       |     36 |
| Sundar      |     36 |
| Amit        |     36 |
| Lisa        |     36 |
| Harrison    |     36 |
| Tayler      |     36 |
| William     |     36 |
| Elizabeth   |     36 |
| Sundita     |     36 |
| Ellen       |     36 |
| Alyssa      |     36 |
| Jonathon    |     36 |
| Jack        |     36 |
| Kimberely   |     36 |
| Charles     |     36 |
| Winston     |     36 |
| Jean        |     36 |
| Martha      |     36 |
| Girard      |     36 |
| Nandita     |     36 |
| Alexis      |     36 |
| Julia       |     36 |
| Anthony     |     36 |
| Kelly       |     36 |
| Jennifer    |     36 |
| Timothy     |     36 |
| Randall     |     36 |
| Sarah       |     36 |
| Britney     |     36 |
| Samuel      |     36 |
| Vance       |     36 |
| Alana       |     36 |
| Kevin       |     36 |
| Donald      |     36 |
| Douglas     |     36 |
| Jennifer    |     36 |
| Michael     |     36 |
| Pat         |     36 |
| Susan       |     36 |
| Hermann     |     36 |
| Shelley     |     36 |
| William     |     36 |
+-------------+--------+
107 rows in set (0.00 sec)





--9. Display first name of employees who joined in 2001.
SELECT FIRST_NAME
    -> FROM employees
    -> WHERE YEAR(HIRE_DATE)=2001;
Empty set (0.00 sec)





--10. Display employees who joined in the current year.
SELECT * FROM employees WHERE YEAR(HIRE_DATE)=YEAR(NOW());
Empty set (0.01 sec)



--11. Display the number of days between system date and 1st January 2011.
SELECT DATEDIFF(DATE(NOW()),'2011-01-01');
+------------------------------------+
| DATEDIFF(DATE(NOW()),'2011-01-01') |
+------------------------------------+
|                               4682 |
+------------------------------------+
1 row in set (0.04 sec)



--12. Display number of employees joined after 15th of the month.
 SELECT COUNT(*)
    -> FROM employees
    -> WHERE DAY(HIRE_DATE)>15;
+----------+
| COUNT(*) |
+----------+
|       61 |
+----------+
1 row in set (0.00 sec)




--13. Display third highest salary of employees. 
 SELECT SALARY
    -> FROM employees
    -> LIMIT 2,1;
+----------+
| SALARY   |
+----------+
| 17000.00 |
+----------+
1 row in set (0.00 sec)

--------------------------------------------------------------------

--Note : To solve below queries use “spj” database
--1. Display all the Suppliers, belonging to cities starting with the letter ‘L’.
mysql> SELECT *
    -> FROM S
    -> WHERE city LIKE 'L%';
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S4 | Clark |     20 | London |
+----+-------+--------+--------+
2 rows in set (0.01 sec)




--2. Display all the Jobs, with the third letter in JNAME as ‘n’.
Mysql> SELECT *
    -> FROM J
    -> WHERE Jname LIKE '__n%';
+----+---------+--------+
| J# | Jname   | City   |
+----+---------+--------+
| J2 | Punch   | Rome   |
| J4 | Console | Athens |
+----+---------+--------+
2 rows in set (0.00 sec)




--3. Display all the Supplier names with the initial letter capital.
SELECT
    CONCAT(
           UPPER(LEFT(Sname,1)),
           LOWER(SUBSTR(Sname,2))    
    ) supplier_capitalized 
FROM S;
+----------------------+
| supplier_capitalized |
+----------------------+
| Smith                |
| Jones                |
| Blake                |
| Clark                |
| Adams                |
+----------------------+
5 rows in set (0.00 sec)





--4. Display all the Supplier names in upper case.
mysql> SELECT UPPER(Sname) supplier_upper
    -> FROM S;
+----------------+
| supplier_upper |
+----------------+
| SMITH          |
| JONES          |
| BLAKE          |
| CLARK          |
| ADAMS          |
+----------------+
5 rows in set (0.00 sec)





---5. Display all the Supplier names in lower case.
SELECT LOWER(Sname) supplier_lower FROM S;
+----------------+
| supplier_lower |
+----------------+
| smith          |
| jones          |
| blake          |
| clark          |
| adams          |
+----------------+
5 rows in set (0.00 sec)





--6. Display the Supplier names and the lengths of the names.
SELECT Sname,LENGTH(Sname) supplier_name_len FROM S;
+-------+-------------------+
| Sname | supplier_name_len |
+-------+-------------------+
| Smith |                 5 |
| Jones |                 5 |
| Blake |                 5 |
| Clark |                 5 |
| Adams |                 5 |
+-------+-------------------+
5 rows in set (0.00 sec)





--7. Display the current day (e.g. Thursday).
SELECT DAYNAME(NOW());
+----------------+
| DAYNAME(NOW()) |
+----------------+
| Friday         |
+----------------+
1 row in set (0.00 sec)




--8. Display the minimum Status in the Supplier table.
SELECT MIN(Status) MIN_STATUS
FROM S;
+------------+
| MIN_STATUS |
+------------+
|         10 |
+------------+
1 row in set (0.00 sec)





--9. Display the maximum Weight in the Parts table.
SELECT MAX(Weight) MAX_WEIGHT
FROM P;
+------------+
| MAX_WEIGHT |
+------------+
|         19 |
+------------+
1 row in set (0.00 sec)





--10. Display the average Weight of the Parts.
SELECT AVG(Weight) AVG_WEIGHT FROM P;
+------------+
| AVG_WEIGHT |
+------------+
|    15.1667 |
+------------+
1 row in set (0.00 sec)



--11. Display the total Quantity sold for part ‘P1’.
SELECT SUM(QTY) P1_TOTAL_QTY
    -> FROM sp
    -> WHERE `P#`='P1';
+--------------+
| P1_TOTAL_QTY |
+--------------+
|         1000 |
+--------------+
1 row in set (0.07 sec)





--12. Display all the Supplier names (with ‘la’ replaced by ‘ro’).
HINT: REPLACE.

SELECT REPLACE(Sname,'la','ro') Sname_replaced,Sname FROM S;
+----------------+-------+
| Sname_replaced | Sname |
+----------------+-------+
| Smith          | Smith |
| Jones          | Jones |
| Broke          | Blake |
| Crork          | Clark |
| Adams          | Adams |
+----------------+-------+
5 rows in set (0.00 sec)

