p([X|L]) :- write("X="), writeln(X), 
            write("L"), write(L).

q([X, Y|L]) :- write("X="), writeln(X),
               write("Y="), writeln(Y),
               write("L="), write(L).
  
% calcular la suma de de los números de la lista
suma(L, Result) :- L=[], Result is 0.
suma([X|L], Result) :- suma(L, R),
                       Result is X + R. 

% calcular la longitud de la lista
long(L, Result) :- L=[], Result is 0.
long([_|L], Result) :- long(L, R),
                       Result is R + 1. 


fib(1, Result) :- Result is 0, !.
fib(2, Result) :- Result is 1, !.
fib(X, Result) :- N1 is X - 1, N2 is X - 2, fib(N1, R1), fib(N2, R2), Result is R1 + R2.