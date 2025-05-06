p([X|L]) :- 
  write("X="), writeln(X), 
  write("L"), write(L).

q([X, Y|L]) :- 
  write("X="), writeln(X),
  write("Y="), writeln(Y),
  write("L="), write(L).
  
% calcular la suma de de los números de la lista
suma([], 0).

suma([X|L], Result) :- 
  suma(L, R),
  Result is X + R. 

% longitud de la lista
long(L, Result) :- 
  L=:=[], 
  Result is 0.

long([_|L], Result) :- 
  long(L, R),
  Result is R + 1. 


fib(1, Result) :- Result is 0, !.
fib(2, Result) :- Result is 1, !.
fib(X, Result) :- N1 is X - 1, N2 is X - 2, fib(N1, R1), fib(N2, R2), Result is R1 + R2.

% La frecuencia del elemento
% ?- frecuencia([1,2,3,3], 3, Result)
frec([], _, 0).
frec([X|L], E, Result) :- 
  X =:= E,
  frec(L, E, R),
  Result is R + 1.

frec([_|L], E, Result) :- 
  frec(L, E, R),
  Result is R.


% El mayor número
% ?- mayor([1,2,3,3], Result)

mayor([X,_], X).

mayor([X|L], Result) :- 
  mayor(L, R),
  X > R,
  Result is X.

mayor([_|L], Result) :-
  mayor(L, R),
  Result is R.

% El indice del elemento
% ?- indexOf([1,2,3,4], 3, Result).

indexOf(List, E, Result) :- indexOfAux(List, E, 0, Result).

indexOfAux([], _, _, -1).

indexOfAux([X|_], E, A, Result) :-
  X =:= E,
  Result is A.

indexOfAux([_|L], E, A, Result):-
  A1 is A + 1,
  indexOfAux(L,E, A1, Result).

% La suma de los pares
% ?- sumaPares([1,2,3,4,5], Result).
sumaPares([], 0).

sumaPares([X|L], Result) :-
  X mod 2 =:= 0,
  sumaPares(L, R),
  Result is R + X.

sumaPares([_|L], Result) :-
  sumaPares(L, R),
  Result is R.
