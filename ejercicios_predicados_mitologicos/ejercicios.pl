% 1. Aplanar una lista de listas anidadas

flatten([1,[2,[3,4],5],[6]], Result).

% Output :Result = [1, 2, 3, 4, 5, 6].

% 2. Encontrar todas las permutaciones de una lista

permutation([a, b, c], Result).

% Output
% Result = [a, b, c] ;
% Result = [a, c, b] ;
% Result = [b, a, c] ;
% Result = [b, c, a] ;
% Result = [c, a, b] ;
% Result = [c, b, a] ;
% false.

% 3. Generar subconjuntos de una lista

% 4. Encontrar todos los números en un rango que cumplen una condición

esprimo(Num) :-
    Num > 1,
    \+ tiene_divisor(Num, 2).

% Predicado auxiliar que verifica si un número tiene un divisor.
tiene_divisor(Num, Div) :-
    Div * Div =< Num,     % Solo revisamos divisores hasta la raíz cuadrada.
    Num mod Div =:= 0 ;   % Si hay un divisor exacto, no es primo.
    tiene_divisor(Num, Div + 1). % Verifica el siguiente divisor.

% 5. Concatenar dos listas

append([1,2], [3,4], X).

% Output: X = [1, 2, 3, 4].

% 6. Encontrar elementos únicos en una lista