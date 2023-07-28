library(dplyr)
library(readr)
mi_dataset <- read_delim("bolog7510.txt", 
                        delim = "\t", escape_double = FALSE, 
                        trim_ws = TRUE)

#-----------------------------------------------------------------------------------------------------------------------

mi_dataset <- mi_dataset %>% arrange(desc(ganancia))%>% mutate(posicion = row_number())

# Ganancia más alta obtenida
max <- max(mi_dataset$ganancia)
# Ganancia mínima obtenida 
min <- min(mi_dataset$ganancia)

#-----------------------------------------------------------------------------------------------------------------------

# Calcular la media de cada parámetro
media_learning_rate <- mean(mi_dataset$learning_rate)
media_feature_fraction <- mean(mi_dataset$feature_fraction)
media_num_leaves <- mean(mi_dataset$num_leaves)
media_min_data_in_leaf <- mean(mi_dataset$min_data_in_leaf)

# Definir la tolerancia para la comparación (por ejemplo, 0.01 para una tolerancia del 1%)
tolerancia <- 0.01

# Buscar las filas que contienen valores aproximados a la media de cada parámetro
fila_media_learning_rate <- which(near(mi_dataset$learning_rate, media_learning_rate, tol = tolerancia))
fila_media_feature_fraction <- which(near(mi_dataset$feature_fraction, media_feature_fraction, tol = tolerancia))
fila_media_num_leaves <- which(near(mi_dataset$num_leaves, media_num_leaves, tol = 14))
fila_media_min_data_in_leaf <- which(near(mi_dataset$min_data_in_leaf, media_min_data_in_leaf, tol = 31))

# Imprimir los resultados
print(paste("Fila con valor aproximado a la media de learning_rate:", fila_media_learning_rate))
print(paste("Fila con valor aproximado a la media de feature_fraction:", fila_media_feature_fraction))
print(paste("Fila con valor aproximado a la media de num_leaves:", fila_media_num_leaves))
print(paste("Fila con valor aproximado a la media de min_data_in_leaf:", fila_media_min_data_in_leaf))
#------------------------------------------------------------------------------

library(ggplot2)

# Gráfico de dispersión para ver la ganancia en función de learning_rate y feature_fraction
ggplot(mi_dataset, aes(x = learning_rate, y = ganancia)) +
  geom_point() +
  labs(title = "Ganancia en función de learning_rate",
       y = "Ganancia",
       x = "Learning Rate",
       color = "Ganancia")
--------------------
  # Gráfico de dispersión para ver la ganancia en función de feature_fraction
  ggplot(mi_dataset, aes(x = feature_fraction, y = ganancia)) +
  geom_point() +
  labs(title = "Ganancia en función de feature_fraction",
       y = "Ganancia",
       x = "feature_fraction",
       color = "Ganancia")

------------
  # Gráfico de dispersión para ver la ganancia en función de num_leaves
  ggplot(mi_dataset, aes(x = num_leaves, y = ganancia)) +
  geom_point() +
  labs(title = "Ganancia en función de num_leaves",
       y = "Ganancia",
       x = "num_leaves",
       color = "Ganancia")

------------
  # Gráfico de dispersión para ver la ganancia en función de min_data_in_leaf
  ggplot(mi_dataset, aes(x = min_data_in_leaf, y = ganancia)) +
  geom_point() +
  labs(title = "Ganancia en función de min_data_in_leaf",
       y = "Ganancia",
       x = "min_data_in_leaf",
       color = "Ganancia")
-----------
  
  








# Gráfico de contorno para ver la ganancia en función de num_leaves y min_data_in_leaf
ggplot(mi_dataset, aes(x = num_leaves, y = min_data_in_leaf, z = ganancia)) +
  geom_contour() +
  labs(title = "Ganancia en función de num_leaves y min_data_in_leaf",
       x = "Num Leaves",
       y = "Min Data in Leaf",
       z = "Ganancia")

