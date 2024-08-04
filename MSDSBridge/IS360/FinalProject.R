require(dplyr)
library(hflights)
dflights <- tbl_df(hflights)
dfflights <- na.omit(dflights)


#Export all dfligh data. 

write.csv(dfflights, "Dflights.csv", row.names=F)

#########################################

airplanes <- select(dflights, FlightNum, ActualElapsedTime, Cancelled, TaxiIn, TaxiOut)

airplaneSum <- dflights %>% 
group_by(FlightNum) %>%
summarise(FlighTime = mean(ActualElapsedTime, na.rm = TRUE), TaxI = mean(TaxiIn, na.rm = TRUE),
          TaxO = mean(TaxiOut, na.rm = TRUE), CancelCount = sum(Cancelled, na.rm = TRUE))

#shows correlation of taxi in and out vs flight cancellations
require(ggplot2)

ggplot(airplaneSum, aes(TaxI + TaxO, CancelCount)) +
geom_point(aes(size = CancelCount), alpha = 1/2) +
geom_smooth() +
scale_size_area()

#Export airplane summary flight data

write.csv(airplaneSum, "airplaneSums.csv", row.names=F)


