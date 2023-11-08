-- Database Technologies – Assignment 7
-- Use appropriate joins to solve following queries.
-- Note : To solve below queries use “sales” database
-- 1. Write a query that lists each order number followed by the name of the customer who made the order.
SELECT o.onum, c.cname 
FROM orders o
LEFT JOIN customers c
ON o.cnum = c.cnum
ORDER BY o.onum;

+------+----------+
| onum | cname    |
+------+----------+
| 3001 | Cisneros |
| 3002 | Pereira  |
| 3003 | Hoffman  |
| 3005 | Liu      |
| 3006 | Cisneros |
| 3007 | Grass    |
| 3008 | Clemens  |
| 3009 | Giovanni |
| 3010 | Grass    |
| 3011 | Clemens  |
+------+----------+


-- 2. Write a query that gives the names of both the salesperson and the customer for each order along with the order number.

SELECT o.onum, s.sname, c.cname
FROM orders o
LEFT JOIN salespeople s ON o.snum = s.snum
INNER JOIN customers c ON s.snum = c.snum
ORDER BY o.onum;

+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3001 | Rifkin  | Cisneros |
| 3002 | Motika  | Pereira  |
| 3003 | Peel    | Hoffman  |
| 3003 | Peel    | Clemens  |
| 3005 | Serres  | Liu      |
| 3005 | Serres  | Grass    |
| 3006 | Rifkin  | Cisneros |
| 3007 | Serres  | Liu      |
| 3007 | Serres  | Grass    |
| 3008 | Peel    | Hoffman  |
| 3008 | Peel    | Clemens  |
| 3009 | Axelrod | Giovanni |
| 3010 | Serres  | Liu      |
| 3010 | Serres  | Grass    |
| 3011 | Peel    | Hoffman  |
| 3011 | Peel    | Clemens  |
+------+---------+----------+

-- 3. Write a query that produces all customers serviced by salespeople with a commission above 12%. Output the customer’s name, the salesperson’s name, and the salesperson’s rate of commission.
SELECT  c.cname, s.sname, s.comm
FROM salespeople s
LEFT JOIN customers c ON s.snum = c.snum
WHERE comm > 0.12
ORDER BY s.sname;

+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Cisneros | Rifkin | 0.15 |
| Grass    | Serres | 0.13 |
| Liu      | Serres | 0.13 |
+----------+--------+------+

-- 4. Write a query that calculates the amount of the salesperson’s commission on each order by a customer with a rating above 100.

SELECT DISTINCT o.onum, s.sname, (s.comm*o.amt) AS commission
FROM orders o 
LEFT JOIN salespeople s ON o.snum = s.snum
INNER JOIN customers c ON c.snum = s.snum 
WHERE rating > 100
ORDER BY o.onum;
+------+---------+------------+
| onum | sname   | commission |
+------+---------+------------+
| 3001 | Rifkin  |     2.8035 |
| 3005 | Serres  |   670.8585 |
| 3006 | Rifkin  |   164.7240 |
| 3007 | Serres  |     9.8475 |
| 3009 | Axelrod |   171.3230 |
| 3010 | Serres  |    40.2935 |
+------+---------+------------+

-- 5. Write a query that produces all pairs of salespeople who are living in the same city.Exclude combinations of salespeople with themselves as well as duplicate rows with the order reversed.
SELECT s.sname, c.sname, c.city
FROM salespeople s
INNER JOIN salespeople c;

Note : To solve below queries use “spj” database

-- 1. Display the Supplier name and the Quantity sold.
SELECT S.sname, SUM(SP.qty) AS Qunatity
FROM S 
INNER JOIN SP ON S.`S#` = SP.`S#`
GROUP BY S.sname;
+-------+----------+
| sname | Qunatity |
+-------+----------+
| Smith |      900 |
| Jones |     3200 |
| Blake |      700 |
| Clark |      600 |
| Adams |     3100 |
+-------+----------+
5 rows in set (0.01 sec)

-- 2. Display the Part name and Quantity sold.
SELECT P.Pname, SUM(SP.QTY)
FROM P
INNER JOIN SP ON SP.`P#` = P.`P#`
GROUP BY P.Pname;

