-- SingleTableQueriesSolutions.sql
-- All of the queries use tables in the flights database.  
-- You may find the data descriptions here helpful:
-- http://cran.r-project.org/web/packages/nycflights13/nycflights13.pdf

-- 1. Write a SELECT statement that returns all of the rows and columns in the planes table

SELECT * FROM airplanes;

-- 2. Using the weather table, concatenate the year, month, and day columns to display a date in the form "3/17/2013"
-- see:  http://www.postgresql.org/docs/9.1/static/functions-string.html; PostgreSQL delimiter is ||
-- note that PostgreSQL does not support computed columns directly; there are ways to implement this in a function or a view


SELECT Month  || '/' || Day || '/' || Year FROM weather;

-- 3. Order by planes table by number of seats, in descending order.

SELECT * FROM planes ORDER BY seats DESC;

-- 4. List only those planes that have an engine that is 'Reciprocating'

SELECT * FROM planes WHERE engine = 'Reciprocating';

-- 5. List only the first 5 rows in the flights table

SELECT * FROM flights LIMIT 5;

-- 6. What was the longest (non-blank) air time?

SELECT air_time FROM flights WHERE air_time > 0 ORDER BY air_time DESC LIMIT 1;

-- 7. What was the shortest (non-blank) air time for Delta?

SELECT air_time FROM flights WHERE air_time > 0 AND carrier = 'DL' ORDER BY air_time LIMIT 1;

-- 8. Show all of the Alaska Airlines flights between June 1st, 2013 and June 3rd, 2013.  Is the way the data is stored in the database
--    helpful to you in making your query?

SELECT * 
  FROM flights 
 WHERE carrier = 'AS' 
   AND year = 2013 AND month = 6 AND day >= 1 AND day <= 3

-- or

SELECT * 
  FROM flights 
 WHERE carrier = 'AS' 
   AND year = 2013 AND month = 6 AND day BETWEEN 1 AND 3

9.  Show all of the airlines whose names contain 'America'
 SELECT * FROM airlines WHERE name LIKE '%America%';

10. How many flights went to Miami?

SELECT COUNT(*) FROM flights WHERE dest = 'MIA';

11. Were there more flights to Miami in January 2013 or July 2013?  (Multiple queries are OK)

SELECT COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND month = 1;
SELECT COUNT(*) FROM flights WHERE dest = 'MIA' AND year = 2013 AND month = 7;


12. what is the average altitude of airports?

SELECT AVG(alt) FROM airports;

13. What is the average altitude of the three major New York airports?

SELECT AVG(alt) FROM airports WHERE faa IN ('EWR','LGA','JFK');

SELECT AVG(alt) FROM airports WHERE faa = 'EWR' OR faa = 'LGA' OR faa = 'JFK';

14. What is the average altitude for airports grouped by timezone.  Which timezone has the highest altitude?  Why?

SELECT tz, AVG(alt) 
FROM airports
GROUP BY tz
ORDER BY tz;






   



