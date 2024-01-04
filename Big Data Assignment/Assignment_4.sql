1. Create table "books_staging" and load books.csv in it.
CREATE TABLE books_staging(id SMALLINT,
title STRING, 
author STRING, 
genre STRING, 
price DOUBLE)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

load data local inpath '/home/vishu/Downloads/git_download/BigData/data/books.csv' into table books_staging;

+-------------------+----------------------------------+-----------------------+----------------------+----------------------+
| books_staging.id  |       books_staging.title        | books_staging.author  | books_staging.genre  | books_staging.price  |
+-------------------+----------------------------------+-----------------------+----------------------+----------------------+
| 1001              | Exploring C                      | Yashwant Kanetkar     | C Programming        | 123.456              |
| 1002              | Pointers in C                    | Yashwant Kanetkar     | C Programming        | 371.019              |
| 1003              | ANSI C Programming               | E Balaguruswami       | C Programming        | 334.215              |
| 1004              | ANSI C Programming               | Dennis Ritchie        | C Programming        | 140.121              |
| 2001              | C++ Complete Reference           | Herbert Schildt       | C++ Programming      | 417.764              |
| 2002              | C++ Primer                       | Stanley Lippman       | C++ Programming      | 620.665              |
| 2003              | C++ Programming Language         | Bjarne Stroustrup     | C++ Programming      | 987.213              |
| 3001              | Java Complete Reference          | Herbert Schildt       | Java Programming     | 525.121              |
| 3002              | Core Java Volume I               | Cay Horstmann         | Java Programming     | 575.651              |
| 3003              | Java Programming Language        | James Gosling         | Java Programming     | 458.238              |
| 4001              | Operatig System Concepts         | Peter Galvin          | Operating Systems    | 567.391              |
| 4002              | Design of UNIX Operating System  | Mauris J Bach         | Operating Systems    | 421.938              |
| 4003              | UNIX Internals                   | Uresh Vahalia         | Operating Systems    | 352.822              |
+-------------------+----------------------------------+-----------------------+----------------------+----------------------+
13 rows selected (0.406 seconds)


2. Create table "books_orc" as transactional table.
CREATE TABLE books_orc(id SMALLINT,
title STRING, 
author STRING, 
genre STRING, 
price DOUBLE)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS ORC
TBLPROPERTIES('transactional'='true');

INSERT INTO books_orc
SELECT * FROM books_staging;


3. Create a materialized view for summary -- Subjectwise average book price.
 
CREATE MATERIALIZED VIEW mv_book as
select genre, avg(price) avg_price from books_orc GROUP BY genre;
+--------------------+--------------------+
|   mv_book.genre    | mv_book.avg_price  |
+--------------------+--------------------+
| C Programming      | 242.20275          |
| C++ Programming    | 675.214            |
| Java Programming   | 519.67             |
| Operating Systems  | 447.3836666666666  |
+--------------------+--------------------+



4. Display a report that shows subject and average price in descending order -- on materialized view.
select * from mv_book order by avg_price desc;
+--------------------+--------------------+
|   mv_book.genre    | mv_book.avg_price  |
+--------------------+--------------------+
| C++ Programming    | 675.214            |
| Java Programming   | 519.67             |
| Operating Systems  | 447.3836666666666  |
| C Programming      | 242.20275          |
+--------------------+--------------------+

5. Create a new file newbooks.csv.
20,Atlas Shrugged,Ayn Rand,Novel,723.90
21,The Fountainhead,Ayn Rand,Novel,923.80
22,The Archer,Paulo Cohelo,Novel,623.94
23,The Alchemist,Paulo Cohelo,Novel,634.80
touch newbooks.csv

