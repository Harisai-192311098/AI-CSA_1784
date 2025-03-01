% Base case: If there is only one disk, move it from Source to Destination
move(1, Source, Destination, _) :-
    write('Move disk 1 from '), write(Source), write(' to '), write(Destination), nl.

% Recursive case: Move N disks from Source to Destination using Aux as auxiliary peg
move(N, Source, Destination, Aux) :-
    N > 1,
    M is N - 1,
    move(M, Source, Aux, Destination),        % Move M disks from Source to Aux
    move(1, Source, Destination, _),          % Move the largest disk from Source to Destination
    move(M, Aux, Destination, Source).        % Move M disks from Aux to Destination

% Wrapper for the Towers of Hanoi
hanoi(N) :-
    move(N, a, c, b).  % Moving N disks from peg a to peg c using b as auxiliary
