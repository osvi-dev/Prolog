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

% --------------------- Templates de eliza 1  ----------------------------
template(['Hola', eliza, soy, s(_), '.'], ['Hola', 0, 'Como', te, ha, ido, '?'], [3]).
template([hola, eliza, soy, s(_), '.'], ['Hola', 0, 'Como', te, ha, ido, '?'], [3]).

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).
template([dime, tus, gustos, _], gustosEliza, []).

% pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).    



% ------------------------ Templates definidos -----------------------------
% template para los sentimientos
template([estoy, triste], ['¿Por', que, estas, triste, '?', '¿Quieres', hablar, de, ello, '?'], []).
template([me, siento, feliz], ['¡Eso', es, maravilloso, '!', 'Cuentame', mas, sobre, lo, que, te, hace, 'feliz.'], []).
template([quien, eres, '?'], ['Soy Eliza', tu, 'chatbot.', 'Estoy', aquí, para, 'ayudarte.'], []).
template([que, puedes, hacer, '?'], ['Puedo', conversar, contigo, responder, preguntas, y, tratar, de, 'ayudarte.'], []).
template([tengo, un, problema], ['¿Que', tipo, de, problema, 'tienes?', 'Estoy', aquí, para, 'ayudarte.'], []).

template([que, piensas, de, mi, '?'], ['Pienso', que, deberias, de, tomar, una, ducha, eres, de, sistemas], []).

% Recomendaciones
template(['Eliza', recomiendame, una, cancion], ['Te', recomiendo, la, cancion, de, 'La ciudad de las luces de latin mafia'], []).
template([eliza, recomiendame, una, cancion], ['Te', recomiendo, la, cancion, de, 'La ciudad de las luces de latin mafia'], []).
template(['Eliza', recomiendame, una, serie], ['Te', recomiendo, 'The Office.'], []).
template([eliza, recomiendame, una, serie], ['The Office es una muy buena serie la recomiendo.'], []).
template(['Eliza', carta, blanca, o, corona, '?'], ['Carta', blanca, es, mas, barata], []).
template([eliza, carta, blanca, o, corona, '?'], ['Carta', blanca, es, mas, barata], []).

template(['Eliza', puedes, mentarme, la, madre, '?'], ['Camara', ya, te, la, 'sabes.', mi, pinche, todo, tibio], []).
template([eliza, puedes, mentarme, la, madre, '?'], ['Camara', ya, te, la, 'sabes.', mi, pinche, todo, tibio], []).

% template para saber donde es eliza
template([eliza, eres, de, s(_), '?'], [flagWhere], [3]).
template([eliza, viviste, en, s(_), '?'], [flagWhere], [3]).		

% eliza te dice si es un buen cafe
template([oye, eliza, estoy, tomando, un, s(_), es, un, buen, cafe, '?'], [flagCoffe], [5]).
template([eliza, estoy, tomando, un, s(_), es, un, buen, cafe, '?'], [flagCoffe], [4]).
template([eliza, me, dieron, un, s(_), sabes, si, es, un, buen, cafe, '?'], [flagCoffe], [4]).



% -------------------------  Templates de familia --------------------------------
template([eliza, quien, es, el, hijo, de, s(_)], [flagfam], [6]).
template([eliza, quienes, son, los, nietos, de, s(_)], [flagNieto], [6]).
template([eliza, quienes, son, los, tios, de, s(_)], [flagTios], [6]).
template([eliza, quienes, son, las, tias, de, s(_)], [flagTios], [6]).
template([eliza, quienes, son, los, hermanos, de, s(_)], [flagHermanos], [6]).
template([eliza, quienes, son, las, hermanas, de, s(_)], [flagHermanos], [6]).
template([eliza, quienes, son, los, padres, de, s(_)], [flagPadres], [6]).


% --------------------Templates para acertijo de medicina ------------
% Consulta de médico con base en su especialidad
template([eliza, quien, es, el, medico, de, Especialidad], [Medico, 'es el medico que trabaja en la especialidad de', Especialidad], []) :-
    especialidad_de(Medico, Especialidad).

