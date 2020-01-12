install.packages("plumber")
library(plumber)
r<-plumb("C:/Users/Ernesto/Documents/datascientist/plumber.R")
r$run(port = 8000)
