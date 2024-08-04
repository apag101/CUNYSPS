#Write a loop that calculates 12 factorial
f<- 1
for (i in 1:12)
{
    f<- f*((1:12)[i])  
}
print(f)

#Final balance rounded to nearestr cent, with initial value of 1500 @ 3.24 
#compound interest after 6 years

s<-1500
i<-1+.0324/12
for (f in 1:72)
{
    s<-s*i
}
p<- round(s, digits = 2)
print(p)

#Vector of 20 add sum of every 3rd element
e<-c(5:15, 15:20, 45:50)
sum(e[c(3,6,9,12,15,18)])

#Use a for loop for summuation of  10 numbers where x = 2
x <-0
for(s in 1:10)
{
    x<-sum(x, 2)

}
print (x)

#use while loop to do same summation as directly above
j<-0
while (j<10)
{
    x<-sum(x, 2)   
    j<-j+1
}
print (x)

#solve above problem without using a loop
x<-2
n<-10 
s<-x * n
print (s)

#create a vector 20-50 by 5
v<-seq(from=20, to=50, by=5 )
print (v)

#character vector of legnth 10 , 10 times
e<-c("example") 
j<-rep(e, 10)
print(j)

#Input 3 numbers to solve quadratic equation
a<-1
b<-3
c<-1
x<-1
v<-0
f1 <- function(x) {a * x ^ + b * x + c}
lapply(v,f1) 

#Mean of a vector
v<- c(2:15)
f2<- function(x) {mean(v)}
f2(v)

#Modify above with missing value

v<- c(2:15, NA )
f2<- function(x) {mean(v, na.rm=TRUE)}
f2(v)

#Function with 2 input numbers and calculate greatest common dvisor
#Reference http://r.789695.n4.nabble.com/Greatest-common-divisor-of-two-numbers-td823047.html

f<- function(x,y) ifelse(y==0, x, f(y, x %% y))

#Function with 2 inuputs to solve x^2y+2xy+xy^2

f5<- function(x,y) {x ^ 2 * y + 2 * x * y - x * y ^ 2}
    
