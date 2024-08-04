--IS 360 Week 11 Assignment Page 1
--Week 11 Assignment
--Week 11 assignment is due end of day on Tuesday November 11th. You may work with a partner on the assignment.
--Please use the weather table in the flights database. Directions for downloading and restoring the flights database are provided in the Week 10 folder. Your deliverable is the SQL query or queries.
--A solution to the assignment will be posted on Wednesday November 12th.
--You may find this reference information helpful:
--http://www.fondriest.com/news/wind-speed-and-direction.htm
--http://www.postgresql.org/docs/9.3/static/functions-conditional.html
--Your task is to show the wind direction for the first hour of the first day of each month as “West”, “North”, “East”, or “South”. It is left to you to come up with a reasonable way to answer the question.

select year, month, day, hour, wind_dir,
(select case 
when wind_dir <= 90 then 'North'
when wind_dir > 90 and wind_dir <= 180 then 'East'
when wind_dir > 180 and wind_dir <= 270 then 'South'
when wind_dir > 270 and wind_dir <= 360 then 'West'
else 'Unknown'
end as wind_direction) 
from weather
where day = 1 and hour = 1
order by month;
