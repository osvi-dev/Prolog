# Leemos la expresion
expresion = input('Ingrese la expresion: ')

def evualuate (expresion):
    # Ponemos los dos terminos del stack
    stack = [expresion[0]]
    
    item = 0
    # Vamos a recorrer la expresion varias veces
    # si recorremos toda la expresion no tenemos mas match
    # quiere decir que la expresion no es valida
    times = 1
    while times < 2:
        # empezamos desde el segundo item
        for i in range((len(expresion) - 1), 1, -1):
            
            if (expresion[last_item] == ')' and expresion[i] == '(' 
            or expresion[last_item] == '(' and expresion[i] == ')' ):
                # hacemos pop de los dos elementos
                stack.pop()
                stack.pop(i)
                
                # actualizo mi last_item
                last_item = len(stack) - 1   
                  

        
    



# print('Expresion es: ', stack)
print('Expresion valida: ', parentesis(expresion))

