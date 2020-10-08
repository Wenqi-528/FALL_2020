#setwd('set your own')
library(psych)
rm(list=ls())
#Set your own group4.dat location
data<- read.table("your own path", header=TRUE)
data

strsplit(data[1,1], "|")

data[1,1]

x<-vector()
y<-vector()
for (i in (1:11) )
    { x<-cbind(x,unlist(strsplit(data[i,1], "[|]"))[1])
     y<-cbind(y,unlist(strsplit(data[i,1], "[|]"))[2])}

attributes(x)

data<-data.frame(cbind(t(x),t(y)))
data
x<-as.numeric(data$X1)
y<-as.numeric(data$X2)
x
y


describe(x)
describe(y)
cor(x,y)


reg<-lm(y~x)
summary(reg)
summary(reg)$r.squared
plot(x,y, xlab="X",
     ylab="Y", 
     main = "y is regressed on x")
abline(coef(reg))
#p-values of t-test are below the 0.05 threshold, so the model is indeed statistically significant.
#linear model fit explains a 66.67% of the variance observed in the data.
#p-values of f-test are below the 0.05 threshold
