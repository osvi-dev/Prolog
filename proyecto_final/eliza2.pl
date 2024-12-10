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



% --------------------Templates para acertijo de medicina ------------
% Templates para responder sobre médicos y especialidades

template([quien, trabaja, en, Especialidad], 
         ['El medico que trabaja en ', Especialidad, ' es ', Medico], 
         [3]) :-
    especialidad_de(Medico, Especialidad).

template([quien, trabaja, en, Hospital], 
         ['El medico que trabaja en el hospital ', Hospital, ' es ', Medico], 
         [3]) :-
    hospital_de(Medico, Hospital).

template([quien, utiliza, Equipo], 
         ['El medico que utiliza el ', Equipo, ' es ', Medico], 
         [3]) :-
    usa(Equipo, Medico).

template([cual, es, el, interes, de, Medico], 
         ['El interes de investigacion de ', Medico, ' es ', Interes], 
         [5]) :-
    interes_de(Medico, Interes).

template([en, que, hospital, trabaja, Medico], 
         ['El hospital donde trabaja ', Medico, ' es ', Hospital], 
         [4]) :-
    hospital_de(Medico, Hospital).

template([que, especialidad, tiene, Medico], 
         ['La especialidad de ', Medico, ' es ', Especialidad], 
         [3]) :-
    especialidad_de(Medico, Especialidad).


template(_, ['Por favor, explica un poco más.'], []).

familia(X, R) :-
    findall(["El hijo de: ", X, " es: ", Y], padre_de(X, Y), Results),
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

% Carla
restriccion(carla, hospital, [general, privado]).
restriccion(carla, especialidad, [neurologia]).

% Electrocardiógrafo y Hospital Militar
usa(electrocardiografo, X) :- especialidad_de(X, cardiologia), hospital_de(X, militar), X \= diego.
% Dermatoscopio
usa(dermatoscopio, X) :- hospital_de(X, universitario).
usa(X, elena) :- X \= electrocardiografo.
% Resonador Magnético
usa(resonador, X) :- interes_de(X, inmunologia), X \= elena.
% Ecógrafo
usa(ecografo, X) :- especialidad_de(X, pediatria), \+hospital_de(X, universitario), \+hospital_de(X, militar).

% Bruno
hospital_de(bruno, H) :- \+member(H, [regional, militar]).
interes_de(bruno, farmacologia).
% Elena
interes_de(elena, bioetica).

% Diego
interes_de(diego, microbiologia).

% Oncología y Hospital General
especialidad_de(X, oncologia) :- hospital_de(X, general), usa(X, tomografo).

% Hospital Regional
especialidad_de(X, dermatologia) :- hospital_de(X, regional).


% ------------------- Datos para el arbol genealogico -------------------------


padre_de(jose, jose_antonio).
padre_de(jose, salvador).
padre_de(jose, hermila).
padre_de(jose_antonio, osvaldo).
padre_de(jose_antonio, fatima).
padre_de(salvador, tony).
padre_de(salvador, xochilt_hija).
padre_de(salvador, chavita).
padre_de(isidro_abuelo, patricia).
padre_de(isidro_abuelo, isidro).
padre_de(isidro_abuelo, erick).
padre_de(isidro_abuelo, juan).
padre_de(isidro_abuelo, gabriela).
padre_de(isidro_abuelo, ana).
padre_de(isidro, daniel).
padre_de(isidro, jair).
padre_de(isidro, china).
padre_de(isidro, estefani).
padre_de(juan, juanito).
padre_de(jaime, jose).
padre_de(jaime, anita).
padre_de(jaime, lucero).
padre_de(jaime, cristina).
padre_de(felix, telli).
padre_de(felix, yaya).
padre_de(felix, mary).
padre_de(felix, gaby_chiquita).
padre_de(vidal, manuel).
padre_de(vidal, lalo).
padre_de(vidal, eitan).
padre_de(nacho, josep).
padre_de(nacho, evelyn).
padre_de(nacho, jennifer).
padre_de(miguel, cacheton).
padre_de(miguel, alexa).
padre_de(miguel, michelle).
padre_de(edgar, emerick).
padre_de(edgar, emilio).
padre_de(edgar, soff).
padre_de(angel, isai).
padre_de(angel, ailin).
padre_de(angel, yareli).
padre_de(hugo, isabella).
padre_de(luis, natalia).
padre_de(luis, pato).
padre_de(javier, jazmin).
padre_de(javier, miriam).
padre_de(javier, sarahi).

madre_de(teresa, jose_antonio).
madre_de(teresa, hermila).
madre_de(teresa, salvador).
madre_de(rafaela, patricia).
madre_de(rafaela, erick).
madre_de(rafaela, juan).
madre_de(rafaela, isidro).
madre_de(rafaela, ana).
madre_de(rafaela, gabriela).
madre_de(patricia, osvaldo).
madre_de(patricia, fatima).
madre_de(gabriela, mary).
madre_de(gabriela, yaya).
madre_de(gabriela, telli).
madre_de(gabriela, gaby_chiquita).
madre_de(yaya, natalia).
madre_de(yaya, pato).
madre_de(mary, regina).
madre_de(ana, anita).
madre_de(ana, lucero).
madre_de(ana, jose).
madre_de(ana, cristina).
madre_de(anita, michelle).
madre_de(anita, alexa).
madre_de(lucero, manuel).
madre_de(lucero, eitan).
madre_de(lucero, lalo).
madre_de(cristina, evelyn).
madre_de(cristina, jennifer).
madre_de(cristina, josep).
madre_de(erika, jair).
madre_de(erika, daniel).
madre_de(erika, china).
madre_de(erika, estefani).
madre_de(china, isabella).
madre_de(estefani, emerick).
madre_de(estefani, emilio).
madre_de(estefani, soff).
madre_de(hermila, sarahi).
madre_de(hermila, miriam).
madre_de(hermila, jazmin).
madre_de(miriam, ailin).
madre_de(miriam, yareli).
madre_de(miriam, isai).
madre_de(xochilt, xochilt_hija).
madre_de(xochilt, chavita).
madre_de(xochilt, tony).

