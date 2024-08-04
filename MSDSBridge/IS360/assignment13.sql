--IS 360 Week 13 Assignment Page 1
--Week 13 Assignment
--Week 13 assignment is due end of day on Tuesday November 25th. You may work with a partner on the assignment.
--Please use the tables in the flights database. Directions for downloading and restoring the flights database are provided in the Week 10 folder. Your deliverable is the SQL query or queries.
--A solution to the assignment will be posted on Wednesday November 26th.
--1. Show every possible combination of airline and airport in the flights database.


select a.name as airlines, p.name as airports from airlines a, airports p order by airlines, airports


--2. For every airport north of Fairbanks, show the name of the airport, and all airports north of that airport. The resultset below sorted first by the name of the airport, then by the most northerly “more northerly” airports first.

select a.name, a.lat, b.name, b.lat from airports a join airports b on a.faa = b.faa
where a.lat > (select lat from airports where name like 'Fairbanks%') or b.lat > a.lat
order by a.name;

--Challenge question. Can you find an obvious outlier in this dataset?i How could you rewrite the query to exclude the outlier airport? What would be another approach to handling this outlier?