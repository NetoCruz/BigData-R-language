
#* @param Precio
#* @param Opiniones
#* @param Peso
#* @param Volumen
#* @param Potencia
#* @param Alto
#* @param Ancho
#* @param Profundidad
#* @get /getCluster

function(Precio, Opiniones, Peso, Volumen, Potencia,Alto,Ancho,Profundidad){

campos<- as.vector(data[1,])
midist<-matrix(0,ncol = 8,nrow = 8)

for (i in 1:7) {
c<-dist(x=c(campos[i],mycluster$centers[,i]))
b<-as.matrix(c)
distancia<-b[-1,1]
midist[i,]<-distancia
}

rownames(midist)<-c("Precio","Opiniones","Peso","Volumen","Potencia","Alto","Ancho","Profundidad")
midist

dist_total<-apply(midist, 2, sum)
dist_total
num_cluster<-which.min(dist_total)
num_cluster
}

