coches<-c(1,3,5,5,4,9,7)
camiones<-c(2,4,4,3,5,5,11)
motos<-c(1,3,3,4,3,9,14)
plot(coches,type="o",col="blue")#Añadimos el tipo puntos y color
title(main = "autos",col.main="red",font.main=4)#Añadimos un titulo en rojo y letra cursiva negrita
plot(coches,type="o",col="blue",ylim=c(0,11))#Añadimos el rango del eje y y (0,11)
lines(camiones, type = "o",pch=22,lty=2,col="red")#Dibujamos camiones con una intermitente roja y puntos cuadrados
title(main = "Autos",col.main="red",font.main=4)#Creamos el título rojo, negrita y cursiva
rango<-range(0,coches,camiones)#Calculamos el rango desde 0 al máximo valor de coches y camiones
plot(coches,type = "o",col="blue",ylim = rango,axes = FALSE,ann=FALSE)#Dibujamos Autos poniendo en el eje y el rango. Además cerramos las etiquetas de los ejes y anotaciones para poner nosotros las que queramos
axis(1,at=1:7,lab=c("lun","mar","mie","Jue","vie","sab","dom"))#Introducimos el eje x la etiqueta con los dias de la semana
axis(2,las=1,at=rango[2])
box()
lines(camiones,type = "o",pch=22,lty=2,col="red")#Volvemos a dibujar camiones
title(main="Autos",col.main="red",font.main=4)#Título
#Etiquetamos los ejes en color verde
title(xlab = "Días",col.lab="green2")
title(ylab = "Total",col.lab="green2")

#vAmos a añadir una etiqueta al gráfico utilizando el tipo de línea y colores del gráfico
legend(1,rango[2],c("coches","camiones"),cex = 0.8,col = c("blue","red"),pch=21:22,lty=1:2)
df<-data.frame(coches,camiones,motos)
df

#Diagramas de barras
barplot(coches)
barplot(df$coches,main = "Coches",xlab = "Días",ylab = "Total",names.arg = c("lun","mar","mie","jue","vie","sab","dom"),border = "blue",density = c(10,20,30,40,50,60,70))
barplot(as.matrix(df),main="Autos",ylab = "Total",beside = TRUE,col = rainbow(7))
legend("topleft",c("Lun","Mar","Mie","Jue","Vie","Sab","Dom"),cex = 0.6,bty = "n",fill = rainbow(7))
barplot(t(df),main = "Autos",ylab = "Total",col = heat.colors(3),space = 0.1,cex.axis = 0.8,las=1,names.arg = c("Lun","Mar","Mie","Jue","Vie","Sab","Dom"),cex=0.8)
legend(3,30,names(df),cex = 0.8,fill = heat.colors(3))