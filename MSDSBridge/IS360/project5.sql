--1. What weather conditions are associated with New York City departure delays?
 -- It appearts wind gust and wind direction may be associated with departure delays.
create view flight_Delays as
select concat(month,':',day,':',year,':', hour) as flight_date, origin, dest, dep_delay, tailnum from flights 
where origin in ('LGA', 'JFK') and dep_delay is not null order by flight_date; 

create view weather_days as
select concat(month,':',day,':',year,':', hour) as flight_date, origin, temp, dewp, humid, wind_dir, wind_speed, wind_gust, precip, pressure, visib 
from weather where origin in ('LGA', 'JFK') order by flight_date; 

select distinct w.flight_date, w.origin, f.dep_delay,  wind_dir, wind_speed, wind_gust, pressure, visib
from flight_delays f  join weather_days w on f.flight_date = w.flight_date and f.origin = w.origin
order by dep_delay, wind_dir, wind_speed, wind_gust, pressure, visib;

--2. Are older planes more likely to be delayed?
--Yes it does appear that older planes will likely be delayed.
select p.year, count(dep_delay) as dep_delay from flights f
join planes p on f.tailnum = p.tailnum
where f.origin in ('JFK', 'LGA')
group by p.year
order by p.year;

--3. Ask (and if possible answer) a third question that also requires joining information from two or more tables in the flights database, and/or assumes that additional information can be collected in advance of answering your question.
--Do specific manufacturers and/or engine type have more delays than others.
select manufacturer, engine, count(dep_delay) as dep_delay from flights f
join planes p on f.tailnum = p.tailnum
where f.origin in ('JFK', 'LGA')
group by manufacturer, engine
order by dep_delay desc;
