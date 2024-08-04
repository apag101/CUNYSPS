--IS 360 Week 12 Quiz Page 1
--Week 12 Quiz
--The Week 12 quiz is due end of day Sunday November 16th. You may work with a partner if you wish.
--Please use the tables in the flights database. Directions for downloading and restoring the flights database are provided in the Week 10 folder. For each question, your deliverable is the SQL query or queries.

--1. Which of these four airplanes made the most flights out of New York City airports in 2013? Plane tailnums: 'N125UW','N848MQ','N328AA','N247JB'

select tailnum, count(tailnum) from flights
where tailnum in ('N125UW','N848MQ','N328AA','N247JB')
group by tailnum
order by count desc
limit 4;


--2. For each of these four planes, show the corresponding meta-data (model, manufacturer, engines, etc.) about each plane? What is surprising about the information returned? How do you think this could happen?

select * from planes
where tailnum in 
('N125UW','N848MQ','N328AA','N247JB')

--"N125UW";2009;"Fixed wing multi engine";"AIRBUS";"A320-214";2;182;;"Turbo-fan"
--"N247JB";2006;"Fixed wing multi engine";"EMBRAER";"ERJ 190-100 IGW";2;20;;"Turbo-fan"
--"N328AA";1986;"Fixed wing multi engine";"BOEING";"767-223";2;255;;"Turbo-fan"


--Data is missing N848MQ. Maybe its is not owned by the company that is using the database or it is a newly owned plane that was never entered into the database. Could also be bad inventory db design.

--3. Write a SELECT statement that shows for all of the flights during the period February 14th to February 17th for each of the four planes above: 'N125UW','N848MQ','N328AA','N247JB'. Your select statement should return the following information: tailnum, flight date information, departure delay, arrival delay, 3 digit destination code

select tailnum, concat(month,'/',day,'/',year) as FlightDate, dep_delay, arr_delay, dest from flights
where month = 2 and day between 14 and 17 and tailnum in ('N125UW','N848MQ','N328AA','N247JB');
 
--4. Add a join clause, to also show destination airport name. How many rows were returned?
--13

select tailnum, concat(month,'/',day,'/',year) as FlightDate, dep_delay, arr_delay, dest, name from 
flights join airports on faa = dest
where month = 2 and day between 14 and 17 and tailnum in ('N125UW','N848MQ','N328AA','N247JB');

--5. Rewrite the join as a left join, and compare your results.
--It now returns 14 rows, including the airports with null in the name.

select tailnum, concat(month,'/',day,'/',year) as FlightDate, dep_delay, arr_delay, dest, name
from flights 
left join airports on faa = dest
where month = 2 and day between 14 and 17 and tailnum in ('N125UW','N848MQ','N328AA','N247JB')
order by name;

--6. Add a second left join clause to also show the number of seats in the planes

select flights.tailnum, concat(month,'/',day,'/',flights.year) as FlightDate, dep_delay, arr_delay, dest, name, seats 
from flights 
left join airports on faa = dest
left join planes on flights.tailnum = planes.tailnum
where month = 2 and day between 14 and 17 and flights.tailnum in ('N125UW','N848MQ','N328AA','N247JB')
order by seats;

--7. Rewrite your query, using table aliases. (Results unchanged from above). Do you find the code more readable with or wthout table aliases?
--More easier to read without aliases since you have the table clearly listed, but quicker to code with table alias.

select f.tailnum, concat(month,'/',day,'/',f.year) as FlightDate, dep_delay, arr_delay, dest, name, seats 
from flights f
left join airports a on faa = dest
left join planes p on f.tailnum = p.tailnum
where month = 2 and day between 14 and 17 and f.tailnum in ('N125UW','N848MQ','N328AA','N247JB');