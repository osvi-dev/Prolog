import numpy as np

# Función para generar una matriz aleatoria de 0s y 1s
def generate_matriz():
    filas = np.random.randint(4, 6)
    columnas = np.random.randint(4, 6)
    return np.random.randint(0, 2, (filas, columnas))

# Función para realizar backtracking (DFS) desde una posición (x, y)
def backtracking_island(matriz, visitado, x, y):
    # Si la coordenada está fuera de los límites o es agua (0) o ya fue visitada
    if (x < 0 or y < 0 or x >= len(matriz) or
        y >= len(matriz[0]) or matriz[x][y] == 0 or 
        visitado[x][y]):
        return

    # Marcar la celda actual como visitada
    visitado[x][y] = True

    # Llamar recursivamente para explorar en las 4 direcciones
    backtracking_island(matriz, visitado, x + 1, y)  # Abajo
    backtracking_island(matriz, visitado, x - 1, y)  # Arriba
    backtracking_island(matriz, visitado, x, y + 1)  # Derecha
    backtracking_island(matriz, visitado, x, y - 1)  # Izquierda

# Función para contar el número de islas utilizando backtracking
def count_island(matriz):
    filas = len(matriz)
    columnas = len(matriz[0])
    
    # Crear una matriz de visitados
    visitado = np.full((filas, columnas), False)
    contador_islas = 0
    
    for i in range(filas):
        for j in range(columnas):
            # Si encontramos una nueva isla (celda 1 no visitada)
            if matriz[i][j] == 1 and not visitado[i][j]:
                backtracking_island(matriz, visitado, i, j)
                # Incrementar el contador de islas
                contador_islas += 1
    
    return contador_islas

# Generar la matriz
matriz = generate_matriz()
print("Matriz generada:")
print(matriz)


num_islands = count_island(matriz)
print("Número de islas:", num_islands)
