% Facts: Define edges with their corresponding cost
edge(a, b, 4).
edge(a, c, 3).
edge(b, d, 5).
edge(b, e, 12).
edge(c, f, 8).
edge(d, g, 7).
edge(e, h, 2).
edge(f, i, 6).
edge(g, j, 10).

% Heuristic values (Estimated cost to goal)
heuristic(a, 10).
heuristic(b, 6).
heuristic(c, 8).
heuristic(d, 5).
heuristic(e, 2).
heuristic(f, 7).
heuristic(g, 3).
heuristic(h, 1).
heuristic(i, 4).
heuristic(j, 0).  % Goal node

% Best First Search Algorithm
best_first_search(Start, Goal, Path) :-
    best_first([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

% If goal is reached, return the path
best_first([[Goal | Rest] | _], Goal, [Goal | Rest]).

% Expand the best path and continue searching
best_first([[Node | Path] | OtherPaths], Goal, FinalPath) :-
    findall([Next, Node | Path],
            (edge(Node, Next, _), \+ member(Next, [Node | Path])),
            NewPaths),
    append(OtherPaths, NewPaths, UpdatedPaths),
    sort_paths_by_heuristic(UpdatedPaths, SortedPaths),
    best_first(SortedPaths, Goal, FinalPath).

% Sort paths based on the heuristic value of the first node in each path
sort_paths_by_heuristic(Paths, SortedPaths) :-
    get_heuristic_list(Paths, HeuristicPairs),
    sort_heuristic_list(HeuristicPairs, SortedPairs),
    extract_paths(SortedPairs, SortedPaths).

% Get heuristic values for each path
get_heuristic_list([], []).
get_heuristic_list([[Node | Rest] | Paths], [(H, [Node | Rest]) | HeuristicPairs]) :-
    heuristic(Node, H),
    get_heuristic_list(Paths, HeuristicPairs).

% Simple sorting based on heuristic values (Selection Sort)
sort_heuristic_list(List, Sorted) :- sort_heuristic(List, [], Sorted).

sort_heuristic([], Acc, Acc).
sort_heuristic(List, Acc, Sorted) :-
    select_min(List, Min, Rest),
    sort_heuristic(Rest, [Min | Acc], Sorted).

% Select the path with the minimum heuristic value
select_min([X], X, []).
select_min([(H1, P1), (H2, P2) | Rest], Min, [(H2, P2) | NewRest]) :-
    H1 =< H2, !, select_min([(H1, P1) | Rest], Min, NewRest).
select_min([(H1, P1), (H2, P2) | Rest], Min, [(H1, P1) | NewRest]) :-
    select_min([(H2, P2) | Rest], Min, NewRest).

% Extract only paths from sorted (H, Path) pairs
extract_paths([], []).
extract_paths([(_, Path) | Rest], [Path | Paths]) :-
    extract_paths(Rest, Paths).