hermanos<-c(0,3,2,5,4)
hermanos
df<-data.frame(hermanos)
df
barplot(df$hermanos,main = "hermanos",xlab = "clases",ylab = "numero",names.arg = c("a","b","c","d","e"))
