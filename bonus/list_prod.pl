prod(X,[],[]).
prod(X,[HEAD|TAIL],L) :-  prod(X,TAIL,L1), W is X * HEAD, L = [W|L1].

prod2([],Y,[]).
prod2([HEAD|TAIL],Y,L) :- prod(HEAD,Y,L1), prod2(TAIL,Y,L2), append(L1,L2,L).
