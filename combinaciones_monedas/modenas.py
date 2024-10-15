def find_combinations_recursive(target, coins, current_combo=None, index=0):
    # Inicializamos la lista de la combinación actual si es None
    if current_combo is None:
        current_combo = [0] * len(coins)
    
    # Caso base: Si el target es 0, hemos encontrado una combinación válida
    if target == 0:
        return [current_combo.copy()]
    
    # Caso base: Si el target es negativo o si hemos considerado todas las monedas, no es una combinación válida
    if target < 0 or index >= len(coins):
        return []
    
    # Lista para almacenar las combinaciones válidas
    combinations = []

    # Caso 1: Usar la moneda actual (coins[index])
    current_combo[index] += 1
    combinations += find_combinations_recursive(target - coins[index], coins, current_combo, index)
    
    # Deshacer la elección anterior
    current_combo[index] -= 1

    # Caso 2: No usar la moneda actual y pasar a la siguiente
    combinations += find_combinations_recursive(target, coins, current_combo, index + 1)

    return combinations

# Definición de las monedas y el objetivo
coins = [1, 5, 10, 20]
target_amounts = [200, 500, 1000, 1500]

# Almacenar resultados
results = {}

# Buscar combinaciones para cada cantidad objetivo
for amount in target_amounts:
    results[amount] = find_combinations_recursive(amount, coins)

# Mostrar resultados
for amount, combinations in results.items():
    print(f"Combinaciones para {amount} pesos:")
    for combo in combinations:
        print(f"  - {combo[0]} monedas de 1, {combo[1]} monedas de 5, {combo[2]} monedas de 10, {combo[3]} monedas de 20")
