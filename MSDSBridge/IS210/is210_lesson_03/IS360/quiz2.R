#Vector of 20 numbers
v <-c(1:15, 13, 1, 4, 7, 9)

#Convert vector to character
v2char <-as.character(v)

#convert vector to a factor
v2fac <-as.factor(v)

#How many levels in the factor
length(v2fac)

#Use vector to peform formula 3x^2-4x+1
f1 <- function(x) {3*x^2-4*x+1} #set fuction
lapply(v,  f1) #apply function to vector 

#Create a named list
nlist <- list(Ten = 1:10, twenty = 11:20, thirty = 21:30)

#create a data frame with four columns, one each character, factor 3 levels
#numeric, and date with 10 observations
n <- 1:10
c <-c("One","two", "three", "four", "five", "six", "seven", "eight","nine", "ten")
d <-c("1/3/13", "2/1/14", "2/13/11", "3/24/14", "5/15/12", "8/14/10", "10/10/10", "11/5/12", "7/7/01", "1/1/01")
f <-factor(c(3, 4, 6, 3, 4, 6, 3, 3, 4, 3))
df <- data.frame(c, f, n, d)

#Illustrate how to add a row with a factor column that isn't in the 
#list of levels
f <-factor(c(3, 4, 6, 3, 4, 6, 3, 3, 4, 3)) #factor with 3 levels
f
f <-factor(c(f, 7)) #add a factor and make 4 levels
f

#Show how you would read in a CSV file called temperature.csv from current working directory
thefile <- "temperature.csv" #set file variable
temp <- read.table(file = thefile, header = TRUE, sep = ",") #import file
head(temp) #read file

#Show code that would read a TSV file call measurements.txt from directory other than current
thefile <-"C:\\temp\\measurements.txt" #set file variable
measure <- read.table(file = thefile, header = TRUE, sep = "\t") #import TSV file
head(measure) #read file

#Show code that would read in a delimited file with a pipe separator from a website
theurl <-"http://www.fakeurl.com" #set url variable
turl <- read.table(file = theurl, header = TRUE, sep = "|") #import pipe delimeted file
head(turl) #read file