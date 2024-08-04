--Week 10 Quiz

--1. Create a list of customers whose last names start with an “M” or an “N”

SELECT * from customer where last_name like '%M%' or last_name like '%N%'

--2. What is the length of the longest film in the database?

select length from film
order by length desc
limit 1;

--3. Create a list of category_ids from the table category where the category is either “animation,” “children,” or “family.”

select category_id from category
where name in ('Animation', 'Children', 'Family');


 










