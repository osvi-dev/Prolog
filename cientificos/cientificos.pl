Problema: Los investigadores y sus descubrimientos

Cinco investigadores (Alonso, Beatriz, Carlos, Diana y Eduardo) han
hecho descubrimientos importantes en cinco áreas diferentes de la
ciencia (astronomía, biología, química, física y geología) y cada uno es
originario de un país distinto (México, España, Canadá, Japón y
Alemania). Cada investigador tiene un instrumento favorito (microscopio,
telescopio, acelerador, sismógrafo y espectrómetro) y una especialidad
secundaria (botánica, genética, oceanografía, paleontología y
vulcanología).

Las siguientes pistas te ayudarán a deducir qué descubrimiento hizo cada
investigador, su país de origen, su instrumento favorito y su
especialidad secundaria:

• Carlos no es de México ni de Canadá, y no estudia biología.
• La persona que usa el telescopio es de Japón y trabaja en astronomía,
  pero no es Diana.
• Beatriz es experta en botánica y no es de España ni de Japón.
• La persona que usa el microscopio trabaja en biología y no es de
  Alemania ni de España.
• El investigador de física es de México y utiliza el acelerador.
• El especialista en genética usa el espectrómetro y no es Eduardo.
• El investigador de Canadá se dedica a la geología.
• Eduardo estudia vulcanología y no utiliza el telescopio.
• Alonso es el experto en oceanografía.
• El investigador de Alemania utiliza un sismógrafo.

Pregunta: ¿Cuál es el descubrimiento de cada investigador, su país de
origen, su instrumento favorito y su especialidad secundaria?


investigador(alonso).
investigador(beatriz).
investigador(carlos).
investigador(diana).
investigador(eduardo).

rama(astronomia).
rama(biologia).
rama(quimica).
rama(fisica).
rama(geologia).

pais(mexico).
pais(espana).
pais(cadana).
pais(japon).
pais(alemania).

instrumento(microscopio).
instrumento(telescopio).
instrumento(acelerador).
instrumento(sismografo).
instrumento(espectometro).

especialidad(botanica).
especialidad(genetica).
especialidad(oceanografia).
especialidad(paleontologia).
especialidad(vulcanologia).

restricciones:-


descubrimiento(Investigador, Rama, Pais, Instrumento, Especialidad):-
	investigador(Investigador),
	rama(Rama),
	Pais(Pais),
	instrumento(Instrumento),
	especialidad(Especialidad),

	% Pistas proporcionadas
    % 1. Carlos no es de México ni de Canadá, y no estudia biología.
    Investigador \= carlos ; (Pais \= mexico, Pais \= canada, Ramo \= biologia),

    % 2. La persona que usa el telescopio es de Japón y trabaja en astronomía, pero no es Diana.
    Instrumento \= telescopio ; (Pais = japon, Ramo = astronomia, Investigador \= diana),

    % 3. Beatriz es experta en botánica y no es de España ni de Japón.
    Investigador \= beatriz ; (Especialidad = botanica, Pais \= espana, Pais \= japon),

    % 4. La persona que usa el microscopio trabaja en biología y no es de Alemania ni de España.
    Instrumento \= microscopio ; (Ramo = biologia, Pais \= alemania, Pais \= espana),

    % 5. El investigador de física es de México y utiliza el acelerador.
    Ramo \= fisica ; (Pais = mexico, Instrumento = acelerador),

    % 6. El especialista en genética usa el espectrómetro y no es Eduardo.
    Especialidad \= genetica ; (Instrumento = espectrometro, Investigador \= eduardo),

    % 7. El investigador de Canadá se dedica a la geología.
    Pais \= canada ; Ramo = geologia,

    % 8. Eduardo estudia vulcanología y no utiliza el telescopio.
    Investigador \= eduardo ; (Especialidad = vulcanologia, Instrumento \= telescopio),

    % 9. Alonso es el experto en oceanografía.
    Investigador \= alonso ; Especialidad = oceanografia,

    % 10. El investigador de Alemania utiliza un sismógrafo.
    Pais \= alemania ; Instrumento = sismografo.

% Consulta para obtener todas las combinaciones que cumplan las condiciones
solucion(Investigador, Ramo, Pais, Instrumento, Especialidad) :-
    descubrimiento(Investigador, Ramo, Pais, Instrumento, Especialidad).