% Consulta de médico con base en su hospital
template([eliza, quien, trabaja, en, el, hospital, Hospital], [Medico, 'trabaja en el hospital', Hospital], []) :-
    hospital_de(Medico, Hospital).

% Consulta de médico con base en su equipo
template([eliza, quien, usa, el, equipo, Equipo], [Medico, 'usa el equipo', Equipo], []) :-
    equipo_de(Medico, Equipo).

% Consulta de médico con base en su interés
template([eliza, quien, tiene, interes, en, Interes], [Medico, 'tiene interés en', Interes], []) :-
    interes_de(Medico, Interes).

% Consulta general: especialidad y hospital de un médico
template([eliza, que, especialidad, y, hospital, tiene, Medico], [Medico, 'trabaja en la especialidad de', Especialidad, 'y en el hospital', Hospital], []) :-
    especialidad_de(Medico, Especialidad),
    hospital_de(Medico, Hospital).

% Consulta general: equipo y hospital de un médico
template([eliza, que, equipo, y, hospital, usa, Medico], [Medico, 'usa el equipo', Equipo, 'y trabaja en el hospital', Hospital], []) :-
    equipo_de(Medico, Equipo),
    hospital_de(Medico, Hospital).

% Consulta general: interés y especialidad de un médico
template([eliza, que, interes, y, especialidad, tiene, Medico], [Medico, 'tiene interés en', Interes, 'y trabaja en la especialidad de', Especialidad], []) :-
    interes_de(Medico, Interes),
    especialidad_de(Medico, Especialidad).

% Consulta combinada: especialidad, hospital, equipo e interés
template([eliza, dame, toda, la, informacion, de, Medico], [Medico, 'trabaja en la especialidad de', Especialidad, ' en el hospital', Hospital, ', usa el equipo', Equipo, 'y tiene interés en', Interes], []) :-
    resolver_relacion(Medico, Especialidad, Hospital, Equipo, Interes).

% ----------------- Templates Harry Potter -----------------------

template([cuales, son, los, principales, objetos, magicos, que, conoces, '?'], [flagKnowMagicalObjects], [_]).
% quien es el propietario de varita_de_sauco ? .
template([quien, es, el, propietario, de, s(_), '?'], [flagOwner], [5]).

% que personajes de genero femenino conoces ? .
template([que, personajes, de, genero, s(_), conoces, '?'], [flagCharactersByGender], [4]).

% cuales son las casas de hogwarts ? .
template([cuales, son, las, casas, de, hogwarts, '?'], [flagHogwartsHouses], [_]).

% a que casa pertenece harry_potter ? .
template([a, que, casa, pertenece, s(_), '?'], [flagHouseOf], [4]).

% que familias conoces ? .
template([que, familias, conoces, '?'], [flagFamilies], [_]).

% cuales objetos magicos conoces ? .
template([cuales, objetos, magicos, conoces, '?'], [flagMagicalObjects], [_]).

% a quien le pertenece el objeto magico varita_de_sauco ? .
template([a, quien, le, pertenece, el, objeto, magico, s(_), '?'], [flagOwnerOfObject], [7]).

% que locaciones magicas conoces ? .
template([que, locaciones, magicas, conoces, '?'], [flagMagicalLocations], [_]).

% cuales son las principales criaturas magicas que conoces ? .
template([cuales, son, las, principales, criaturas, magicas, que, conoces, '?'], [flagMagicalCreatures], [_]).

% que conoces de la criatura magica elfo_domestico ? .
template([que, conoces, de, la, criatura, magica, s(_), '?'], [flagInfoCreature], [6]).

% que conoces del objeto magico varita_de_sauco ? .
template([que, conoces, del, objeto, magico, s(_), '?'], [flagInfoObject], [5]).

% que conoces del personaje albus_dumbledore ? .
template([que, conoces, del, personaje, s(_), '?'], [flagInfoCharacter], [4]).

