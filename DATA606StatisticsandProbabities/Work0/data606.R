install.packages(c('openintro','OIdata','devtools','ggplot2','psych','reshape2', 'knitr','markdown','shiny')) 
devtools::install_github("jbryer/DATA606") 
library(DATA606)
startLab('Lab0')

library('DATA606')          # Load the package
vignette(package='DATA606') # Lists vignettes in the DATA606 package
vignette('os3')             # Loads a PDF of the OpenIntro Statistics book
data(package='DATA606')     # Lists data available in the package
getLabs()                   # Returns a list of the available labs
viewLab('Lab0')             # Opens Lab0 in the default web browser
startLab('Lab0')            # Starts Lab0 (copies to getwd()), opens the Rmd file
shiny_demo()                # Lists available Shiny apps

install.packages("tidyverse","ggplot2", "devtools")

library(ggplot2)
ggplot(mpg, aes(displ, hwy, colour = class)) + geom_point()

startLab('Lab1')
getLabs()

devtools::install_github("seankross/lego")
library(lego)
data(legosets)
str(legosets)

DATA606::viewLab('Lab2')
DATA606::startLab('Lab2')

#Stats
#bionomial k with n trials times success % times failed %
choose(8,2) * (.28^2)*(.72^8)

