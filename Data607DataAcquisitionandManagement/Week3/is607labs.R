#Subsetting
theurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/bridges/bridges.data.version1"
thedatav1 <- read.table(file = theurl, header = FALSE, sep = ",")
head(thedatav1)
names(thedatav1)
names(thedatav1) <- c("Identif","River","Location","Erected","Purpose","Length","Lanes","ClearG","TorD","Material","Span","RelL","Type")
names(thedatav1)
head(thedatav1)
thedata.v3 <-head(subset(thedatav1, Purpose == "HIGHWAY", select = c('River','Location','Erected','Length','Lanes','TorD','Material','Span')))
thedata.v3  

#reading csv and sql dataframes
pop.data <-read.csv(file = 'C:/Users/apagan/Documents/CUNYSPS/IS607DataAcquisitionandManagement_Fall2018/population.csv', header = FALSE, sep = ",")
tb.data <-read.csv(file = 'C:/Users/apagan/Documents/CUNYSPS/IS607DataAcquisitionandManagement_Fall2018/tb2.csv', header = TRUE, sep = ",")
str(pop.data)
str(tb.data)
names(pop.data)<- c("country","year","population")
names(tb.data)<-c("country","year","cases")
md <- merge(x = pop.data, y = tb.data, by = c("country","year"))
md$rate <- round(md$cases/as.integer(md$population), digits = 2)
names(md)
str(md)
md.subset <-subset(md, select = c('country', 'year', 'rate'))
names(md.subset)
str(md.subset)
head(md.subset)