6. Upload the file newbooks.csv into books_staging.
load data local inpath '/home/vishu/Downloads/git_download/BigData/data/newbooks.csv' into table books_staging;
+-------------------+----------------------------------+-----------------------+----------------------+----------------------+
| books_staging.id  |       books_staging.title        | books_staging.author  | books_staging.genre  | books_staging.price  |
+-------------------+----------------------------------+-----------------------+----------------------+----------------------+
| 1001              | Exploring C                      | Yashwant Kanetkar     | C Programming        | 123.456              |
| 1002              | Pointers in C                    | Yashwant Kanetkar     | C Programming        | 371.019              |
| 1003              | ANSI C Programming               | E Balaguruswami       | C Programming        | 334.215              |
| 1004              | ANSI C Programming               | Dennis Ritchie        | C Programming        | 140.121              |
| 2001              | C++ Complete Reference           | Herbert Schildt       | C++ Programming      | 417.764              |
| 2002              | C++ Primer                       | Stanley Lippman       | C++ Programming      | 620.665              |
| 2003              | C++ Programming Language         | Bjarne Stroustrup     | C++ Programming      | 987.213              |
| 3001              | Java Complete Reference          | Herbert Schildt       | Java Programming     | 525.121              |
| 3002              | Core Java Volume I               | Cay Horstmann         | Java Programming     | 575.651              |
| 3003              | Java Programming Language        | James Gosling         | Java Programming     | 458.238              |
| 4001              | Operatig System Concepts         | Peter Galvin          | Operating Systems    | 567.391              |
| 4002              | Design of UNIX Operating System  | Mauris J Bach         | Operating Systems    | 421.938              |
| 4003              | UNIX Internals                   | Uresh Vahalia         | Operating Systems    | 352.822              |
| 20                | Atlas Shrugged                   | Ayn Rand              | Novel                | 723.9                |
| 21                | The Fountainhead                 | Ayn Rand              | Novel                | 923.8                |
| 22                | The Archer                       | Paulo Cohelo          | Novel                | 623.94               |
| 23                | The Alchemist                    | Paulo Cohelo          | Novel                | 634.8                |
+-------------------+----------------------------------+-----------------------+----------------------+----------------------+



7. Insert "new" records from books_staging into books_orc.
truncate table books_orc;
INSERT INTO books_orc SELECT * FROM books_staging;
+---------------+----------------------------------+--------------------+--------------------+------------------+
| books_orc.id  |         books_orc.title          |  books_orc.author  |  books_orc.genre   | books_orc.price  |
+---------------+----------------------------------+--------------------+--------------------+------------------+
| 1001          | Exploring C                      | Yashwant Kanetkar  | C Programming      | 123.456          |
| 1002          | Pointers in C                    | Yashwant Kanetkar  | C Programming      | 371.019          |
| 1003          | ANSI C Programming               | E Balaguruswami    | C Programming      | 334.215          |
| 1004          | ANSI C Programming               | Dennis Ritchie     | C Programming      | 140.121          |
| 2001          | C++ Complete Reference           | Herbert Schildt    | C++ Programming    | 417.764          |
| 2002          | C++ Primer                       | Stanley Lippman    | C++ Programming    | 620.665          |
| 2003          | C++ Programming Language         | Bjarne Stroustrup  | C++ Programming    | 987.213          |
| 3001          | Java Complete Reference          | Herbert Schildt    | Java Programming   | 525.121          |
| 3002          | Core Java Volume I               | Cay Horstmann      | Java Programming   | 575.651          |
| 3003          | Java Programming Language        | James Gosling      | Java Programming   | 458.238          |
| 4001          | Operatig System Concepts         | Peter Galvin       | Operating Systems  | 567.391          |
| 4002          | Design of UNIX Operating System  | Mauris J Bach      | Operating Systems  | 421.938          |
| 4003          | UNIX Internals                   | Uresh Vahalia      | Operating Systems  | 352.822          |
| 20            | Atlas Shrugged                   | Ayn Rand           | Novel              | 723.9            |
| 21            | The Fountainhead                 | Ayn Rand           | Novel              | 923.8            |
| 22            | The Archer                       | Paulo Cohelo       | Novel              | 623.94           |
| 23            | The Alchemist                    | Paulo Cohelo       | Novel              | 634.8            |
+---------------+----------------------------------+--------------------+--------------------+------------------+


8. Display a report that shows subject and average price in descending order -- on materialized view. -- Are new books visible in report?
select * from mv_book order by avg_price desc;
+--------------------+--------------------+
|   mv_book.genre    | mv_book.avg_price  |
+--------------------+--------------------+
| C Programming      | 242.20275          |
| C++ Programming    | 675.214            |
| Java Programming   | 519.67             |
| Operating Systems  | 447.3836666666666  |
+--------------------+--------------------+

9. Rebuild the materialized view.
ALTER MATERIALIZED VIEW mv_book REBUILD;


