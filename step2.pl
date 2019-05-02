member(X, [X | _]).
member(X,[_|Y]) :- member(X,Y).

rightTo(L, R, [L,R | _]).
rightTo(L, R, [_ | Rest]) :-
	rightTo(L, R, Rest).
nextTo(X, Y, List) :-
	rightTo(X, Y, List).
nextTo(X, Y, List) :-
	rightTo(Y, X, List).

solution(Houses, FishOwner) :-
	Houses = [[house,norwegian,_,_,_,_],_,[house,_,_,_,milk,_],_,_],
	/*
   	* The Norwegian lives in the first house. 
	* The person living in the center house drinks milk.
	*/
	member([house,englishman,_,_,_,red], Houses),
	/*
	* The Englishman lives in the red house.
	*/
	member([house,swede,dog,_,_,_], Houses),
	/*
	* The Swede has dogs.
	*/
	member([house,dane,_,_,tea,_], Houses),
	/*
	*  The Dane drinks tea.
	*/
	rightTo([house,_,_,_,_,green], [house,_,_,_,_,white], Houses),
	/*
	* The green house is to the left of the white house.
	*/
	member([house,_,_,_,coffee,green], Houses),
	/*
	*  The owner of the green house drinks coffee.
	*/
	member([house,_,bird,pallmall,_,_], Houses),
	/*
	* The person who smokes Pall Mall has birds.
	*/
	member([house,_,_,dunhill,_,yellow], Houses),
	/*
	* The owner of the yellow house smokes Dunhill.
	*/
	nextTo([house,_,_,dunhill,_,_], [house,_,horse,_,_,_], Houses),
	/*
	* The man who has a horse is the neighbor of the one who smokes Dunhill.
	*/
	member([house,_,_,_,milk,_],Houses),
	/*
	* The person living in the center house drinks milk.
	*/
	nextTo([house,_,_,blend,_,_], [house,_,cat,_,_,_], Houses),
	/*
	* The man who smokes Blend lives next to the one who has cats.
	*/
	nextTo([house,_,_,blend,_,_], [house,_,_,_,water,_], Houses),
	/*
	* The man who smokes Blend has a neighbor who drinks water.
	*/
	member([house,_,_,bluemaster,beer,_], Houses),
	/*
	* The owner who smokes Blue Master drinks beer.
	*/
	member([house,german,_,prince,_,_], Houses),
	/*
	* The German smokes of the prince.
	*/
	nextTo([house,norwegian,_,_,_,_], [house,_,_,_,_,blue], Houses),
	/*
	*  The Norwegian lives right next to the blue house.
	*/
	member([house,FishOwner,fish,_,_,_], Houses).

