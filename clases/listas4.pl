% 1. reemplaza un elemento A, por otro B
replace([], _, _, []).

replace([X|L], A, B, Result) :-
  X =:= A,
  replace(L, A, B, R),
  Result = [B|R].

replace([X|L], A, B, Result) :-
  replace(L, A, B, R),
  Result = [X|R].

% 2. obtenerPrim(n) devuelve la lista con los primeros n elmentos
obtenerPrim(_, 0, []).

obtenerPrim([X|L], N, Result) :-
  N1 is N - 1,
  obtenerPrim(L, N1, R),
  Result = [X|R].

% 3. obtenerUlt(n) devuelve la lista con los ultimos n elmentos
obtenerUlt(_, 0, []). % caso base 1

obtenerUlt([X|L], N, Result) :- % caso base 2
  length([X|L], Length),
  N =:= Length,
  Result = [X|L].

obtenerUlt([_|L], N, Result) :-
  obtenerUlt(L, N, R),
  Result = R.

% 4. eliminarPrim(n) elimina los primeros n elementos 
eliminarPrim(L, 0, L).

eliminarPrim([_|L], N, Result) :-
  N1 is N - 1,
  eliminarPrim(L, N1, R),
  Result = R.

% 5. eliminarUlt(N) elimina los ultimos n elementos 
eliminarUlt(L, N, Result) :-
  length(L, Length),
  N1 is Length - N,
  obtenerPrim(L, N1, R),
  Result = R.