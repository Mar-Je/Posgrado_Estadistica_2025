300+240+1527+400+1500+1833
celular <- 300
celular
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
5800*5*2

abs(10)
abs(-4)
sqrt(9)
log(2)

#Este es un comentario 

2*9
4+5 #Este es un comentario de prueba

celular <- 300
Celular <--300
CELULAR <- 8000

celular+Celular
CELULAR-celular

help(abs)
help(mean)
?mean
help.search("absolute")

gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)

gastos

barplot(gastos)

sort(gastos)
barplot(sort(gastos))
help(sort)
sort(gastos, decreasing = TRUE)        
barplot(sort(gastos, decreasing = TRUE))

gastos_ordenador <- sort(gastos, decreasing = TRUE)
barplot(gastos_ordenador)
?name

names(gastos_ordenador) <- c("Otros","Comestibles", "Alquiler", "Gimnasio","Celular", "Transporte")
barplot(gastos_ordenador, main = "Gastos mensuales", names.arg = names(gastos_ordenador), col = "pink")
 
       