vc <- c(1:20)
str(vc)
vcchar <- as.character(vc)
str(vcchar)
vcfac <- as.factor(vc)
str(vcfac)
levels(vcfac)
vform <- c(3*vc^2-4*vc+1)
vform
str(vform)
vform2 <- c(3*vc^2-4*vc+1)
vform2
str(vform2)
named.list <- list(names = c('tony', 'bob'), age =(1:2), eyes=c('brown','blue'))
named.list

players <- as.character(c("Bernie Williams","Derek Jeter", "Jorge Pasada", "Aron Judge",
                          "Aron Hicks", "Babe Ruth", "Lou Gerret", "Reggie Jackson",
                          "Thurmon Munson", "Greg Nettles"))
position <-c("OF", "2B", "C", "RF", "CF", "RF", "CF", "RF", "C", "3B")
batting <-as.numeric(c(300, 301, 302, 303, 304, 305, 306, 307, 308, 309))
year <-as.Date(c("1996-4-1","1998-4-1", "1999-4-1","2017-4-1", "2015-4-1", "1908-4-1", "1968-4-1",
                 "1978-4-1","1977-4-1", "1979-4-1"))
df <- data.frame(players, position, batting, year)
df$players <-as.character(df$players)
str(df)

dfnew <- data.frame(players = "Ron Guidry", position = "P", batting = 100, year = "1977-4-2")
str(dfnew)
dfnew$year <- as.Date(dfnew$year)
dfnew$players <- as.character(dfnew$players)
str(dfnew)

df <- rbind(df, dfnew)
df
str(df)

getwd()
setwd("C://Users//apagan//Documents//MSDSBridge//R")
dft <-read.table(file= "iris_semicolon.csv", header = TRUE, sep = ",")
tail(dft)
str(dft)

principal <- 1500
annual_int <- 0.0324
compount_periodYears <- 12
years <- 6

for (period in 1:(compount_periodYears*years))
{
    principal <- principal + (principal * annual_int / compount_periodYears)
}
print (principal)
sprintf("%.2f", principal)

num <- c(1:20)
sum(num[num %% 3 == 0])

x<- 2
sum <- 0
for (i in 1:10)
{
    sum <- sum + x ^ i
}
print (sum)

x<- 2
sum <- 0
i<- 1
while (i <= 10)
{
    sum <- sum + x ^ i
    i <- i + 1
}
print (sum)

x <- 2
print(sum(x^(1:10)))

calc_mean = function(vec){
total <- 0
n <- 0
for (i in 1:length(vec))
{
    if(!is.na(vec[1]))
    {
        total <- total + vec[i]
        n<- n + 1
    }
    avg <- total/n
}
return(avg)
}

calc_median = function(vec)
{
    vec <- sort(vec)
    if(length(vec)==1){
        med <- vec[1]
    }
    else if(length(vec) %% 2 == 1)
    {
        med<-vec[ceiling(length(vec)/2)]
    }
    else
    {
        n<-ceiling(length(vec)/2)
        med<-(vec[n] + vec[n + 1])/2
    }
    return(med)
}

vec<- c(1,2,4,5,5,8)
vec<- c(-10:29, NA)
calc_mean(vec)
calc_median(vec)
