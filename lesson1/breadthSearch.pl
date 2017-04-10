#!/usr/bin/env swipl

:- initialization main.

%Facts
con(a,b).
con(a,c).
con(b,d).
con(b,e).
con(c,f).
con(c,g).
con(d,h).
con(d,i).

bfsHelper(Start, Goal):-
    bfs_([Start], Goal, [Start]).

bfs_([Cpos|Open], Goal, _):- Cpos=Goal.
bfs_([Cpos|Open], Goal, Seen):-
    write(Cpos),
    findall(
        X,
        (write(X), con(Cpos, X), not(member(X, Seen))),
        Y
    ),
    write(Y),
    merge(Open, Y, OpenN),
    bfs_(OpenN, Goal,[Cpos|Seen]).

enqueue(E,[],[E]).
enqueue(E,Q,[Q|E]).

merge([], R, R) .
merge([H|T], R1, [H|R2]) :-
    merge(T, R1, R2).

main(Argv):-
    bfsHelper(a,i).

