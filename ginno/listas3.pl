% invertir un vector
invertir([], []).

invertir([X|L], Result) :-
  invertir(L, R),
  append(R, [X], Final),
  Result = Final.

% devuelve el elemento de la posicion P
elemPos([X|_], 0, X).

elemPos([_|L], P, Result) :-
  P1 is P - 1,
  elemPos(L, P1, R),
  Result is R.

% eliminar los ceros a la izquierda de la lista
trimLeft([], []).

trimLeft([X|L], Result) :-
  X =:= 0,
  trimLeft(L, R),
  Result = R.

trimLeft([X|L], Result) :-
  Result = [X|L].

% eliminar los ceros a la derecha de la lista
trimRight([], []).

trimRight([X|L], Result) :-
  invertir([X|L], Invertido1),
  trimLeft(Invertido1, SinCeros),
  invertir(SinCeros, Invertido2),
  Result = Invertido2.

% verifica si la lista esta con elementos sucesivos [k, k+1, k+2, k+n]
% si esta vacia o tiene un solo elemento es true 

escalera([]).
escalera([_]).
escalera([X,Y|L]) :-
  X =:= Y - 1,
  escalera([Y|L]).
