#Permutations sample(x,k), size k
x=1:5
x
sample(x,3)
sample(x,5)

## We can choose a k>x, with option replace=true ###
sample(x,10,replace = TRUE)

## generate a 3X4 array of random dice rolls
y=sample(1:6,12,replace = TRUE)
matrix(y,3,4)
matrix(y,2,6)

## Simulation
x=sample(1:6,3,replace = TRUE)
x
## To check if any of the 3 rolls are 6
x==6
 
## which is less than 6
x<6

## Simulate 1000 rolls
x=sample(1:6,1000,replace = TRUE)

## Number of sixs (in theory about 1/6 if divided for 1000)
sum(x==6)
sum(x==6)/1000

## Lets resume
x=matrix(sample(1:6,4*10,replace=TRUE),nrow = 4,ncol = 10)
x
y=(x==6)
y
z=colSums(y)
z
z>0
sum(z>0)
mean(z>0)

## 1000 trials
x=matrix(sample(1:6,4*1000,replace = TRUE),nrow = 4,ncol = 1000)
y=(x==6)
z=colSums(y)
sum(z>0)
mean(z>0)

# Verification of numbers or rows and cols
dim(x)

#One more simulations
x=matrix(sample(1:6,20000,replace = TRUE),2,10000)
y=colSums(x)
mean(y==7)
