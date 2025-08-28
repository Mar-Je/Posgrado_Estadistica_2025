# Script 4 
# 28/08/5
# Maria Ramirez


# Importar ----------------------------------------------------------------

calidad <- read.csv("calidad_plantulas.csv", header = T)

# Crear factor 
calidad$Tratamiento <- as.factor(calidad$Tratamiento)
class(calidad$Tratamiento)
summary(calidad)

# Media de Indice de esbeltez 
mean(calidad$IE)

# Calculo de media, desviación estandar y variancia de IE Y T
tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

# Craer objeto colores 
colores <- c("navajowhite", "skyblue")

# Boxplot con datdos de Indice de esbeltez y Tratamiento
boxplot(calidad$IE~ calidad$Tratamiento)

# Boxplot de Datos de Vivero (IE y T)
boxplot(calidad$IE~ calidad$Tratamiento, col = colores, 
        main = "Calidad de plantula", xlab = "Tratamiento", 
        ylab = "Indice de esbeltez", ylim = c(0.4,1.2))

# Aplicar un subconjunto para cada tratamiento 

df_ctrl <- subset(calidad$IE, calidad$Tratamiento == "Ctrl")
df_ctrl <- subset(calidad, Tratamiento == "Ctrl")
df_fer <- subset(calidad, Tratamiento != "Ctrl")


# Grafico de normalidad 

par(mfrow=c(1,2)) # para ver graficos juntos 
qqnorm(df_ctrl$IE); qqline(df_ctrl$IE)
qqnorm(df_fer$IE); qqline(df_fer$IE)
par(mfrow=c(1,1)) # Volver a ver solo una grafica 



# Prueba de normalidad (Shapiro)

shapiro.test(df_ctrl$IE)

shapiro.test(df_fer$IE)



# Reavisar homogeneidad 

var.test(calidad$IE ~ calidad$Tratamiento)



# Saber si la media que se esta comparando es 0, se elige la de dos colas 

t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", 
       var.equal = T) # Prueba de dos colas (varianzas iguales)

t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", 
       var.equal = F) # Prueba de Welch (varianzas difrerentes)

t.test(calidad$IE ~ calidad$Tratamiento, alternative = "greater", 
       var.equal = T)


# Medir efecto 

cohens_efecto <- function(x, y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x);     s2 <- sd(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 -2))
  (mean(x) - mean(y)) / sp
}

d1_cal <- cohens_efecto(df_ctrl$IE, df_fer$IE)
d1_cal         
# Redondeo 
round(d1_cal, 2)

