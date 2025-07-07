% 1. Pregunta de Arbol de refutación
/*
2.
Sin usar ningun predicado auxiliar, escriba el predicado
ins(Lista, E, Dato, Result), el cual devuelva
en Result, la misma Lista, pero con los Dato insertados
antes de los E de la lista, Si E no existe, Result = Lista.
*/

ins([], _, _, []).

ins([X|L], E, Dato, Result) :- 
    X =:= E, 
    ins(L, E, Dato, R),
    Result = [Dato, X|R].

ins([X|L], E, Dato, Result) :- 
    ins(L, E, Dato, R),
    Result = [X|R].

/*
3. 
Escriba un predicado trimCenter(Lista, Result), el cual devuelva
en Result la misma Lista, pero quitando los ceros que están 
entre dos elementos distintos de cero (si todos los elementos son cero
Result = Lista).
Por ejemplo: 
?- trimCenter([0,2,0,9,0,0,0,8,0,0], Result).
Result = [0,2,9,8,0,0].
*/

% auxiliar salta los ceros a la izquierda sino tiene elemento falla
saltarCeros([], _) :- !, fail. % si esta vacio retornar fail 
saltarCeros([X|L], Proximo, Result) :-
    X =:= 0,
    saltarCeros(L, Proximo, Result).

saltarCeros([X|L],X, L) :-
    X =\= 0.

trimCenter([], []).

trimCenter([X|L], Result) :-
    X =\= 0,
    saltarCeros(L, Prox, S),
    trimCenter([Prox|S], R),
    Result = [X|R].

trimCenter([X|L], Result) :-
    trimCenter(L, R),
    Result = [X|R].

% Se salta una secuencia de ceros si van entre dos no-ceros

/*
4. Escriba un predicado odd(Lista), el cual devuelva true, si y solo si todos los elementos impares
ocupan las posiciones impares (Si no hay elementos impares), devolver True). 
*/

odd(L) :- oddAux(L, 0).

oddAux([], _).
oddAux([X|_], Index) :-
  X mod 2 =:= 1,
  Index mod 2 =:= 0,
  !, 
  fail.

oddAux([_|L], Index) :-
  SigIndex is Index + 1,
  oddAux(L, SigIndex).