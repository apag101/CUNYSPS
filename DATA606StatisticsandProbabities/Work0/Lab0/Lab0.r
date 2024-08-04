source("more/arbuthnot.R")
arbuthnot
dim(arbuthnot)
names(arbuthnot)
arbuthnot$boys
arbuthnot$girls
plot(x = arbuthnot$year, y = arbuthnot$girls)
plot(x = arbuthnot$year, y = arbuthnot$girls, type = "l")
?plot
5218 + 4683
arbuthnot$boys + arbuthnot$girls
plot(arbuthnot$year, arbuthnot$boys + arbuthnot$girls, type = "l")
5218 / 4683
arbuthnot$boys / arbuthnot$girls
5218 / (5218 + 4683)
plot(arbuthnot$year, arbuthnot$boys / (arbuthnot$boys + arbuthnot$girls), type = "l")
arbuthnot$boys > arbuthnot$girls

source("more/present.R")
present$year     
dim(present)
names(present)
present #arbuthnot was 10s of thousands, present are in the millions

