hijo(jose_antonio).
hijo(osvaldo).

hijo(salvador).
hijo(tony).
hijo(chavita).

hijo(erick).

hijo(isidro).
hijo(jair).
hijo(daniel).

hijo(juan).
hijo(juanito).


hijo(jose).

hijo(telli).

hijo(manuel).
hijo(lalo).
hijo(eitan).

hijo(josep).

hijo(cacheton).

hijo(emerick).
hijo(emilio).

hijo(pato).
hijo(isai).

hija(patricia).
hija(fatima).

hija(gabriela).
hija(gaby_chiquita).

hija(mary).
hija(regina).

hija(yaya).
hija(natalia).

hija(ana).
hija(lucero).

hija(cristina).
hija(jennifer).
hija(evelyn).

hija(anita).
hija(michelle).
hija(alexa).

hija(china).
hija(isabella).

hija(estefani).
hija(soff).

hija(hermila).
hija(miriam).
hija(ailin).
hija(yareli).

hija(jazmin).
hija(sarahi).

hija(xochilt_hija).

padre(jose).
padre(jose_antonio).
padre(salvador).

padre(isidro_abuelo).
padre(isidro).
padre(juan).

padre(jaime).
padre(felix).
padre(vidal).
padre(nacho).
padre(miguel).
padre(edgar).
padre(angel).
padre(hugo).
padre(luis).
padre(javier).

madre(teresa).

madre(rafaela).
madre(patricia).

madre(gabriela).
madre(yaya).
madre(gaby_chiquita).
madre(mary).

madre(ana).
madre(anita).
madre(lucero).
madre(cristina).


madre(erika).
madre(china).

madre(estefani).

madre(hermila).
madre(miriam).

madre(xochilt).

padrede(jose, jose_antonio).
padrede(jose, salvador).
padrede(jose, hermila).

padrede(jose_antonio, osvaldo).
padrede(jose_antonio, fatima).

padrede(salvador, tony).
padrede(salvador, xochilt_hija).
padrede(salvador, chavita).


padrede(isidro_abuelo, patricia).
padrede(isidro_abuelo, isidro).
padrede(isidro_abuelo, erick).
padrede(isidro_abuelo, juan).
padrede(isidro_abuelo, gabriela).
padrede(isidro_abuelo, ana).

padrede(isidro, daniel).
padrede(isidro, jair).
padrede(isidro, china).
padrede(isidro, estefani).

padrede(juan, juanito).

padrede(jaime, jose).
padrede(jaime, anita).
padrede(jaime, lucero).
padre(jaime, cristina).

padrede(felix, telli).
padrede(felix, yaya).
padrede(felix, mary).
padrede(felix, gaby_chiquita).


padrede(vidal, manuel).
padrede(vidal, lalo).
padrede(vidal, eitan).

padrede(nacho, josep).
padrede(nacho, evelyn).
padrede(nacho, jennifer).

padrede(miguel, cacheton).
padrede(miguel, alexa).
padrede(miguel, michelle).

padrede(edgar, emerick).
padrede(edgar, emilio).
padrede(edgar, soff).

padrede(angel, isai).
padrede(angel, ailin).
padrede(angel, yareli).

padrede(hugo, isabella).

padrede(luis, natalia).
padrede(luis, pato).

padrede(javier, jazmin).
padrede(javier, miriam).
padrede(javier, sarahi).

madrede(teresa, jose_antonio).
madrede(teresa, hermila).
madrede(teresa, salvador).

madrede(rafaela, patricia).
madrede(rafaela, erick).
madrede(rafaela, juan).
madrede(rafaela, isidro).
madrede(rafaela, ana).
madrede(rafaela, gabriela).

madrede(patricia, osvaldo).
madrede(patricia, fatima).

madrede(gabriela, mary).
madrede(gabriela, yaya).
madrede(gabriela, telli).
madrede(gabriela, gaby_chiquita).

madrede(yaya, natalia).
madrede(yaya, pato).

madrede(mary, regina).

madrede(ana, anita).
madrede(ana, lucero).
madrede(ana, jose).
madrede(ana, cristina).

madrede(anita, michelle).
madrede(anita, alexa).

madrede(lucero, manuel).
madrede(lucero, eitan).
madrede(lucero, lalo).

madrede(cristina, evelyn).
madrede(cristina, jennifer).
madrede(cristina, josep).

madrede(erika, jair).
madrede(erika, daniel).
madrede(erika, china).
madrede(erika, estefani).

madrede(china, isabella).

madrede(estefani, emerick).
madrede(estefani, emilio).
madrede(estefani, soff).

madrede(hermila, sarahi).
madrede(hermila, miriam).
madrede(hermila, jazmin).

madrede(miriam, ailin).
madrede(miriam, yareli).
madrede(miriam, isai).

madrede(xochilt, xochilt_hija).
madrede(xochilt, chavita).
madrede(xochilt, tony).

abuelo(X,Y):- padrede(X,Z), padrede(Z,Y); padrede(X,Z), madrede(Z,Y).
abuela(X,Y):- madrede(X,Z), padrede(Z,Y); madrede(X,Z), madrede(Z,Y).
nieto_nieta(Y,X):- padrede(X,Z), padrede(Z,Y); madrede(X,Z), madrede(Z,Y).
hermano_hermana(A,B):- padrede(X,A), padrede(X,B); madrede(X,A), madrede(X,B).
tio_tia(B,C):- hermano_hermana(A,B), padrede(A,C); hermano_hermana(A,B), madrede(A,C).