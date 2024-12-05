% Problema 1: Los guardianes de los templos
guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

templo(fuego).
templo(agua).
templo(tierra).
templo(aire).

% Apolo no cuida el templo de fuego ni el de tierra.
restriccionTemplo(apolo, fuego).
restriccionTemplo(apolo, tierra).

% Hécate no cuida el templo de aire.
restriccionTemplo(hecate, aire).

% Ares no cuida el templo de agua ni de aire.
restriccionTemplo(ares, agua).
restriccionTemplo(ares, aire).

% Hermes cuida el templo de fuego o de agua.
restriccionTemplo(hermes, tierra).
restriccionTemplo(hermes, aire).

% Cada templo debe tener solo un guardian.
solucionTemplos(Guardian) :-
    Guardian = [guardian(apolo, T1),
                  guardian(hecate, T2),
                  guardian(ares, T3),
                  guardian(hermes, T4)],
    templo(T1), templo(T2), templo(T3), templo(T4),
    T1 \= T2, T1 \= T3, T1 \= T4,
    T2 \= T3, T2 \= T4,
    T3 \= T4,
    \+ restriccionTemplo(apolo, T1),
    \+ restriccionTemplo(hecate, T2),
    \+ restriccionTemplo(ares, T3),
    \+ restriccionTemplo(hermes, T4).

% output: solucionTemplos(Guardian).
% Asinacion = [guardian(apolo, aire), guardian(hecate, fuego), guardian(ares, tierra), guardian(hermes, agua)].

% Problemas 2: Las armas de los héroes Cuatro héroes mitológicos

heroe(aquiles).
heroe(perseo).
heroe(hercules).
heroe(teseo).

arma(espada).
arma(lanza).
arma(arco).
arma(escudo).


% Aquiles no usa el escudo ni el arco.
restriccionHeroe(aquiles, escudo).
restriccionHeroe(aquiles, arco).

% Perseo no usa la espada.
restriccionHeroe(perseo, espada).

% Hercules no usa la lanza ni el escudo.
restriccionHeroe(hercules, lanza).
restriccionHeroe(hercules, escudo).

% Teseo usa el arco o el escudo.
restriccionHeroe_teseo(T) :- T \= arco, T \= escudo.

% Cada heroe usa solamente una arma.
solucionArmas(Heroe) :-
    Heroe = [heroe(aquiles, A1),
                  heroe(perseo, A2),
                  heroe(hercules, A3),
                  heroe(teseo, A4)],
    arma(A1), arma(A2), arma(A3), arma(A4),
    A1 \= A2, A1 \= A3, A1 \= A4,
    A2 \= A3, A2 \= A4,
    A3 \= A4,
    \+ restriccionHeroe(aquiles, A1),
    \+ restriccionHeroe(perseo, A2),
    \+ restriccionHeroe(hercules, A3),
    (A4 = arco; A4 = escudo).

% Consulta la solución

% output: solucionArmas(Heroe).
% Heroe = [heroe(aquiles, espada), heroe(perseo, lanza), heroe(hercules, arco), heroe(teseo, escudo)] 

% Problema 3: Las gemas de los titanes Cuatro titanes
titan(cronos).
titan(oceano).
titan(hiperion).
titan(japeto).

gemas(zafiro).
gemas(rubi).
gemas(esmeralda).
gemas(diamante).

restriccionTitan(cronos, zafiro).
restriccionTitan(cronos, diamante).
restriccionTitan(oceano, rubi).
restriccionTitan(hiperion, zafiro).
restriccionTitan(hiperion, rubi).
restriccionTitan(japeto, diamante).
restriccionTitan(japeto, esmeralda).

solucionGemas(Titan):-
    Titan = [titan(cronos, G1),
                  titan(oceano, G2),
                  titan(hiperion, G3),
                  titan(jepeto, G4)],
    Gema(G1), Gema(G2), Gema(G3), Gema(G4),
    G1 \= G2, G1 \= G3, G1 \= G4,
    G2 \= G3, G2 \= G4,
    G3 \= G4,
    \+ restriccionTitan(cronos, G1),
    \+ restriccionTitan(oceano, G2),
    \+ restriccionTitan(hiperion, G3),
    \+ restriccionTitan(jepeto, G4).
  
