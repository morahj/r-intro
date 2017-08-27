# File: Intro-R_06_prHipoProp.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Pruebas de hipótesis para proporciones.

# PRUEBA PARA PROPORCIONES SIMPLE (1 GRUPO) #####

# Contexto del problema:
# Se preguntó a un grupo aleatorio de 264 estudiantes si les gustaba tener clase los viernes a las 5 pm. De estos, 161 respondieron afirmativamente. Use una significancia de 0.05 para determinar si este resultado es significativamente mayor al 55%.

# Ejecución de la prueba de proporciones
prop.test(161, 264, # Casos de "éxito", y casos totales.
          p = .55, # Proporción de la hipótesis  nula.
          alternative = "greater", # Hipótesis alterna.
          conf.level = .95 # Nivel de confianza
          ) 

# PRUEBA PARA COMPARAR PROPORCIONES #####

# Contexto del problema:
# Se realizó el mismo sondeo a estudiantes de otra universidad sobre su opinión sobre ver clases los viernes a las 5 pm. Los resultados de estos están en el set de datos. Use una significancia de 0.01 para determinar si la proporción es similar entre ambos grupos.

# Obtener datos de internet
dataWeb <- RCurl::getURL("https://raw.githubusercontent.com/morahj/r-intro/master/datasets/estudiantes_prop.csv") # Descarga los datos de internet.
estudiantesProp <- read.csv(text = dataWeb, header = TRUE) # Guarda los datos de las observaciones en un set de datos.
rm(dataWeb) # Elimina objeto dataWeb del espacio de trabajo.
row.names(estudiantesProp) <- estudiantesProp[,1] # Asigna identificadores a cada observación.
estudiantesProp <- select(estudiantesProp, SiNo) # Elimina la columna/variable de números 1:25.
# Convertir set de datos un tabla de frecuencias
estudTable <- table(estudiantesProp)
estudTable # Ver tabla de frecuencias creada.

# Ejecución de la prueba de proporciones 
prop.test(c(161, 100), # Casos de éxito de ambos grupos, ingresados como vector.
          c(264, 289), # Casos totales de ambos grupos, ingresados como vector.
          conf.level = .99 # Nivel de confianza.
          ) # La hipótesis nula corresponde a que la proporción sea igual entre ambos grupos.
