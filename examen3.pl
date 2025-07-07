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