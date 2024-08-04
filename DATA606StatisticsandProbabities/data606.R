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

n<-le5
pop<-runif(n, 0, 1)
mean(pop)
samp1<-sample(pop, size=10, replace = TRUE)
mean(samp1)
hist(samp1)
samp2<-sample(pop, size=30, replace = TRUE)
mean(samp2)
hist(samp2)

#Chapter 5 Inference for numerical data
####z score mean-null/(sd/sqrt(n) or SE=(sd/sqrt(n))
se<-8.887/sqrt(200)
zs<-(-.545-0)/(se)


#### p-value
pnorm(zs)


####Get z0-score from p-value
qnorm(pnorm(zs))

####confidence intervals = mean+- zs*se
c(-.545+1.96*se, -.545-1.96*se)

####Sample error between 2 sample means = sqrt(variance1/n1 + variance2/n2)
sem<-round(sqrt(15.14^2/505 + 15.12^2/667),2)
####T-test stats on diff of 2 small sample means 
####se== sqrt(variance1/n1 + variance2/n2)
####df =min(n1-1, n2-1)

####Confidence inteval of 2 sample means = (m1-m2)+- zs*se
c(round((41.8-39.4)-1.96*sem,2),round((41.8-39.4)+1.96*sem,2))

####Tdf SE=sample pe difference/sqrt(n)
st<-round(1176/sqrt(10))
####T test statistic= population pe differenc-null value/SE
tt<-round((1836-0)/st,2)

#2 * pnorm(mean(hsb2$diff), mean=0 , sd = sd(hsb2$diff)/sqrt(nrow(hsb2)))
####df = n-1
dft <-10-1

####Test statistic p-value use below or lookup test statistic in t-table based on df
2 * pt(tt, dft, lower.tail = FALSE)

####Confidence t-test interval = pe +- tdf * conf use qt to get tvalue
sqt<-qt(.025, dft)
c(1836 -st*sqt, 1836+st*sqt)

####ANOVA degrees of freedom = group (k-1), total sample size(t-1), groupdf-totaldf
####use same tvalue and divide by # of groups

1-pnorm(1.87)
1-pnorm(3.8)

##Anova pf value pf(pv, dfg, dfe, lower.tail = FALSE)
pf(21.735, 3, 791, lower.tail = FALSE)

#Chapter 6
#Pchi sqr pchisq(pv, df, lower.tail = FALSE)
pchisq(22.63, 4, lower.tail = FALSE)

#Inference inference(data, est=, type, method, success)
inference(sw12$response, est = "proportion", type = "ci", method = "theoretical", 
          success = "atheist")