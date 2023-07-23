corridas <- read.csv("Registro de corridas 19-07 - Corridas.csv")

library(ggplot2)
library(tidyverse)
library(dbplyr)


corridas$Método <- trimws(corridas$Método)
corridas$Ganancia <- gsub("\\.", "", corridas$Ganancia)
corridas$Ganancia <- as.numeric(corridas$Ganancia)
corridas$Ganancia <- corridas$Ganancia * 10

corridas <- rename(corridas, Envios = Cantidad.de.Envios)

corridas$Método <- as.factor(corridas$Método)
corridas_5sem <- corridas %>% filter( Cantidad.de.semillas==5)

corridas_10sem <- corridas %>% filter( Cantidad.de.semillas==10)

aggregated_data <- aggregate(Ganancia ~ Envios + Método, data = corridas, FUN = function(x) max(x))

aggregated_data_5s <- aggregate(Ganancia ~ Envios + Método, data = corridas_5sem, FUN = function(x) max(x))

# Ordenar los resultados por la máxima cantidad promedio de ganancia de forma descendente
aggregated_data <- aggregated_data[order(-aggregated_data$Ganancia), ]




ggplot(corridas, aes(x = Envios, y = Ganancia, color = Método)) +
  geom_smooth(se = FALSE) +
  labs(x = "Envios", y = "Ganancia", title = "Comparación de ganancias s/ método utilizado") +
  scale_color_discrete(name = "Metodo") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE),
                     breaks = seq(0, 70000000, by = 5000000))+
  theme_bw()
-----
  ggplot(corridas_5sem, aes(x = Envios, y = Ganancia, color = Método)) +
  geom_smooth(se = FALSE) +
  labs(x = "Envios", y = "Ganancia", title = "Ganancias obtenidas en Kaggle s/ método utilizado para 5 semillas") +
  scale_color_discrete(name = "Metodo") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE),
                     breaks = seq(0, 70000000, by = 5000000))+
  theme_bw()
------
  ggplot(corridas_10sem, aes(x = Envios, y = Ganancia, color = Método)) +
  geom_smooth(se = FALSE) +
  labs(x = "Envios", y = "Ganancia", title = "Ganancias obtenidas en Kaggle s/ método utilizado para 10 semillas") +
  scale_color_discrete(name = "Metodo") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE),
                     breaks = seq(0, 55000000, by = 10000000))+
  theme_bw()
  