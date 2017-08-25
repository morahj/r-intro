# File: Intro-R_03_graficos.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Gráficos básicos: barras, histograma, de caja, dispersión.

# Activar paquetes necesarios
pacman::p_load(RColorBrewer) # RColorBrewer: paquete con paletas de colores para usar en gráficos.
display.brewer.all() # Muestra todas las paletas de colores disponibles.

# DIAGRAMA DE BARRAS #####
barplot(data2$horasTV) # No funciona. Se necesita una tabla de frecuencias para hacer gráfico de barras.
horasTV <- prop.table(table(data2$horasTV))*100 # Crea una tabla de frecuencias relativas de la variable horasTV.
barplot(horasTV,
        col = brewer.pal(5, "Set2"), # Paleta de colores y número de colores requeridos.
        border = NA, # Muestra las barras sin borde.
        ylim = c(0, 35), # Define los límites de eje y.
        main = "Horas de TV vistas al día", # Título del gráfico.
        xlab = "Horas de TV", # Título del eje x.
        ylab = "Número de adolescentes" # título del eje y.
        )

# HISTOGRAMA #####
hist(data2$FPmeanD, # Variable que se va a graficar.
     freq = FALSE, # Muestra la frecuecnia relativa en lugar de la absoluta.
     ylim = c(0, 0.05), # Límites del eje y.
     main = "Histograma de variable Fuerza Prensil Media \nMano derecha", # Título del gráfico
     xlab = "Fuerza Prensil (kg/m2)", # Título del eje x.
     col = "thistle1" # Color del gráfico.
     )

# Superpone una curva normal.
curve(dnorm(x, mean = mean(data2$FPmeanD, na.rm = TRUE), sd = sd(data2$FPmeanD, na.rm = TRUE)), 
      col = "thistle4", 
      lwd = 2,
      add = TRUE) # Agregar curva al gráfico preexistente.


# DIAGRAMA DE CAJA #####
# Diagrama de caja para una variable.
boxplot(data2$FPmeanD, # Variable a graficar.
        col = "thistle2", # Color para gráfico.
        boxwex = 0.5,  # Ancho de la caja como proporción del original.
        whisklty = 1,  # Tipo de la línea vertical "bigotes"; 1 = línea sólida.
        outpch = 16,  # Símbolo para outlier; 16 = circle relleno.
        outcol = "thistle4",  # Color para outliers
        main = "Fuerza Prensil Promedio de la mano derecha",
        xlab = "Fuerza Prensil (kg/m2)" # Título del eje x.
        )

# Diagramas de cajas simultáneos para categorías de una variable o para variables similares
boxplot(select(data2, FPmeanD, FPmeanI), # Variables a graficar. Pueden ser distintas categorías de una misma variable.
        col = "thistle2", # Color del gráfico.
        boxwex = 0.5,  # Ancho de la caja como proporción del original.
        whisklty = 1,  # Tipo de la línea vertical "bigotes"; 1 = línea sólida.
        outpch = 16,  # Símbolo para outlier; 16 = circle relleno.
        outcol = "thistle4",  # Color para outliers
        main = "Fuerza Prensil Promedio",
        xlab = "Fuerza Prensil (kg/m2)", # Título del eje x.
        names = (c("Mano derecha", "Mano Izquierda")) # Etiquetas para cada caja.
)

# DIAGRAMA DE DISPERSIÓN #####
# Diagrama de dispersión sencillo
plot(data2$FPmeanD, data2$FPmeanI, # Variables x, y, a graficar.
     pch = 19,         # Circulo sólido
     cex = 0.5,        # Reduce el tamaño al 50%.
     col = "#cc0000",  # Color
     main = "Fuerza prensil de la mano izquierda como función de la derecha",
     xlab = "Fuerza prensil mano derecha (kg/m2)",
     ylab = "Fuerza prensil mano izquierda (kg/m2)"
)

# Añadir línea de regresión
abline(lm(data2$FPmeanI ~ data2$FPmeanD), # Variable y como función de variable x.
       col = "darkred", 
       lwd = 2) # Ancho de la línea.

# Diagrama de dispersión para datos agrupados
# Activar paquete necesario 
pacman::p_load(car)
sp(data2$FPmeanI ~ data2$FPmeanD | SEXO,
   data = data2, 
   xlab = "Fuerza prensil mano derecha", 
   ylab = "Fuerza prensil mano izquierda", 
   main = "Fuerza prensil agrupado por Sexo", 
   labels = row.names(data2))