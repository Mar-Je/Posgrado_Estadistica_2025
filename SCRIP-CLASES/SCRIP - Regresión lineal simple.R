# Ejercico 1 
# María Ramírez 
# 25/09/25


# Datos  ------------------------------------------------------------------

datos <- data.frame(trigo = c(30,28,32,25,25,25,22,24,35,40),
                    harina = c(25,30,27,40,42,40,50,45,30,25))


# Inicio de  formula  -----------------------------------------------------

sumxi_yi<-sum(datos$trigo*datos$harina)
30*25
28*30

# segunda parte 
nxy <- length(datos$trigo)*mean(datos$trigo)*mean(datos$harina)
sumxi_yi-nxy


xi2<- sum(datos$trigo^2)
nx2 <- length(datos$trigo)*mean(datos$trigo)^2


# Parte dos de la formula --------------------------------------------------

# Beta 1 
b1 <- (sumxi_yi - nxy)/(xi2-nx2)
b1

# Beta 0
b0 <- mean(datos$harina)- b1*mean(datos$trigo)
b0
fit.lm$model
fit.lm$coefficients
fit.lm$residuales
mean(fit.lm$residuals)

# añadir datos 
datos$yprima <- 74.11 - 1.3536*datos$trigo
datos$recta <- fit.lm$fitted.values

datos$prima <- b0 + b1 * datos$trigo

datos$residuales <- datos$harina-datos$recta
sum(datos$residuales^2)
SSE <- sum(datos$residuales^2)
SSE/8
sqrt(SSE/8)

# Revisión datos (reisdulaes -coeficientes)
fit.lm <- lm(datos$harina~ datos$trigo)
summary(fit.lm)

# comprobación de modelo ( si es significativo o no)
anova(fit.lm)


# Paquetes 

library(lmtest)

# datos 
x <- c(datos$trigo)
y <-  c(datos$harina)

m <-  lm(y ~ x )

bptest(m)
