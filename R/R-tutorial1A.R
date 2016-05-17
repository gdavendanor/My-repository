###Vectors
x<-c(6,8,10) 
#las dos primeras entradas
x[c(1,2)]
#De la segunda a la tercera entrada
x[2:3]
#Series
s<-1:10
s
sum(s)
mean(s)
sum(s^2)
sum((1:10)^2)
#Matrices
# A vector of length 10 can be arranged as a 2x5 or a 5x2 matrix
# Again the syntax is clunky but very clear
y=matrix(s,nrow=2,ncol=5)
y
z=matrix(s,nrow=5,ncol=2)
z
#ordenando por filas
w=matrix(s,nrow=2,ncol=5,byrow=TRUE)
w
#Accesing entries in matrix
y[1,1]
y[2,3]
y[1,3]
#Sums and means on matrices
rowSums(y)
colSums(y)
rowMeans(y)
colMeans(y)