aspiradoras<-as.data.frame(res)
View(aspiradoras)
#Procesado de peso

aspiradoras$Peso<-as.character(aspiradoras$Peso)
aspiradoras$Peso<-gsub("Kg", "",aspiradoras$Peso)
aspiradoras$Peso<-gsub(",", ".",aspiradoras$Peso)
aspiradoras$Peso<-gsub("-1", NA ,aspiradoras$Peso)
aspiradoras$Peso<-as.numeric(aspiradoras$Peso)
aspiradoras$Peso

pesomedio<-mean(aspiradoras$Peso,na.rm=TRUE)
pesomedio
summary(aspiradoras$Peso)
aspiradoras$Peso[is.na(aspiradoras$Peso)]<-pesomedio
hist(aspiradoras$Peso)

#Procesado de volumen
aspiradoras$Volumen<-as.character(aspiradoras$Volumen)
aspiradoras$Volumen<-gsub("litros", "",aspiradoras$Volumen)
aspiradoras$Volumen<-gsub("-1", NA ,aspiradoras$Volumen)
aspiradoras$Volumen<-as.numeric(aspiradoras$Volumen)
aspiradoras$Volumen

volumenmedio<-mean(aspiradoras$Volumen,na.rm=TRUE)
volumenmedio
aspiradoras$Volumen[is.na(aspiradoras$Volumen)]<-volumenmedio
aspiradoras$Volumen
hist(aspiradoras$Volumen)
summary(aspiradoras$Volumen)

#Procesado de precio
#Siguiente parametro numero de precio
str(aspiradoras$Precio)
#Convertimos a char para procesar
aspiradoras$Precio<-as.character(aspiradoras$Precio)
aspiradoras$Precio<-gsub("EUR", "", aspiradoras$Precio)
aspiradoras$Precio<-gsub("???", "", aspiradoras$Precio)
aspiradoras$Precio<-gsub("€", "", aspiradoras$Precio)
aspiradoras$Precio<-gsub(",", ".", aspiradoras$Precio)
#Eliminamos el ultimo character
aspiradoras$Precio<-str_sub(aspiradoras$Precio, 1, str_length(aspiradoras$Precio)-1)
aspiradoras$Precio<-as.numeric(aspiradoras$Precio)
aspiradoras$Precio[is.na(aspiradoras$Precio)] <- mean(aspiradoras$Precio, na.rm = TRUE)
hist(aspiradoras$Precio)
boxplot(aspiradoras$Precio)

#procesado de valoraciones
aspiradoras$Opiniones<-as.character(aspiradoras$Opiniones)
aspiradoras$Opiniones<-gsub("valoraciones", "",aspiradoras$Opiniones)
#aspiradoras$Opiniones<-gsub("-1", NA ,aspiradoras$Opiniones)
aspiradoras$Opiniones<-as.numeric(aspiradoras$Opiniones)
aspiradoras$Opiniones

valoracionmedio<-mean(aspiradoras$Opiniones,na.rm=TRUE)
valoracionmedio
aspiradoras$Opiniones[is.na(aspiradoras$Opiniones)]<-valoracionmedio
aspiradoras$Opiniones
hist(aspiradoras$Opiniones)
summary(aspiradoras$Opiniones)

str(aspiradoras$Potencia)
#Convertimos a char para procesar
aspiradoras$Potencia<-as.character(aspiradoras$Potencia)
aspiradoras$Potencia<-gsub("watt_hours", "", aspiradoras$Potencia)
aspiradoras$Potencia<-gsub("vatios", "", aspiradoras$Potencia)
aspiradoras$Potencia<-gsub("-1", NA, aspiradoras$Potencia)
aspiradoras$Potencia<-as.numeric(aspiradoras$Potencia)
pmean<-mean(aspiradoras$Potencia, na.rm = TRUE)
aspiradoras$Potencia[is.na(aspiradoras$Potencia)] <- pmean

library(stringr)
aspiradoras$`Dimensiones`<-as.character(aspiradoras$`Dimensiones`)
aspiradoras$`Dimensiones`<-gsub("cm", "", aspiradoras$`Dimensiones`)
aspiradoras$`Dimensiones`<-gsub(",", ".", aspiradoras$`Dimensiones`)
dimen<-str_split_fixed(aspiradoras$Dimensiones,"x",3)
#dimen<-as.numeric(dimen)
View(dimen)

res_limpio<-cbind(aspiradoras, dimen)
res_limpio$`1`<-as.numeric(res_limpio$`1`)
res_limpio$`2`<-as.numeric(res_limpio$`2`)
res_limpio$`3`<-as.numeric(res_limpio$`3`)
res_limpio<-res_limpio[,-5]
