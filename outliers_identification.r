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

# Analizando la distribución de la variable Silicio

# Resumen de la variable Silicio
summary(Glass$Si)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 69.81   72.28   72.79   72.65   73.09   75.41

# Visualizamos distribución de la variable silicio
hist(Glass$Si, breaks = "sturges",
     main = "Gráfico N°4: Distribución de la variable Silicio",
     xlab = "Valores",
     ylab = "Cantidad",
     col="mistyrose",
     border="black")

# Analizando la distribución de la variable Potasio

# Resumen de la variable Potasio
summary(Glass$K)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.0000  0.1225  0.5550  0.4971  0.6100  6.2100

# Visualizamos distribución de la variable potasio
hist(Glass$K, breaks = "sturges",
     main = "Gráfico N°5: Distribución de la variable Potasio",
     xlab = "Valores",
     ylab = "Cantidad",
     col="mediumpurple1",
     border="black")

# Analizando la distribución de la variable Calcio

# Resumen de la variable Calcio
summary(Glass$Ca)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 5.430   8.240   8.600   8.957   9.172  16.190

# Visualizamos distribución de la variable calcio
hist(Glass$Ca, breaks = "sturges",
     main = "Gráfico N° 6: Distribución de la variable Calcio",
     xlab = "Valores",
     ylab = "Cantidad",
     col="olivedrab1",
     border="black")

# Analizando la distribución de la variable Bario

# Resumen de la variable Bario
summary(Glass$Ba)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.000   0.000   0.000   0.175   0.000   3.150

# Visualizamos distribución de la variable Bario
hist(Glass$Ba, breaks = "sturges",
     main = "Gráfico N° 7: Distribución de la variable Bario",
     xlab = "Valores",
     ylab = "Cantidad",
     col="seagreen1",
     border="black")


# Analizando la distribución de la variable Hierro

# Resumen de la variable Hierro
summary(Glass$Fe)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00000 0.00000 0.00000 0.05701 0.10000 0.51000

# Visualizamos distribución de la variable Hierro
hist(Glass$Fe, breaks = "sturges",
     main = "Gráfico N° 8: Distribución de la variable Hierro",
     xlab = "Valores",
     ylab = "Cantidad",
     col="tomato",
     border="black")

# Creamos la función para identificar outliers
is_outlier <- function(x) {
  return(x < quantile(x, 0.25) - 1.5 * IQR(x) | x > quantile(x, 0.75) + 1.5 * IQR(x))
}

# Creamos las variables segmentados por tipo
p1 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Na), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Na)) +
  geom_boxplot(fill="plum") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p2 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Mg), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Mg)) +
  geom_boxplot(fill="springgreen") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p3 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Al), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Al)) +
  geom_boxplot(fill="wheat3") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p4 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Si), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Si)) +
  geom_boxplot(fill="mistyrose") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p5 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(K), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = K)) +
  geom_boxplot(fill="mediumpurple1") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p6 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Ca), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Ca)) +
  geom_boxplot(fill="olivedrab1") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p7 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Ba), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Ba)) +
  geom_boxplot(fill="seagreen1") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

p8 <- Glass %>%
  group_by(Type) %>%
  mutate(outlier = ifelse(is_outlier(Fe), RI, as.numeric(NA))) %>%
  ggplot(., aes(x = Type, y = Fe)) +
  geom_boxplot(fill="tomato") +
  geom_text(aes(label = outlier), na.rm = TRUE, hjust = -0.3) +
  theme_bw()

# Mostrando gráfico de análisis univariado de valores extremos por categoría
# Componentes quimicos: Na, Mg, Al, Si
library(ggpubr)
plot <- ggarrange(p1, p2, p3, p4, ncol = 2, nrow = 2)
plot <- annotate_figure(
  plot,
  top = text_grob("Análisis Univariado de Valores Extremos por categoria", size = 15))
plot

# Mostrando gráfico de análisis univariado de valores extremos por categoría
# Componentes quimicos: K, Ca, Ba, Fe
plot <- ggarrange(p5, p6,p7,p8, ncol = 2, nrow = 4)
plot <- annotate_figure(
  plot,
  top = text_grob("Análisis Univariado de Valores Extremos por categoria", size = 15))
plot