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
