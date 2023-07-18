corridas <- read.csv("Registro de corridas - Corridas.csv")

library(ggplot2)
library(tidyverse)
library(dbplyr)


corridas$Método <- trimws(corridas$Método)
corridas$Ganancia <- gsub("\\.", "", corridas$Ganancia)
corridas$Ganancia <- as.numeric(corridas$Ganancia)
corridas <- rename(corridas, Envios = Cantidad.de.Envios)
corridas$Método <- as.factor(corridas$Método)
corridas_5sem <- corridas %>% filter( Cantidad.de.semillas==5)

corridas_10sem <- corridas %>% filter( Cantidad.de.semillas==10)

corridas %>%
  group_by(Método) %>% 
  summarise(avg = mean(Ganancia))





ggplot(corridas, aes(x = Envios, y = Ganancia, color = Método)) +
  geom_smooth() +
  labs(x = "Envios", y = "Ganancia", title = "Comparación de ganancias s/ método utilizado") +
  scale_color_discrete(name = "Metodo") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE),
                     breaks = seq(0, 5500000, by = 1000000))+
  theme_bw()
-----
  ggplot(corridas_5sem, aes(x = Envios, y = Ganancia, color = Método)) +
  geom_smooth() +
  labs(x = "Envios", y = "Ganancia", title = "Ganancias obtenidas en Kaggle s/ método utilizado para 5 semillas") +
  scale_color_discrete(name = "Metodo") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE),
                     breaks = seq(0, 5500000, by = 1000000))+
  theme_bw()
------
  ggplot(corridas_10sem, aes(x = Envios, y = Ganancia, color = Método)) +
  geom_smooth() +
  labs(x = "Envios", y = "Ganancia", title = "Ganancias obtenidas en Kaggle s/ método utilizado para 10 semillas") +
  scale_color_discrete(name = "Metodo") +
  scale_y_continuous(labels = function(x) format(x, scientific = FALSE),
                     breaks = seq(0, 5500000, by = 1000000))+
  theme_bw()
  