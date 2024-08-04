
--IS 360 Week 13 Quiz Page 1
--Week 13 Quiz
--The Week 13 quiz is due end of day Sunday November 23rd. You may work with a partner if you wish.
--Suppose you are tasked with creating an HTML form that displays all of the combinations of information from two SQL tables for a language school. The first table has the world’s four most popular “mother tongue” languages.i The second table has a list of courses: “Beginning”, “Intermediate” and “Advanced.” Assume that the first table is called languages, and the second table is called courselevels, and that both columns keep the descriptive text in a column called “name.” Write a SQL query that returns a single column of information for every combination, such as “Intermediate Hindi.”
--Mockup of sample HTML form constructed by combining information from all of the rows in two SQL tables.

SELECT 
 concat("Courselevels".courselevel, ' ',"Language"."Language")
FROM 
  public."Language", 
  public."Courselevels";

--Challenge exercise (Successful completion of this exercise may require working a week ahead in the course material, by reading The Language of SQL, chapters 17 and 18):
--A. Create and populate the two tables needed to generate this information.
--B. What else do you need to do to be sure that the most popular “mother tongue” languages are listed first, and that they are always listed in the order of Beginning, Intermediate, then Advanced?ii

SELECT 
 concat("Courselevels".courselevel, ' ',"Language"."Language")
FROM 
  public."Language", 
  public."Courselevels"
  order by "Language"."Language", "Courselevels".courselevel;