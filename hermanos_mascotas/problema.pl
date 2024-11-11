% Definimos los hermanos y sus posibles mascotas
hermano(ana).
hermano(bruno).
hermano(carla).
hermano(daniel).

mascota(perro).
mascota(gato).
mascota(loro).
mascota(pez).

% Regla para asignar una mascota única a cada hermano
asignacion([
    mascota(ana, MascotaAna),
    mascota(bruno, MascotaBruno),
    mascota(carla, MascotaCarla),
    mascota(daniel, MascotaDaniel)
]) :-
    mascota(MascotaAna), mascota(MascotaBruno), mascota(MascotaCarla), mascota(MascotaDaniel),
    % Cada mascota debe ser diferente
    all_different([MascotaAna, MascotaBruno, MascotaCarla, MascotaDaniel]),

    % Pistas:
    MascotaAna \= perro,        % Ana no tiene un perro
    MascotaAna \= pez,          % Ana no tiene un pez
    MascotaBruno \= gato,       % Bruno no tiene un gato
    MascotaCarla \= pez,        % Carla no tiene un pez
    (MascotaDaniel = loro ; MascotaDaniel = pez). % Daniel tiene un loro o un pez

% Utilidad para verificar que todos los elementos de una lista son diferentes
all_different([]).
all_different([H|T]) :- \+ member(H, T), all_different(T).
