p([X|L]) :- 
  write("X="), writeln(X), 
  write("L"), write(L).

q([X, Y|L]) :- 
  write("X="), writeln(X),
  write("Y="), writeln(Y),
  write("L="), write(L).
  
% 1. calcular la suma de de los números de la lista
suma([], 0).

suma([X|L], Result) :- 
  suma(L, R),
  Result is X + R. 

% 2. obtiene la longitud de la lista
longitud(L, Result) :- 
  L=:=[], 
  Result is 0.

longitud([_|L], Result) :- 
  longitud(L, R),
  Result is R + 1. 

% 3. Obtiene el enesimo numero de fibonacci 
fibonacci(1, Result) :- Result is 0, !.
fibonacci(2, Result) :- Result is 1, !.
fibonacci(X, Result) :- N1 is X - 1, N2 is X - 2, fibonacci(N1, R1), fibonacci(N2, R2), Result is R1 + R2.

% 4. Obtiene la frecuencia del numero 
frecuencia([], _, 0).
frecuencia([X|L], E, Result) :- 
  X =:= E,
  frecuencia(L, E, R),
  Result is R + 1.

frecuencia([_|L], E, Result) :- 
  frecuencia(L, E, R),
  Result is R.

% 5. Obtiene el número mayor 
mayor([X,_], X).

mayor([X|L], Result) :- 
  mayor(L, R),
  X > R,
  Result is X.

mayor([_|L], Result) :-
  mayor(L, R),
  Result is R.

% 6. Obtiene el número menor
% NOTA EN ESTE EJERCICIO SI O SIN NECESITAMOS HACER (X < R) Y (X >= R) PORQUE PARA QUE SEAN
% Son mutuamente excluyentes y NO HALLA PROBLEMAS 
menor([X,_], X).

menor([X|L], Result) :- 
  menor(L, R),
  X < R,
  Result is X.

menor([_|L], Result) :-
  menor(L, R),
  X >= R,
  Result is R.

% 7. Obtiene el indice del elemento
indexOf(List, E, Result) :- indexOfAux(List, E, 0, Result).

indexOfAux([], _, _, -1).

indexOfAux([X|_], E, A, Result) :-
  X =:= E,
  Result is A.

indexOfAux([_|L], E, A, Result):-
  A1 is A + 1,
  indexOfAux(L,E, A1, Result).

% 8. Suma los números pares
sumaPares([], 0).

sumaPares([X|L], Result) :-
  X mod 2 =:= 0,
  sumaPares(L, R),
  Result is R + X.

sumaPares([_|L], Result) :-
  sumaPares(L, R),
  Result is R.
