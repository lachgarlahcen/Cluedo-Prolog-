woman(anne).
woman(betty).
woman(lisa).
woman(sylvie).
woman(eve).
woman(julie).
woman(valerie).

man(marc).
man(luc).
man(jean).
man(jules).
man(leon).
man(loic).
man(gerard).
man(jacques).
man(herve).
man(paul).

parent(marc, jean).
parent(marc, jules).
parent(marc, leon).
parent(anne, jean).
parent(anne, jules).
parent(anne, leon).
parent(luc, lisa).
parent(luc, loic).
parent(luc, gerard).
parent(betty, lisa).
parent(betty, loic).
parent(betty, gerard).
parent(jules, jasques).
parent(lisa, jasques).
parent(leon, herve).
parent(leon, julie).
parent(sylvie, herve).
parent(sylvie, julie).
parent(loic, paul).
parent(loic, valerie).
parent(eve, paul).
parent(eve, valerie).
married(marc, anne).
married(luc, betty).
married(jules, lisa).
married(leon, sylvie).
married(loic, eve).

husband_of(X, Y) :- 
	married(X, Y),
	man(X).
wife_of(X, Y) :-
	married(Y, X),
	woman(X).
child_of(X, Y) :-
	parent(Y, X).
father_in_law_of(X,Y):-
	man(X),
	parent(X,Z),
	married(Z,Y).
mother_in_law_of(X,Y):-
	woman(X),
	parent(X,Z),
	married(Z,Y).
ancestor_of(X, Y) :-
	parent(X, Y).
ancestor_of(X, Y) :-
	parent(X, Z),
	ancestor(Z, Y).
