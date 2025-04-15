p :- q, !, s.
q :- a.

% Para que exista, per no influya
a :- fail.
s :- fail.

% el resultado es false
