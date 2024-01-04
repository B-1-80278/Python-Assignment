CREATE TABLE movie_staging1 (
    USERID INT,
    MOVIEID INT,
    RATING DOUBLE,
    MOVIE_TIMESTAMP STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';


LOAD DATA LOCAL INPATH '/home/kartik/Downloads/movies/rats.csv'
INTO TABLE movie_staging1;

select userid,movieid,rating from movie_staging1 group by userid,movieid,rating limit 10;

create table temptable as select m1.MOVIEID id1,m2.MOVIEID id2,m1.RATING r1,m2.RATING r2
from movie_staging1 m1 join movie_staging1 m2 on m1.USERID=m2.USERID
where m1.MOVIEID<m2.MOVIEID ;
select * from temptable;

create table mvcorr as select id1,id2,count(*) as cnt,corr(r1,r2)
from temptable
group by id1,id2 ;
select * from mvcorr;