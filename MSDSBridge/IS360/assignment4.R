#Read in week-4-price-data.csv and week-4-make-model.csv as data frames
price <- read.csv("C:\\Users\\Development\\Desktop\\CUNYSPS\\IS360\\week-4-price-data.csv", stringsAsFactors=FALSE)
model <- read.csv("C:\\Users\\Development\\Desktop\\CUNYSPS\\IS360\\week-4-make-model-data.csv", stringsAsFactors=FALSE)
m <- merge(price, model, by.price = "ModelNumber", by.model = "ModelNumber", all = FALSE)
nrow(m) #Yes suprised it is 27

#All Price data
m <- merge(price, model, by.price = "ModelNumber", by.model = "ModelNumber", all.price = TRUE)
nrow(m) 

#VEhicles = 2010
install.packages("sqldf")
library(sqldf)
sqldf("select * from m where year = 2010")

#Red Cars cost more than 10000
sqldf("select * from m where color = 'Red' and price > 10000")

# Remove ModelNumber and Color
sqldf("select ID, Mileage, Price, Make, Model, Year from m where color = 'Red' and price > 10000")

#Input vector and output number of characters in each element of the vector
v<- c('bob', 'sam', 'tony')
f2<- function(x) 
    {
    for (i in x)
        print (nchar(i))
      
}  
f2(v)

