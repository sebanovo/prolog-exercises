/*
1. Escriba una función cantDigitos :: Int -> Int,donde cantDigitos n,
devuelve la cantidad de dígitos de n (n>0). Por ejemplo:
cantDigitos 7356 = 4
*/
cantDigitos(X, Result) :-
  X < 10,
  Result is 1.

cantDigitos(X, Result) :-
  X1 is X // 10,
  cantDigitos(X1, R),
  Result is R + 1.

/*
2. Escriba una función getDigitos :: Int -> [Int],
donde getDigitos n, devuelve una lista con todos
los dígitos de n (n > 0). Por ejemplo:
getDigitos 398 = [3, 9, 8]
getDigit  os
-}
getDigitos :: Int -> [Int]
getDigitos n =
  let l = getDigitos (n `div` 10)
   in if n < 10
        then
          [n]
        else
          l ++ [n `mod` 10]
*/
getDigitos(X, Result) :-
  X < 10,
  Result = [X].

getDigitos(X, Result) :-
  X1 is X // 10,
  D is X mod 10,
  getDigitos(X1, R),
  append(R, [D], Final),
  Result = Final.

/*
3. Escriba una función pares :: Int->Int->[Int], donde
pares inicio cant //inicio es par >= 0 y cant > 0
devuelve una lista con cant números pares consecutivos, partiendo de inicio. Por ejemplo:
pares 8 5 = [8,10,12,14,16]
//A partir del 8 se generan 5 pares consecutivos
*/

pares(_, Cant, Result) :-
  Cant =:= 0,
  Result = [].

pares(Inicio, Cant, Result) :-
  Cant =:= 1,
  Result = [Inicio].

pares(Inicio, Cant, Result) :-
  Inicio1 is Inicio + 2,
  Cant1 is Cant - 1,
  pares(Inicio1, Cant1, R),
  Result = [Inicio|R].

/*
4. Se dice que una lista de enteros es un ladder (escalera),
si sus elementos tienen la forma [k, k+1, k+2, …]. Sabiendo esto,
escriba una función ladder::[Int] -> Bool, donde ladder lista,
devuelva true si y solo si, la lista dada es un ladder.
Por ejemplo:
ladder [4, 5, 6, 7] = True
ladder [8, 9, 6, 10] = False
También, son ladders, la lista vacía y la lista de un solo elemento.
*/
ladder([]).
ladder([_]).
ladder([X,Y|_]) :-
  X > Y, 
  !, 
  fail.

ladder([_,Y|L]) :-
  ladder([Y|L]).

/*
5. Escriba la función addAlt :: [Int]->Int, tal que,
addAlt lista, produzca la suma de los elementos de la lista,
pero alternando los signos (empezando con el +). Por ejemplo:
addAlt [ ] = 0
addAlt [3] = 3
addAlt [5,4,8,5,6] = 10 //5 – 4 + 8 – 5 + 6 = 10
*/
addAlt(Lista, Result) :-
    addAlt1(Lista, 1, Result).

addAlt1([], _, 0).

addAlt1([X|L], B, Result) :-
  B =:= 1,
  addAlt1(L, 0, Suma),
  Result is Suma + X.
addAlt1([X|L], _, Result) :-
  addAlt1(L, 1, Suma),
  Result is Suma - X.

/*
6. Escriba una función delete lista k, la cual devuelva la misma Lista,
pero sin su K-ésimo elemento. Por ejemplo:
        0 1  2  3
delete [4,8,10,15] 2 = [4, 8, 15] //Eliminar elemento de la posición 2.
Asuma que k es un valor entre 0 y length-1, donde length es la longitud de la lista.
*/

delete([], _, []).
delete([_|L], 0, L).
delete([X|L], K, Result) :- 
  K1 is K - 1,
  delete(L, K1, R),
  Result = [X|R].

/*
7. Definir una función insert, tal que insert list index dato
retorna la misma lista, pero insertado el dato en la posición index.
Los elementos de la posición index, se desplazarán a la (correción: derecha).
Por ejemplo,
        0 1  2 3 4 5 6          0 1  2  3 4 5 6 7
insert [8,9,10,5,7,9,0] 2 50 = [8,9,50,10,5,7,9,0]
Asuma que la lista dada tiene al menos un elemento.
*/
insert([], 0, Elem, [Elem]).
insert([X|L], 0, Elem, [Elem, X|L]).
insert([X|L], Index, Elem, Result) :- 
  Index1 is Index - 1,
  insert(L, Index1, Elem, R),
  Result = [X|R].

