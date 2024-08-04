

#Libraries

## @knitr loadlib
library(dplyr)
library(tidyr)
library(readxl)
library(ggplot2)
library(plotrix)
library(plotly)
library(gapminder)
library(RMySQL)
library(DT)


## CSV files to data frames


## @knitr loadcsv
apprDstr<-data.frame(read.csv(file = 'https://raw.githubusercontent.com/apag101/CUNYSPS/master/IS607/Project3/APPR_DISTRICT_RESEARCHER_FILE_DATA.csv', header = TRUE, sep= ",", stringsAsFactors = FALSE))

apprSch<-data.frame(read.csv(file = 'https://raw.githubusercontent.com/apag101/CUNYSPS/master/IS607/Project3/APPR_SCHOOL_RESEARCHER_FILE_DATA.csv', header = TRUE, sep= ",", stringsAsFactors = FALSE))

apprState<-data.frame(read.csv(file = 'https://raw.githubusercontent.com/apag101/CUNYSPS/master/IS607/Project3/APPR_STATEWIDE_RESEARCHER_FILE_DATA.csv', header = TRUE, sep= ",", stringsAsFactors = FALSE))


#Import data to MYSQL for analysis


## @knitr dbinit
mydb = dbConnect(MySQL(), user='root', password='123456', dbname='education', host='localhost')
dbListTables(mydb)
dbRemoveTable(mydb, "apprdstr")
dbWriteTable(mydb, "apprDstr",apprDstr, overwrite = TRUE)
dbRemoveTable(mydb, "apprsch")
dbWriteTable(mydb, "apprSch",apprSch, overwrite = TRUE)
dbRemoveTable(mydb, "apprstate")
dbWriteTable(mydb, "apprState",apprState, overwrite = TRUE)
dbDisconnect(mydb)


