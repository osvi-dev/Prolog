% 1. La Biblioteca Nacional tiene el libro "Don Quijote de la Mancha".
libro_en_biblioteca("Don Quijote de la Mancha", biblioteca_nacional).

% 2. Todos los libros en la Biblioteca Nacional están catalogados.
catalogado(Libro) :- libro_en_biblioteca(Libro, biblioteca_nacional).

% 3. Existen libros que están en más de una biblioteca.
libro_en_biblioteca("La Odisea", biblioteca_nacional).
libro_en_biblioteca("La Odisea", biblioteca_central).

% 4. Si un libro es raro, entonces no se puede prestar.
no_prestable(Libro) :- libro_raro(Libro).

% 5. La Biblioteca Central tiene más de 10,000 libros.
cantidad_libros(biblioteca_central, 10000).

% 6. Todos los autores tienen al menos un libro en una biblioteca.
autor_con_libro(Autor) :- libro_de_autor(Libro, Autor), libro_en_biblioteca(Libro, _).

% 7. Existe un autor que tiene más de 5 libros publicados.
libros_de_autor(autor_famoso, ["Libro1", "Libro2", "Libro3", "Libro4", "Libro5", "Libro6"]).

% 8. No todos los libros de la biblioteca están en buen estado.
buen_estado("Libro Antiguo") :- fail. % Algunos libros no están en buen estado.

% 9. Si un libro está en buen estado, puede ser prestado.
prestado(Libro) :- buen_estado(Libro).

% 10. Todos los usuarios registrados pueden tomar prestado un libro.
puede_prestamo(Usuario) :- usuario_registrado(Usuario).

% 11. Existen libros que solo se pueden consultar en la biblioteca.
solo_consulta("Enciclopedia Universal").

% 12. Todo libro prestado debe ser devuelto en 15 días.
devolucion(Libro, Dias) :- prestado(Libro), Dias =< 15.

% 13. Hay un libro que nadie ha pedido en préstamo.
no_pedido_en_prestamo("Libro Olvidado").

% 14. Si un usuario tiene una multa, no puede pedir un libro prestado.
no_prestamo(Usuario) :- tiene_multa(Usuario).

% 15. Todos los libros escritos por un mismo autor están en la misma sección.
seccion_de_autor(Autor, Seccion) :- 
    libro_de_autor(Libro, Autor), 
    seccion(Libro, Seccion).

% 16. Existe un libro que tiene más de un ejemplar en la biblioteca.
ejemplares("Libro Popular", 2).

% 17. Todo usuario con más de tres préstamos debe devolver uno para pedir otro.
limite_prestamos(Usuario) :- 
    prestamos_actuales(Usuario, N), 
    N > 3.

% 18. Hay una sección de la biblioteca donde todos los libros son de ciencias.
seccion_ciencias("Seccion Ciencias").
es_de_ciencias(Libro) :- seccion(Libro, "Seccion Ciencias").

% 19. No todos los libros en la biblioteca tienen más de 100 páginas.
mas_de_100_paginas("Pequeño Poemario") :- fail. % Ejemplo de libro con menos de 100 páginas.

% 20. Existe un usuario que ha tomado prestados todos los libros de la sección infantil.
todos_los_libros_prestados(Usuario, "Seccion Infantil") :- 
    usuario_registrado(Usuario), 
    forall(seccion(Libro, "Seccion Infantil"), prestado_a(Libro, Usuario)).
