# - Media móvil
# - María Ramírez 
# - 1965814

# Media  movil para determinar el n ideal con respecto a la población 

data("iris")
View(iris)

setosa <-subset(iris, Species == "setosa")

# Sumatoria acumulativa de la variable longitud 
acumu <- cumsum(setosa$Sepal.Length)
acumu # SUmatoria acumulada
cont <- seq(1:length(setosa$Sepal.Length))
cont

# Creae un data drame con los datos creados 

set_mov <- data.frame(cont, acumu)
set_mov
# Crear nueva columna 
set_mov$movil <- acumu/cont
set_mov$movil <- round(acumu/cont,2)

plot(cont, set_mov$movil, type = "l", 
     xlab = "Número de observaciones", 
     ylab = "Media móvil", main = "Iris Media Movil")
abline(h=mean(setosa$Sepal.Length), col = "red") 
# Para poner media de datos originales, debe estar seguida del comando de 
# grafico para realizar la media 

mean(setosa$Sepal.Length)





