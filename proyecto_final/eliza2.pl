eliza :-
    writeln('Hola, mi nombre es Eliza, tu chatbot.'),
    writeln('Por favor, ingresa tu consulta (usar solo minúsculas sin punto al final):'),
    read_line_as_list(Input),
    eliza(Input), !.

%% Caso de salida: el usuario dice "adios"
eliza(Input) :-
    maplist(downcase_atom, Input, LowerInput),
    LowerInput = ['adios'],
    writeln('Adios. Espero poder haberte ayudado.'), !.

% Respuesta por defecto
eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    % Si se encuentra un template, procesar la respuesta
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R),
    read_line_as_list(Input1),
    eliza(Input1), !.

% Templates definidos
template([eliza, quien, es, el, hijo, de, s(_)], [flagfam], [6]).
template(_, ['Por favor, explica un poco más.'], []).

% --------------------Templates para acertijo de medicina ------------
% Templates para responder sobre médicos y especialidades
template([quien, trabaja, en, 'Especialidad', '.'], 
         ['El medico que trabaja en ', Especialidad, ' es ', Medico], 
         [3]) :-
    especialidad_de(Medico, Especialidad).

template([quien, trabaja, en, Hospital, '.'], 
         ['El medico que trabaja en el hospital ', Hospital, ' es ', Medico], 
         [3]) :-
    hospital_de(Medico, Hospital).

template([quien, utiliza, Equipo, '.'], 
         ['El medico que utiliza el ', Equipo, ' es ', Medico], 
         [3]) :-
    usa(Equipo, Medico).

template([cual, es, el, interes, de, Medico, '.'], 
         ['El interes de investigacion de ', Medico, ' es ', Interes], 
         [5]) :-
    interes_de(Medico, Interes).

template([en, que, hospital, trabaja, Medico, '.'], 
         ['El hospital donde trabaja ', Medico, ' es ', Hospital], 
         [4]) :-
    hospital_de(Medico, Hospital).

template([en, que, especialidad, trabaja, Medico, '.'], 
         ['La especialidad de ', Medico, ' es ', Especialidad], 
         [4]) :-
    especialidad_de(Medico, Especialidad).


% Base de datos
padre(juan, luis).
padre(juan, antonio).
padre(luis, carlos).

familia(X, R) :-
    findall(["El hijo de ", X, " es ", Y], padre(X, Y), Results),
    flatten(Results, R).

% Coincidencias
match([], []).
match([S|Stim], [I|Input]) :-
    atom(S), S == I,
    match(Stim, Input), !.
match([S|Stim], [_|Input]) :-
    \+atom(S),
    match(Stim, Input), !.

% Reemplazo en la respuesta
replace0([], _, _, Resp, Resp).
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagfam | _],
    familia(Atom, R), !.
replace0([I|Index], Input, N, Resp, R) :-
    nth0(I, Input, Atom),
    select(N, Resp, Atom, R1),
    N1 is N + 1,
    replace0(Index, Input, N1, R1, R), !.

% Lectura de línea como lista
read_line_as_list(Input) :-
    read_line_to_string(user_input, String),
    split_string(String, " ", "", InputList),
    maplist(atom_string, Input, InputList).


% --------------------- hechos para problema medicina -----------------

medico(ana).
medico(bruno).
medico(carla).
medico(diego).
medico(elena).

especialidad(cardiologia).
especialidad(neurologia).
especialidad(oncologia).
especialidad(pediatria).
especialidad(dermatologia).

hospital(general).
hospital(regional).
hospital(universitario).
hospital(privado).
hospital(militar).

equipo(ecografo).
equipo(resonador).
equipo(tomografo).
equipo(dermatoscopio).
equipo(electrocardiografo).

interes(genetica).
interes(farmacologia).
interes(inmunologia).
interes(bioetica).
interes(microbiologia).

% Restricciones a partir de las pistas
% Carla
restriccion(carla, hospital, [general, privado]).
restriccion(carla, especialidad, [neurologia]).

% Electrocardiógrafo y Hospital Militar
usa(electrocardiografo, X) :- especialidad_de(X, cardiologia), hospital_de(X, militar), X \= diego.

% Bruno
hospital_de(bruno, H) :- \+member(H, [regional, militar]).
interes_de(bruno, farmacologia).

% Ecógrafo
usa(ecografo, X) :- especialidad_de(X, pediatria), \+hospital_de(X, universitario), \+hospital_de(X, militar).

% Oncología y Hospital General
especialidad_de(X, oncologia) :- hospital_de(X, general), usa(X, tomografo).

% Resonador Magnético
usa(resonador, X) :- interes_de(X, inmunologia), X \= elena.

% Hospital Regional
especialidad_de(X, dermatologia) :- hospital_de(X, regional).

% Elena
interes_de(elena, bioetica).
usa(X, elena) :- X \= electrocardiografo.

% Diego
interes_de(diego, microbiologia).

% Dermatoscopio
usa(dermatoscopio, X) :- hospital_de(X, universitario).
