#Project 1 Statistic values min, max, mean, 1st/3rd quartile, Standarde deviation and number
#of missing values


    stats <- list(
    mean = function(x){sum(x, na.rm = TRUE)/length(na.omit(x))}, #calculate the mean
    min = function(x) {sort(x)[1]}, #calculate the maximum
    max = function(x) {sort(x, decreasing = TRUE)[1]}, #calculate the minimum
    q1 = function(x) {sort(length(na.omit(x)))/4[1]}, #calcuate the 1st quartile
    q3 = function(x) {sort(length(na.omit(x)))/4*3+1[1]}, #calculate the 3rd quartu
    median = function(x) {                              #calculate the median
        if (length(na.omit(x)) %% 2  == 0) 
        {
            md<- x[x[length(na.omit(x))/2]]
        } else {
            md<- x[x[length(na.omit(x))/2]]+1/2}
    },
    sdv = function(x) { for (i in na.omit(x))       #calculate standard deviation
        {
            sqrt(((x-stats$mean(x))+x)^2)
        }
    }
    
)
x<-c(1,2,3,4,5,NA)
lapply(stats, function(f) f(x))

