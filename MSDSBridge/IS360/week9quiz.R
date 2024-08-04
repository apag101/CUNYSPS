# week9quiz.R
# [For your convenience], here is the provided code from Jared Lander's R for Everyone, 
# 6.7 Extract Data from Web Sites

install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowlPool <- readHTMLTable(theURL, which = 1, header = FALSE, stringsAsFactors = FALSE)
bowlPool

# 1. What type of data structure is bowlpool? 
#BolwPool is a data frame
str(bowlPool)
'data.frame':    10 obs. of  3 variables:
    $ V1: chr  "Participant 1" "Participant 2" "Participant 3" "Participant 4" ...
$ V2: chr  "Giant A" "Giant B" "Giant C" "Giant D" ...
$ V3: chr  "Patriot Q" "Patriot R" "Patriot S" "Patriot T" ...
# 2. Suppose instead you call readHTMLTable() with just the URL argument,
# against the provided URL, as shown below

theURL <- "http://www.w3schools.com/html/html_tables.asp"
hvalues <- readHTMLTable(theURL)

# What is the type of variable returned in hvalues

#In this scenerio the variables returned are lists

# 3. Write R code that shows how many HTML tables are represented in hvalues
str(hvalues)
# 4. Modify the readHTMLTable code so that just the table with Number, 
# FirstName, LastName, # and Points is returned into a dataframe

readHTMLTable(theURL, which = 1)

# 5. Modify the returned data frame so only the Last Name and Points columns are shown.

havalue <-readHTMLTable(theURL, which = 1)
havalue[,c(3,4)]

# 6 Identify another interesting page on the web with HTML table values.  
# This may be somewhat tricky, because while
# HTML tables are great for web-page scrapers, many HTML designers now prefer 
# creating tables using other methods (such as <div> tags or .png files).  
This url creats a health table tracking viruses when setting to detailed view. 
http://healthmap.org/en/

Table code below:
    
    <table cellpadding="0" cellspacing="0" border="0" class="display" id="list_view_table">
    <thead>
    <tr id="list_view_header">
    <th id="lvh0" width="60">Source</th>
    <th id="lvh1" width="70">Date</th>
    <th id="lvh2" width="200">Summary</th>
    <th id="lvh3" width="100">Disease</th>
    <th id="lvh4" width="100">Location</th>
    <th id="lvh5" width="95">Species</th>
    <th id="lvh6" width="60">Cases</th>
    <th id="lvh7" width="60">Deaths</th>
    <th id="lvh8" width="95">Significance</th>
    </tr>
    </thead>
    <tbody></tbody>
    </table>

# 7 How many HTML tables does that page contain?
#It contains one table

# 8 Identify your web browser, and describe (in one or two sentences) 
# how you view HTML page source in your web browser.
#I use IE 11. To view HTML page source i right click the page and select view source

