# Análisis univariado a las variables de componentes químicos: Na, Mg, Al, Si, K, Ca, Ba, Fe 
# Paquetes utilizados
# install.packages("mlbench", "ggpubr")
library(mlbench)

# Cargamos la base de datos Glass en memoria.
data(Glass)

# Mostramos primeros 6 registros de la base de datos
head(Glass)

# RI    Na   Mg   Al    Si    K   Ca Ba   Fe Type
# 1 1.52101 13.64 4.49 1.10 71.78 0.06 8.75  0 0.00    1
# 2 1.51761 13.89 3.60 1.36 72.73 0.48 7.83  0 0.00    1
# 3 1.51618 13.53 3.55 1.54 72.99 0.39 7.78  0 0.00    1
# 4 1.51766 13.21 3.69 1.29 72.61 0.57 8.22  0 0.00    1
# 5 1.51742 13.27 3.62 1.24 73.08 0.55 8.07  0 0.00    1
# 6 1.51596 12.79 3.61 1.62 72.97 0.64 8.07  0 0.26    1

# Mostramos estructura de la base de datos.
str(Glass)

# Resumen de las variables del data frame
summary(Glass)

# Analizando la distribución de la variable Sodio

# Resumen de la variable Sodio
summary(Glass$Na)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 10.73   12.91   13.30   13.41   13.82   17.38

# Visualizamos distribución de la variable sodio
hist(Glass$Na, breaks = "sturges",
     main = "Gráfico N°1: Distribución de la variable sodio",
     xlab = "Valores",
     ylab = "Cantidad",
     col="plum", 
     border="black"
)

# Analizando la distribución de la variable Magnesio

# Resumen de la variable magnesio
summary(Glass$Mg)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.000   2.115   3.480   2.685   3.600   4.490 

# Visualizamos distribución de la variable Magnesio
hist(Glass$Mg, breaks = "sturges",
     main = "Gráfico N° 2: Distribución de la variable Magnesio",
     xlab = "Valores",
     ylab = "Cantidad",
     col="springgreen",
     border="black"
)

# Analizando la distribución de la variable aluminio

# Resumen de la variable aluminio
summary(Glass$Al)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.290   1.190   1.360   1.445   1.630   3.500

# Visualizamos distribución de la variable aluminio
hist(Glass$Al, breaks = "sturges",
     main = "Gráfico N° 3: Distribución de la variable Aluminio",
     xlab = "Valores",
     ylab = "Cantidad",
     col="wheat3",
     border="black")