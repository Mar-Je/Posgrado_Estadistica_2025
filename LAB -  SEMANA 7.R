# María de Jesús Ramírez Navejar 
# Matricula: 1965814
# Fecha: 22-09-25


read.csv("crop.data.csv",header=T)
crop <-read.csv("crop.data.csv",header=T) 
View(crop)
crop$density <- as.factor(crop$density)
crop$block <- as.factor(crop$block)
crop$fertilizer <- as.factor(crop$fertilizer)
summary(crop)

boxplot(crop$yield~crop$fertilizer,
        xlab = "Fertilizantes",
        ylab = "Rendimiento(ton/ha")

tapply(crop$yield,crop$fertilizer,mean)
tapply(crop$yield,crop$fertilizer,var)


#aplicar prueva de normalidad 
#fertilizante usamdo subset y shapiro
shapiro.test(crop$yield)

shapiro.test(subset(crop$yield,crop$fertilizer =="1"))
shapiro.test(subset(crop$yield,crop$fertilizer =="2"))
shapiro.test(subset(crop$yield,crop$fertilizer =="3"))

#prueba de barlett sirve para datos de 3 tratamientos o medias que comparar
bartlett.test(crop$yield,crop$fertilizer)



#Anova funcion aov

crop.aov<-aov(crop$yield~crop$fertilizer)
summary(crop.aov)



#LSD determinar el valor 

qt(0.975,93)

sqrt((2*0.3859)/32)*qt(0.975,93)
tapply(crop$yield,crop$fertilizer,mean)
#primer diferencia de media f1vsf2 no hay dif
176.7570-176.9332

#primer diferencia de media f2vsf3 hay dif
176.9332-177.3562 

#primer diferencia de media f1vsf3 hay dif
176.7570-177.3562


# Prueba de tukey

sqrt((2*0.3859)/32)*qtukey(0.95, nmeans=3, df=93)

TukeyHSD(crop.aov)
plot(TukeyHSD(crop.aov))


install.packages("agricolae")
library(agricolae)
lsd <- LSD.test(crop.aov, "crop$fertilizer", p.adj = "none")
print(lsd)

library(ggplot2)
ggplot(crop, aes(x = fertilizer, y = yield, fill = fertilizer)) +
  geom_violin(trim = FALSE, alpha = 0.6) +
  geom_jitter(width = 0.1, alpha = 0.7) +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) 
theme_light()