10. Display a report that shows subject and average price in descending order -- on materialized view. -- Are new books visible in report?
select * from mv_book order by avg_price desc;
+--------------------+--------------------+
|   mv_book.genre    | mv_book.avg_price  |
+--------------------+--------------------+
| Novel              | 726.6099999999999  |
| C++ Programming    | 675.214            |
| Java Programming   | 519.67             |
| Operating Systems  | 447.3836666666666  |
| C Programming      | 242.20275          |
+--------------------+--------------------+

11. Increase price of all Java books by 10% in books_orc.

update books_orc SET price = (price * 1.1) where genre = "Java Programming";

12. Rebuild the materialized view.
alter MATERIALIZED VIEW mv_book REBUILD;


13. Display a report that shows subject and average price in descending order -- on materialized view. -- Are new price changes visible in report?
select * from mv_book order by avg_price desc;
+--------------------+--------------------+
|   mv_book.genre    | mv_book.avg_price  |
+--------------------+--------------------+
| Novel              | 726.6099999999999  |
| C++ Programming    | 675.214            |
| Java Programming   | 571.6370000000001  |
| Operating Systems  | 447.3836666666666  |
| C Programming      | 242.20275          |
+--------------------+--------------------+


14. Delete all Java books.
delete from books_orc where genre = "Java Programming";
+---------------+----------------------------------+--------------------+--------------------+------------------+
| books_orc.id  |         books_orc.title          |  books_orc.author  |  books_orc.genre   | books_orc.price  |
+---------------+----------------------------------+--------------------+--------------------+------------------+
| 1001          | Exploring C                      | Yashwant Kanetkar  | C Programming      | 123.456          |
| 1002          | Pointers in C                    | Yashwant Kanetkar  | C Programming      | 371.019          |
| 1003          | ANSI C Programming               | E Balaguruswami    | C Programming      | 334.215          |
| 1004          | ANSI C Programming               | Dennis Ritchie     | C Programming      | 140.121          |
| 2001          | C++ Complete Reference           | Herbert Schildt    | C++ Programming    | 417.764          |
| 2002          | C++ Primer                       | Stanley Lippman    | C++ Programming    | 620.665          |
| 2003          | C++ Programming Language         | Bjarne Stroustrup  | C++ Programming    | 987.213          |
| 4001          | Operatig System Concepts         | Peter Galvin       | Operating Systems  | 567.391          |
| 4002          | Design of UNIX Operating System  | Mauris J Bach      | Operating Systems  | 421.938          |
| 4003          | UNIX Internals                   | Uresh Vahalia      | Operating Systems  | 352.822          |
| 20            | Atlas Shrugged                   | Ayn Rand           | Novel              | 723.9            |
| 21            | The Fountainhead                 | Ayn Rand           | Novel              | 923.8            |
| 22            | The Archer                       | Paulo Cohelo       | Novel              | 623.94           |
| 23            | The Alchemist                    | Paulo Cohelo       | Novel              | 634.8            |
+---------------+----------------------------------+--------------------+--------------------+------------------+


15. Rebuild the materialized view.
alter MATERIALIZED VIEW mv_book REBUILD;



16. Display a report that shows subject and average price in descending order -- on materialized view. -- Are new price changes visible in report?
select * from mv_book order by avg_price desc;
+--------------------+--------------------+
|   mv_book.genre    | mv_book.avg_price  |
+--------------------+--------------------+
| Novel              | 726.6099999999999  |
| C++ Programming    | 675.214            |
| Operating Systems  | 447.3836666666666  |
| C Programming      | 242.20275          |
+--------------------+--------------------+


17. Upload movies data into HDFS directory (not in hive warehouse).

vishu@vishu-Nitro-AN515-58:~/apache-hive-3.1.2-bin$ hadoop fs -mkdir -p /user/sunbeam/movies/input
vishu@vishu-Nitro-AN515-58:~/apache-hive-3.1.2-bin$ hadoop fs -put /home/vishu/Downloads/git_download/BigData/data/movies/movies/movies.csv  /user/sunbeam/movies/input
vishu@vishu-Nitro-AN515-58:~/apache-hive-3.1.2-bin$ hadoop fs -ls /user/sunbeam/movies/input
Found 1 items
-rw-r--r--   1 vishu supergroup     458390 2024-01-02 11:01 /user/sunbeam/movies/input/movies.csv