% ginny_weasley es estudiante ? .
template([s(_), es, estudiante, '?'], [flagIsStudent], [0]).


template(_, ['Por favor, explica un poco más.'], []).

% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

% eliza de donde es
elizaWhere(X,R):- where(X), R = ['Sabes', demasiado, tendremos, que, neutrazalizarte].
elizaWhere(X, R):- \+where(X), R = ['Efectivamente', soy, de, X].

where('NASA').
where('Chilchota').
where('Morelia').

% eliza cafe 
elizaCoffe(X,R):- coffe(X), R = ['Efectivamente', el, X, un, buen, cafe].
elizaCoffe(X,R):- \+coffe(X), R = ['Guacala', a, eso, no, se, le, puede, llamar, cafe].

coffe(flatwhite).
coffe(spresso).
coffe(coldbrew).
coffe(americano).
coffe(late).
coffe(capuchino).

familia(X, R) :-
    findall(["El hijo de: ", X, " es: ", Y], padre_de(X, Y), Results),
    flatten(Results, R).

% Regla para obtener los nietos de una persona
nietos(X, R) :-
    findall(Y, (padre_de(X, Z), padre_de(Z, Y)), Nietos),
    (Nietos \= [] -> R = ["Los nietos de ", X, " son: ", Nietos]
    ; R = ["No se encontraron nietos para ", X]).

tios_tias(X, R) :-
    findall(Y, (padre_de(P, X), (hermano_de(P, Y); hermana_de(P, Y))), TiosTias),
    (TiosTias \= [] -> R = ["Los tíos/tías de ", X, " son: ", TiosTias]
    ; R = ["No se encontraron tíos o tías para ", X]).

hermanos_hermanas(X, R) :-
    findall(Y, ((padre_de(P, X), padre_de(P, Y)); (madre_de(M, X), madre_de(M, Y)), X \= Y), Hermanos),
    sort(Hermanos, HermanosUnicos),  % Elimina duplicados
    (HermanosUnicos \= [] -> R = ["Los hermanos/hermanas de ", X, " son: ", HermanosUnicos]
    ; R = ["No se encontraron hermanos o hermanas para ", X]).

padres(X, R) :-
    findall(P, (padre_de(P, X); madre_de(P, X)), Padres),
    (Padres \= [] -> R = ["Los padres de ", X, " son: ", Padres]
    ; R = ["No se encontraron padres para ", X]).


