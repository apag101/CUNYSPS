//**SQL Select and Aggregations Please use the tables in the flights database.  
Your deliverable should include the SQL queries that you write in support of your conclusions.
**// 

#1. Which destination in the flights database is the furthest distance away, 
#based on information in the flights table.  Show the SQL query(s) that support your conclusion. 
#Answer: HNL

select dest from flights order by distance desc limit 1;

#2. What are the different numbers of engines in the planes table?  
#For each number of engines, which aircraft have the most number of seats?  
#Show the SQL statement(s) that support your result. 
# Anwser: a)1,2,3,4 b)4

select distinct engines from planes;
select engines, seats from planes order by seats desc limit 1;

#3. Show the total number of flights. 
#Answer: 336776

select count(flight) from flights;

#4. Show the total number of flights by airline (carrier).
#Answer:
/**
UA	58665
AA	32729
B6	54635
DL	48110
EV	54173
MQ	26397
US	20536
WN	12275
VX	5162
FL	3260
AS	714
9E	18460
F9	685
HA	342
YV	601
OO	32 
**/

select carrier, count(flight)  as NFlights from flights group by carrier;

#5. Show all of the airlines, ordered by number of flights in descending order. 
#answer:
/**
B6	29952
UA	58665
B6	54635
EV	54173
DL	48110
AA	32729
MQ	26397
US	20536
9E	18460
WN	12275
VX	5162
FL	3260
AS	714
F9	685
YV	601
HA	342
OO	32
**/

select carrier, count(flight)  as NFlights from flights group by carrier order by count(flight) desc;

#6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order. 
#Answer:
/**
UA	58665
B6	54635
EV	54173
DL	48110
AA	32729
**/

select carrier, count(flight)  as NFlights from flights group by carrier order by count(flight) desc limit 5;

#7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater,
# ordered by number of flights in descending order. 
#Answer:
/**
UA	41135
B6	30022
DL	28096
AA	23583
EV	6248
**/

select carrier, count(flight)  as NFlights from flights where distance > 1000
group by carrier order by count(flight) desc limit 5;

#8. Create a question that (a) uses data from the flights database, and 
#(b) requires aggregation to answer it, and write down both the question, 
#and the query that answers the question. 
#Find number of carrier with 3 carriers with most flights with no departure delays
#Answer:
/**
B6	29952
DL	29654
UA	27321
**/
select carrier, count(carrier) from flights where dep_delay is not null and
dep_delay < 0 group by carrier order by count(carrier) desc limit 3;