18. Create external table movies1 with schema - id INT, title STRING, genres STRING.
Find number of 'Action' movies.
CREATE EXTERNAL TABLE movies1 (id INT, title STRING, genres STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE LOCATION '/user/sunbeam/movies/input' TBLPROPERTIES('skip.header.line.count'='1');

SELECT * FROM movies1 LIMIT 10;

+-------------+-------------------------------------+----------------------------------------------+
| movies1.id  |            movies1.title            |                movies1.genres                |
+-------------+-------------------------------------+----------------------------------------------+
| 1           | Toy Story (1995)                    | Adventure|Animation|Children|Comedy|Fantasy  |
| 2           | Jumanji (1995)                      | Adventure|Children|Fantasy                   |
| 3           | Grumpier Old Men (1995)             | Comedy|Romance                               |
| 4           | Waiting to Exhale (1995)            | Comedy|Drama|Romance                         |
| 5           | Father of the Bride Part II (1995)  | Comedy                                       |
| 6           | Heat (1995)                         | Action|Crime|Thriller                        |
| 7           | Sabrina (1995)                      | Comedy|Romance                               |
| 8           | Tom and Huck (1995)                 | Adventure|Children                           |
| 9           | Sudden Death (1995)                 | Action                                       |
| 10          | GoldenEye (1995)                    | Action|Adventure|Thriller                    |
+-------------+-------------------------------------+----------------------------------------------+
SELECT COUNT(movies1.id) AS Count_Of_Action_Movies FROM movies1 WHERE movies1.genres='Action';

+-------------------------+
| count_of_action_movies  |
+-------------------------+
| 32                      |
+-------------------------+

19. Create external table movies2 with schema - id INT, title STRING, genres ARRAY<STRING>.
Find number of movies having single genre.

CREATE EXTERNAL TABLE movies2 (id INT, title STRING, genres ARRAY<STRING>) ROW FORMAT DELIMITED FIELDS TERMINATED BY '^' COLLECTION ITEMS TERMINATED BY '|' STORED AS TEXTFILE LOCATION '/user/sunbeam/movies_caret/input' TBLPROPERTIES('skip.header.line.count'='1');

SELECT *FROM movies2 LIMIT 20;

+-------------+----------------------------------------+----------------------------------------------------+
| movies2.id  |             movies2.title              |                   movies2.genres                   |
+-------------+----------------------------------------+----------------------------------------------------+
| 1           | Toy Story (1995)                       | ["Adventure","Animation","Children","Comedy","Fantasy"] |
| 2           | Jumanji (1995)                         | ["Adventure","Children","Fantasy"]                 |
| 3           | Grumpier Old Men (1995)                | ["Comedy","Romance"]                               |
| 4           | Waiting to Exhale (1995)               | ["Comedy","Drama","Romance"]                       |
| 5           | Father of the Bride Part II (1995)     | ["Comedy"]                                         |
| 6           | Heat (1995)                            | ["Action","Crime","Thriller"]                      |
| 7           | Sabrina (1995)                         | ["Comedy","Romance"]                               |
| 8           | Tom and Huck (1995)                    | ["Adventure","Children"]                           |
| 9           | Sudden Death (1995)                    | ["Action"]                                         |
| 10          | GoldenEye (1995)                       | ["Action","Adventure","Thriller"]                  |
| 11          | American President, The (1995)         | ["Comedy","Drama","Romance"]                       |
| 12          | Dracula: Dead and Loving It (1995)     | ["Comedy","Horror"]                                |
| 13          | Balto (1995)                           | ["Adventure","Animation","Children"]               |
| 14          | Nixon (1995)                           | ["Drama"]                                          |
| 15          | Cutthroat Island (1995)                | ["Action","Adventure","Romance"]                   |
| 16          | Casino (1995)                          | ["Crime","Drama"]                                  |
| 17          | Sense and Sensibility (1995)           | ["Drama","Romance"]                                |
| 18          | Four Rooms (1995)                      | ["Comedy"]                                         |
| 19          | Ace Ventura: When Nature Calls (1995)  | ["Comedy"]                                         |
| 20          | Money Train (1995)                     | ["Action","Comedy","Crime","Drama","Thriller"]     |
+-------------+----------------------------------------+----------------------------------------------------+

SELECT COUNT(movies2.id) AS CountOfSingleGenre FROM movies2 WHERE SIZE(movies2.genres)=1;

+---------------------+
| countofsinglegenre  |
+---------------------+
| 2793                |
+---------------------+


20. Upload busstops.json data into HDFS directory. Then create hive external table to fetch data using JsonSerDe.
{"_id":{"$oid":"5a0720b478597fc11004d951"},"stop":"Non-BRTS","code":"103B-D-
04","seq":4.0,"stage":1.0,"name":"Aranyeshwar Corner","location":{"type":"Point","coordinates":[73.857675,18.486381]}}
location STRUCT<type:STRING, coordinates:ARRAY<DOUBLE>>
When column-name have special charatcters like _ or $, they should be encapsulated in `back-quotes`.

vishu@vishu-Nitro-AN515-58:~$ hadoop fs -mkdir -p /user/sunbeam/busstops/input
vishu@vishu-Nitro-AN515-58:~$ hadoop fs -put /home/vishu/Downloads/git_download/BigData/data/bus.json  /user/sunbeam/busstops/input


CREATE EXTERNAL TABLE busstops (`_id` STRUCT<`$oid`:STRING>, stop STRING, code STRING, seq DECIMAL(2,1), stage DECIMAL(2,1), name STRING, location STRUCT<type:STRING, coordinates:ARRAY<DOUBLE>>) ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe' STORED AS TEXTFILE LOCATION '/user/sunbeam/busstops/input';

 SELECT *FROM busstops LIMIT 30;

+--------------------------------------+----------------+----------------+---------------+-----------------+--------------------------+----------------------------------------------------+
|             busstops._id             | busstops.stop  | busstops.code  | busstops.seq  | busstops.stage  |      busstops.name       |                 busstops.location                  |
+--------------------------------------+----------------+----------------+---------------+-----------------+--------------------------+----------------------------------------------------+
| {"$oid":"5a0720b478597fc11004d951"}  | Non-BRTS       | 103B-D-04      | 4.0           | 1.0             | Aranyeshwar Corner       | {"type":"Point","coordinates":[73.857675,18.486381]} |
| {"$oid":"5a0720b478597fc11004d952"}  | Non-BRTS       | 103B-D-05      | 5.0           | 2.0             | Natubaug                 | {"type":"Point","coordinates":[73.857167,18.48103]} |
| {"$oid":"5a0720b478597fc11004d953"}  | Non-BRTS       | 103B-D-07      | 7.0           | 2.0             | Shankar Maharaj Math     | {"type":"Point","coordinates":[73.857234,18.470738]} |
| {"$oid":"5a0720b478597fc11004d954"}  | Non-BRTS       | 103B-D-06      | 6.0           | 2.0             | Padmawati                | {"type":"Point","coordinates":[73.857244,18.477347]} |
| {"$oid":"5a0720b478597fc11004d955"}  | Non-BRTS       | 103B-D-08      | 8.0           | 3.0             | Balajinagar              | {"type":"Point","coordinates":[73.858154,18.464405]} |
| {"$oid":"5a0720b478597fc11004d95b"}  | Non-BRTS       | 103B-D-09      | 9.0           | 3.0             | Bharati Vidyapeeth Gate  | {"type":"Point","coordinates":[73.8582,18.457434]} |
| {"$oid":"5a0720b478597fc11004d95d"}  | Non-BRTS       | 103B-U-03      | 3.0           | 1.0             | Bharati Vidyapeeth Gate  | {"type":"Point","coordinates":[73.858154,18.457616]} |
| {"$oid":"5a0720b478597fc11004d95e"}  | Non-BRTS       | 103B-U-04      | 4.0           | 2.0             | Balajinagar              | {"type":"Point","coordinates":[73.857973,18.464558]} |
| {"$oid":"5a0720b478597fc11004d95f"}  | Non-BRTS       | 103B-U-05      | 5.0           | 2.0             | Shankar Maharaj Math     | {"type":"Point","coordinates":[73.857067,18.470349]} |
+--------------------------------------+----------------+----------------+---------------+-----------------+--------------------------+----------------------------------------


