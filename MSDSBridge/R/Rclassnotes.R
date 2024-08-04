library(help = "datasets")
sample(letters)
fix()
sessionInfo()
dput(mtcars)
test <-dput(read.table("clipboard",sep="\t",header=TRUE))

install.packages("devtools")
library(devtools)
url_test <-url("http://vincentarelbundock.github.io/Rdatasets/datasets.html")
reproduce(mydata)  

data(mtcars)
names(mtcars)

dput?
    
install.packages("nycflights13")
require("nycflights13")
View(weather)
weather <-data.frame(weather)
weather$date <-ISOdate(weather$year, weather$month, weather$day, weather$hour,
                       min=0, sec=0, tz="America/New_York")
weather$temperature <-round(weather$temp*(5/9)+32,1)
newarkweather <-data.frame(weather$date, weather$temperature)
View(newarkweather)
colnames(newarkweather) <-c("date","temp")
str(newarkweather)
View(newarkweather)
getwd()
setwd("C://Users//apagan//Documents//MSDSBridge//R")
write.csv(newarkweather, file="temparature.csv", row.names=FALSE)
getwd()

install.packages("SciencePo")
anonymize(test)
