#Project 3: Profiling a Data Set
#https://nycopendata.socrata.com/data?cat=social services
#http://www.npdb.hrsa.gov/resources/publicData.jsp
#https://www.opensciencedatacloud.org/
#http://www.inside-r.org/howto/finding-data-internet
#http://blogs.mathworks.com/loren/2014/07/14/analyzing-fitness-data-from-wearable-devices-in-matlab/
#http://groupware.les.inf.puc-rio.br/har
#http://www.amstat.org/publications/jse/v6n2/datasets.watnik.html

tf <- "C:\\Users\\Development\\Desktop\\CUNYSPS\\IS360\\bbproj.csv"
tb <- read.table(file = tf, header = TRUE, stringsAsFactors = FALSE, sep = ",")
bb <- data.frame(tb)
require(tidyr)
obp <- select(bb, Pname, Sal, BA, OBP)
summary(obp)
install.packages("ggplot2")
library(ggplot2)
require(ggplot2)
ggplot(obp, aes(x = Sal, y = OBP)) +
    + geom_line()
ggplot(obp, aes(x = Sal, y = BA)) +
    + geom_line()
