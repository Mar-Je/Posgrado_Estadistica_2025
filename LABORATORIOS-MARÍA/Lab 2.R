# Laboratorio 1 -----------------------------------------------------------
# María de Jesús Ramírez Navejar 
# 1965814

# cargar Base de datos Iris ------------------------------------------------------
data("iris")
View(iris)

# Explorar las primeras filas
head(iris)

# Resumen general de la base
summary(iris)

# Nombres de las variables
names(iris)


# Seleccionar especies ----------------------------------------------------

# Filtrar solo versicolor y virginica
data_sub <- subset(iris, Species %in% c("versicolor", "virginica"))

# Comprobar el subconjunto
table(data_sub$Species)
head(data_sub)


# Estadística descriptiva  ------------------------------------------------

# Calcular descriptivos de Petal.Length por especie
tapply(data_sub$Petal.Length, data_sub$Species, summary)

# Promedios por especie
aggregate(Petal.Length ~ Species, data=data_sub, mean)

# Desviación estándar por especie
aggregate(Petal.Length ~ Species, data=data_sub, sd)


# Plantamiento de hipótesis -----------------------------------------------

# Pregunta de investigación: ¿Existe diferencia significativa en la longitud del 
# pétalo entre versicolor y virginica?
  
# Hipótesis:
  
# Hn: μ₁ = μ₂ (no hay diferencia en las medias de Petal.Length)

# H₁: μ₁ ≠ μ₂ (sí hay diferencia en las medias de Petal.Length)


# Pureba de t sutudent ----------------------------------------------------

# Prueba de normalidad (Shapiro)

shapiro.test(data_sub$Petal.Length)


# Prueba de homogeneidad de varianzas (F-test)
var.test(Petal.Length ~ Species, data=data_sub)


# Para varianzas NO son iguales usamos Welch
t.test(Petal.Length ~ Species, data=data_sub, var.equal = FALSE)

# Si varianzas iguales:
t.test(Petal.Length ~ Species, data=data_sub, var.equal = TRUE)


# Efecto ------------------------------------------------------------------

# Extraer los datos por especie

versicolor <- subset(data_sub, Species=="versicolor")$Petal.Length
virginica  <- subset(data_sub, Species=="virginica")$Petal.Length

# Tamaños de muestra
n1 <- length(versicolor)
n2 <- length(virginica)

# Medias
m1 <- mean(versicolor)
m2 <- mean(virginica)

# Desviaciones estándar
s1 <- sd(versicolor)
s2 <- sd(virginica)

# Desviación combinada (pooled)
s_pooled <- sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2))

# Cohen's d
d <- (m1 - m2) / s_pooled
d


# Grafíco comparativo  ----------------------------------------------------


boxplot(Petal.Length ~ Species, data=data_sub,
        col=c("navajowhite","pink"),
        main="Comparación del largo de pétalo entre especies",
        ylab="Largo del pétalo (cm)", xlab = "Especie")

# Interpretación de resultados --------------------------------------------

# En este análisis se comparó la longitud del pétalo (Petal.Length) entre Iris 
# versicolor e Iris virginica. Los descriptivos iniciales mostraron que 
# versicolor presentó una media de aproximadamente 4.26 cm, mientras que 
# virginica alcanzó cerca de 5.55 cm, lo que sugiere una diferencia evidente 
# entre ambas especies.

# La prueba de normalidad de Shapiro-Wilk indicó cierta desviación de 
# la normalidad; sin embargo, debido al tamaño de muestra balanceado, la prueba 
# t se considera adecuada. La prueba F de homogeneidad de varianzas arrojó 
# un valor-p ≈ 0.26, lo que permitió asumir igualdad de varianzas y aplicar
# la prueba t de Student para dos muestras independientes.

# El resultado de la prueba t fue altamente significativo 
# (t ≈ -12.6, gl ≈ 98, p < 0.001), confirmando que existe una diferencia
# en la longitud promedio de los pétalos, rechazando la hipotesis nula planteada.
# Además, el tamaño del efecto obtenido (Cohen’s d ≈ 2.5) 
# indica un efecto muy grande, lo que refleja una diferencia 
# biológicamente relevante.

# En conclusión, los pétalos de Iris virginica son significativamente más 
# largos que los de Iris versicolor, y esta característica constituye un rasgo 
# morfológico confiable para diferenciar ambas especies.

