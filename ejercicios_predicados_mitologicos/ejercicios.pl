% 1. Aplanar una lista de listas anidadas

% flatten([1,[2,[3,4],5],[6]], Result).

% Output :Result = [1, 2, 3, 4, 5, 6].

% 2. Encontrar todas las permutaciones de una lista

% permutation([a, b, c], Result).

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
% append([1,2], [3,4], X).
% Output: X = [1, 2, 3, 4].

% 6. Encontrar elementos únicos en una lista
unicos([], []).

% Caso recursivo: Si el elemento no está en el acumulador, lo agrega.
unicos([Head|Tail], [Head|Result]) :-
    \+ member(Head, Tail), % Verifica si Head no está ya en Tail.
    unicos(Tail, Result).

% Si el elemento está repetido, lo omite y continúa.
unicos([Head|Tail], Result) :-
    member(Head, Tail),
    unicos(Tail, Result).

% input -> unicos([1, 2, 2, 3, 3, 3, 4], ListaUnica).
% ouput -> ListaUnica = [1, 2, 3, 4]


% 7. Calcular la potencia de un número
potencia(_, 0, 1).

% Caso recursivo: Calcula la potencia N^Exp.
potencia(Base, Exp, Resultado) :-
    Exp > 0,
    Exp1 is Exp - 1,
    potencia(Base, Exp1, Resultado1),
    Resultado is Base * Resultado1.


% Encuentra todas las potencias de una base hasta un límite.
potencias_hasta(Base, Limite, Potencias) :-
    findall(Potencia,
            (between(0, 100, Exp), % Genera exponentes desde 0 hasta un número suficientemente grande.
             potencia(Base, Exp, Potencia),
             Potencia =< Limite), % Filtra las potencias que excedan el límite.
            Potencias).

% Input -> potencias_hasta(2, 32, Potencias).
% Output -> Potencias = [1, 2, 4, 8, 16, 32].


% 8. Alinear equipos en un torneo
