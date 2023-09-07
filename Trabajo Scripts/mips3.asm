.data  			# Sección para declarar variables y constantes.

mensaje1: .asciiz "Realizado Por: Juan Camilo Morales Lopez \n."      	# Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
mensaje2: .asciiz "Scrip Para La Serie De Fibonacci  \n."		# Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
mensaje3: .asciiz "Ingenieria Informatica \n."				# Declara una cadena de caracteres como mensaje con mensaje1 y utilizando asciiz que es de tipo string.
prompt:      .asciiz "Ingrese el número de términos que tendra la serie de Fibonacci: "       # Declara una cadena de caracteres como mensaje informativo para el usuario utilizando asciiz que sería de tipo string para hasta donde quiere que llegue la serie de fibonacci.   
result_msg:  .asciiz "Serie de Fibonacci: "		# Declara una cadena de texto para el resultado utilizando asciiz de tipo string para el resultado del programa.      

.text			# Seccion para códigos y metódos.
.globl main		# Seccion del menú.

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
    
    # Pide al usuario el número de términos de la serie de Fibonacci.
    
    li $v0, 4                   # Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.	                 
    la $a0, prompt             # Carga la dirección de la cadena de prompt en $a0 indicando que el usuario ingrese el terminos de la serie.
    syscall                     # Llamada al sistema para realizar la impresión.

    # Lee el número de términos ingresado por el usuario.
    
    li $v0, 5		# Código de servicio 5 para leer el  número ingresado por el usuario.
    syscall		# Llamada al sistema para verificar.
    move $s0, $v0      # # Copiar el valor del registro ingresado de $v0 en el registro $s0 donde $s0 es el numero de terminos.

    # Inicializa los primeros dos términos de la serie.
    
    li $t0, 0          # Carga el primer numero de la serie en $t0.
    li $t1, 1          # Carga el segundo numero de la serie en $t1.

    # Imprime el mensaje inicial.
    
    li $v0, 4 		# Código de servicio 4 para mostrar operación con cadenas de caracteres en el registro $v0.
    la $a0, result_msg     # Carga la direccion de la cadena result_msg en $a0 para imprimir el mensaje.
    syscall			#Llamada al sistema.

    # Imprime los primeros n términos de la serie de Fibonacci.
    
    loop:		# Bucle condicional em este caso para la suma de cada uno de los terminos.		
        # Imprime el término actual
        li $v0, 1	# Codigo de servicio 1 para imprimir el valor entero.
        move $a0, $t0	# Carga el en este caso 0 que es $t0 en la direccion de cadena $a0.
        syscall		# Llamada al sistema.

        # Calcula el siguiente término
        
        addu $t2, $t0, $t1  # Suma los registros de 0 y 1 que son $t1 y $t0 para guardar el resultado de la suma en $t2. 

        # Actualiza los valores de $t0 y $t1 para la próxima iteración
        
        move $t0, $t1      # Copia el valor del registro de $t1 a $t0 para actulizar el valor de este para la siguiente iteracion.
        move $t1, $t2      # Copia el valor del resgistro de $t2 a $t1 para actulizar el valor de $t2 y proceder a la siguiente iteracion.

        # Decrementa n y verifica si se han impreso todos los términos.
        
        subu $s0, $s0, 1	# Resta los numeros de los registros $s0 y $s0, con el codigo de servicio 1 imprime el valor entero de la resta.
        bnez $s0, loop		# Realiza un salto condicional para la resta que obtiene de arriba  y entrar en un bucle loop para imprimir los nuemos.

    # Salir del programa
    li $v0, 10		# Código de servicio 10 para salir del programa y terminar la ejecución.  
    syscall
