# File: Intro-R_04_descrip.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Estadísticos descriptivos.

# Funciones individuales
mean(data2$AFEDAD) # Promedio aritmético.
sd(data2$AFEDAD) # Desviación estándar.
IQR(data2$AFEDAD) # Rango intercuartil.

# Función "summary"
summary(data2$AFEDAD) # Calcula la media, el valor mínimo, el valor máximo, los 1er y 3er quartiles, y la mediana.
summary(data2) # Calcula los estadísticos descriptivos para todo el set de datos.

# Función alternativa del paquete "psych"
pacman::p_load(psych) # Activa el paquete "psych".

describe(data2$AFEDAD) # Arroja estadísticos descriptivos más completos.
