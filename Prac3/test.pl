% Rachel Kegge - u20426586
%
% facts
%
% ------------------------ TASK 1 -------------------------
% :- write('Task 1').



married(peter, mary).
married(lilly, joseph).

ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

% rules

household(X, Y) :-
    married(Y, X).
household(X, Y) :-
    married(X, Y).


householdPet(O1, O2, P) :-
    ownsPet(O1, P),
    household(O1, O2).
householdPet(O1, O2, P) :-
    ownsPet(O2, P),
    household(O1, O2).

wanderingPet(P) :-
    ownsPet(O1, P),
    ownsPet(O2, P),
    O1 \= O2,
    household(O1, _),
    household(O2, _).


father(bill, jake).
father(bill, shelley).
father(jake, ted).
father(ron, liz).
mother(mary, jake).
mother(mary, shelley).
mother(janet, ted).
mother(shelley, liz).

siblings(X, Y) :-
    father(Z, Y),
    mother(W, Y),
    father(Z, X),
    mother(W, X),
    Z == Z,
    W == W,
    X \= Y.

%siblings(X, Y) :-
%    father(F, X),
%    father(F, Y),
%    mother(M, X),
%    mother(M, Y),
%    X \= Y.

parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).


uncleAunt(X, Y) :-
    siblings(X, Z),
    parent(Z, Y).


animal(elephant).
animal(lion).
animal(giraffe).
animal(tiger).
animal(monkey).

has_trunk(elephant).
has_mane(lion).
has_long_neck(giraffe).
has_stripes(tiger).

animal_characteristic(X, Y) :-
    animal(X),
    Y == has_trunk,
    has_trunk(X).
animal_characteristic(X, Y) :-
    animal(X),
    Y == has_mane,
    has_mane(X).
animal_characteristic(X, Y) :-
    animal(X),
    Y = has_long_neck,
    has_long_neck(X).
animal_characteristic(X, Y) :-
    animal(X),
    Y = has_stripes,
    has_stripes(X).


population(tokyo, 37400068).
population(delhi, 29399141).
population(shanghai, 26317104).
population(mumbai, 23355000).
population(beijing, 21707000).

larger_population(X, Y) :-
    population(X, Z),
    population(Y, W),
    Z > W.

capital(japan, tokyo).
capital(india, delhi).
capital(china, beijing).
capital(russia, moscow).
capital(brazil, brasilia).

% Define the continents
continent(asia, [japan, india, china]).
continent(europe, [russia]).
continent(south_america, [brazil]).

% Predicate to check if two countries are on the same continent
same_continent(X, Y) :-
    continent(Continent, Countries),
    member(X, Countries),
    member(Y, Countries),
    X \= Y,
    format('~w and ~w are both on the continent ~w.~n', [X, Y, Continent]).



course(mathematics).
course(physics).
course(chemistry).
course(computer_science).

enrolled(john, mathematics).
enrolled(john, physics).
enrolled(sarah, mathematics).
enrolled(mike, computer_science).
enrolled(mike, physics).
enrolled(emma, chemistry).
enrolled(emma, computer_science).

common_course(X, Y) :-
    enrolled(X, Z),
    enrolled(Y, Z),
    X \= Y,
    Z == Z.


getPositiveValues([], []). % Base case: empty list results in empty list

getPositiveValues([H|T], [H|Result]) :-
    H > 0,
    getPositiveValues(T, Result). % Positive value, include in result

getPositiveValues([_|T], Result) :-
    getPositiveValues(T, Result). % Non-positive value, skip it







removeDuplicates([], []).

removeDuplicates([X|Xs], [X|Result]) :- % Include the head in the result list
    removeDuplicatesHelper(X, Xs, NewXs), % Remove duplicates of X from the tail Xs
    removeDuplicates(NewXs, Result). % Recursively process the tail Xs

% Helper predicate to remove duplicates of X from the list Xs
removeDuplicatesHelper(_, [], []).

removeDuplicatesHelper(X, [X|Xs], NewXs) :- % If X is found, remove it and cont
    removeDuplicatesHelper(X, Xs, NewXs).

removeDuplicatesHelper(X, [Y|Xs], [Y|NewXs]) :- % If X !found, include Y and cont
    X \= Y, % Ensure X and Y are not equal
    removeDuplicatesHelper(X, Xs, NewXs).






duplicateMaker([], _, []). % Base case: an empty list results in an empty list

duplicateMaker([H|T], Element, [H, Element|Result]) :- % dupe X if match element
    H =:= Element, % Check if X is equal to the Element
    duplicateMaker(T, Element, Result). % Recursively process the tail Xs

duplicateMaker([H|T], Element, [H|Result]) :- % Include X without duplication
    H =\= Element, % Check if X is not equal to the Element
    duplicateMaker(T, Element, Result). % Recursively process the tail Xs


% Define helper predicates (member, append, reverse) if not already defined

% Base case: if the input list is empty, the result is also empty
stripNegativesAndZerosDuplicatePositives([], []).

% If the head of the list is negative or zero, skip it and continue with the tail
stripNegativesAndZerosDuplicatePositives([H|T], Result) :-
    H =< 0,
    stripNegativesAndZerosDuplicatePositives(T, Result).

% If the head of the list is positive, duplicate it and continue with the tail
stripNegativesAndZerosDuplicatePositives([H|T], [H,H|Result]) :-
    H > 0,
    stripNegativesAndZerosDuplicatePositives(T, Result).



doublePositiveElements([], []).

doublePositiveElements([H|T], Result) :-
    H =< 0,
    doublePositiveElements(T, Result).

doublePositiveElements([H|T], [H,H|Result]) :-
    H > 0,
    doublePositiveElements(T, Result).


removeNegatives([],[]).

removeNegatives([H|T], [H|Result]) :-
    H >= 0,
    removeNegatives(T, Result).

removeNegatives([H|T], Result) :-
    H < 0,
    removeNegatives(T, Result).


evenPositiveElements([],[]).

evenPositiveElements([H|T], [H|Result]) :-
    H >= 0,
    0 is H mod 2,
    evenPositiveElements(T, Result).

evenPositiveElements([_|T], Result) :-
    evenPositiveElements(T, Result).






negativeOddEl([], []).

negativeOddEl([H|T], [H|Result]) :-
    H < 0,
    1 is H mod 2,
    negativeOddEl(T, Result).

negativeOddEl([_|T], Result) :-
    negativeOddEl(T, Result).


addPos([], 0).

addPos([H|T], X) :-
    H > 0,
    addPos(T, W),
    X is H + W.

addPos([_|T], X) :-
    addPos(T, X).



getEverySecondValue([], []).

getEverySecondValue([H], []).


%getEverySecondValue([H|T], Result) :-


getEverySecondValue([_, M|T], [M|Result]) :-
    getEverySecondValue(T, Result).
