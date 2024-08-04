#Project 2: Tidying and Transforming data

#1) Write 3 Questions that you want to answer about the data
# a) Total nmber of users asked, b) % of users in each age and city category, c) % of users in each city catgeory


#Create an R data fram with with 2 observations to this data in its curretn "messy" state.
Answers<-c("Yes", "Yes", "No", "No", "Yes", "Yes", "No", "No")
AgeRange<-c("16-24", "25+", "16-24", "25+", "16-24", "25+", "16-24", "25+")
City<-c("Edinburgh", "Edinburgh", "Edinburgh", "Edinburgh", "Glasgow", "Glasgow", "Glasgow", "Glasgow")
VoterCounts<-c(80100, 143000, 35900, 214800, 99400, 150400, 43000, 207000)
dfa <- data.frame(City, AgeRange, Answers, VoterCounts)
df1 <-data.frame(AgeRange, City, VoterCounts)
df2 <-data.frame(Answers,  City, VoterCounts)
dfa
df1
df2

# USe functionality in tidyr to convert the data frame to be tiday data
#install.packages("devtools")
#devtools::install_github("hadley/tidyr")
require(tidyr)
library(tidyr)
dfa %>%
gather(key, value, starts_with('City'))

#Use functionality dplyr to answer questions in 1
require(dplyr)
library(dplyr)
df_sum <- summarise(dfa, total = sum(VoterCounts))
df_sum

df_perc <- mutate(dfa, perc = VoterCounts/sum(VoterCounts))
df_perc

edn<-dfa %>% select(VoterCounts) %>%
filter(City == 'Edinburgh') %>%
summarise(sum(VoterCounts))

ednperc <- edn/df_sum

gls<-dfa %>% select(VoterCounts) %>%
    filter(City == 'Glasgow') %>%
    summarise(sum(VoterCounts))

glsperc <- gls/df_sum

lage<-dfa %>% select(VoterCounts) %>%
    filter(AgeRange == '16-24') %>%
    summarise(sum(VoterCounts))

lageperc <- lage/df_sum

uage<-dfa %>% select(VoterCounts) %>%
    filter(AgeRange == '25+') %>%
    summarise(sum(VoterCounts))

uageperc <- uage/df_sum

#Would you have changed approach or questions
#I would probably would liked to have gotten more data breakdown by age incrementally. Maybe using 2 tables would ha
#a better way to normalize the data rather then working off of one table.
