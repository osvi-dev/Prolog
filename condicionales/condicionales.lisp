(defun mayor-if (numero)

(if (>= numero 18) 
	(princ "Eres mayor de edad")
	(princ "Eres menor de dedad")
	)
)

(defun mayor-when (numero)
	(when (>= numero 18)
		(princ "Eres mayor de edad") 
	)
	(when (< numero 18)
		(princ "Eres menor de edad") 
	)
) 


(defun mayor-unless (numero)
	(unless (< numero 18)
		(princ "Eres mayor de edad")
	)(unless (>= numero 18)
		(princ "Eres menor de edad")
	)
) 

(defun par-impar-if (numero)
	( if (evenp numero)
		(princ "Es par")
		(princ "Es impar")
	)
)

(defun par-impar-when (numero)
	(when (evenp numero)
		(princ "El numero es par")
	)
	(when (not (evenp numero))
		(princ "El numero es impar")
	)
)

(defun par-impar-unless (numero)
	(unless (evenp numero)
		(princ "El numero es impar")
	)
	(unless (not(evenp numero))
		(princ "El numero es par")
	)
)




