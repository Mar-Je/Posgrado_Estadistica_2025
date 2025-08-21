# Maria Ramirez 
# 21/08/25
# Semana 3 

# Importar datos ----------------------------------------------------------

temperatura <- read.csv("C:/Repositorio/Posgrado_Estadistica_2025/temperatura.csv")

#Inspeccionar mi objeto temperatura 
head(temperatura) # Primeras 6 filas
dim(temperatura) # Numero de filas y columnas 
names(temperatura) # Nombres de las columnas 
str(temperatura) # Estructura del data frame 

summary(temperatura) # Resumen estadistico

names(temperatura) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul",
                        "Ago", "Sep", "Oct", "Nov", "Dic") 

# Corregir nombre de la columna

temperatura$media_anual <- rowMeans(temperatura[,2:13])
head(temperatura)

write.csv(temperatura,"temp_final.cvs") # Para guardar en formato cvs

# Crear objetos de temperatura y colores para boxplot
temp <- temperatura[,2:13] # Se seleccionaron las filas de los años
temp10 <- temperatura[11:21, 2:13]
temperatura[2,2]
colores <- c("linen", "tan1","wheat1" )

# Crear un boxplot con las temperaturas del 2010 al 2020
boxplot(temp10, col = "green", 
        main = "Comportamiento temperatura (2010 - 2020)", 
        xlab = "Meses", ylab = "Temperatura (C)")

# Crear un boxplot con las temperatura del 2000 al 2020
boxplot(temp, col = colores, 
        main = "Comportamiento temperatura (2000 - 2020)", 
        xlab = "Meses", ylab = "Temperatura (C)")


# Importar datos web ------------------------------------------------------

#Importar datos de web
url <- "https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv" 

# Acomodar el url por la extension 
url2 <- paste0("https://repodatos.atdt.gob.mx/api_update/senasica/",
                "actividades_inspeccion_movilizacion/29_actividades-",
                "inspeccion-movilizacion.csv")

# Ver tabla en cvs 
senasica <- read.csv(url, header = T) 

senasica2 <- read.csv(url2, header = T)
head(senasica2[, c(1,3:12)])
