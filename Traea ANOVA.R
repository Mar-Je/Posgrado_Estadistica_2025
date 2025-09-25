# María de Jesús Ramírez Navejar 
# Matricula: 1965814
# Fecha: 22-09-25

# Datos  ------------------------------------------------------------------

# Datos de concentración de estroncio (mg/ml)
estroncio <- data.frame(
  Sitio = rep(c("Graysons_Pond", "Beaver_Lake", "Anglers_Cove",
                "Appletree_Lake", "Rock_River"), each = 6),
  Valor = c(
    28.2, 33.2, 36.4, 34.6, 29.1, 31.0,  # Grayson's Pond
    39.6, 40.8, 37.9, 37.1, 43.6, 42.4,  # Beaver Lake
    46.3, 42.1, 43.5, 48.8, 43.7, 40.1,  # Angler's Cove
    41.0, 44.1, 46.4, 40.2, 38.6, 36.3,  # Appletree Lake
    56.3, 54.1, 59.4, 62.7, 60.0, 57.3   # Rock River
  )
)

# Ver los primeros registros
head(estroncio)


# Gráfico de violín para comparar concentraciones por sitio

library(ggplot2)

ggplot(estroncio, aes(x = Sitio, y = Valor, fill = Sitio)) +
  geom_violin(trim = FALSE, alpha = 0.6) +   # Forma del violín
  geom_boxplot(width = 0.1, color = "black", alpha = 0.8) + # Caja dentro
  labs(title = "Concentración de estroncio en cuerpos de agua",
       x = "Cuerpo de agua", 
       y = "Concentración (mg/ml)") +
  theme_minimal()



# Hipótesis  --------------------------------------------------------------

# H₀ (nula): No existen diferencias significativas en la concentración media de
# estroncio entre los cinco cuerpos de agua.

# H₁ (alternativa): Al menos un cuerpo de agua presenta una concentración 
# media significativamente diferente.


# Anova (Una vía) ---------------------------------------------------------

# ANOVA de una vía
modelo <- aov(Valor ~ Sitio, data = estroncio)

# Tabla de ANOVA
summary(modelo)


# Prubea LSD (Fisher) -----------------------------------------------------

# Extraer MSE y gl de la tabla ANOVA
anova_tab <- anova(modelo)
MSE <- anova_tab["Residuals", "Mean Sq"]
gl_error <- anova_tab["Residuals", "Df"]

# Número de réplicas por sitio
n <- 6

# Valor crítico t
t_crit <- qt(0.975, df = gl_error) # 0.975 porque es bilateral con alfa=0.05

# LSD
LSD <- t_crit * sqrt(2 * MSE / n)
LSD

# Comparación de medias 
# Medias por sitio
medias <- aggregate(Valor ~ Sitio, data = estroncio, mean)
medias

# Comparación par a par
comb <- combn(medias$Valor, 2)
diferencias <- abs(comb[1,] - comb[2,])
diferencias

# Ver si superan el LSD
diferencias > LSD


# Prueba de Tukey HSD -----------------------------------------------------

# Prueba Tukey HSD
tukey <- TukeyHSD(modelo)
tukey


# Interpretación de resultados  -------------------------------------------

# El análisis de varianza (ANOVA) aplicado a las concentraciones de estroncio
# en los cinco cuerpos de agua permitió evaluar si existen diferencias
# significativas entre ellos. Los resultados mostraron que la hipótesis 
# nula (H₀: todas las medias son iguales) se rechaza, lo que indica que al 
# menos uno de los sitios presenta una concentración promedio de estroncio
# significativamente distinta de los demás.

# Al analizar los valores medios, se observa que Rock River presentó las 
# concentraciones más elevadas, con valores consistentemente por encima de
# 54 mg/ml y alcanzando hasta 62.7 mg/ml. Este comportamiento contrasta
# claramente con Grayson’s Pond, que mostró las concentraciones más bajas 
# (en el rango de 28–36 mg/ml). Esto sugiere una separación marcada entre 
# estos dos cuerpos de agua, confirmada por las pruebas post-hoc.

# Las pruebas de comparaciones múltiples (LSD y Tukey HSD) mostraron que:
  
# - Rock River difiere significativamente de todos los demás sitios, 
# lo cual indica que este cuerpo de agua presenta condiciones particulares 
# que favorecen una acumulación mayor de estroncio.

# - Grayson’s Pond se ubicó en el extremo opuesto, con valores
# significativamente menores respecto al resto.

# Los cuerpos intermedios (Beaver Lake, Angler’s Cove y Appletree Lake) 
# no mostraron diferencias estadísticamente significativas entre sí, lo que
# implica que presentan condiciones similares en cuanto a la concentración
# de este elemento.

# El hecho de que Rock River presente las concentraciones más altas podría
# estar relacionado con una mayor exposición a fuentes de contaminación, 
# como descargas industriales, escorrentía agrícola o procesos geológicos 
# locales que incrementen la presencia natural del estroncio. Este exceso 
# podría representar riesgos tanto para la salud de los organismos acuáticos 
# como para los usuarios del agua, ya que concentraciones elevadas de estroncio
# pueden afectar procesos biológicos y la calidad general del ecosistema.

# Por otro lado, la baja concentración observada en Grayson’s Pond podría
# interpretarse como una condición más “natural” o menos impactada por 
# actividades humanas, aunque también podría deberse a características 
# fisicoquímicas del agua (pH, dureza, alcalinidad) que limitan la 
# solubilidad del estroncio.

# En conclusión, el análisis estadístico permitió identificar diferencias
# claras en la distribución espacial del estroncio entre los cuerpos de agua 
# evaluados. Esta información es crucial para orientar estrategias de monitoreo 
# ambiental, priorizar sitios de atención y diseñar planes de manejo que 
# busquen mitigar los riesgos asociados a la contaminación por elementos 
# traza en ecosistemas acuáticos.




