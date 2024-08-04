setwd("L:\\school\\cuny\\621\\group_hw2\\cuny621-hw2")
dfRaw <- read.csv("classification-output-data.csv", header = TRUE)

df <- dfRaw[,9:11]

table(df[,1:2])

TP <- function(df)
{
    return( sum((df[,1]==1) & (df[,2]==1)) )
}


TN <- function(df)
{
    return( sum((df[,1]==0) & (df[,2]==0)) )
}

FP <- function(df)
{
    return( sum((df[,1]==0) & (df[,2]==1)) )
}

FN <- function(df)
{
    return( sum((df[,1]==1) & (df[,2]==0)) )
}

accuracy <- function(df)
{
    return ( (TP(df) + TN(df)) / ( TP(df) + FP(df) + TN(df) + FN(df) ))
}

classificationError<- function(df)
{
    return ( (FP(df) + FN(df)) / ( TP(df) + FP(df) + TN(df) + FN(df) ))
}

precision <- function(df)
{
    return ( TP(df) / ( TP(df) + FP(df)) )
}

sensitivity <- function(df)
{
    return ( TP(df) / ( TP(df) + FN(df)) )
}

specificity <- function(df)
{
    return ( TN(df) / ( TN(df) + FP(df)) )
}

F1Score <- function(df)
{
    return ((2 * precision(df) * sensitivity(df)) / (precision(df) + sensitivity(df)))
}
#checking that count = 181, so at least we are including all cases
sum(TP(df) + TN(df) + FP(df) + FN(df))

accuracy(df)
classificationError(df)
precision(df)
sensitivity(df)
specificity(df)
F1Score(df)