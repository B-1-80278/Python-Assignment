-- Q1 Create 'spj' database'.
CREATE DATABASE spj_db;
+--------------------+
| Database           |
+--------------------+
| classwork_db       |
| dbda_db            |
| information_schema |
| mysql              |
| performance_schema |
| spj_db             |
| sys                |
+--------------------+
 
 -- Q2 use spj database;
USE spj_db;

SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| spj_db     |
+------------+

-- 3. Create following tables in spj database.
-- CREATE TABLE S (S# CHAR(5) NOT NULL, Sname CHAR(20), status
-- SMALLINT, city CHAR(15));

CREATE TABLE S(`S#` CHAR(5) NOT NULL, Sname CHAR(20),status SMALLINT, city CHAR(15));

SHOW TABLES;
+------------------+
| Tables_in_spj_db |
+------------------+
| S                |
+------------------+

INSERT INTO S VALUES
('S1', 'Smith', 20, 'London'),
('S2', 'Jones', 10, 'Paris'),
('S3', 'Blake', 30, 'Paris'),
('S4', 'Clark', 20, 'London'),
('S5', 'Adams', 30, 'Athens');

+----+-------+--------+--------+
| S# | Sname | status | city   |
+----+-------+--------+--------+
| S1 | Smith |     20 | London |
| S2 | Jones |     10 | Paris  |
| S3 | Blake |     30 | Paris  |
| S4 | Clark |     20 | London |
| S5 | Adams |     30 | Athens |
+----+-------+--------+--------+

CREATE TABLE P(`P#` CHAR(6) NOT NULL, Pname CHAR(20), color CHAR(6), weight SMALLINT, city CHAR(15));

SHOW TABLES;
+------------------+
| Tables_in_spj_db |
+------------------+
| P                |
| S                |
+------------------+

 INSERT INTO P VALUES
 ('P1', 'Nut', 'Red', 12, 'London'),
 ('P2', 'Bolt', 'Green', 17, 'Paris'),
 ('P3', 'Screw', 'Blue', 17, 'Rome'),
 ('P4', 'Screw', 'Red', 14, 'London'),
 ('P5', 'Cam', 'Blue', 12, 'Paris'),
 ('P6', 'Cog', 'Red', 19, 'London');

 SELECT*FROM P;
+----+-------+-------+--------+--------+
| P# | Pname | color | weight | city   |
+----+-------+-------+--------+--------+
| P1 | Nut   | Red   |     12 | London |
| P2 | Bolt  | Green |     17 | Paris  |
| P3 | Screw | Blue  |     17 | Rome   |
| P4 | Screw | Red   |     14 | London |
| P5 | Cam   | Blue  |     12 | Paris  |
| P6 | Cog   | Red   |     19 | London |
+----+-------+-------+--------+--------+

 CREATE TABLE J(`J#` CHAR(4) NOT NULL, Jname CHAR(10),  City CHAR(15));
 SHOW TABLES;
+------------------+
| Tables_in_spj_db |
+------------------+
| J                |
| P                |
| S                |
+------------------+
INSERT INTO J VALUES 
    -> ('J1', 'Sorter', 'Paris'),
    -> ('J2', 'Punch', 'Rome'),
    -> ('J3', 'Reader', 'Athens'),
    -> ('J4', 'Console', 'Athens'),
    -> ('J5', 'Collator', 'London'),
    -> ('J6', 'Terminal', 'Oslo'),
    -> ('J7', 'Tape', 'London');
    -> ('J2', 'Punch', 'Rome'),
    -> ('J3', 'Reader', 'Athens'),
    -> ('J4', 'Console', 'Athens'),
    -> ('J5', 'Collator', 'London'),
    -> ('J6', 'Terminal', 'Oslo'),
    -> ('J7', 'Tape', 'London');

