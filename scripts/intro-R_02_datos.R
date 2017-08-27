# File: Intro-R_02_datos.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Importar bases de datos a R y manejo básico de variables.

# Instalar paquete "pacman". Activa paquetes necesarios, y los instala automáticamente si no están instalados.
install.packages("pacman") # Descarga e instala el paquete.

# Instalar/activar paquete "dplyr". Es útil para manejar variables y observaciones de sets de datos.
# Instalar/activar paquete "RCurl" para descargar archivos desde internet.
pacman::p_load(dplyr, RCurl)

## IMPORTAR DATOS DESDE LA WEB #####

# Descargar archivo de base de datos desde internet
dataWeb <- getURL("https://raw.githubusercontent.com/morahj/r-intro/master/datasets/af_adol_short3.csv") # Descarga los datos "crudos" desde internet y los almacena en variable dataWeb.
data1 <- read.csv(text = dataWeb, header = TRUE, na = c(".", "")) # Lee y convierte los datos descargados de dataWeb en un set de datos de R (data frame).
rm(dataWeb) # Elimina la variable dataWeb del espacio de trabajo.

# Otras funciones para leer sets de datos en otros tipos de archivos
# Archivos de datos separados por comas (.csv)
data <- read.csv("datosR.txt") # Lee los datos del archivo que está guardado en el disco duro y los convierte en un set de datos de R (data frame).

# Archivos de datos separados por TAB (.txt o .tsv).
# data <- read.table("C:/documents/archivo.txt", header = TRUE, sep = "\t") # # Lee los datos del archivo que está guardado en el disco duro y los convierte en un set de datos de R (data frame).

# Archivos de Excel
# No se recomienda importar archivos guardados en este formato porque los datos pueden alterarse.
# data <- rio::import("C:/documents/archivo.xlsx") # Se necesita el paquete "rio".

# Mirar que se haya descargado correctamente el archivo
head(data1) # Muestra las primeras 6 observaciones del set de datos.
View(data1) # Ver el set de datos completo. ¡Cuidado! Si es demasiado grande puede bloquear el equipo.


# MANIPULACIÓN DEL SET DE DATOS #####

# Extraer observaciones específicas (filas), usando paquete dplyr
dataExtFem1 <- filter(data1, SEXO == 2) # Extrae todas las observaciones que complen el critero "SEXO == 2", y los guarda en dataExtFem.

# Extraer columnas de observaciones específicas
dataExtFem2 <- data1$AFEDAD[data1$AFDEPTO == "ANTIOQUIA" & data1$SEXO > 1] # Extrae, como un vector de datos, los datos correspondientes a la columna/variable edad, de las observaciones que cumplen la condición de departamento = Antioquia Y Sexo = 1.

# Extrae una submuestra aleatoria de observaciones, usando paquete dplyr
subMues1 <- sample_n(data1, 40, replace = TRUE) # Crea una submuestra de 40 observaciones, con reemplazamiento.

# Ordenar observaciones de forma ascendente con base a una variable
subMues1Ord <- arrange(subMues1, AFEDAD) # Ordena las observaciones de subMues1 de forma ascendente según la edad.
View(subMues1Ord)

# Ordenar observaciones de forma descendente con base a una variable
subMues1OrdDesc <- arrange(subMues1, desc(AFEDAD)) # Ordena las observaciones de subMues1 de forma descendente según la edad.
View(subMues1OrdDesc)

# Agregar una observación/fila al set de datos
subMues1 <- add_row(subMues1, AFDEPTO = "VICHADA", AFAREA = 1, AFEDAD = 16, SEXO = 1) # Agrega la fila al set de datos con los párametros especificados.


# Extraer variables específicas
dataEdad1 <- data1$AFEDAD # Extrae, en un vector de datos, todos los datos de la columna/variable AFEDAD.

# Extraer variables específicas, usando dplyr
dataEdadSexo <-  select(data1, AFEDAD, SEXO) # Extrae los datos correspondientes las columnas/variables AFEDAD y SEXO de todas las observaciones del set de datos.

# Agregar una nueva columna/variable al set de datos
# Se crearán dos variables que promedien las medidas de fuerza prensil ()
FPmeanD1 <- rowMeans(select(data1, FP_1D, FP_2D, FP_3D), na.rm = TRUE) # Crea un vector con los datos correspondientes al promedio de las 3 columnas dadas como parámetro. Corresponde a la fuerza prensil promedio de la mano derecha.
FPmeanI1 <- rowMeans(select(data1, FP_1I, FP_2I, FP_3I), na.rm = TRUE) # Crea un vector con los datos correspondientes al promedio de las 3 columnas dadas como parámetro. Corresponde a la fuerza prensil promedio de la mano izquierda

data2 <- mutate(data1, FPmeanD = FPmeanD1, FPmeanI = FPmeanI1) # Toma todas las observaciones y variables de data1, y les adiciona el vector creado anteriormente como una nueva columna/variable.

rm(FPmeanD1, FPmeanI1) # Borra variables que contienen los vectores de datos.

#Borrar objetos no necesarios ####
rm(dataEdad1, dataExtFem1, dataExtFem2, dataEdadSexo, subMues1, subMues1Ord, subMues1OrdDesc) # Eliminda del espacio de trabajo todos los objetos que no se usarán más.

# Desactivar paquetes que ya no se van a usar #####
p_unload(all) # Desactiva todos los paquetes. No realizar esta acción si se va a continuar trabajando en RStudio.