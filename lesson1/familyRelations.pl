
%Facts
man(jakob).
man(holger).
man(fabian).
man(hubert).
woman(hermine).
woman(sabine).
woman(susie).
woman(helga).

father(holger, jakob).
father(hubert, fabian).
father(gerhardt, susie).
father(gerhardt, holger).
father(gerhardt, hubert).
mother(sabine, jakob).
mother(helga, susie).
mother(helga, holger).
mother(helga, hubert).

%Rules
sibling(X,Y):-
    father(A,X),father(A,Y),
    mother(B,X),mother(B,Y).
brother(X,Y):-
    sibling(X,Y),
    man(X).
sister(X,Y):-
    sibling(X,Y),
    woman(X).
uncle(X,Y):- brother(X,Z), parent(Z,Y).
aunt(X,Y):- sister(X,Z), parent(Z,Y).
cousin(X,Y):-
    parent(Z,X), uncle(Z,Y);
    parent(Z,X), aunt(Z,Y).
parent(X,Y):- father(X,Y); mother(X,Y).
parents(X,Y):-
    father(X,Z), mother(Y,Z);
    father(Y,Z), mother(X,Z).
grandmother(X,Y):-mother(X,Z),parents(Z,Y).
grandfather(X,Y):-father(X,Z),parents(Z,Y).
