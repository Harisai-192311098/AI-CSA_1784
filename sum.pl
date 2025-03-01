% Base case: The sum of 1 to 0 is 0
sum(0, 0).

% Recursive case: Sum of 1 to N is N + sum of 1 to N-1
sum(N, Result) :-
    N > 0,
    N1 is N - 1,
    sum(N1, TempResult),
    Result is N + TempResult.
