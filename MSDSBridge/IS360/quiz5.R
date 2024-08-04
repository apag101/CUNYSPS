The answers to the following questions should be placed in a single document file or text file.
Week 5 quiz is due end of day on Friday September 26th. Solutions to all quiz exercises will be posted on Saturday September 27th. Your grade will be based on two randomly selected exercises.
Reading Quiz: “Tidy Data”
1. Data tidying is what Hadley Wickham calls structuring datasets to facilitate analysis.

2. In tidy data, there are three properties. One of these properties states that “each type of observational unit forms a table.” What are the other two properties of tidy data.

Each variable forms a column.
Each observation forms a row.

3. According to Hadley Wickham, what are the five most common problems with messy datasets?

1) Column headers are values and not variable names
2) Multiple variables are stored in one column
3) Variables are stored in both rows and columns
4) Multiple types of obeservational units are stored in the same table.
5) A single obversationl unit is stored in multiple tables

4. Provide a one sentence definition for each of the four fundamental verbs of data manipulation:
a. Filter - Get only data that is required, based on a condition, leaving all other data out of visualization.
b. Transform - Cleaning data, removing unneeded data and fixing any formating discrepencies by adding or modifying variables.
c. Aggregate - Grouping data based on categories by collapsing multiple values into a single value
d. Sort - Set specific data or columns in descending or ascending order or changing order of observatios.

5. What is the function in base R used for filtering?

Function(s) for filtering are subset() and transform()

Reading Quiz: “Introduction to dplyr”
1. What are the advantages and disadvantages of using the dplyr package versus the plyr package?

Dplyr is the upgrade to plyr. Dply runs functions and computations more efficiently, you can work with local or remote database tables and it allows you to chain commmands with %.% . One disadvantage is you still need to pull down data frame if you want to use lm.

2. What are the advantages and disadvantage of using plyr versus the base R apply family of functions?

Although plyr are have same advantages it has with ply , like speed and ability to chain commands it does not include methods summary functions such as mean() and sum()

Reading Quiz: “tidyr”
1. What are the two verbs (functions) in the tidyr package that correspond to the spreadsheet functions pivot and unpivot?

To pivot you use gather() to unpivot we would use spread()