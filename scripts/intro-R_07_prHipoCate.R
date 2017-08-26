# File: Intro-R_07_prHipoCate.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Pruebas de hipótesis para variables categóricas. 

# INTERVALOS DE CONFIANZA CON CHI-CUADRADO #####

# Contexto del problema:
# Al tomar una muestra aleatoria de 15 pacientes de un tratamiento se encontró que la reducción de peso tuvo en adultos un promedio de 5kg con una desviación de 0.8 Kg.

# Construcicón del Intervalo de confianza del 95% para la desviación estándar

# Valores de chi-cuadrado para el intervalo
e1b_chiIzq <- qchisq(.025, (14)) # Chi-cuadrado para la cola izquierda.
e1b_chiDer <- qchisq(.975, (14)) # Chi-cuadrado para la cola derecha.

# Límites del intervalo de confianza
e1b_limSup <- sqrt( (14 * (.8 ^ 2) / e1b_chiIzq)) # Límite superior.
e1b_limInf <- sqrt( (14 * (.8 ^ 2) / e1b_chiDer)) # Límite inferior.

e1b_ic <- c(e1b_limInf, e1b_limSup) # Asignación de límites del IC a una variable.
e1b_ic # Intervalo de confianza de la varianza.

rm(e1b_chiIzq, e1b_chiDer, e1b_limSup, e1b_limInf, e1b_ic) # Borra los objetos creados para el ejercicio.


# PRUEBA DE HIPÓTESIS PARA LA DESVIACIÓN ESTANDAR #####

# Contexto del problema:
# Según un reporte, la desviación estándar de los tiempos de permanencia de un medicamento en la sangre es 8.5 horas. Suponga que estos tiempos de permanencia se distribuyen normal. Al tomar una muestra aleatoria de 10 tiempos, se encontró una desviación de 10.2 horas. Use una significancia de 0.01 para determinar si está frente a evidencia que permita afirmar que la desviación de los tiempos de permanencia del medicamento en la sangre es significativamente mayores de lo que afirma el reporte.

# Valores de chi-cuadrado
e2_chiNull <- qchisq(.99, 9) # Valor de chi-cuadrado para la zona crítica.
e2_chi <- (9 * (10.2 ^ 2) / (8.5 ^ 2)) # Valor de chi-cuadrado de prueba usando la fórmula.

e2_chiNull # Chi-cuadrado de zona crítica.
e2_chi # Chi-cuadrado de prueba.

rm(e2_chiNull, e2_chi) # Borra los objetos creados para el ejercicio.

# PRUEBA DE BONDAD DE AJUSTE #####

# Contexto del problema:
# Un estudio afirma que en universidades de Bogotá, el 40% de los estudiantes es de Bogotá, 30% de los de Medellín, 20% de Cali y 10% de otras ciudades. Al consultar a una muestra aleatoria de 500 personas en cada ciudad se obtuvo el siguiente número de personas con estudios universitarios: Bogota: 250; Medellín: 170; Cali: 50; Otra ciudad: 30. Use una significancia del 2.5% para determinar si la evidencia encontrada reafirma o no la conclusión del estudio.

# Ingreso de los datos del ejercicio
e3_tablaObs <- matrix(c(250, 170, 50, 30), ncol = 4) # Tabla de valores observados.
colnames(e3_tablaObs) = c("Bogota", "Medellin", "Cali", "Otra") # Nombre para las columnas de la tabla.
e3_tablaObs # Visualizar tabla de valores observados.

e3_tablaEsp <- c(.4, .3, .2, .1) # Valores esperados según enunciado del ejercicio.

# Estadísticos chi-cuadrado
e3_chiNull <- qchisq(.975, 3) # Chi-cuadrado de zona crítica.

# Prueba de chi-cuadrado para bondan de ajuste entre "tabla3" y "tabla3_esperados".
e3_chi <- chisq.test(e3_tablaObs, # Tabla con los valores observados.
                     p = e3_tablaEsp # Tabla con los valores esperados.
                     ) 

e3_chi # Chi-cuadrado de prueba.
e3_chiNull # Chi-cuadrado de zona crítica.


rm(e3_tablaObs, e3_tablaEsp, e3_chiNull, e3_chi) # Borra los objetos creados para el ejercicio.


# PRUEBA DE INDEPENDENCIA #####

# Contexto del problema:
# En un experimento para estudiar la relación entre la hipertensión y los hábitos de fumar se tomaron los datos de 180 personas.
# Pruebe la hipótesis de que la presencia o ausencia de la hipertensión es independiente de los hábitos de fumar. Utilice un nivel de significancia del 5%. Plantee hipótesis nula y alterna adecuadas.

# Ingreso de los datos del ejercicio
e4_tabla <- matrix(c(27, 42, 36, 26, 30, 19), ncol = 3) # Tabla con los valores observados, en 3 columnas.
colnames(e4_tabla) = c("No_fuma", "Fumador_moderado", "Fumador_empedernido") # Nombres para las columnas.
rownames(e4_tabla) = c("Con_hipertesion", "Sin_hipertencion") # Nombres para las filas.
e4_tabla # Visualizar tabla completa.

# Estadísticos chi-cuadrado 
e4_chiNull <- qchisq(.95, 2) # Valor chi-cuadrado de zona crítica.

# Prueba de chi-cuadrado de "tabla4"
e4_chi <- chisq.test(e4_tabla) # Chi-cuadrado de prueba.

e4_chi # Chi-cuadrado de prueba.
e4_chiNull # Chi-cuadrado de zona crítica.


rm(e4_tabla, e4_chiNull, e4_chi) # Borra los objetos creados para el ejercicio.