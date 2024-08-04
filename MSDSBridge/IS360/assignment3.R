#Use R to determine how many numbers from 1 to 1000 are not divisible by any of 3, 7, and 11
v<- c(1:1000)
for (i in v)
{
   f<-c(v %% 3)
   f<-c(f, v %% 7)
   f<-c(f, v %% 11) 
}
count <-grep(0, f)
length(count)

#Function that takes a vector as input and returns the number of missing values in a vector

v<- c(2:15, NA )
f2<- function(x) {v = NA}
g<-f2(v)
length(g)

#Function that takes a data frame as input and returns a named vector with the number of missing values in a vector
x <- 5:1
y <- 1:5
q <- c("Yankees", "Mets", "Knicks", "Nets", NA)
df <- data.frame(x, y, q)
f2<- function(x) {df = NA}
g<-f2(df)
length(g)



