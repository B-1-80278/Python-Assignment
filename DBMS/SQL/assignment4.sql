-Database Technologies – Assignment 4
--Note : To solve below queries use “spj” database
USE spj;

--1. Display the PNAME and COLOR from the P table for the
--CITY=”London”.
 SELECT PNAME,COLOR
    -> FROM P
    -> WHERE CITY='London';
+-------+-------+
| PNAME | COLOR |
+-------+-------+
| Nut   | Red   |
| Screw | Red   |
| Cog   | Red   |
+-------+-------+
3 rows in set (0.00 sec)



--2. Display all the Suppliers from London.
SELECT *
    -> FROM S
    -> WHERE CITY='London';
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S4 | Clark |     20 | London |
+----+-------+--------+--------+
2 rows in set (0.00 sec)



--3. Display all the Suppliers from Paris or Athens.
mysql> SELECT * FROM S WHERE CITY IN ('Paris','Athens');
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S2 | Jones |     10 | Paris  |
| S3 | Blake |     30 | Paris  |
| S5 | Adams |     30 | Athens |
+----+-------+--------+--------+
3 rows in set (0.00 sec)



--4. Display all the Jobs in Athens.
mysql> SELECT * 
    -> FROM J
    -> WHERE CITY='Athens';
+----+---------+--------+
| J# | Jname   | City   |
+----+---------+--------+
| J3 | Reader  | Athens |
| J4 | Console | Athens |
+----+---------+--------+
2 rows in set (0.06 sec)




--5. Display all the Part names with the weight between 12 and 14
--(inclusive of both).
mysql> SELECT *
    -> FROM P
    -> WHERE WEIGHT BETWEEN 12 AND 14;
+----+-------+-------+--------+--------+
| P# | Pname | color | weight | city   |
+----+-------+-------+--------+--------+
| P1 | Nut   | Red   |     12 | London |
| P4 | Screw | Red   |     14 | London |
| P5 | Cam   | Blue  |     12 | Paris  |
+----+-------+-------+--------+--------+
3 rows in set (0.00 sec)






--6. Display all the Suppliers with a Status greater than or equal
--to 20.
mysql> SELECT * FROM S WHERE status>=20;
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S3 | Blake |     30 | Paris  |
| S4 | Clark |     20 | London |
| S5 | Adams |     30 | Athens |
+----+-------+--------+--------+
4 rows in set (0.00 sec)



--7. Display all the Suppliers except the Suppliers from London.
mysql> SELECT *
    -> FROM S
    -> WHERE city!='London';
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S2 | Jones |     10 | Paris  |
| S3 | Blake |     30 | Paris  |
| S5 | Adams |     30 | Athens |
+----+-------+--------+--------+
3 rows in set (0.00 sec)






--8. Display only the Cities from where the Suppliers come from.
mysql> SELECT DISTINCT city
    -> FROM S
    -> ;
+--------+
| city   |
+--------+
| London |
| Paris  |
| Athens |
+--------+
3 rows in set (0.04 sec)




--9. Display the Supplier table in the descending order of CITY.
mysql> SELECT *
    -> FROM S
    -> ORDER BY city DESC;
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S2 | Jones |     10 | Paris  |
| S3 | Blake |     30 | Paris  |
| S1 | Smith |     20 | London |
| S4 | Clark |     20 | London |
| S5 | Adams |     30 | Athens |
+----+-------+--------+--------+
5 rows in set (0.00 sec)



--10. Display the Part Table in the ascending order of CITY and
--within the city in the ascending order of Part names.
mysql> SELECT * 
    -> FROM P
    -> ORDER BY city,Pname;
+----+-------+-------+--------+--------+
| P# | Pname | color | weight | city   |
+----+-------+-------+--------+--------+
| P6 | Cog   | Red   |     19 | London |
| P1 | Nut   | Red   |     12 | London |
| P4 | Screw | Red   |     14 | London |
| P2 | Bolt  | Green |     17 | Paris  |
| P5 | Cam   | Blue  |     12 | Paris  |
| P3 | Screw | Blue  |     17 | Rome   |
+----+-------+-------+--------+--------+
6 rows in set (0.00 sec)




--11. Display all the Suppliers with a status between 10 and 20.
mysql> SELECT *
    -> FROM S
    -> WHERE Status BETWEEN 10 AND 20;
+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S2 | Jones |     10 | Paris  |
| S4 | Clark |     20 | London |
+----+-------+--------+--------+
3 rows in set (0.00 sec)




--12. Display all the Parts and their Weight, which are not in the
--range of 10 and 15.
mysql> SELECT *
    -> FROM P
    -> WHERE Weight NOT BETWEEN 10 AND 15;
+----+-------+-------+--------+--------+
| P# | Pname | color | weight | city   |
+----+-------+-------+--------+--------+
| P2 | Bolt  | Green |     17 | Paris  |
| P3 | Screw | Blue  |     17 | Rome   |
| P6 | Cog   | Red   |     19 | London |
+----+-------+-------+--------+--------+
3 rows in set (0.00 sec)
