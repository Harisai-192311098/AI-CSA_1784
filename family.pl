% Facts: parent(Parent, Child)
parent(john, mary).  % John is Mary's parent
parent(john, paul).  % John is Paul's parent
parent(mary, anna).  % Mary is Anna's parent
parent(mary, james). % Mary is James' parent
parent(paul, sophia).% Paul is Sophia's parent
parent(james, lucy). % James is Lucy's parent

% Facts: gender(Male/Female)
gender(john, male).
gender(mary, female).
gender(paul, male).
gender(anna, female).
gender(james, male).
gender(lucy, female).
gender(sophia, female).

% Rule to find if X is a parent of Y
is_parent(X, Y) :- parent(X, Y).

% Rule to find if X is a mother of Y
is_mother(X, Y) :- parent(X, Y), gender(X, female).

% Rule to find if X is a father of Y
is_father(X, Y) :- parent(X, Y), gender(X, male).

% Rule to find siblings (two people have the same parents)
are_siblings(X, Y) :-
    parent(P, X), parent(P, Y), X \= Y.

% Rule to find grandparents
is_grandparent(X, Y) :-
    parent(X, Z), parent(Z, Y).

% Rule to find uncles and aunts
is_uncle_or_aunt(X, Y) :-
    parent(P, Y), are_siblings(X, P).

% Rule to find cousins
are_cousins(X, Y) :-
    parent(P1, X), parent(P2, Y), are_siblings(P1, P2).
