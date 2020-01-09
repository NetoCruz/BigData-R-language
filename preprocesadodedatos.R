aspiradoras<-as.data.frame(res)
View(aspiradoras)
#Procesado de peso

aspiradoras$volumen<-as.character(aspiradoras$volumen)
aspiradoras$volumen<-gsub("Kg", "",aspiradoras$volumen)
aspiradoras$volumen<-gsub(",", ".",aspiradoras$volumen)
aspiradoras$volumen<-gsub("-1", NA ,aspiradoras$volumen)
aspiradoras$volumen<-as.numeric(aspiradoras$volumen)
aspiradoras$volumen

pesomedio<-mean(aspiradoras$volumen,na.rn=TRUE)
pesomedio
