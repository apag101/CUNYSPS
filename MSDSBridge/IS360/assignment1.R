# R Version 3.1.1
# PostGresSQL Version 9.3

#Load and Install DMWR Package
install.packages("DMwR") 
library(DMwR)

#Load Sales Data
data(sales)

#Count Number of observations
nrow(sales)