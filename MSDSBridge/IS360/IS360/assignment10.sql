--Week 10 Assignment

--1. What country is the city of Abu Dhabi in? Show the SQL that answers this question.

select country from 
city c join country o on
c.country_id = o.country_id
where city like '%Abu Dhabi%';

--2. Write a SQL query that shows all of the films with the word “Astronaut” in their description.

select title from film where
description like '%Astronaut%';

--3. Write a SQL query that lists all film titles with replacement costs between $20.00 and $24.99 (inclusive) that start with the letter E, in alphabetical order by film title.

select title from film where
replacement_cost between 20.00  and 24.99
and title like 'E%'
order by title;

--Challenge Exercise
--Create a PostgreSQL table and load it with information about real films, using data that you’ve found on the web.
--retteived from http://files.grouplens.org/datasets/movielens/ml-100k-README.txt

dvdrental=# create table rfilms(id integer, title varchar(100), rdate date, idbm_
url varchar(250));
dvdrental=# COPY rfilms from 'C:\Program Files\PostgreSQL\9.3\gdal-data\rfilms2.
txt';

