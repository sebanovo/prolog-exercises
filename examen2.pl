/*
PREGUNTA 1:
Sin usar ninguna función auxiliar, definir una función delFirst :: [Int] -> Int -> [Int],
tal que delFirst lista n (donde n >= 0) devuelve la misma lista, pero sin sus primeros
n elementos. Tome en cuenta que, si n es mayor o igual a la longitud de la lista,
devuelve la lista vacía.
Excepcionalmente, puede usar la función length de Haskell.
Ejemplos:
delFirst [6,9,1,2,7,9,0] 3 = [2,7,9,0] // Quitar los 3 primeros.
delFirst [3,8,4,2,7] 9 = [] // 9 es mayor a la longitud de la lista
*/
delFirst([], _ , []).
delFirst(L, 0, L).
delFirst([_|L], N, Result) :-
  N =<  0,
  Result = L.

delFirst([_|L], N, Result) :-
  N1 is N - 1,
  delFirst(L, N1, R),
  Result = R.

/*
PREGUNTA 2:
En una lista sin elementos duplicados, definirmos la distancia entre dos elementos
b y c, como la cantidad de elementos que se deben recorrer hacia la derecha, partiendo de b para llegar a c.
Escriba la función dist :: [Int] -> Int -> Int -> Int, donde dist lista b c, devuelva la distancia entre b y c,
en la lista dada. Si b o c no están en la lista o partiendo de b y moviéndose a la derecha no se puede alcanzar a c,
devolver -1.
Ejemplos:
dist [] 7 9 = -1 // los elementos 7 y 9 no existen en la lista.
dist [9,6,3,8,1,2,5] 6 2 = 4 // Partiendo del 6 y moviéndonos a la derecha, alcanzamos el 2 recorriendo 4 elementos.
*/
distancia([], _, -1).
distancia([X|_], E, Result) :-
  X =:= E,
  Result is 1.
distancia([X|L], E, Result) :-
  X =\= E,
  distancia(L, E, R),
  Result is R + 1.

dist([], _ , _ -1).
dist(L, B, C, Result) :-
  distancia(L, B, B1),
  distancia(L, C, C1),
  R is C1 - B1,
  (R < 0 ; B1 =:= -1 ; C1 =:= -1),
  Result is -1.

dist(L, B, C, Result) :-
  distancia(L, B, B1),
  distancia(L, C, C1),
  R is C1 - B1,
  Result is R.

/*
PREGUNTA 3:
Escriba una función sucN :: Int -> Int -> Int, donde sucN n inicio
devuelve el n-ésimo (n > 0) término de una sucesión que empieza en inicio.
Los términos se van generando sumando el término anterior con un valor
el cual empieza en uno y se incrementa en + 1, entre dos términos.
Ejemplos:
sucN 3 10 = 13 // 10 11 13 (3 términos de la suc. empezando en 10)
sucN 4 6 = 12 // 6 7 9 12
*/
sucN(N, Inicio, Result) :-
  N =< 1,
  Result is Inicio. 

sucN(N, Inicio, Result) :-
  N1 is N - 1,
  Inicio1 is Inicio + (N - 1),
  sucN(N1, Inicio1, R),
  Result is R.
