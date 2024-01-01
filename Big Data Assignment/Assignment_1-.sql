
-- Customers table
CREATE TABLE Customers (
    CustomerID INT,
    Name VARCHAR(100),
    Age INT,
    LocationID INT
);

-- Products table
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Sales table
CREATE TABLE Sales (
    SaleID INT ,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2)
);

-- Locations table
CREATE TABLE Locations (
    LocationID INT ,
    City VARCHAR(50),
    State VARCHAR(50)
);

-- Customers
INSERT INTO Customers VALUES (1, 'John Doe', 30, 1);
INSERT INTO Customers VALUES (2, 'Jane Smith', 25, 2);
INSERT INTO Customers VALUES (3, 'Bob Johnson', 35, 1);
INSERT INTO Customers VALUES (4, 'Alice Brown', 28, 3);
INSERT INTO Customers VALUES (5, 'Charlie Davis', 32, 2);

-- Products
INSERT INTO Products VALUES (1, 'Laptop', 'Electronics', 800.00);
INSERT INTO Products VALUES (2, 'Smartphone', 'Electronics', 400.00);
INSERT INTO Products VALUES (3, 'T-shirt', 'Clothing', 20.00);
INSERT INTO Products VALUES (4, 'Shoes', 'Footwear', 50.00);
INSERT INTO Products VALUES (5, 'Bookshelf', 'Furniture', 150.00);

-- Sales
INSERT INTO Sales VALUES (1, 1, 1, '2023-01-01', 2, 1600.00);
INSERT INTO Sales VALUES (2, 2, 3, '2023-01-02', 3, 60.00);
INSERT INTO Sales VALUES (3, 3, 2, '2023-01-03', 1, 400.00);
INSERT INTO Sales VALUES (4, 4, 4, '2023-02-01', 2, 100.00);
INSERT INTO Sales VALUES (5, 5, 5, '2023-02-02', 1, 150.00);

-- Locations
INSERT INTO Locations VALUES (1, 'Pune', 'Maharashtra'), (2, 'Mumbai', 'Maharashtra'), (3, 'Bangalore', 'Karnataka'), (4, 'Delhi', 'Delhi'), (5, 'Chennai', 'Tamil Nadu');

-- 1. Retrieve the names of all customers who made a purchase.

> select c.name
> from customers c
> inner join sales s on c.customerid=s.customerid;

+----------------+
|     c.name     |
+----------------+
| John Doe       |
| Jane Smith     |
| Bob Johnson    |
| Alice Brown    |
| Charlie Davis  |
+----------------+
5 rows selected (15.275 seconds)


-- 2. List the products and their total sales amounts for a given date range.

select p.productid, p.productname, sum(s.totalamount) totalamount 
from products p inner join sales s on p.productid=s.productid 
where s.saledate between '2023-01-01' and '2023-01-31'
group by p.productid, p.productname;

+--------------+----------------+--------------+
| p.productid  | p.productname  | totalamount  |
+--------------+----------------+--------------+
| 1            | Laptop         | 1600.00      |
| 2            | Smartphone     | 400.00       |
| 3            | T-shirt        | 60.00        |
+--------------+----------------+--------------+


-- 3. Find the total sales amount for each product category.

select p.category, sum(s.totalamount) total
from products p inner join sales s on p.productid=s.productid
group by p.category;

+--------------+----------+
|  p.category  |  total   |
+--------------+----------+
| Clothing     | 60.00    |
| Electronics  | 2000.00  |
| Footwear     | 100.00   |
| Furniture    | 150.00   |
+--------------+----------+


-- 4. Identify the customers who made purchases in a specific city.

select c.name, l.city
from customers c 
inner join locations l on c.locationid=l.locationid
and l.city='Pune';

+--------------+---------+
|    c.name    | l.city  |
+--------------+---------+
| John Doe     | Pune    |
| Bob Johnson  | Pune    |
+--------------+---------+


-- 5. Calculate the average age of customers who bought products in the 'Electronics' category.

select avg(c.age) age_avg, p.category
from customers c
inner join sales s on c.customerid=s.customerid
inner join products p on s.productid=p.productid and p.category='Electronics'
group by p.category;

+----------+--------------+
| age_avg  |  p.category  |
+----------+--------------+
| 32.5     | Electronics  |
+----------+--------------+


-- 6. List the top 3 products based on total sales amount.

select p.productname, sum(s.totalamount) total
from products p
inner join sales s on p.productid=s.productid
group by p.productname
order by total desc
limit 3;

+----------------+----------+
| p.productname  |  total   |
+----------------+----------+
| Laptop         | 1600.00  |
| Smartphone     | 400.00   |
| Bookshelf      | 150.00   |
+----------------+----------+


-- 7. Find the total sales amount for each month.

select month(s.saledate) month1, sum(s.totalamount) total
from sales s
group by month(s.saledate);

+---------+----------+
| month1  |  total   |
+---------+----------+
| 1       | 2060.00  |
| 2       | 250.00   |
+---------+----------+


-- 8. Identify the products with no sales.

select p.productid
from products p
left join sales s on p.productid=s.productid
where s.productid is null;

+--------------+
| p.productid  |
+--------------+
+--------------+


-- 9. Calculate the total sales amount for each state.

select l.state, sum(s.totalamount) total
from locations l 
inner join customers c on l.locationid=c.locationid
inner join sales s on c.customerid=s.customerid
group by l.state;

+--------------+----------+
|   l.state    |  total   |
+--------------+----------+
| Karnataka    | 100.00   |
| Maharashtra  | 2210.00  |
+--------------+----------+

-- 10. Retrieve the customer names and their highest purchase amount.

select c.name, max(s.totalamount) max_amount
from customers c
inner join sales s on c.customerid=s.customerid
group by c.name;

+----------------+-------------+
|     c.name     | max_amount  |
+----------------+-------------+
| Alice Brown    | 100.00      |
| Bob Johnson    | 400.00      |
| Charlie Davis  | 150.00      |
| Jane Smith     | 60.00       |
| John Doe       | 1600.00     |
+----------------+-------------+

