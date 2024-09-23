# !/usr/bin/env python3


def dividir(dividendo, divisor):
    
    if dividendo - divisor < 0:
        return 0
    
    return dividir(dividendo - divisor, divisor) + 1

print(dividir(10, 2))