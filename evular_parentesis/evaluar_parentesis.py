# Leemos la expresion
expresion = input('Ingrese la expresion: ')

def evaluate(expresion:str) -> bool:
    if expresion[0] == ')': return False
    
    stack = [expresion[0]]
    
    for i in range(1,len(expresion)):
        if expresion[i] == ')' and stack[-1] == '(':
            stack.pop()
        else:
            stack.append(expresion[i])
    
    return True if len(stack) == 0 else False
    
                  

        
    
isValid = evaluate(expresion)
print('expresion es correcta?: ', isValid)

# print('Expresion es: ', stack)
# print('Expresion valida: ', evualuate(expresion))

