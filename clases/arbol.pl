% Primer nivel (esto es un comentario de linea)
padre(adan, cain).
padre(adan, abel).  %abel no tiene hijos
padre(adan, set).

% Segundo nivel
padre(cain, pepe).
padre(cain, jose).
padre(cain, josefo).
padre(cain, joselo).

padre(set, saul).
padre(set, samuel).
padre(set, sanson).

% Tercer nivel
padre(pepe, pablo).
padre(pepe, pedro).

padre(jose, javier).
padre(jose, jacob).
padre(jose, juan).
padre(jose, jorge).

padre(saul, saulo).
padre(saul, sancho).

padre(sanson, sara).
padre(sanson, dalila).

% Cuarto nivel
padre(pablo, zenon).
padre(pablo, zoe).

% Ejercicios hechos en clases
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

abuelo(X, Y) :- padre(X, Z), padre(Z, Y).


% 2 formas

nieto1(X, Y) :- padre(Y, Z), padre(Z, X).
nieto2(X, Y) :- abuelo(Y, X).

hermano(X, Y) :- padre(Z, X), padre(Z, Y), (X \= Y). % X no puede ser unificado solo funciona si x != y esta al final porque X, Y son hechos

tio(X, Y) :- hermano(X, Z), padre(Z, Y).

% 2 formas
primo1(X, Y) :- hermano(Z, W), padre(Z, X), padre(W, Y).
primo2(X, Y) :- tio(W, X), tio(Z, Y), padre(Z, X), padre(W, Y).

tieneHijos(X) :- padre(X,Y).
sinHijos(X) :- not(tieneHijos(X)).

% recursivo
ancestro(X, Y) :- padre(X, Y).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).
