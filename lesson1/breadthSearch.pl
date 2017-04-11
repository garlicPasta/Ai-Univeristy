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
        (con(Cpos, X), not(member(X, Seen))),
        Y
    ),
    append(Open, Y, OpenN),
    bfs_(OpenN, Goal,[Cpos|Seen]).

append([], R, R) .
append([H|T], R1, [H|R2]) :-
    append(T, R1, R2).

main(Argv):-
    bfsHelper(a,i).
