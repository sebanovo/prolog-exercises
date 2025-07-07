/*
11. Usando el predicado write("*"), escriba un predicado
asteriscos(N), el cual siempre devuelva true, pero muestre en
consola N asteriscos (N >= 0). Por ejemplo:
?- asteriscos(4).
****
*/

asteriscos(X) :- 
  X =< 0,
  !.

asteriscos(X) :- 
  write("*"),
  X1 is X - 1,
  asteriscos(X1).


/*
12. Usando el predicado writeln(Var), escriba un
predicado ladder(Ini, Fin), (Ini≤Fin), el cual siempre devuelva
true, pero muestre en consola Ini, Ini+1, …,Fin . Por ejemplo:
?- ladder(5, 9).
5
6
7
8
9
*/

ladder(Ini, Fin)  :-  % caso base
  Ini > Fin,
  !.

ladder(Ini, Fin) :-
  writeln(Ini),
  Ini1 is Ini + 1,
  ladder(Ini1, Fin).

/*
13. Identico al ejercicio anterior, pero mostrando en orden
inverso. Por ejemplo:
?- ladderInv(5, 9).
9
8
7
6
5
*/

ladderInv(Ini, Fin)  :-  % caso base
  Ini > Fin,
  !.

ladderInv(Ini, Fin) :-
  writeln(Fin),
  Fin1 is Fin - 1,
  ladderInv(Ini, Fin1).

/*
14. Escriba un predicado tieneDivisores(N, Ini, Fin), (Ini <= Fin),
el cual devuelva true si y solo si, N tiene algún divisor entre
[Ini, Fin]. Por ejemplo:
?- tieneDivisores(20, 6, 11)
true
//Porque entre el 6 y el 11 hay divisores de 20 (el 10).
?- tieneDivisores(50, 11, 20)
false
//Porque entre el 11 y el 20 no hay divisores de 50.
Recuerde que un número entero D es divisor de un número entero N, si y solo
si, N mod D=0.
*/
tieneDivisores(_, Ini, Fin) :- % caso base
  Ini > Fin,
  !,
  fail.

tieneDivisores(N, Ini, _) :-
  N mod Ini =:= 0,
  !.

tieneDivisores(N, Ini, Fin) :-
  Ini1 is Ini + 1,
  tieneDivisores(N,Ini1, Fin).

/*
15. Usando el predicado anterior, escriba el predicado
primo(N), (N >= 2), el cual devuelva true si y solo si N es un
número primo.
Recuerde que un número N es primo, si y solo si, es divisible solamente entre
el 1 y N.
*/
primo(N) :-
  N < 2,
  !,
  fail.

primo(N) :-
  N1 is N - 1,
  not(tieneDivisores(N, 2, N1)).

/*
16. Escriba un predicado frec(Lista, N, Result), el cual
devuelva en Result, la cantidad de veces que aparece N en la
Lista. Por ejemplo:
?-frec([5, 7, 6, 5 ], 5, Result).
Result=2 //5 aparece 2 veces en la lista.
*/

frec([], _, 0) :- !. % caso base

frec([X|L], N, Result) :-
  frec(L, N, R),
  X =:= N,
  Result is R + 1.

frec([_|L], N, Result) :-
  frec(L, N, R),
  Result is R.

/*
17. Escriba un predicado delK(Lista, K), el cual devuelva en
Result, la misma Lista, pero sin su K-ésimo elemento. Por
ejemplo:
?- delK([4, 8, 6, 9], 3, R).
R=[4, 8, 9] //Se eliminó el 3er elemento.
?- delK([8, 5, 9], 1, R).
R=[5, 9] //Se eliminó el 1er elemento.
*/

delK([], _, []) :- !. % caso base
delK([_|L], K, Result) :- % caso base
  K =< 1, 
  Result = L.

delK([X|L], K, Result) :-
  K1 is K - 1,
  delK(L, K1, R),
  Result = [X|R].

/*
18. Asumiendo que la Lista dada tiene al menos dos
elementos, escriba un predicado penultimo(Lista, Result), el
cual devuelva en Result, el penúltimo elemento de la Lista.
Por ejemplo:
?- penultimo([1, 2, 7, 8, 9 ], Result).
Result = 8
Si usted utiliza un predicado auxiliar, deberá implementarlo.
*/

penultimo([X,_], Result) :-  % caso base
  Result is X,
  !.

penultimo([_|L], Result) :- 
  penultimo(L, R), 
  Result is R.

