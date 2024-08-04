# Question 1 A Taxonomy of Data Science
#The  5 process steps for the acronym OSEMN are
# 1 Obtain which is the process of obtaining data from multiple sources via scripting or API
# 2 SCrub which is cleaning inconsistancies from data with scripting
#3 Explore which is using tools explore and visualize data
#4 Model which is using the best algorithms to predict data
#5 Interpret which is taking the predictive analysis and telling a story with it.

#Question 2 Well Designed or Decently Designed
# A well designed fuction inteerface and data structure decently implemented would be a better program
# because the implementation can be changed easier if the the interface and data structures are well designed. 
#The data structure and interface or the foundation of the program. Having a decently designed interface and data structure makes it more
#difficult to change. Its like building a house , if the foundation is suspect the house may crumble.

# Question 3 get day of the year for the currenet date
library(lubridate)
today <- Sys.time()
yday(today)

# Question 4 POSIXct or POSIXlt
#POSIXct inlcudes seconds from beginning of time, POSIXlt uses different formats. When considering only date/seconds format
#use POSIxCT when using any other formats you can use POSIXlt.

#Question 5 How long ago was Claude Shannon born ?
dob <- as.Date(Sys.time()) - as.Date("1916-4-30")
dob

#Question 6 create a date with data frames
dmonth <- 1:12
dday <- 18:29
dyear <- 1990:2001
DFdate <- data.frame(dyear, dmonth, dday)
DFdate
newdate<-c(paste(DFdate$dyear, DFdate$dmonth, DFdate$dday, sep="-"))
DFdate[["newdate"]] <- as.Date(newdate)
str(DFdate)

#Question 7 code to take MM-DD-YYYY format and convert to a date
cdate <- c("12-12-2014", "01-01-2013")
ndate <- as.Date(cdate, "%m-%d-%Y")
ndate

#Question 8 extract month from a date
cdate <- c("12-12-2014", "01-01-2013")
ndate <- as.Date(cdate, "%m-%d-%Y")
months(ndate)

#Question 9 Sequence of dates from January 1, 2005 to December 21, 2014
ldate <- c("2005-1-1","2014-12-21")
ldate
fdate <- c(as.Date(ldate[1], "%Y-%m-%d"))
tdate <- c(as.Date(ldate[2], "%Y-%m-%d"))
adate <- c(tdate:fdate)
as.Date(adate, origin= "1970-01-01")

#Question 10 Creating a data fram from a vector
#When creating a data from a vector, you would add the drop=FALSE argument to NOT automatically
#convert character vectors into factors.