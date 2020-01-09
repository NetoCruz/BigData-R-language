edad<-c(22,34,29,25,30,33,31,27,25,25)
tiempo<-c(14.21,10.36,11.89,13.81,12.03,10.99,12.48,13.37,12.23,12.34)
sexo<-c("M","H","H","M","M","H","H","M","M","H")
misDatos<-data.frame(edad,tiempo,sexo)
misDatos
str(misDatos)
dim(misDatos)
misDatos[,1]
misDatos[1,]
misDatos[2,3]
misDatos$edad
dat<-misDatos$tiempo>=12
dat
val<-which(dat)
val
misDatos[val,]

mifile<-read.csv("\tmp\datos.csv")
