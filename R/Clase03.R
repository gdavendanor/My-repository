library(dslabs)
data(murders)
str(murders)
names(murders)
murders$state
murders$abb
a <-murders[["population"]]
b <- murders$population
identical(a,b)
murders["population"]
murders$abb
class(murders$region)
levels(murders$region)
length(murders$region)
length(levels(murders$region))
x<-c("a","a","b","b", "b", "c")
table(x)
murders$region
table(murders$region)
