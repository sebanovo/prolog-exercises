% 1. Obtiene los pares de la lista
pares([], []).
pares([X|L], Result) :- 
	pares(L, R),
	X mod 2 =:= 0,
	Result = [X|R].

pares([_|L], Result) :-
	pares(L, R),
	Result = R.

% 2. Devuelve los impares de la lista
impares([], []).

impares([X|L], Result) :- 
	impares(L, R),
	X mod 2 =:= 1,
	Result = [X|R].

impares([_|L], Result) :-
	impares(L, R),
	Result = R.

% 4. Obtiene los pares y los impares de la lista
% 4.1. usando los predicados auxiliares
parImpar1(L, ResultP, ResultI) :-
	pares(L, ResultP), 
	impares(L, ResultI).

% 4.2 sin usar predicados auxiliares
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

% 5. Elimina los elementos E de la lista
del([], _, []).

del([X|L], E, Result) :-
	X =:= E, 
	del(L, E, Result).
	
del([X|L], E, [X|R]) :- del(L, E, R).


/*
6. Crear una funcion que inserte en una lista
ya ordenada un elemento de menor a mayor
(inserta de forma ordenada)
*/
insOrd([], E, [E]).

insOrd([X|L], E, Result) :- 
	E =< X,
	Result = [E, X|L].
	
insOrd([X|L], E, [X|R]) :- 
	insOrd(L, E, R).

% 7. Insertion sort
insertSort([], []).

insertSort([X|L], Result) :- 
	insertSort(L, R), 
	insOrd(R, X, Result).

/*
8. Metodo que separa la lista en 2 listas,  
ResultI = la posicion de los elementos <= de P
ResultD = la posicion de los elementos > de P
*/
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

% 9. QuickSort
quickSort([], []).

quickSort([X|L], Result) :-
	split(X, L, ResultI, ResultD),
	quickSort(ResultI, RI),
	quickSort(ResultD, RD),
	append(RI, [X], R1),
	append(R1, RD, R2),
	Result = R2.

% 10. Metodo que elimina un solo elemento de la lista
delElem([], _, []).

delElem([X|L], E, Result) :-
	X =:= E,
	Result = L.
	
delElem([X|L], E, Result) :-
	delElem(L, E, R),
	Result = [X|R].

% 11. Elimina el menor elemento
setMenor(Lista, Menor, SinMenor) :-
	menor(Lista, Menor), 
	delElem(Lista, Menor, SinMenor).

% 12. SelectionSort 
selectionSort([], []).
selectionSort(Lista, Result) :-
	setMenor(Lista, Menor, SinMenor),
	selectionSort(SinMenor, R),
	Result = [Menor|R].
	
% Nota: Arreglar el seletionSort provoca ciclo infinito (creo)