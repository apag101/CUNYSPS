use tb;
select * from tb;

select country, year, sum(adult) + sum(child) + sum(elderly) as count from tb
group by country, year
HAVING count IS NOT NULL; 

drop table if exists tmptb;
create table tmptb as
select country, year, sum(adult) + sum(child) + sum(elderly) as count from tb
group by country, year
HAVING count IS NOT NULL
ORDER BY country, year ; 

select * from tmptb;

SELECT * FROM tmptb  
INTO OUTFILE 'c:/temp/tb2.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

