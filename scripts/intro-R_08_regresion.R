# File: Intro-R_08_regresion.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Regresión lineal y exponencial.

# MODELO DE REGRESIÓN LINEAR BIVARIADA #####
# Se usarán los datos de la fuerza prensil de los adolescentes (data2)
regLin <- lm(FPmeanI ~ FPmeanD, # Variable "FPmeanI" en función de la variable "FPmeanD".
           data = data2 # Set de datos donde se encuentran ambas variables.
           )

summary(regLin) # Ver los resultados de la regresión.
confint(regLin, level = .95) # Obtener intervalo de confianza del 95% para los coeficientes de la regresión.

# MODELO DE REGRESIÓN EXPONENCIAL #####

# Contexto del problema:
# En la tabla se encuentran los datos de las horas trabajadas dado el número de pacientes. Construya el modelo de regresión exponencial y muestre el valor de R2 (coeficiente de determinación).

# Importar datos
horasTrab <- read.csv("horas_trabajadas.csv") # Importa el archivo almacenado localmente.

# Graficar gatos
plot(horasTrab) # Gráfico de dispersión de las dos variables del set de datos.

# Ejecutar modelo de regresión exponencial
regExp <- lm(log(horasTrab$horasTrab) ~ horasTrab$Pacientes) # Variable de respuesta transformada (logaritmo natural) en función de la variable "horasTrab$Pacientes".

summary(regExp)
exp(regExp$coefficients) # Obtener coeficientes verdadedos aplicando la función exponencial.

