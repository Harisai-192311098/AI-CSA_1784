% Facts about the current weather conditions
weather(sunny).
weather(warm).

% Rules (Inference)
plan(picnic) :-
    weather(sunny),
    weather(warm).

plan(stay_indoors) :-
    weather(rainy).

plan(wear_jacket) :-
    weather(cold).

% Forward chaining: Applying rules until a plan is inferred
forward_chaining :-
    (plan(Activity) ->
        format('You should: ~w\n', [Activity]);
        format('No suitable plan found.\n')
    ).

% Start the forward chaining process
run_forward_chaining :-
    forward_chaining.
