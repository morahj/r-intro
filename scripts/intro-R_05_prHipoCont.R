# File: Intro-R_05_prHipoCont.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Pruebas de hipótesis para variables continuas. 

# Z-TEST #####
# Prueba de hipótesis para la media de la población

# Cargar paquete necesario para z-test.
pacman::p_load(BSDA) # Contiene una función z.test para pruebas de hipótesis usando la distribución Z.

# Obtener datos de internet
dataWeb <- getURL("https://raw.githubusercontent.com/morahj/r-intro/master/datasets/pregnant_days.csv") # Descarga los datos de internet.
pregnantDays <- read.csv(text = dataWeb, header = TRUE) # Guarda los datos de las observaciones en un set de datos.
rm(dataWeb) # Elimina objeto dataWeb del espacio de trabajo.
row.names(pregnantDays) <- pregnantDays[,1] # Asigna identificadores a cada observación.
pregnantDays <- select(pregnantDays, days) # Elimina la columna/variable de números 1:25.

# Contexto del problema:
# The length of human pregnancy is known to have a mean of 266 days and a standard deviation of 16 days. Based on records from a large women's hospital, a random sample of 210 women who were smoking and/or drinking alcohol during their pregnancy and their pregnancy lengths are recorded in the datafile linked below. Do the data provide enough evidence to support the (well-known) fact that women who smoke and/or drink alcohol during their pregnancy have shorter pregnancies than women in general (in other words, are more likely to have premature labor)?

# Ver histograma de la variable para evaluar normalidad en su distribución
hist(pregnantDays$days,
     freq = FALSE)
curve(dnorm(x, mean = mean(pregnantDays$days, na.rm = TRUE), sd = sd(pregnantDays$days, na.rm = TRUE)), 
      col = "darkred", 
      lwd = 2,
      add = TRUE) # Agregar curva al gráfico preexistente.

# Ejecución del Z-test para prueba de hipótesis de la media con respecto a la población
z.test(pregnantDays$days, mu = 266, sigma.x = 16, conf.level = .95, alternative = "less")

# T-TEST PARA UNA MUESTRA#####

# Obtener datos de internet
dataWeb <- getURL("https://raw.githubusercontent.com/morahj/r-intro/master/datasets/ninas_antrop.csv") # Descarga los datos de internet.
ninasAntrop <- read.csv(text = dataWeb, header = TRUE) # Guarda los datos de las observaciones en un set de datos.
rm(dataWeb) # Elimina objeto dataWeb del espacio de trabajo.
row.names(ninasAntrop) <- ninasAntrop[,1] # Asigna identificadores a cada observación.
ninasAntrop <- ninasAntrop[ ,-1] # Elimina la columna/variable de números 1:25.

# Prueba de hipótesis para una muestra usando el t-test.
# Contexto del problema:
# Suponga que la estatura media es de 105.5cm. Se tomó una muestra aleatoria de 25 niñas de cinco años de esta comunidad y se encontró una estatura media de 104.7cm. Use una significancia de 0.04 para determinar si está frente a evidencia experimental que nos permita afirmar que la estatura media de las niñas de 5 años de esa comunidad es significativamente mayor de lo que se afirma en la información de referencia.

# Ejecución del t-test para una muestra.
t.test(ninasAntrop$talla, alternative = "two.sided", conf.level = .96, mu = 105.5)


# Calculo del estadístico de la distribución t.
# Contexto: 
# Construya la estimación por intervalo de confianza del 98% para la estatura promedio de las niñas de 5 años de esta comunidad si en una muestra aleatoria de 20 niñas de cinco años de esta comunidad se encontró una estatura media de 105,4cm y una desviación estándar de 1.24cm.

t <- qt(.99, 19) # Estadístico t.
err <- t * 1.24 / sqrt(20) # Error estándar para el IC.
c(105.4 - err, 105.4 + err) # Intervalo de confianza del 98%.


# T-TEST PARA DIFERENCIAS DE MEDIAS (DOS MUESTRAS) #####

# Obtener datos de internet
dataWeb <- getURL("https://raw.githubusercontent.com/morahj/r-intro/master/datasets/trat_inr.csv") # Descarga los datos de internet.
tratINR <- read.csv(text = dataWeb, header = TRUE) # Guarda los datos de las observaciones en un set de datos.
rm(dataWeb) # Elimina objeto dataWeb del espacio de trabajo.
row.names(tratINR) <- tratINR[,1] # Asigna identificadores a cada observación.
tratINR <- tratINR[ ,-1] # Elimina la columna/variable de números 1:25.

# t-test para diferencia de datos Emparejados/Dependientes
# Contexto del problema:
# La tabla contiene los datos de los resultados obtenidos por una muestra aleatoria de pacientes, al someterse a un tratamiento para aumentar su valor de INR al corto plazo luego de haber encontrado mediciones muy bajas en las pruebas. Use una significancia de 0.04 para determinar si hubo diferencia en el valor del INR luego de recibir el tratamiento.

# Ejecución de la prueba t-test para diferencia de medias Emparejadas/Dependientes
t.test(tratINR$INR.despues, tratINR$INR.antes, paired = TRUE, conf.level = .96)


# t-test para diferencia de medias de grupos independientes
# Contexto del problema:
# Suponga que la tabla contiene los valores del INR de dos grupos de personas distintas, no relacionadas, que recibieron tratamientos diferentes para subir el nivel del INR. Use una significancia de 0.01 para determinar si hubo una diferencia mayor a 0.4 en el nivel de INR entre los grupos.

# Ejecución de la prueba t-test para diferencia de medias de datos independientes
t.test(tratINR$INR.despues, tratINR$INR.antes, conf.level = .95, mu = 0.4, alternative = "greater")