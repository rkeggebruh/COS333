% Rachel Kegge - u20426586
%
% facts
%
% ------------------------ TASK 1 -------------------------

%father(joe, jane).
%father(joe, dan).
%father(bill, ted).
%father(dan, alice).
%mother(mary, jane).
%mother(mary, dan).
%mother(jane, ted).
%mother(linda, alice).

%parent(X, Y) :- father(X, Y).
%parent(X, Y) :- mother(X, Y).

%sibling(X, Y) :-
%    parent(Z, X),
%    parent(Z, Y),
%    X \= Y.
%
%cousin(X, Y) :-
%    parent(Z, X),
%    parent(W, Y),
%    sibling(Z, W),
%    X \= Y.


father(bill, jake).
father(bill, shelley).
father(jake, ted).
father(ron, liz).

mother(mary, jake).
mother(mary, shelley).
mother(janet, ted).
mother(shelley, liz).

parent(X, Y):- mother(X, Y).
parent(X, Y):- father(X, Y).

sibling(X, Y) :-
    mother(M1, X),
    father(F1, X),
    mother(M, Y),
    father(F, Y),
    M1 = M,
    F1 = F,
    X \= Y.

uncleAunt(X, Y) :-
    parent(P, Y),
    sibling(P, X),
    P \= X,
    X \= Y,
    P \= Y.



sumNonNegativeValues([], 0).

sumNonNegativeValues([H|T], X) :-
    H >= 0,
    sumNonNegativeValues(T, Result),
    X is H + Result.

sumNonNegativeValues([_|T], X) :-
   % H < 0,
    sumNonNegativeValues(T, X).



removeNegatives([], []).

removeNegatives([H|T], [H|Res]) :-
    H >= 0,
    removeNegatives(T, Res).

removeNegatives([H|T], Res) :-
    H < 0,
    removeNegatives(T, Res).


dupeNegatives([], []).

dupeNegatives([H|T], [H,H|Res]) :-
    H < 0,
    dupeNegatives(T, Res).

dupeNegatives([H|T], Res) :-
    H >= 0,
    dupeNegatives(T, Res).



addPositives([], 0).

addPositives([H|T], X) :-
    H >= 0,
    addPositives(T, Sums),
    X is H + Sums.

addPositives([_|T], X) :-
    addPositives(T, X).




%getEverySecondValue([], []).

%getEverySecondValue([_, Sec|T], [Sec|Result]) :-
%    getEverySecondValue(T, Result).

%getEverySecondValue([_], []).




getSecifPos([], []).

getSecifPos([_, Sec|T], [Sec|Result]) :-
    Sec >= 0,
    getSecifPos(T, Result).

getSecifPos([_], []).

getSecifPos([_, Sec|T], Result) :-
    Sec < 0,
    getSecifPos(T, Result).


longer([], [_|_]).
longer([_|T1], [_|T2]) :-
    longer(T1, T2).



getPosVals([], []).

getPosVals([H|T], [H|Result]) :-
    H >= 0,
    getPosVals(T, Result).

getPosVals([H|T], Result) :-
    H < 0,
    getPosVals(T, Result).


posValsSum([], 0).

posValsSum([H|T], X) :-
    H >= 0,
    posValsSum(T, Sum),
    X is Sum + H.

posValsSum([_|T], X) :-
    posValsSum(T, X).


secVal([], []).

secVal([_, Sec|T], [Sec|Result]) :-
    secVal(T, Result).

secVal([_], []).


married(peter, mary).
married(lilly, joseph).
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

spouse(X, Y) :-
    married(X, Y).
spouse(X, Y) :-
    married(Y, X).


household(X, Y) :-
    spouse(X, Y).

householdPet(O1, O2, P) :-
    ownsPet(O1, P),
    household(O1, O2).

householdPet(O1, O2, P) :-
    ownsPet(O2, P),
    household(O1, O2).

wanderingPet(P) :-
    householdPet(X, Y, P),
    householdPet(X1, Y1, P),
    X \= X1,
    Y \= Y1,
    Y \= X1,
    X \= Y1.


stripNegativesAndZerosDuplicatePositives([], []).

stripNegativesAndZerosDuplicatePositives([H|T], [H,H|Res]) :-
    H > 0,
    stripNegativesAndZerosDuplicatePositives(T, Res).

stripNegativesAndZerosDuplicatePositives([_|T], Res) :-
    stripNegativesAndZerosDuplicatePositives(T, Res).






course(cos151).
course(cos132).
course(cos110).
course(cos212).
course(cos222).
prerequisite(cos151, cos132).
prerequisite(cos132, cos110).
prerequisite(cos110, cos212).
passed(joe, cos151).

allowedToReg(X, Y) :-
    passed(X, P),
    prerequisite(P, Y),
    course(Y).