SELECT*FROM J;
+----+----------+--------+
| J# | Jname    | City   |
+----+----------+--------+
| J1 | Sorter   | Paris  |
| J2 | Punch    | Rome   |
| J3 | Reader   | Athens |
| J4 | Console  | Athens |
| J5 | Collator | London |
| J6 | Terminal | Oslo   |
| J7 | Tape     | London |
+----+----------+--------+

CREATE TABLE SP (`S#` CHAR(4) NOT NULL, P# CHAR(4) NOT NULL, J#
CHAR(4) NOT NULL, QTY INT);
SHOW TABLES;
+------------------+
| Tables_in_spj_db |
+------------------+
| J                |
| P                |
| S                |
| SP               |
+------------------+
INSERT INTO SP VALUES
('S1', 'P1', 'J1', 200),
('S1', 'P1', 'J4', 700),
('S2', 'P3', 'J1', 400),
('S2', 'P3', 'J2', 200),
('S2', 'P3', 'J3', 200),
('S2', 'P3', 'J4', 500),
('S2', 'P3', 'J5', 600),
('S2', 'P3', 'J6', 400),
('S2', 'P3', 'J7', 800),
('S2', 'P5', 'J2', 100),
('S3', 'P3', 'J1', 200),
('S3', 'P4', 'J2', 500),
('S4', 'P6', 'J3', 300),
('S4', 'P6', 'J7', 300),
('S5', 'P2', 'J2', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P5', 'J5', 500),
('S5', 'P5', 'J7', 100),
('S5', 'P6', 'J2', 200),
('S5', 'P1', 'J4', 100),
('S5', 'P3', 'J4', 200),
('S5', 'P4', 'J4', 800),
('S5', 'P5', 'J4', 400),
('S5', 'P6', 'J4', 500);

SELECT*FROM SP;
+----+----+----+------+
| S# | P# | J# | QTY  |
+----+----+----+------+
| S1 | P1 | J1 |  200 |
| S1 | P1 | J4 |  700 |
| S2 | P3 | J1 |  400 |
| S2 | P3 | J2 |  200 |
| S2 | P3 | J3 |  200 |
| S2 | P3 | J4 |  500 |
| S2 | P3 | J5 |  600 |
| S2 | P3 | J6 |  400 |
| S2 | P3 | J7 |  800 |
| S2 | P5 | J2 |  100 |
| S3 | P3 | J1 |  200 |
| S3 | P4 | J2 |  500 |
| S4 | P6 | J3 |  300 |
| S4 | P6 | J7 |  300 |
| S5 | P2 | J2 |  200 |
| S5 | P2 | J4 |  100 |
| S5 | P5 | J5 |  500 |
| S5 | P5 | J7 |  100 |
| S5 | P6 | J2 |  200 |
| S5 | P1 | J4 |  100 |
| S5 | P3 | J4 |  200 |
| S5 | P4 | J4 |  800 |
| S5 | P5 | J4 |  400 |
| S5 | P6 | J4 |  500 |
+----+----+----+------+

-- Q. 1. Create 'hr' database. Import hr-db.sql.

CREATE DATABASE hr_db;
USE hr_db;
Database changed
SELECT database();
+------------+
| database() |
+------------+
| hr_db      |
+------------+

SOURCE /home/sumit/Desktop/DBDA/DBDA/DBMS/DBMS/db/hr-db.sql

-- Q. 2. Create 'sales' database. Import sales-db.sql.
CREATE DATABASE sales_db;
USE sales_db;
Database changed
SELECT dtabase();
+------------+
| DATABASE() |
+------------+
| sales_db   |
+------------+

-- List all tables in hr database. Display contents of all tables (one by one).
 SHOW TABLES;
+-----------------+
| Tables_in_hr_db |
+-----------------+
| countries       |
| departments     |
| employees       |
| job_history     |
| jobs            |
| locations       |
| regions         |
+-----------------+
-- List all tables in sales database. Display contents of all tables (one by one).
SHOW TABLES;
+--------------------+
| Tables_in_sales_db |
+--------------------+
| customers          |
| orders             |
| salespeople        |
+--------------------+


