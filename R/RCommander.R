refrescos<-c(25,30,40,20,15,10)
refrescos
df<-data.frame(refrescos)
df
barplot(df$refrescos, main="Consumo", xlab="Meses", ylab="Refrescos", names.arg=c("Abr", "May", "Jun", "Jul", "Agos", "Sept"))
pdf(file="refrescosgraf.pdf")
barplot(df$refrescos, main="Consumo", xlab="Meses", ylab="Refrescos", names.arg=c("Abr", "May", "Jun", "Jul", "Agos", "Sept"))
dev.off()

