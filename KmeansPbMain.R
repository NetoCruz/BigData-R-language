library(plumber)
r<-plumb("C:/Users/Ernesto/Documents/datascientist/aspiradoraspb.R")
r$run(port = 8000)

#"http://localhost:8000/getCluster?precio=-0.2637021&opiniones=1.6261791&peso=0.5397330&potencia=0.0000000&alto=1.1762029&ancho=1.0432872&profundidad=0.3795931"