library(dslabs)
data("murders")
class(murders)
str(murders)
head(murders)
murders$population
names(murders)
murders$state
pop<-murders$population
length(pop)
class(pop)
class(murders$state)
z<-3==2
z
class(z)
levels(murders$region)
class(murders$region)
