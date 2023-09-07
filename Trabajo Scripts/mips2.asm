.data				 # Sección para declarar variables y constantes.

mensaje1: .asciiz "Realizado Por: Juan Camilo Morales Lopez \n"			# Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
mensaje2: .asciiz "Scripts para calcular el menor numero \n"			# Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
mensaje3: .asciiz "Ingenieria Informatica \n"					# Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
prompt1:    .asciiz "Hola Por Favor, Ingrese el primer número: "		# Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string.
prompt2:    .asciiz "Por Favor, Ingrese el segundo número: "			# Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string.		
prompt3:    .asciiz "Por Favor, Ingrese el tercer número: "			# Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string.
result_msg: .asciiz "El número menor es: "					 # Declara una cadena de texto para el resultado utilizando asciiz de tipo string para el resultado del programa. 

all_equal_msg: .asciiz "Todos los números son iguales, el menor es el primero que ingresaste: "		# Declara como mensaje informativo en caso de que el usuario ingrese los 3 números iguales.

.text				# Sección de código y métodos.
.globl main			# Sección del menú.

main:
    # Muestra mensaje inicial.
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, mensaje1            # Carga la dirección de la cadena de mensaje1 en $a0.
    syscall                     # Llamada al sistema para realizar la impresión.
    
    # Muestra mensaje 2.
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, mensaje2            # Carga la dirección de la cadena de mensaje2 en $a0.
    syscall                     # Llamada al sistema para realizar la impresión.
    
    # Muestra mensaje 3.
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, mensaje3            # Carga la dirección de la cadena de mensaje 3 en $a0.
    syscall                     # Llamada al sistema para realizar la impresión.
    
    # Pide al usuario el primer número.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.	                 
    la $a0, prompt1             # Carga la dirección de la cadena de prompt1 en $a0 indicando que el usuario ingrese el primer número.
    syscall                     # Llamada al sistema para realizar la impresión.

    # Lee el primer número ingresado.
    li $v0, 5                   # Código de servicio 5 para leer el primer número ingresado por el usuario.
    syscall                     # Llamada al sistema para verificar.
    move $s0, $v0               # Copiar el valor del registro ingresado de $v0 en el registro $s0.

    # Pide al usuario el segundo número.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.			
    la $a0, prompt2             # Carga la dirección de la cadena de prompt2 en $a0 indicando que el usuario ingrese el segundo número.	
    syscall                     # Llamada al sistema para realizar la impresión.

    # Lee el segundo número ingresado.
    
    li $v0, 5                   # Código de servicio 5 para leer el segundo número ingresado por el usuario.
    syscall                     # Llamada al sistema para verificar.
    move $s1, $v0               # Copiar el valor del registro ingresado de $v0 en el registro $s1.

    # Pide al usuario el tercer número.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.		
    la $a0, prompt3             # Carga la dirección de la cadena de prompt3 en $a0 indicando que el usuario ingrese el tercer número.		
    syscall                     # Llamada al sistema para verificar

    # Lee el tercer número ingresado.
    
    li $v0, 5                   # Código de servicio 5 para leer el tercer número ingresado por el usuario.			
    syscall                     # Llamada al sistema para verificar.
    move $s2, $v0               # Copiar el valor del registro ingresado de $v0 en el registro $s2.		

    # Compara los números para localizar el mayor.
    move $t0, $s0               # Copiar el valor del registro en $s0 ingresado por el usuario (primer número) en $t0.
    move $t1, $s1               # Copiar el valor del registro en $s1 ingresado por el usuario (segundo número) en $t1.

    blt $s0, $s1, check_third		# Bgt es salto si es mayor que comparando los 2 primeros números ingresados por el usuario luego de esto con check_third salta al siguiente método si se cumple esta condición.
    move $t0, $s1      			# Copia el valor del registro del $s1 en $t0 ya con el número mayor comparado de estos dos.

check_third:				       # En caso de que la condición de que se cumpla salta para imprimir resultado del número menor entre los dos anteriores.
    blt $t0, $s2, print_result		# Bgt salto condicional en caso de que $t0 sea menor que $s2.	
    move $t0, $s2      			# Copia el valor del registro del número menor ya comparado con el tercer número ingresado por el usuario en $t0.

print_result:				# Imprime resultado pero entrar a verificar en caso de que los 3 números sean iguales. 

    beq $s0, $s1, all_equal 	# beq realiza un salto si dos registros son iguales en este caso si el primer número y el segundo son iguales.   
    beq $s0, $s2, all_equal 	# beq realiza un salto si dos registros son iguales en este caso si el tercer número y el primero son iguales.
    beq $s1, $s2, all_equal     # beq realiza un salto si dos registros son iguales en este caso si el tercer número y el segundo son iguales.

    # Imprime el resultado si los números no son iguales

    li $v0, 4    	# Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, result_msg  # Carga la dirección de la cadena result_msg para indicar el número menor.
    syscall		# Llamada al sistema.
    b end_program 	# Realiza salto a la etiqueta end_program para finalizar el programa

all_equal:

    # Imprime el mensaje de que todos son iguales y el mayor es el primero que el usuario ingresó.
    li $v0, 4   	# Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, all_equal_msg  # Carga la dirección de la cadena de all_equal_msg en $a0 indicando que todos los números ingresados son iguales y el mayor es el primero que se ingresó.
    syscall		   # Llamada al sistema.

end_program:    # Finalizar el programa en caso de que los 3 números sean iguales.

    li $v0, 1 	 # Código de servicio 1 para indicar las llamadas del sistema e imprimir los valores numéricos.
    move $a0, $t0   # Copiar el valor del registro en este caso el número mayor $t0 en $a0.
    syscall	    # Llamada al sistema.

    # Salir del programa
    
    li $v0, 10        # Código de servicio 10 para salir del programa y terminar la ejecución.     
    syscall

