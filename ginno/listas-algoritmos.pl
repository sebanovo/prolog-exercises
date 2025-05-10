pares([], []).
pares([X|L], Result) :- 
	pares(L, R),
	X mod 2 =:= 0,
	Result = [X|R].

pares([_|L], Result) :-
	pares(L, R),
	Result = R.
		
del([], _, []).

del([X|L], E, Result) :-
	X =:= E, 
	del(L, E, Result).
	
del([X|L], E, [X|R]) :- del(L, E, R).

impares([], []).

impares([X|L], Result) :- 
	impares(L, R),
	X mod 2 =:= 1,
	Result = [X|R].

impares([_|L], Result) :-
	impares(L, R),
	Result = R.
	
parImpar1(L, ResultP, ResultI) :-
	pares(L, ResultP), 
	impares(L, ResultI).
	
% sin usar predicados auxiliares
parImpar2([], [], []).

parImpar2([X|L], ResultP, ResultI) :-
	X mod 2 =:= 0,
	parImpar2(L, P, I),
	ResultP = [X|P], 
	ResultI = I.

parImpar2([X|L], ResultP, ResultI) :-
	parImpar2(L, P, I),
	ResultP = P, 
	ResultI = [X|I].
	
% crear una funcion que inserte en una lista
% ya ordenada un elemento de menor a mayor
insOrd([], E, [E]).

insOrd([X|L], E, Result) :- 
	E =< X,
	Result = [E, X|L].
	
insOrd([X|L], E, [X|R]) :- 
	insOrd(L, E, R).

% insertion sort
insertSort([], []).

insertSort([X|L], Result) :- 
	insertSort(L, R), 
	insOrd(R, X, Result).

% metodo que separa un vector en 2 vectores
split(_, [], [], []).

split(P, [X|L], ResultI, ResultD) :- 
	X =< P,
	split(P, L, RI, RD),
	ResultI = [X|RI],
	ResultD = RD.

split(P, [X|L], ResultI, ResultD) :- 
	split(P, L, RI, RD),
	ResultI = RI,
	ResultD = [X|RD].

% quickSort
quickSort([], []).

quickSort([X|L], Result) :-
	split(X, L, ResultI, ResultD),
	quickSort(ResultI, RI),
	quickSort(ResultD, RD),
	append(RI, [X], R1),
	append(R1, RD, R2),
	Result = R2.

% selection-sort
% metodo que obtiene el menor elemento
menor([X], X).

menor([X|L], Result) :- 
	menor(L, R),
	X < R, 
	Result is X.
	
menor([_|L], Result) :- 
	menor(L, R), 
	Result is R.
	
% metodo que elimina un elemento de la lista
delElem([], _, []).

delElem([X|L], E, Result) :-
	X =:= E,
	Result = L.
	
delElem([X|L], E, Result) :-
	delElem(L, E, R),
	Result = [X|R].

% set menor devuelve el menor y elimina el menor
setMenor(Lista, Menor, SinMenor) :-
	menor(Lista, Menor), 
	delElem(Lista, Menor, SinMenor).

% mejorar este predicado porque provoca un ciclo infinito

selectionSort([], []).
selectionSort(Lista, Result) :-
	setMenor(Lista, Menor, SinMenor),
	selectionSort(SinMenor, R),
	Result = [Menor|R].
	