

## Get Data
#install.packages("taskscheduleR", repos = "http://www.datatailor.be/rcube", type = "source")
library(RCurl)
library(jsonlite)
library(methods)
library(RMySQL)
raw_aot_url <-getURL("https://api.arrayofthings.org/api/raw-observations")
df.raw_aot_url<-fromJSON(raw_aot_url)
df.raw_aot<-as.data.frame(df.raw_aot_url$data)

mydb = dbConnect(MySQL(), user='root', password='123456', dbname='aot', host='localhost')
dbWriteTable(mydb, "dfraw_aot",df.raw_aot, overwrite = TRUE)
dbDisconnect(mydb)
#write.csv(df.raw_aot, file=paste(format(Sys.time(),"%Y-%m-%d %h-%m-%s"), "csv", sep = "."))

#dbRemoveTable(mydb, "dfraw_aot")



