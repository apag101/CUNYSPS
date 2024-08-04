#Exploratory Data Analytics in R
#References:
#http://vincentarelbundock.github.io/Rdatasets/datasets.html
#http://www.baseball-reference.com/bullpen/On_base_percentage
#The full formula is OBP = (Hits + Walks + Hit by Pitch) / (At Bats + Walks + Hit by Pitch + Sacrifice Flies). 
#Batters are not credited with reaching base on an error or fielder's choice, and they are not charged with an 
#opportunity if they make a sacrifice bunt. 

tf <- "C:\\Users\\Development\\Desktop\\CUNYSPS\\IS360\\baseball.csv"
baseball <- read.csv(tf, header = TRUE, stringsAsFactors = FALSE, sep = ",")

library(sqldf)
obp<-sqldf("select team, year, ab, bb, hbp, sf from baseball where sf != 'NA'")
library(dplyr)
obperc <- mutate(obp, obp = (h + bb + hbp) / (ab + bb + hbp + sf))

obpperc<- obp %>%
group_by(year, team)%>%
summarise(teamobp = mean(obp))

obpct<- obpperc%>%
select(year, teamobp)%>%
group_by(year)%>%
summarise(yearobp = mean(teamobp))

barplot(t(as.matrix(obpct)), beside = TRUE)
hist(as.matrix(obpct))
boxplot(obpct)


