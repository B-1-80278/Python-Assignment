-- Database Technologies – Assignment 8
-- Use sub-query to solve following problems.
-- Note : To solve below queries use “sales” database
-- 1. Write a query that uses a subquery to obtain all orders for the customer named Cisneros. Assume you do not know his customer number (cnum).

SELECT * FROM orders
WHERE cnum = ( 
	      SELECT cnum
	      FROM customers
	      WHERE cname = 'Cisneros'
	      )
	      
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
2 rows in set (0.00 sec)



-- 2. Write a query that produces the names and ratings of all customers who have above-average orders.

SELECT cname, rating
FROM customers
WHERE cnum IN (SELECT cnum
	FROM orders
	WHERE amt > (SELECT AVG(amt) FROM orders));
	
+---------+--------+
| cname   | rating |
+---------+--------+
| Liu     |    200 |
| Clemens |    100 |
+---------+--------+
2 rows in set (0.00 sec)

-- 3. Write a query that selects the total amount in orders for each salesperson for whom this total is greater than the amount of the largest order in the table.

SELECT o.snum, s.sname, SUM(o.amt) AS total_amt
FROM orders o
JOIN salespeople s ON s.snum = o.snum
GROUP BY o.snum, s.sname
HAVING total_amt > (SELECT MAX(amt) FROM orders); 

+------+-------+-----------+
| snum | sname | total_amt |
+------+-------+-----------+
| 1001 | Peel  |  15382.07 |
+------+-------+-----------+
1 row in set (0.00 sec)



-- 4. Write a query that selects all customers whose ratings are equal to or greater than ANY of Serres’.

SELECT cname, rating FROM customers

WHERE rating >= (
		SELECT MIN(rating) FROM customers
		WHERE snum = (SELECT snum FROM salespeople
		WHERE sname = 'Serres')
		);
		
+----------+--------+
| cname    | rating |
+----------+--------+
| Giovanni |    200 |
| Liu      |    200 |
| Grass    |    300 |
| Cisneros |    300 |
+----------+--------+


-- 5. Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.

SELECT *
FROM salespeople
WHERE city != (SELECT )

-- 6. Write a query that selects all orders for amounts greater than any for the customers in London.

SELECT * 
FROM orders
WHERE amt > ANY(SELECT amt FROM orders 
		WHERE snum = ANY( SELECT snum FROM customers
		WHERE city = 'London')
		)
		
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
6 rows in set (0.00 sec)


7. Extract all the orders of Motika.
SELECT * 
FROM orders
WHERE snum = (
	      SELECT snum FROM salespeople
	      WHERE sname = 'Motika'		
	      );
		
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
+------+---------+------------+------+------+
1 row in set (0.00 sec)

-- 8. Find all the order attribute of salespeople servicing customers in London.

SELECT *
FROM orders
WHERE snum = ANY(SELECT snum 
		FROM customers 
		WHERE city ='London');
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
3 rows in set (0.00 sec)
 
-- 9. Find names and numbers of all salesperson who have more than one customer.
SELECT sname, snum
FROM salespeople
WHERE snum IN(SELECT snum
		 FROM orders
		 GROUP BY snum
		 HAVING count(snum) > 1   
		)
		
+--------+------+
| sname  | snum |
+--------+------+
| Peel   | 1001 |
| Serres | 1002 |
| Rifkin | 1007 |
+--------+------+
3 rows in set (0.00 sec)

10. Find salespeople number,name and city who have multiple customers.

SELECT sname, snum, city
FROM salespeople
WHERE snum IN(SELECT snum 
	      FROM orders
	      GROUP BY snum
	      HAVING COUNT(snum) > 1
	      );
	      
+--------+------+-----------+
| sname  | snum | city      |
+--------+------+-----------+
| Peel   | 1001 | London    |
| Serres | 1002 | San Jose  |
| Rifkin | 1007 | Barcelona |
+--------+------+-----------+
3 rows in set (0.00 sec)

-- 11. Select customers who have a greater rating than any other customer in Rome.

SELECT cname
FROM customers
WHERE rating > ANY(SELECT rating
		   FROM customers
		   WHERE city = 'Rome');
+----------+
| cname    |
+----------+
| Giovanni |
| Liu      |
| Grass    |
| Cisneros |
+----------+
4 rows in set (0.00 sec)

-- 12. Select all orders that had amounts that were greater that atleast one of the orders from ‘1990-10-04’.
SELECT * 
FROM orders
WHERE amt > ANY(SELECT amt FROM orders 
		WHERE odate = '1990-10-04');
		
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-04 | 2006 | 1001 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

-- 13. Find all orders with amounts smaller than any amount for a customer in San Jose.

SELECT * FROM orders WHERE amt < ANY(SELECT amt FROM orders WHERE cnum IN (SELECT cnum FROM customers WHERE city = 'San Jose'));

+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4723.00 | 1990-10-04 | 2006 | 1001 |
| 3010 |  309.95 | 1990-10-04 | 2004 | 1002 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

-- 14. Select those customers whose rating are higher than every customer in Paris.
SELECT * FROM customers 
WHERE rating > ALL(SELECT rating FROM customers
		   WHERE city = 'Paris');
		   
+------+----------+----------+--------+------+
| cnum | cname    | city     | rating | snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)