+-------+-------------+
| Pname | SUM(SP.QTY) |
+-------+-------------+
| Nut   |        1000 |
| Screw |        4800 |
| Cam   |        1100 |
| Cog   |        1300 |
| Bolt  |         300 |
+-------+-------------+
5 rows in set (0.01 sec)


-- 3. Display the Job name and Quantity sold.
SELECT J.Jname, SUM(SP.QTY)
FROM J
INNER JOIN SP ON SP.`J#` = J.`J#`
GROUP BY J.Jname;
+----------+-------------+
| Jname    | SUM(SP.QTY) |
+----------+-------------+
| Sorter   |         800 |
| Console  |        3300 |
| Punch    |        1200 |
| Reader   |         500 |
| Collator |        1100 |
| Terminal |         400 |
| Tape     |        1200 |
+----------+-------------+
7 rows in set (0.00 sec)

-- 4. Display the Supplier name, Part name, Job name and Quantity sold.

SELECT DISTINCT S.sname, J.Jname, P.Pname, SP.qty AS Qunatity
FROM SP 
INNER JOIN J ON J.`J#` = SP.`J#`
INNER JOIN P ON P.`P#` = SP.`P#`
INNER JOIN S ON S.`S#` = SP.`S#`;
+-------+----------+-------+----------+
| sname | Jname    | Pname | Qunatity |
+-------+----------+-------+----------+
| Jones | Sorter   | Screw |      400 |
| Blake | Sorter   | Screw |      200 |
| Smith | Sorter   | Nut   |      200 |
| Adams | Punch    | Cog   |      200 |
| Jones | Punch    | Cam   |      100 |
| Blake | Punch    | Screw |      500 |
| Jones | Punch    | Screw |      200 |
| Adams | Punch    | Bolt  |      200 |
| Clark | Reader   | Cog   |      300 |
| Jones | Reader   | Screw |      200 |
| Adams | Console  | Cog   |      500 |
| Adams | Console  | Cam   |      400 |
| Adams | Console  | Screw |      800 |
| Jones | Console  | Screw |      500 |
| Adams | Console  | Screw |      200 |
| Adams | Console  | Bolt  |      100 |
| Smith | Console  | Nut   |      700 |
| Adams | Console  | Nut   |      100 |
| Adams | Collator | Cam   |      500 |
| Jones | Collator | Screw |      600 |
| Jones | Terminal | Screw |      400 |
| Clark | Tape     | Cog   |      300 |
| Adams | Tape     | Cam   |      100 |
| Jones | Tape     | Screw |      800 |
+-------+----------+-------+----------+
24 rows in set (0.00 sec)


-- 5. Display the Supplier name, Supplying Parts to a Job in the same City
SELECT S.sname, P.Pname, S.city, P.city
FROM S 
INNER JOIN P ON P.city = S.city;
-- 6. Display the Part name that is ‘Red’ in color, and the Quantity sold.
SELECT P.Pname, P.color, SUM(SP.QTY) AS Quantity
FROM P 
INNER JOIN SP ON SP.`P#`=P.`P#`
WHERE P.color = 'Red'
GROUP BY P.Pname;

+-------+-------+----------+
| Pname | color | Quantity |
+-------+-------+----------+
| Nut   | Red   |     1000 |
| Screw | Red   |     1300 |
| Cog   | Red   |     1300 |
+-------+-------+----------+
3 rows in set (0.00 sec)


-- 7. Display all the Quantity sold by Suppliers with the Status = 20.

SELECT S.Sname, S.status, SUM(SP.QTY)
FROM S
INNER JOIN SP ON SP.`S#`= S.`S#`
WHERE S.status = 20
GROUP BY S.Sname;

+-------+--------+-------------+
| Sname | status | SUM(SP.QTY) |
+-------+--------+-------------+
| Smith |     20 |         900 |
| Clark |     20 |         600 |
+-------+--------+-------------+
2 rows in set (0.00 sec)

 
-- 8. Display all the Parts and Quantity with a Weight > 14.
SELECT P.Pname, SUM(SP.QTY), P.weight
FROM P
INNER JOIN SP ON SP.`P#`=P.`P#`
WHERE P.weight > 14
GROUP BY P.Pname, P.weight;
+-------+-------------+--------+
| Pname | SUM(SP.QTY) | weight |
+-------+-------------+--------+
| Screw |        3500 |     17 |
| Cog   |        1300 |     19 |
| Bolt  |         300 |     17 |
+-------+-------------+--------+
3 rows in set (0.00 sec)


