library(readr)
mi_dataset <- read_delim("bo.txt", 
                            delim = "\t", escape_double = FALSE, 
                            trim_ws = TRUE)


#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------

library(dplyr)

BO_gcia_descendente <- mi_dataset %>% arrange(desc(ganancia))

# Ganancia más alta obtenida

maximo <- max(BO_gcia_descendente$ganancia)
maximo

posicion_ranking <- which(BO_gcia_descendente$ganancia == maximo)
posicion_ranking

# Ganancia mínima obtenida 

minimo <- min(BO_gcia_descendente$ganancia)
minimo

posicion_ranking <- which(BO_gcia_descendente$ganancia == minimo)
posicion_ranking

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------

# Qué puesto ocupa la ganancia = 66.976.514

iteracion <- 16 # lo busco por N° de iteración dado que no reconoce la ganancia por los decimales, solución más simple

posicion_ranking <- which(BO_gcia_descendente$iteracion_bayesiana == 16)
posicion_ranking

# Resultado = 54, elijo éste por la cantidad de árboles

#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------

# Qué puesto ocupa la ganancia = 67.896.919

iteracion <- 8 # lo busco por N° de iteración dado que no reconoce la ganancia por los decimales, solución más simple

posicion_ranking <- which(BO_gcia_descendente$iteracion_bayesiana == 8)
posicion_ranking

# Resultado = 47 
# Cargamos el dataset o lo creamos si aún no está cargado
# mi_dataset <- read.csv("nombre_del_archivo.csv")  # Si los datos vienen desde un archivo CSV

# Supongamos que tienes el dataset cargado en una variable llamada mi_dataset

# Instala el paquete dplyr si aún no lo tienes instalado
# install.packages("dplyr")

# Cargar el paquete dplyr
library(dplyr)

# Supongamos que tienes el dataset cargado en una variable llamada mi_dataset

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
fila_media_num_leaves <- which(near(mi_dataset$num_leaves, media_num_leaves, tol = tolerancia))
fila_media_min_data_in_leaf <- which(near(mi_dataset$min_data_in_leaf, media_min_data_in_leaf, tol = tolerancia))

# Imprimir los resultados
print(paste("Fila con valor aproximado a la media de learning_rate:", fila_media_learning_rate))
print(paste("Fila con valor aproximado a la media de feature_fraction:", fila_media_feature_fraction))
print(paste("Fila con valor aproximado a la media de num_leaves:", fila_media_num_leaves))
print(paste("Fila con valor aproximado a la media de min_data_in_leaf:", fila_media_min_data_in_leaf))

