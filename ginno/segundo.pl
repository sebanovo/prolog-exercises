p :- !, q, s.
p.
q :- a.

% Para que a exista, pero no influya
a :- fail.
s :- fail.

% El resultado es false