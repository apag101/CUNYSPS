--IS 360 Week 11 Quiz Page 1
--Week 11 Quiz
--The Week 11 quiz is due end of day Sunday November 9th. You may work with a partner if you wish.
--Please use the weather table in the flights database. Directions for downloading and restoring the flights database are --provided in the Week 10 folder. For each question, your deliverable is the SQL query or queries.

--1. Show the first five rows from the weather table. You don’t need to sort the results.

select * from weather limit 5;

--2. What was the average wind speed over time—that is, across all of the rows in the table?

select avg(wind_speed) from weather;

--3. What was the average wind speed for each month?

select month, avg(wind_speed) from weather
group by month
order by month; 

--How many rows are returned from your query? 

--13 rows

--How might you handle this?

select month, avg(wind_speed) from weather
where month is not null
group by month
order by month;

--“cleaned-up” version with wind speed rounded to nearest integer

select month, round(avg(wind_speed)) from weather
where month is not null
group by month
order by month;

--4. Which were the five windiest days? 

select concat(month,'/',day,'/',year) as date, wind_speed from weather 
where wind_speed is not null
order by wind_speed desc
limit 5;

--Drill down on the data for the windiest day

select concat(month,'/',day,'/',year) as date, wind_speed from weather 
where wind_speed is not null
order by wind_speed desc
limit 1;
--what does this tell us? What might we do next here?

--The windiest day appears to be an anomoly. Maybe getting the average will give us a better number closer to a norm.

--5. Write and provide the SQL Script that answers a different “interesting” question about the data in the weather table.

select round(wind_gust) as Gust, round(avg(wind_speed)) as Avg_Wind_Speed from weather
group by wind_gust
order by wind_gust;

--Challenge Exercise
--When was the weather the coldest? Show only one row for that day.

select concat(month,'/',day,'/',year) from weather
order by temp desc
limit 1;