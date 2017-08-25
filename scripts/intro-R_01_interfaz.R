# File: Intro-R_01_interfaz.R
# Elementos de Decisión Clínica II
# Introducción al Uso de R - Hansel J. Mora, hj.mora10@uniandes.edu.co
# Conociendo la interfaz y la sintaxis de R.

# Comentarios. Son lineas de texto no ejecutado por RStudio.
# 1 + 2

1 + 2  # Operaciones básicas; presionar cmd/ctrl + Enter para ejecutar.
1 - 2 # Resta.
2 * 3 # Multiplicación.
4 / 3 # División.
3 ^ 4 # Potenciación.
log10(1000) # Logaritmo en base 10.
log(16, base = 4) # Logaritmo en base y de x.
sqrt(264) # Raiz cuadrada.
exp(5) # Función exponencial, e^x. 

? # Obtener ayuda sobre una función.
help() # Similar a "?" para obtener ayuda sobre una función.
?log # Obtiene ayuda sobre la función log().

x <- 5 * 4 # Crea una variable y le asigna un valor.
x # Muestra el valor de la variable.

1:15 # Imprime los números del 1 al 15 en la consola.

print("Hola!") # Imprime "Hola!" en la consola.

z <- 21:10 # Crea la variable z y le asigna los números del 21 al 10.
z # Muestra el valor de z.

x + z # Operaciones entre variables. Operación con lógica vectorial, suma el valor de x a cada valor de z.

v <- c(1, 2, 3, 4, 5) # Crea el vector v con los valores 1, 2, 3, 4, 5
v # Muestra los valores de v.

# Limpiar el espacio de trabajo
rm(x) # Remueve el objeto x del espacio de trabajo (workspace).
rm(x, z) # Remueve varios objetos al tiempo.
rm(list = ls())  # Limpia todo el espacio de trabajo (workspace).
# Presionar Ctrl/Cmd + l para limpiar la consola.
