/*Sin usar ningún predicado auxiliar, escriba el predicado
delR(Lista, N , Result) (N>=0), el cual devuelva en Result,
la misma Lista, pero sin sus últimos n elementos.
Tome en cuenta que, si n es mayor a la longitud de la Lista,
Result = [].
Excepcionalmente, puede usar los predicados length(Lista, Result) y
delLast(Lista, Result), el cual devuelve en Result la misma Lista pero
sin su último elemento.
Por ejemplo:
?-delR([6,1,8], 5, Result). // 5 es mayor que la longitud de la lista
Result = []
?-delR([3,5,9], 0, Result).
Result = []
?-delR([8,1,6,2,5], 3, Result).
Result = [8,1]
*/
% eliminar ultimo elemento
delLast([], []).
delLast([_], []).
delLast([X|L], Result) :- 
  delLast(L, R),
  Result = [X|R].

delR(L, 0, L).
delR(L, N, Result) :-
  delLast(L, R), 
  N1 is N - 1,
  delR(R, N1, Final),
  Result = Final.
/*
Sin usar ninguna funci+on auxiliar, escriba la función bodd :: [Int] -> [Int],
tal que bodd lista, devuelva los elementos pares de la lista, que están después
de un número impar.
Ejemplos:
bodd [] = []
bodd [2,20,10,3] = [] 
bodd [3,5,3,8,7,2,10] = [4,2]
bodd [8] = []
*/
bodd([], []).
bodd([_], []).
bodd([X,Y|L], Result) :-
  (X mod 2 =:= 1, Y mod 2 =:= 0), 
  bodd([Y|L], R),
  Result = [Y|R].

bodd([X,Y|L], Result) :-
  (X mod 2 =:= 0; Y mod 2 =:= 1), 
  bodd([Y|L], R),
  Result = R.

/*
Escriba partir :: [Int] -> Int -> ([Int], [Int]), donde
partir lista elem, devuelve un par de listas: la primera
contiene los números que están antes de elem y la segundo,
los que están después de elem. Si elem no está en la lista,
devolver ([], []).
Asuma que la lista dada no tiene elementos duplicados
Ejemplos:
partir [] 6 = ([],[])
partir [4,1,8] 4 = ([], [1,8])
partir [3,5,9,8] 9 = ([3,5], [8])
partir [2,7,4] 5 = ([],[])
*/
existe([], _) :- !, fail.
existe([X|_], E) :-
  X =:= E,
  !.

existe([X|L], E) :-
  X =\= E,
  existe(L, E).

partir1([], _, [], []).
partir1([X|L], E, Result1, Result2) :-
  X =:= E, 
  Result1 = [],
  Result2 = L.

partir1([X|L], E, Result1, Result2) :-
  X =\= E, 
  partir1(L, E, R1, R2),
  Result1 = [X|R1],
  Result2 = R2.

partir(L, E, Result1, Result2) :- 
  not(existe(L, E)),
  Result1 = [],
  Result2 = [].

partir(L, E, Result1, Result2) :- 
  partir1(L, E, R1, R2),
  Result1 = R1,
  Result2 = R2.

% MODELOS EXTRAS:
/*
Decimos que una lista tiene perfect-positions (pp) si y solo si, los elementos pares 
se encuentran en las posiciones pares y los elementos impares en las posiciones
impares. Sin usar ningún predicaco auxiliar, escriba el predicado pp(Lista), el cual
devuelva true si y solo si la Lista dada tiene perfect-positions. Por ejemplo: 
?- pp([]).
true

?- pp([8,7,5,9]).
false // el 5 ocupa una posicion par

?- pp([2,5,4,9]).
true
*/
% version 1
pp([]).

pp([X]) :-
    X mod 2 =:= 0.

pp([X,Y|_]) :-
  (X mod 2 =:= 1 ; Y mod 2 =:= 0),
  !, 
  fail.

pp([_,_|L]) :-
  pp(L).

% version 2
pp2([]).

pp2([X]) :-
  X mod 2 =:= 0.

pp2([X,Y|L]) :-
  X mod 2 =:= 0, 
  Y mod 2 =:= 1,
  pp2(L).

/*
Escriba la función lz::[Int]->[Int], donde lz lista devuelve los elementos de la Lista, 
que aparecen después del último cero. Si la lista es vacia o no tiene ceros, 
devuelve la misma lista. Por ejemplo: 
No se permite invertir la lista. Si usted usa una función auxiliar, deberá implementarla
lz [6,1,9,8] = [6,1,9,8] // La lista no tiene ceros
lz [5,0,4,0,1,8] // [1,8] están después del último cero 
*/

% comentario: En esta ocacion si o si necesitamos comparar (X =:= 0) y (Y)
lz([], []).
lz([X|L], Result) :-
  X =:= 0,
  lz(L, R),
  Result = R.

lz([X|L], Result) :-
  X =\= 0,
  lz(L, R),
  L == R,
  Result = [X|R].

lz([_|L], Result) :-
  lz(L, R),
  Result = R.

/*
Sin usar ninguna función auxiliar, escriba la función union :: [Int] -> [Int] -> [Int], 
tal que union lista1 lista2 produzca la unión conjuntista de la lista1 con la lista2
Las listas dadas están ordenadas y sin elementos duplicados.
Es decir, la función unión debe devolver una lista conformada por los elementos de la lista1
y de la lista2, quitando los duplicados
*/
union([], L2, L2).
union(L1, [], L1).
union([X1|L1], [X2|L2], Result) :-
  X1 =:= X2,
  union(L1, L2, R),
  Result = [X1|R].

union([X1|L1], [X2|L2], Result) :-
  X1 < X2,
  union(L1, [X2|L2], R),
  Result = [X1|R].

union([X1|L1], [X2|L2], Result) :-
  X1 >= X2,
  union([X1|L1], L2, R),
  Result = [X2|R].

