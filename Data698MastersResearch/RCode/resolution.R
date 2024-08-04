require(knitr)
library(ggplot2)
library(tidyr)
library(MASS)
library(psych)
library(kableExtra)
library(dplyr)
library(faraway)
library(gridExtra)
library(reshape2)
library(leaps)
library(pROC)
library(caret)
library(pROC)
library(mlbench)
library(e1071)
library(fpp2)
library(mlr)
library(recommenderlab)
library(jsonlite)
library(stringr)
library(devtools)
library(sparklyr)
library(readtext)
library(simmer)
library(quanteda)
library(tidytext)
library(tm)
library(purrr)
library(topicmodels)
library(RMySQL)
library(plotly)
library(GGally)
library(corrplot)
library(imputeTS)
library(car)
library(rpart)
library(keras)
library(tensorflow)
library(naniar)
library(reticulate)

d1<- as.data.frame(read.csv('../Datasets/TestQuery.csv', header = TRUE,quote = ""))
cnames<-c('AlertName','AlertDescription','Severity','Priority','DateTime','ManagedEntityGuid')
d2<- as.data.frame(read.csv('../Datasets/TestQuery3.csv',header= FALSE, col.names = cnames, quote = "\"", sep=","))

joineddata<-right_join(d1, d2,  by = c("DateTime","ManagedEntityGuid"))
joineddata<-subset(joineddata,!is.na(SampleValue))%>%
  subset(select=c(-AlertName.x,-Severity.x))%>%
  rename(AlertName = AlertName.y, Severity = Severity.y)%>%
  mutate(ServerName = case_when
         ((ManagedEntityGuid == '2A909362-BE1E-F148-835C-96787AE2775E') ~ 'Server1',
           (ManagedEntityGuid == '6EA459BD-0616-71F6-FC4A-7989A2DCF9FD') ~ 'Server2',
           (ManagedEntityGuid == 'A1A8A538-8B75-B8F5-5F44-7159F192F602') ~ 'Server3',
           (ManagedEntityGuid == 'AF487CE3-8C62-2C7A-F748-9241D73F0403') ~ 'Server4',
           TRUE ~ 'Server5'))%>%
  mutate(Ticket = case_when
         ((Severity == 2) ~ 1,
           TRUE ~ 0))

sdata<-joineddata%>%subset(select=c(-Objectname, -AlertDescription))%>%
  group_by(DateTime, ServerName, CounterName, AlertName)%>%
  mutate(row_id=1:n()) %>% ungroup() %>%
  spread(CounterName, SampleValue)%>%
  subset(select=c(-row_id,-Priority))

nonats<-na_kalman(sdata)
df <- nonats %>% select(starts_with("Op Master"))
nonats<-nonats%>%mutate(MasterAvg=rowMeans(cbind(nonats[names(df)])))
nonats<-nonats%>%select(!c(names(df)))

nonats2<-nonats%>%
  select(where(~!any(is.na(.))))

resolutions<-c("restart system services",
               "clear application cache", 
               "contact local suport for system reboot",
               "known issue eol application", 
               "kill vb process and restart mm service", 
               "clear print queue",
               "submit request for more vm memory",
               "submit request for more vm disk space",
               "submit request for an additional VM CPU core",
               "clear disk space"
               )


rtest<-sample(resolutions, nrow(nonats2), replace=TRUE, prob = c(0.1, .2, .15, .05, .1,.05,.1,.1,.1,.05))



nonats2%>%mutate(resolution = sample(resolutions, nrow(nonats2), replace=TRUE, 
                                   prob = c(0.1, .2, .15, .05, .1,.05,.1,.1,.1,.05)))
