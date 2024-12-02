
eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input), % Lee la entrada del usuario 
	eliza(Input),!. % Procesa la entrada.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

% Definición de templates (patrones) que Eliza usa para reconocer frases y generar respuestas.
% Cada template tiene una estructura de palabras para identificar las frases del usuario
% y una respuesta predefinida. IndStim indica los índices de palabras que se van a
% reemplazar dinámicamente en la respuesta.

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

% template para los sentimientos
template([estoy, triste, '.'], ['¿Por', que, estas, triste, '?', '¿Quieres', hablar, de, ello, '?'], []).
template([me, siento, feliz, '.'], ['¡Eso', es, maravilloso, '!', 'Cuentame', mas, sobre, lo, que, te, hace, 'feliz.'], []).
template([quien, eres, '?'], ['Soy Eliza', tu, 'chatbot.', 'Estoy', aquí, para, 'ayudarte.'], []).
template([que, puedes, hacer, '?'], ['Puedo', conversar, contigo, responder, preguntas, y, tratar, de, 'ayudarte.'], []).
template([tengo, un, problema, '.'], ['¿Que', tipo, de, problema, 'tienes?', 'Estoy', aquí, para, 'ayudarte.'], []).

template([que, piensas, de, mi, '?'], ['Pienso', que, deberias, de, tomar, una, ducha, eres, de, sistemas], []).

% Recomendaciones
template(['Eliza', recomiendame, una, cancion, '.'], ['Te', recomiendo, la, cancion, de, 'La ciudad de las luces de latin mafia'], []).
template([eliza, recomiendame, una, cancion, '.'], ['Te', recomiendo, la, cancion, de, 'La ciudad de las luces de latin mafia'], []).
template(['Eliza', recomiendame, una, serie, '.'], ['Te', recomiendo, 'The Office.'], []).
template([eliza, recomiendame, una, serie, '.'], ['The Office es una muy buena serie la recomiendo.'], []).
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


template(_, ['Please', explain, a, little, more, '.'], []). 
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

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

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

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.

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

gustosEliza() :- likes(X).