/*
8. Escriba una función zipMax :: [Int]->[Int]->([Int], [Int])
la cual, dadas dos listas de enteros de igual longitud,
devuelve en un par de listas (min, max), el menor y mayor de los elementos
de la misma posición. Por ejemplo:
zipMax [9,6,8] [3,12,2] = ([3, 6, 2], [9, 12, 8])
zipMax [5,5,4,15] [2,20,4,10] = ([2,5,4,10], [5, 20, 4, 15])
*/

zipMax([], [], [], []).
zipMax([X1|L1], [X2|L2], Min, Max) :-
  zipMax(L1, L2, RMin, RMax),
  X1 < X2,
  Min = [X1|RMin], 
  Max = [X2|RMax].

zipMax([X1|L1], [X2|L2], Min, Max) :-
  zipMax(L1, L2, RMin, RMax),
  Min = [X2|RMin], 
  Max = [X1|RMax].

/*
9. Implemente una función right lista n,
la cual devuelva los n últimos elementos de la lista.
Por ejemplo:
right [2, 7, 6, 9 ] 2 = [6, 9]
right [8, 9, 1, 4, 6] 5 = [8, 9, 1, 4, 6]
*/
right(L, N, Result) :-
  length(L, Int),
  N1 is Int - N,
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
10. Definir una función delFirst, tal que
delFirst list n la cual devuelve la misma lista list, 
pero sin sus primeros n elementos. Por ejemplo,
delFirst [6,9,1,2,7,9,0] 3 = [2,7,9,0] //Quitar los 3 primeros.
delFirst [3,8,4,2,7] 5 = []
*/
delFirst([], _, []).
delFirst(L, 0, L).
delFirst([_|L], N, Result) :-
  N =< 0,
  Result = L.

delFirst([_|L], N, Result) :-
  N1 is N - 1,
  delFirst(L, N1, R),
  Result = R.


/*
11. Definir una función delLast, tal que
delLast list n la cual devuelve la misma lista list,
pero sin sus últimos n elementos. Por ejemplo,
delLast [6,9,1,2,7,9,0] 3 = [6,9,1,2] //Quitar  
delLast [3,8,4,2,7] 5 = []
*/

delLast(L, N, Result) :-
  delLast1(L, N, [], Result).

delLast1([], _, Ac, Ac).
delLast1([X|L], N, Ac, Result) :- 
  length([X|L], Int),
  Int =:= N,
  Result = Ac.

delLast1([X|L], N, Ac, Result) :- 
  append(Ac, [X], R),
  delLast1(L, N,  R, Result).

/*
12. Escriba una función indexOf :: [Int]->Int->Int, donde IndexOf lista e,
devuelva la posición, donde se encuentra e en la lista; pero si e no existe, devuelve –1.
Por ejemplo:
         0 1 2 3 4 5
indexOf [6,3,4,9,2,8] 2 = 4 //El 2 se encuentra en la posición 4.
indexOf [2,3,4,9,0,5] 7 = –1 //El 7 no se encuentra en la lista.
Asuma que la lista dada no tiene elementos duplicados.
*/
indexOf(List, E, Result) :- indexOf1(List, E, 0, Result).

indexOf1([], _, _, -1).

indexOf1([X|_], E, A, Result) :-
  X =:= E,
  Result is A.

indexOf1([_|L], E, A, Result):-
  A1 is A + 1,
  indexOf1(L,E, A1, Result).

/*
13. Definir una función ordenada, tal que
ordenada lista
devuelva true, si y solo si la lista está ordenada (de menor a mayor). Por ejemplo:
ordenada [ ] = true //La lista vacía es una lista ordenada.
ordenada [1,9,10,20,60] = true
ordenada [3,4,6,2,9,10] = false
*/

ordenada([]).
ordenada([_]).
ordenada([X,Y|_]) :-
  X > Y, 
  !, 
  fail.

ordenada([_,Y|L]) :-
  ordenada([Y|L]).

