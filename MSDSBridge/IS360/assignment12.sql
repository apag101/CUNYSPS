--IS 360 Week 12 Assignment Page 1
---Week 12 assignment is due end of day on Tuesday November 18th. You may work with a partner on the assignment.
--Please use the tables in the flights database. Directions for downloading and restoring the flights database are provided in --the Week 10 folder. Your deliverable is the SQL query or queries.
--A solution to the assignment will be posted on Wednesday November 19th.

--1. What are the names of the five airports that receive the most flights?

select a.name, count(f.*) as num_of_flights from 
flights f join airports a
on f.dest = a.faa
group by name
order by num_of_flights desc
limit 5;

--2. What are American Airlines’ destination cities from the New York airports?

select distinct name from flights f join airports a on f.dest = a.faa
where carrier = 'AA' and origin in ('JFK', 'LGA') order by name;