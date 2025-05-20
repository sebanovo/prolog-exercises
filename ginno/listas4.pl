% reemplaza un elemento A, por otro B
replace([], _, _, []).

replace([X|L], A, B, Result) :-
  X =:= A,
  replace(L, A, B, R),
  Result = [B|R].

replace([X|L], A, B, Result) :-
  replace(L, A, B, R),
  Result = [X|R].

% obtenerPrim(n) devuelve la lista con los primeros n elmentos
obtenerPrim(_, 0, []).

obtenerPrim([X|L], N, Result) :-
  N1 is N - 1,
  obtenerPrim(L, N1, R),
  Result = [X|R].

% obtenerUlt(n) devuelve la lista con los primeros n elmentos
obtenerUlt(_, 0, []). % caso base 1

obtenerUlt([X|L], N, Result) :- % caso base 2
  length([X|L], Length),
  N =:= Length,
  Result = [X|L].

obtenerUlt([_|L], N, Result) :-
  obtenerUlt(L, N, R),
  Result = R.