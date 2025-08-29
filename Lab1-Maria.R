# Laboratorio 1 
# María Ramirez 
# 1965814
# 01/09/25


# Parte I R y Rstudio  ----------------------------------------------------

# Primer contacto con R 

# Gastos totales 
300+240+1527+400+1500+1833


# Se crearon objetos para almacenar los valores utilizados
celular <- 300
celular # Verificación del valor del objeto creado
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
5800*5*2

# Funciones 
abs(10)
abs(-4)
sqrt(9)
log(2)


# Revsión de como hacer comentarios en R.
# Este es un comentario 

# Prueba de R como calculadora 
2*9
4+5 #Este es un comentario de prueba

# R distingue entre las mayúsculas y minúsculas 
celular <- 300
Celular <--300
CELULAR <- 8000

celular+Celular
CELULAR-celular

# Para obtener ayuda con fucniones en R.
help(abs)
help(mean)
?mean
help.search("absolute")


# Autoevaluación ----------------------------------------------------------


# Creación de objeto 
gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)

gastos

barplot(gastos)

sort(gastos)

# Creación de grafico (Barplot)
barplot(sort(gastos))
sort(gastos, decreasing = TRUE)        
barplot(sort(gastos, decreasing = TRUE))

gastos_ordenador <- sort(gastos, decreasing = TRUE)
barplot(gastos_ordenador)
?name

# Cración de grafico con titulo y leyenda. 
names(gastos_ordenador) <- c("Otros","Comestibles", "Alquiler", "Gimnasio",
                             "Celular","Transporte")

barplot(gastos_ordenador, main = "Gastos mensuales", xlab = "Tipos de gastos", 
        ylab = "Cantidad", ylim = c(0, 2000), 
        names.arg = names(gastos_ordenador), col = "skyblue")
 


# Parte II Variables  -----------------------------------------------------

# Problema 1

# Identifique el tipo de variable (cualitativa o cuantitativa) para la lista 
# de preguntas de una encuesta aplicada a estudiantes universitarios en una 
# clase de estadística:
  
  # Nombre de estudiante. - Cualitativa
  # Fecha de nacimiento (p. Ej., 21/10/1995). - Cuantitativa 
  # Edad (en años). - Cuantitativa 
  # Dirección de casa (por ejemplo, 1234 Ave. Alamo). - Cualitativa 
  # Número de teléfono (por ejemplo, 510-123-4567).-  CUalitativa 
  # Área principal de estudio. - Cualitativa 
  # Grado de año universitario: primer año, segundo año, tercer año, último año.
  # - Cualitativa 
  # Puntaje en la prueba de mitad de período (basado en 100 puntos posibles).
  # - Cuantitativa 
  # Calificación general: A, B, C, D, F. - Cualitativa 
  # Tiempo (en minutos) para completar la prueba final de MCF 202.- Cuantitativa 
  # Numero de hermanos.- Cuantitativa 

# Problema 2 

# Elija un objeto (cualquier objeto, por ejemplo, animales, plantas, países, 
# instituciones, etc.) y obtenga una lista de 14 variables: 7 cuantitativas
# y 7 categóricas.

variables <- data.frame(Variables = c("Población total","PIB per capita",
    "Superficie territorial","Esperanza vida","Tasa alfabetización",
    "Num. aeropuertos","Consumo energía","Nombre país", "Continente",
    "Sistema gobierno","Idioma oficial","Nivel desarrollo",
    "Religion mayoritaría","Membresia organismos"),Tipo = c(
      rep("Cuantitativa", 7),rep("Cualitativa", 7)))

print(variables)


# Problema 3 

# Considere una variable con valores numéricos que describen formas electrónicas 
# de expresar opiniones personales: 1 = Twitter; 2 = correo electrónico;
# 3 = mensaje de texto; 4 = Facebook; 5 = blog. ¿Es esta una variable 
# cuantitativa o cualitativa? Explique.

# Respuesta: Es una variable cualitativa dado que representa 
# distintos medios electrónicos de comunicación como categorías esto, sin orden 
# numérico real, aunque se hayan codificado con números para simplificar 
# su registro.


# Problema 4 

# Para cada pregunta de investigación, (1) identifique a los individuos de 
# interés (el grupo o grupos que se están estudiando), (2) identifique la (s),
# datos y (3) determine si cada variable es categórico o cuantitativo variable 
# (s) (la característica sobre la que recopilaríamos).                                                                                                                                             

# 1. ¿Cuál es la cantidad promedio de horas que los estudiantes de universidades 
# públicas trabajan cada semana?
# - Los individuos de interés son los estudiantes de unviversidades publicas.
# - Variable: Horas trabajadas por semana. 
# - Tipo de variables: Cuantitativa.


# 2. ¿Qué proporción de todos los estudiantes universitarios de México están 
# inscritos en una universidad pública?
# - Los individuos de interés son los Estudiantes universitarios de México. 
# - Variable: Tipo de universidad (pública o privada).
# - Tipo de variable: Cualitativa.


# 3. En los universidades públicas, ¿las estudiantes femeninas tienen un 
# promedio de CENEVAL más alto que los estudiantes varones?
# - Los indiduos de interes son los estudiantes de universidades públicas
#   en México 
# - Variable: Sexo (Femenino/masculino) y Puntaje de Ceneval. 
# - Tipo de vairable: Sexo (Cualitativa) y Puntaje (Cuantitativa).


# 4. ¿Es más probable que los atletas universitarios reciban asesoramiento 
# académico que los atletas no universitarios?
# - Individuos de interés son los Estudiantes universitatrios
# (atletas y no atletas).
# - Variable: Condición del atleta y Recepción de asesoramiento académico. 
# - Tipo de variable: Condición (Cualitativa) y Recepción (Cualitativa).


# 5. Si reuniéramos datos para responder a las preguntas de la investigación 
# anterior, ¿qué datos podrían analizarse mediante un histograma?
# ¿Cómo lo sabes?.
# - El histograma es utilizado para variables cuantitativas. 
# - De los datos anteriores, se pueden analizar: Las horas trabajadas por semana 
#   y el Puntaje de CENEVAL. 
# - Esto se debe a que un histograma representa la distribución de frecuencias
#   de datos númericos. 



       