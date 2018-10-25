x<-c(1,1,1,1,2,2,2,2,2,3,3,3,3,3,3,3)
y<-c(2,2,2,3,3,3,4,4,4,5,5,5,5,2,2,2)
sunflowerplot(x,y)

#Pie: Gráfico de sectores
pie.fruta<-c(0.23,0.35,0.14,0.02,0.23)
names(pie.fruta)<-c("Plátanos","Cerezas","Naranjas","Manzanas","Sandías")
fruta_labels<-round(pie.fruta/sum(pie.fruta)*100,1)
fruta_labels<-paste(fruta_labels,"%",sep = "")
pie(pie.fruta,col = c("yellow","violetred1","orange","green","red"),labels = fruta_labels)
legend("topleft",c("Plátanos","Cerezas","Naranjas","Manzanas","Sandías"),cex = 0.6,bty = "n",fill = c("yellow","violetred1","orange","green","red"))

#Gráfico cajas y bigotes
cars
data(cars)
attach(cars)
boxplot(speed)