/*
19. Escriba un predicado delLast(Lista, Last, Result), el cual
devuelva en Last, el último elemento de la Lista y en Result la
Lista original, pero sin su último elemento. Por ejemplo:
?- delLast([4, 7, 6, 3 ], Last, Result).
Last=3
Result=[4, 7, 6]
La Lista debe tener al menos un elemento.
*/

delLast([X], X, []) :- !.

delLast([X|L], U, [X|R]) :-
  delLast(L, U, R).

/*
20. Escriba un predicado swapFL(Lista, Result), el cual
devuelva en Result, la misma Lista, pero con el último y primer
elemento intercambiados. Por ejemplo:
?- swapFL([4, 7, 6, 3 ], Result).
Result=[3, 7, 6, 4]
Sugerencia: Puede usar el predicado anterior.
*/

swapFL([], []).
swapFL([X], [X]). 
swapFL([X|L], Result) :-
  delLast(L, Last, R),
  append(R, [X], Resultado),
  Result = [Last|Resultado].
/*
21. Escriba un predicado todosPares(Lista), el cual devuelva
true, si y solo sí la Lista dada tiene solamente números pares.
Por ejemplo:
?- todosPares([2, 5, 8, 9 ]).
false
?- todosPares([8, 2, 4, 2]).
true
La Lista debe tener al menos un elemento.
*/
todosPares([]). % caso base

todosPares([X|_]) :-
  X mod 2 =\= 0,
  !,
  fail.

todosPares([_|L]) :- todosPares(L).
/*
22. Sin utilizar ningún predicado auxiliar, escriba un
predicado zipSort(Lista1, Lista2, Min, Max), el cual, dadas dos
listas de enteros de igual longitud, devuelve en las listas Min y
Max, el menor y mayor de los elementos de la misma posición.
Por ejemplo:
?- zipSort([9,6,8], [3,12,2], Min, Max).
Min=[3, 6, 2] Max=[9, 12, 8]
?- zipSort([5,5,4,15], [2,20,4,10], Min, Max).
Min=[2, 5, 4, 10] Max=[5, 20, 4, 15])
*/

zipSort([], [], [], []).

zipSort([X1|L1], [X2|L2], Min, Max) :-
  X1 < X2, 
  zipSort(L1, L2, RMin, RMax),
  Min = [X1|RMin],
  Max = [X2|RMax].

zipSort([X1|L1], [X2|L2], Min, Max) :-
  zipSort(L1, L2, RMin, RMax),
  Min = [X2|RMin],
  Max = [X1|RMax].

/*
23. Implemente el predicado left(Lista, N, Result), el cual
devuelva en la lista Result, los primeros N elementos de Lista.
Por ejemplo:
?- left([2, 7, 6, 9 ], 3, Result).
Result=[2, 7, 6] //Result=los primeros 3 elementos de la Lista.
*/

left([], _, []). % caso base
left(L, 0, L). % caso base
left([X|_], 1, [X]). % caso base

left([X|L], N, Result) :-
  N1 is N - 1,
  left(L, N1, R),
  Result = [X|R].

/*
24. Implemente el predicado right(Lista, N, Result), el
cual devuelva en la lista Result, los últimos N elementos
de Lista. Por ejemplo:
?- right([2, 7, 6, 9 ], 2, Result).
Result=[6, 9] //Result=los últimos 2 elementos de la Lista.
*/

right(L, N, Result) :-
  length(L, Length),
  N1 is Length - N,
  right1(L, N1, R),
  Result = R.

right1([], _, []).
right1([X|L], N, Result) :-
  N =< 0,
  Result = [X|L].

right1([_|L], N, Result) :-
  N1 is N - 1,
  right1(L, N1, R),
  Result = R.

/*
25. Implemente el predicado split(Lista, M1, M2), el
cual devuelva en la lista M1, la primera mitad de la Lista
y, en M2 la segunda mitad. Por ejemplo:
?- split([2, 7, 6, 9 ], M1, M2).
M1=[2,7]
M2=[6, 9]
?- split([4, 2, 8, 9, 1], M1, M2).
M1=[4, 2]
M2=[8, 9, 1]
Si la longitud de la Lista es impar, M1 tendrá un elemento menos que
M2.
*/
split(L, M1, M2) :-
  length(L, Int),
  Mitad is Int // 2,
  split1(L, Mitad, M1, M2).

split1(L, 0, [], L).
split1([X|L], Mitad, M1, M2) :-
  Mitad1 is Mitad - 1,
  split1(L, Mitad1, RM1, RM2),
  M1 = [X|RM1],
  M2 = RM2.