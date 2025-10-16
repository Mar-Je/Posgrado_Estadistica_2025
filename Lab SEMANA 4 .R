# - Pruebas de t 
# - María Ramírez 
# - 1965814

# Pruebas de t muestras dependientes 

# Revisar la producción del kg semillla para el año 2013 y 2014

prod <- read.csv("produccion1.csv", header = T)
View(prod)
prod$Tiempo <- as.factor(prod$Tiempo)

boxplot(prod$Kgsem  ~ prod$Tiempo, xlab = "Tiempo de producción", 
        ylab = "Producción de semilla (Kg)",
        main = "Producción de semilla 2012 vs 2013", col = "navajowhite")
tapply(prod$Kgsem, prod$Tiempo, mean)
tapply(prod$Kgsem, prod$Tiempo, var)
10.1066 - 10.8954

# Subconjunto para la preuba de t con paired 
t2012 <-  subset(prod$Kgsem, prod$Tiempo == "T2012")
t2013 <-  subset(prod$Kgsem, prod$Tiempo == "T2013")


# H0 = La media de la producción de semilla del año 2012 es igual a la media
# de la producción del año 2013. 
# H1 = La media de la producción de de semilla del  año 2012 es diferente a 
# la media deproducción del año 2013.
# Metodo alternativo two.sided

# H0D = La media del 2012 es menor que 2023 
# H1D = Las medias de ambos años son diferentes a cero. 

# Prueba de t 
var.test(prod$Kgsem ~ prod$Tiempo)

t.test(prod$Kgsem ~ prod$Tiempo, alternative = "two.sided", 
       var.equal = T)

t.test(t2012, t2013, alternative = "less", var.equal = T, paired = T)





