% Facts: Bird species and whether it can fly
can_fly(sparrow).
can_fly(eagle).
can_fly(pigeon).

% Facts: Bird species that cannot fly
cannot_fly(ostrich).
cannot_fly(penguin).
cannot_fly(emperor_penguin).

% Rule to determine if a bird can fly or not
can_fly_or_not(Bird) :-
    can_fly(Bird),
    write(Bird), write(' can fly!'), nl.

can_fly_or_not(Bird) :-
    cannot_fly(Bird),
    write(Bird), write(' cannot fly.'), nl.
