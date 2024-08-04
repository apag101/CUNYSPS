library(rvest)
bb <- html("https://www.sites.google.com/site/bwsolg/schedule/sacred-heart")
sch <- bb %>%
    html_nodes("#sites-canvas-main") %>%
    html_text()
sch

install.packages("RCurl")
library("RCurl")
install.packages("XML")
library("XML")
bbs <- getURL("https://www.sites.google.com/site/bwsolg/schedule/sacred-heart", ssl.verifypeer = FALSE)
bbs_sacredHeart <- htmlTreeParse(bbs)