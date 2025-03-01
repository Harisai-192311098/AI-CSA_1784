% Initial state: Monkey is on the ground and banana is on a high platform
state(at_ground, not_holding_banana).

% Actions the monkey can perform
action(walk) :- write('Monkey walks towards the banana.\n').
action(climb) :- write('Monkey climbs the platform.\n').
action(grab) :- write('Monkey grabs the banana!\n').

% Rule to solve the problem
solve :-
    action(walk),
    action(climb),
    action(grab),
    write('Monkey successfully gets the banana!').