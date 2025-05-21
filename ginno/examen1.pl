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
entre dos elementos distintos de cero (si todos los elementos son cer
Result = Lista).
Por ejemplo: 
?- trimCenter([0,2,0,9,0,0,0,8,0,0], Result).
Result = [0,2,9,8,0,0].
*/

trimCenter([], []).
trimCenter([X], [X]).
trimCenter([X,Y], [X,Y]).

trimCenter([A|L], [A|Result]) :-
    A =\= 0,
    saltarCeros(L, R, B),
    trimCenter([B|R], Result).

trimCenter([A|L], [A|Result]) :-
    trimCenter(L, Result).

% Se salta una secuencia de ceros si van entre dos no-ceros
% saltarCeros(Entrada, RestoSinCeros, ProximoValor)
saltarCeros([0|L], Result, Proximo) :-
    saltarCeros(L, Result, Proximo).

saltarCeros([X|L], L, X) :-
    X =\= 0.

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