% Facts: Each disease has associated symptoms
% Format: disease(DiseaseName, [List_of_Symptoms]).

disease(flu, [fever, cough, sore_throat, headache]).
disease(cold, [cough, sore_throat, runny_nose]).
disease(covid, [fever, cough, difficulty_breathing, fatigue]).
disease(allergy, [sneezing, itchy_eyes, runny_nose]).

% Facts: Some symptoms are common across diseases
common_symptom(cough).
common_symptom(sore_throat).
common_symptom(runny_nose).

% Rule: Diagnose disease based on symptoms
diagnose(Disease) :-
    disease(Disease, Symptoms),
    ask_user(Symptoms).

% Rule: Ask the user about the symptoms and check them
ask_user([]).
ask_user([Symptom | Rest]) :-
    ask(Symptom),
    ask_user(Rest).

% Ask the user whether they have the symptom
ask(Symptom) :-
    format('Do you have the symptom ~w? (yes/no): ', [Symptom]),
    read(Response),
    (Response == yes ; Response == y).

% Rule to print the diagnosis
diagnosis :-
    write('Please answer the following questions with "yes" or "no".\n'),
    (diagnose(Disease) -> 
        format('You may have ~w. Please consult a doctor for confirmation.\n', [Disease]);
        write('No diagnosis found. Please consult a doctor.\n')).