/*
14. Escriba la función masFrecuente :: [Int]->Int, tal que
masFrecuente lista, es el elemento que más veces aparece en la lista dada. Por ejemplo:
masFrecuente [8,7,4,8,7,8] = 8
masFrecuente [1,1,4,1,3,8,1,3] = 1
Por comodidad, asuma que la lista no está vacía y que en esta lista hay un solo elemento más frecuente.
*/
frecuencia([], _, 0).
frecuencia([X|L], Elem, Result) :-
  X == Elem,
  frecuencia(L, Elem, R),
  Result is R + 1.

frecuencia([_|L], Elem, Result) :-
  frecuencia(L, Elem, R),
  Result is R.

masFrecuente(L, Result) :-
  masFrecuente1(L, L, Result).

masFrecuente1(_, [], -1).
masFrecuente1(_, [X], X).
masFrecuente1(Original, [X|L], Result) :-
  masFrecuente1(Original, L, R),
  frecuencia(Original,R, M1), 
  frecuencia(Original,X, M2), 
  M1 < M2, 
  Result is X.

masFrecuente1(Original, [_|L], Result) :-
  masFrecuente1(Original, L, R),
  Result is R.

/*
15. Una lista L es subconjunto de una lista P, si todos los elementos de L están en la lista P.
Por definición, una lista vacía es subconjunto de cualquier lista.
Sabiendo esto, definir una función subset::[Int]->[Int]->Bool, tal que
subset list1 list2 devuelva true si y solo si la list1 es subconjunto de la list2. Por ejemplo,
subset [2, 5, 4] [3, 4, 9, 2, 5, 8] = true
subset [3, 9, 6] [3, 4, 9, 2, 5, 8] = false //Falta el 6
subset [ ] [6,9,8] = true //La lista vacía es subconjunto de cualquier lista.
*/
existeElemento([], _) :- !, fail.
existeElemento([X|_], Elem) :- X =:= Elem.
existeElemento([_|L], Elem) :- existeElemento(L, Elem).


subset([], _).
subset([X|_], L2) :- 
  not(existeElemento(L2, X)),
  !, 
  fail.

subset([_|L], L2) :-  
  subset(L, L2).

/*
16. Decimos que dos listas son equivalentes, si ambas tienen los mismos elementos,
sin importar cuantas veces se repiten en sus respectivas listas. Sabiendo esto,
escriba la función equivalentes::[Int]->[Int]->Bool, donde equivalentes list1 list2
devuelva true si y solo si la list1 es equivalente a la list2. Por ejemplo:

equivalentes [ ] [ ] = true
equivalentes [2, 5, 4, 2] [4, 4, 2, 5, 2, 2] = true
equivalentes [1, 6, 1, 6, 6, 1] [1, 6] = true
equivalentes [8,8,6,3,1] [8,6,8,1,2] = false
equivalentes [9,9,6,6,2,4] [2,6,9,4,7] = false
*/
equivalentes(L1, L2) :-
  subset(L1, L2),
  subset(L2, L1).

/*
17. Definir una función segmento, tal que segmento m n list
es la lista de los elementos de list comprendidos entre las posiciones m y n. Por ejemplo,
segmento 3 4 [8,9,1,2,7,9,0] = [2,7]
segmento 2 5 [3,4,1,2,7,9,0] = [1,2,7,9]
*/
segmento(M, N, L, Result) :-
  segmento1(0, M, N, L, Result).

segmento1(_, _ , _, [], []).
segmento1(Index, M, N, [X|L], Result) :-
  Index >= M, 
  Index =< N,
  Index1 is Index + 1,
  segmento1(Index1, M, N, L, R),
  Result = [X|R].

segmento1(Index, M, N, [_|L], Result) :-
  Index1 is Index + 1,
  segmento1(Index1, M, N, L, R),
  Result = R.

/*
18. Escriba la función posMenor :: [Int]->Int,
la cual, dada una lista no-vacía y sin elementos repetidos,
calcule la posición del elemento menor. Por ejemplo:
posMenor [6,3,4,9,2,5] = 4 //2 es el menor y está en la pos. 4.
*/

menor([X], X).
menor([X|L], Result) :-
  menor(L, Men),
  X < Men,
  Result is X.
menor([X|L], Result) :-
  menor(L, R),
  X >= R,
  Result is R.

posMenor(L, Result) :-
  menor(L, Menor),
  indexOf(L, Menor, Result).