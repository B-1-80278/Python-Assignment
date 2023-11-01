-- Create appropriate indexes to solve following problems.
-- Note : use “sales” database to solve below queries.

-- 1. Create an index that will enable a user to pull orders for ‘1990-10-03’ out of the Orders table quickly.

CREATE INDEX idx_odate_orders ON ORDERS(odate);
=>select * from orders where odate = "1990-10-03";

EXPLAIN FORMAT = JSON
select * from orders where odate = "1990-10-03";
+------+---------+------------+------+------+
| onum | amt     | odate      | cnum | snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
5 rows in set (0.01 sec)
=>"query_cost": "1.00"

-- 2. If the Orders table has already been created, how can you force the onum field to be unique (assume all current values are unique)?
 
CREATE UNIQUE INDEX idx_orders_onum ON orders(onum);

INSERT INTO orders(onum) VALUES (3003);
ERROR 1062 (23000): Duplicate entry '3003' for key 'orders.idx_orders_onum'
-- This error coccurs because 3003 is already present

-- 3. Create an index that would permit salesperson to retrieve his orders.


CREATE INDEX idx_snum_orders ON orders(snum);

EXPLAIN FORMAT = JSON
SELECT * FROM orders;

"query_cost": "1.25"

-- 4. Let us assume that each salesperson is to have only one customer of a given rating, and that this is currently the case. Create an index that enforces it.

CREATE UNIQUE INDEX idx_snum_cnum_rating ON customers(snum,cnum,rating);


-- 5. Create an index to speed up searching order on a given date by given customer.
	
CREATE INDEX idx_odate_orders ON orders(odate);