% ---------------- Reglas Harry Potter ----------------
knowMagicalObjects(R) :-
    findall(X, objeto_magico(X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Los principales objetos magicos que conozco son:\n   * ~w.', [AuxStr]).

owner(X, R) :-
    findall(Y, propietario(Y,X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'El propietario de ~w es: ~w.', [X, AuxStr]).

charactersByGender(X, R) :-
    findall(Y, genero(Y, X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Lospersonajes de genero ~w son:\n   * ~w.', [X, AuxStr]).

hogwartsHouses(R) :-
    findall(X, casa(X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Las 4 casa de hogwarts son:\n   * ~w.', [AuxStr]).

houseOf(X, R) :-
    findall(Y, perteneceA(X,Y), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), '~w pertenece a : ~w.', [X, AuxStr]).

families(R) :-
    findall(X, familia(X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Las familias que conozco son:\n   * ~w.', [AuxStr]).

magicalObjects(R) :-
    findall(X, objeto_magico(X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Las objetos magicos que conozco son:\n   * ~w.', [AuxStr]).

ownerOfObject(X, R) :-
    findall(Y, propietario(Y,X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'El/la ~w le pertenece a: ~w.', [X, AuxStr]).

magicalLocations(R) :-
    findall(X, lugar(X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Las locaciones magicas que conozco son:\n   * ~w.', [AuxStr]).

magicalCreatures(R) :-
    findall(X, criatura(X), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'Las criaturas magicas que conozco son:\n   * ~w.', [AuxStr]).

infoCreature(X, R) :-
    findall(Y, descripcion(X,Y), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'De ~w conozco lo siguiente: ~w.', [X, AuxStr]).

infoObject(X, R) :-
    findall(Y, descripcion(X,Y), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'De ~w conozco lo siguiente: ~w.', [X, AuxStr]).

infoCharacter(X, R) :-
    findall(Y, descripcion(X,Y), Aux),
    atomic_list_concat(Aux, '\n   * ', AuxStr),
    format(atom(R), 'De ~w conozco lo siguiente: ~w.', [X, AuxStr]).

isStudent(X, R):- perteneceA(X, A), R = ['Si', X, 'es estudiante de ', A], !.
isStudent(X, R):- \+ perteneceA(X, _), R = ['No', X, 'no es estudiante'], !.

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

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagNieto | _],
    nietos(Atom, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagTios | _],
    tios_tias(Atom, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagHermanos | _],
    hermanos_hermanas(Atom, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagPadres | _],
    padres(Atom, R), !.

%------ para los templates definidos por  mi   ------------------

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

% Eliza where:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagWhere,
	elizaWhere(Atom, R).

% Eliza cafe

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagCoffe,
	elizaCoffe(Atom, R).

replace0([I|_], Input, _, Resp, R) :- 
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    (
        X == flagKnowMagicalObjects -> knowMagicalObjects(R); 
        X == flagOwner -> owner(Atom, R) ;
        X == flagCharactersByGender -> charactersByGender(Atom, R); 
        X == flagHogwartsHouses -> hogwartsHouses(R);
        X == flagHouseOf -> houseOf(Atom, R); 
        X == flagFamilies -> families(R); 
        X == flagMagicalObjects -> magicalObjects(R); 
        X == flagOwnerOfObject -> ownerOfObject(Atom, R); 
        X == flagMagicalLocations -> magicalLocations(R); 
        X == flagMagicalCreatures -> magicalCreatures(R); 
        X == flagInfoCreature -> infoCreature(Atom, R); 
        X == flagInfoObject -> infoObject(Atom, R); 
        X == flagInfoCharacter -> infoCharacter(Atom, R); 
        X == flagIsStudent -> isStudent(Atom, R)
    ).

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
equipo(resonancia).
equipo(tomografo).
equipo(dermatoscopio).
equipo(electrocardiografo).

interes(genetica).
interes(farmacologia).
interes(inmunologia).
interes(bioetica).
interes(microbiologia).

% Carla no trabaja en el Hospital General ni en el Privado, y no estudia neurología.
restriccion(carla, _, general, _).
restriccion(carla, _, privado, _).
restriccion(carla, neurologia, _, _).

% La persona que utiliza el electrocardiógrafo trabaja en cardiología en el Hospital Militar, pero no es Diego.
restriccion(diego, cardiologia, militar, electrocardiografo).

% Bruno está interesado en farmacología, pero no trabaja en el Hospital Regional ni en el Militar.
restriccion(bruno, _, regional, _).
restriccion(bruno, _, militar, _).

% La persona que utiliza el ecógrafo trabaja en pediatría y no es del Hospital Universitario ni del Militar.
restriccion(_, pediatria, universitario, ecografo).
restriccion(_, pediatria, militar, ecografo).

% El médico interesado en inmunología usa el resonador magnético, pero no es Elena.
restriccion(elena, _, _, resonancia).

% Elena está interesada en bioética y no utiliza el electrocardiógrafo.
restriccion(elena, _, _, electrocardiografo).

% Relaciones específicas deducidas
datos(ana, cardiologia, militar, electrocardiografo, genetica).
datos(bruno, pediatria, privado, ecografo, farmacologia).
datos(carla, dermatologia, regional, resonancia, inmunologia).
datos(diego, oncologia, general, tomografo, microbiologia).
datos(elena, neurologia, universitario, dermatoscopio, bioetica).

% Regla para determinar las relaciones entre los atributos
resolver_relacion(Medico, Especialidad, Hospital, Equipo, Interes) :-
    datos(Medico, Especialidad, Hospital, Equipo, Interes),
    \+ restriccion(Medico, Especialidad, Hospital, Equipo).

% Método para obtener la especialidad de un médico
especialidad_de(Medico, Especialidad) :-
    resolver_relacion(Medico, Especialidad, _, _, _).

% Método para obtener el hospital de un médico
hospital_de(Medico, Hospital) :-
    resolver_relacion(Medico, _, Hospital, _, _).

% Método para obtener el equipo de un médico
equipo_de(Medico, Equipo) :-
    resolver_relacion(Medico, _, _, Equipo, _).

% Método para obtener el interés de investigación de un médico
interes_de(Medico, Interes) :-
    resolver_relacion(Medico, _, _, _, Interes).


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

gustosEliza() :- likes(X).

% ----------- Harry Potter -----------
personaje(harry_potter).
personaje(ron_weasley).
personaje(hermione_granger).
personaje(ginny_weasley).
personaje(fred_weasley).
personaje(george_weasley).
personaje(neville_longbottom).
personaje(draco_malfoy).
personaje(cedric_diggory).
personaje(albus_dumbledore).
personaje(rubeus_hagrid).
personaje(sirius_black).
personaje(severus_snape).
personaje(lucius_malfoy).
personaje(voldemort).
personaje(cornelius_fudge).
personaje(luna_lovegood).
personaje(cho_chang).
personaje(nicolas_flamel).

propietario(harry_potter, capa_de_invisibilidad).
propietario(albus_dumbledore, varita_de_sauco).
propietario(nicolas_flamel, piedra_filosofal).
propietario(harry_potter, libro_de_hechizos).
propietario(hogwarts, sombrero_seleccionador).
propietario(neville_longbottom, espada_de_gryffindor).


% Generos
genero(harry_potter, masculino).
genero(ron_weasley, masculino).
genero(fred_weasley, masculino).
genero(george_weasley, masculino).
genero(neville_longbottom, masculino).
genero(draco_malfoy, masculino).
genero(cedric_diggory, masculino).
genero(albus_dumbledore, masculino).
genero(rubeus_hagrid, masculino).
genero(sirius_black, masculino).
genero(severus_snape, masculino).
genero(lucius_malfoy, masculino).
genero(voldemort, masculino).
genero(cornelius_fudge, masculino).
genero(luna_lovegood, femenino).
genero(cho_chang, femenino).
genero(ginny_weasley, femenino).
genero(hermione_granger, femenino).

% Casas
casa(gryffindor).
casa(slytherin).
casa(hufflepuff).
casa(ravenclaw).

% A que casa pertenecen
perteneceA(harry_potter, gryffindor).
perteneceA(ron_weasley, gryffindor).
perteneceA(hermione_granger, gryffindor).
perteneceA(ginny_weasley, gryffindor).
perteneceA(fred_weasley, gryffindor).
perteneceA(george_weasley, gryffindor).
perteneceA(neville_longbottom, gryffindor).
perteneceA(draco_malfoy, slytherin).
perteneceA(cedric_diggory, hufflepuff).
perteneceA(luna_lovegood, ravenclaw).
perteneceA(cho_chang, ravenclaw).

% Familia
familia(potter).
familia(weasley).
familia(malfoy).

% Objetos magicos
objeto_magico(varita_de_sauco).
objeto_magico(capa_de_invisibilidad).
objeto_magico(piedra_filosofal).
objeto_magico(libro_de_hechizos).
objeto_magico(sombrero_seleccionador).
objeto_magico(espada_de_gryffindor).

lugar(hogwarts).
lugar(la_madriguera).
lugar(azkaban).
lugar(diagon_alley).
lugar(la_torre_de_ravenclaw).
lugar(el_bosque_prohibido).

criatura(hipogrifo).
criatura(dementor).
criatura(elfo_domestico).
criatura(fenix).
criatura(hombre_lobo).
criatura(centauro).

% Descripcion de las criaturas
descripcion(hipogrifo, 'Una criatura mágica con el cuerpo de un caballo y las alas y cabeza de un águila.').
descripcion(dementor, 'Seres oscuros que absorben la felicidad de las personas y pueden realizar el "beso del dementor".').
descripcion(elfo_domestico, 'Una criatura mágica que sirve a una familia de magos y tiene poderes mágicos propios.').
descripcion(fenix, 'Un ave mágica que renace de sus cenizas, conocida por sus lágrimas curativas.').
descripcion(hombre_lobo, 'Un ser humano que se transforma en lobo durante la luna llena.').
descripcion(centauro, 'Una criatura con la cabeza, el torso y los brazos de un humano y el cuerpo y las piernas de un caballo.').

% Descripcion de los objetos
descripcion(varita_de_sauco, 'Una de las tres Reliquias de la Muerte, la varita más poderosa jamás creada.').
descripcion(capa_de_invisibilidad, 'Una de las tres Reliquias de la Muerte, hace invisible al portador.').
descripcion(piedra_filosofal, 'Una piedra mágica capaz de convertir cualquier metal en oro y producir el Elixir de la Vida.').
descripcion(libro_de_hechizos, 'Un libro que contiene una colección de hechizos mágicos.').
descripcion(sombrero_seleccionador, 'Un sombrero mágico que selecciona a los estudiantes en una de las cuatro casas de Hogwarts.').
descripcion(espada_de_gryffindor, 'Una espada mágica que pertenece a la casa Gryffindor y aparece en momentos de necesidad.').

% Descripcion de los personajes
descripcion(harry_potter, 'El niño que vivió, famoso por sobrevivir el ataque de Voldemort siendo un bebé.').
descripcion(ron_weasley, 'El mejor amigo de Harry, miembro de la familia Weasley.').
descripcion(hermione_granger, 'La mejor amiga de Harry, conocida por su inteligencia y habilidades mágicas.').
descripcion(ginny_weasley, 'Hermana menor de Ron, miembro de la familia Weasley y eventual esposa de Harry.').
descripcion(fred_weasley, 'Uno de los gemelos Weasley, conocido por su sentido del humor y travesuras.').
descripcion(george_weasley, 'Uno de los gemelos Weasley, conocido por su sentido del humor y travesuras.').
descripcion(neville_longbottom, 'Estudiante de Gryffindor conocido por su valentía y desarrollo a lo largo de la saga.').
descripcion(draco_malfoy, 'Estudiante de Slytherin, rival de Harry y miembro de la familia Malfoy.').
descripcion(cedric_diggory, 'Estudiante de Hufflepuff, conocido por su nobleza y participación en el Torneo de los Tres Magos.').
descripcion(albus_dumbledore, 'Director de Hogwarts, uno de los magos más poderosos y respetados.').
descripcion(rubeus_hagrid, 'Guardián de las llaves y terrenos de Hogwarts, conocido por su amor por las criaturas mágicas.').
descripcion(sirius_black, 'Padrino de Harry, conocido por su lealtad y valentía.').
descripcion(severus_snape, 'Profesor de Pociones, conocido por su papel ambiguo y su sacrificio final.').
descripcion(lucius_malfoy, 'Miembro de la familia Malfoy, conocido por su lealtad a las artes oscuras.').
descripcion(voldemort, 'El mago tenebroso más poderoso de todos los tiempos, conocido por su intento de dominar el mundo mágico.').
descripcion(cornelius_fudge, 'Ministro de Magia durante gran parte de la saga, conocido por su incompetencia y negación de la amenaza de Voldemort.').
descripcion(luna_lovegood, 'Estudiante de Ravenclaw, conocida por su personalidad excéntrica y sus creencias inusuales.').
descripcion(cho_chang, 'Estudiante de Ravenclaw, conocida por su relación con Cedric Diggory y su breve romance con Harry.').