-- 9. Display all the Job names and City, which has bought more than 500 Parts.
SELECT J.Jname, SP.QTY, S.CITY, P.CITY, J.CITY
FROM J
INNER JOIN SP ON SP.`J#`=J.`J#`
INNER JOIN P ON SP.`P#`=P.`P#`
INNER JOIN S ON SP.`S#`=S.`S#`
WHERE QTY > 500;
+----------+------+--------+--------+--------+
| Jname    | QTY  | CITY   | CITY   | CITY   |
+----------+------+--------+--------+--------+
| Console  |  800 | Athens | London | Athens |
| Console  |  700 | London | London | Athens |
| Collator |  600 | Paris  | Rome   | London |
| Tape     |  800 | Paris  | Rome   | London |
+----------+------+--------+--------+--------+
4 rows in set (0.00 sec)


-- 10. Display all the Part names and Quantity sold that have a Weight less than 15.
SELECT P.Pname, SUM(SP.QTY), P.weight
FROM P
INNER JOIN SP ON P.`P#`=SP.`P#`
WHERE P.weight < 15
GROUP BY P.Pname, P.weight;
+-------+-------------+--------+
| Pname | SUM(SP.QTY) | weight |
+-------+-------------+--------+
| Nut   |        1000 |     12 |
| Cam   |        1100 |     12 |
| Screw |        1300 |     14 |
+-------+-------------+--------+
3 rows in set (0.04 sec)


-- 11. Display all the Suppliers with the same Status as the supplier, ‘CLARK’.
SELECT DISTINCT S.status, S.Sname,  A.Sname
FROM S 
INNER JOIN S AS A 
WHERE S.status = A.status AND S.Sname != A.Sname;

12. Display all the Parts which have more Weight than any Red parts.

SELECT Pname,Weight,Color   
FROM P   
WHERE Weight > 
	(
	SELECT MIN(Weight) 
	FROM P 
	WHERE Color='Red') 
AND Color!='Red';
	
+-------+--------+-------+
| Pname | Weight | Color |
+-------+--------+-------+
| Bolt  |     17 | Green |
| Screw |     17 | Blue  |
+-------+--------+-------+
2 rows in set (0.00 sec)









13. Display all the Jobs going on in the same city as the job ‘TAPE’.
SELECT Jname,City 
FROM J 
WHERE City=(SELECT City FROM J WHERE Jname='Tape') AND Jname!='Tape';
+----------+--------+
| Jname    | City   |
+----------+--------+
| Collator | London |
+----------+--------+
1 row in set (0.00 sec)




14. Display all the Parts with Weight less than any the Green parts.

SELECT Pname,Weight,Color   
FROM P   
WHERE Weight < (SELECT MIN(Weight) FROM P WHERE Color='Green') AND Color!='Green';
+-------+--------+-------+
| Pname | Weight | Color |
+-------+--------+-------+
| Nut   |     12 | Red   |
| Screw |     14 | Red   |
| Cam   |     12 | Blue  |
+-------+--------+-------+
3 rows in set (0.01 sec)




15. Display the name of the Supplier who has sold the maximum Quantity (in onesale).

SELECT Sname,MAX(QTY) 
FROM S 
JOIN sp ON S.`S#`=sp.`S#` 
GROUP BY Sname 
ORDER BY 2 DESC 
LIMIT 1;

+-------+----------+
| Sname | MAX(QTY) |
+-------+----------+
| Adams |      800 |
+-------+----------+
1 row in set (0.00 sec)





16. Display the name of the Supplier who has sold the maximum overall Quantity
(sumof Sales).

mysql> SELECT Sname,SUM(QTY)
    -> FROM S
    -> JOIN sp ON sp.`S#`=S.`S#`
    -> GROUP BY Sname
    -> ORDER BY SUM(QTY) DESC
    -> LIMIT 1;
+-------+----------+
| Sname | SUM(QTY) |
+-------+----------+
| Jones |     3200 |
+-------+----------+
1 row in set (0.00 sec)
