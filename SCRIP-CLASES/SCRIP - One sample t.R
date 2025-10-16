# Comparativa de una muetsra 
# Solo se utilizo la especie setosa

setosa  <- subset(iris, Species == "setosa")
mean(setosa$Sepal.Width)

# mu = 3.9, esto es un amedia teoretica 

# H0 = La diferencia entre las medias es cero o menor a cero = Igual a 3.9 
# H1 = La diferencia entre media teorética y experimental, es difrente a cero o 
# debe ser diferente a 3.9 

t.test(setosa$Sepal.Width, mu = 3.9)


