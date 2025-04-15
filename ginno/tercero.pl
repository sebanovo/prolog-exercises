q :- a, b, c.
q :- p, s.
q.
p :- !, b, c.
p :- c.
a. 
b :- fail.
c.
s :- fail.