select tailnum, count(tailnum) from flights
where tailnum in ('N125UW','N848MQ','N328AA','N247JB')
group by tailnum
order by count desc
limit 1;

select * from flights where tailnum in ('N125UW','N848MQ','N328AA','N247JB');

select * from planes
where tailnum in 
('N125UW','N848MQ','N328AA','N247JB')


	  select * from planes where tailnum is null;

select distinct dest from flights where tailnum in ('N125UW','N848MQ','N328AA','N247JB') and origin = 'LGA';

select * from flights where tailnum = 'N848MQ';

select f.tailnum, concat(month,'/',day,'/',f.year) as FlightDate, dep_delay, arr_delay, dest, name, seats from flights f
left join airports a on faa = dest
left join planes p on f.tailnum = p.tailnum
where month = 2 and day between 14 and 17 and f.tailnum in ('N125UW','N848MQ','N328AA','N247JB');

--1. What are the names of the five airports that receive the most flights?

SELECt name, (select count(*) from flights)  
from airports a join flights f on f.dest = a.faa;

select a.name, f.dest, count(f.*) as num_of_flights from 
flights f join airports a
on f.dest = a.faa
group by name, dest
order by num_of_flights desc
limit 5;


--2. What are American Airlines’ destination cities from the New York airports?

select distinct dest from flights where carrier = 'AA' and origin in ('JFK', 'LGA') order by dest;


select * from airports where faa like 'NY%' order by faa;
rtf ,.m
select * from airlines order by name;
                                                                                                                                                                                              order by month, day, year, hour;
select * from flights where origin in ('LGA', 'JFK') and dep_delay is not null order by dep_delay desc;

select distinct origin from weather;
select distinct origin from flights;
select origin, avg(temp), avg(dewp), avg(humid), avg(wind_dir), avg(wind_speed), avg(wind_gust), avg(precip), avg(pressure), avg(visib) from weather
group by origin;
select * from weather;

select concat(month,':',day,':',year,':', hour) as flight_date, origin, dest, tailnum from flights 
where origin in ('LGA', 'JFK') order by flight_date; 

--1. What weather conditions are associated with New York City departure delays?
 
create view flight_Delays as
select concat(month,':',day,':',year,':', hour) as flight_date, origin, dest, dep_delay, tailnum from flights 
where origin in ('LGA', 'JFK') and dep_delay is not null order by flight_date; 

create view weather_days as
select concat(month,':',day,':',year,':', hour) as flight_date, origin, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib 
from weather where origin in ('LGA', 'JFK') order by flight_date; 

select * from flight_delays
select * from weather_Days

select distinct w.flight_date, w.origin, f.dep_delay, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib
from flight_delays f  join weather_days w on f.flight_date = w.flight_date and f.origin = w.origin
order by dep_delay desc
--2. Are older planes more likely to be delayed?

--3. Ask (and if possible answer) a third question that also requires joining information from two or more tables in the flights database, and/or assumes that additional information can be collected in advance of answering your question.