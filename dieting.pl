% Facts: food_beneficial_for_disease(Disease, Food)
food_beneficial_for_disease(diabetes, 'spinach').
food_beneficial_for_disease(diabetes, 'broccoli').
food_beneficial_for_disease(diabetes, 'almonds').
food_beneficial_for_disease(hypertension, 'bananas').
food_beneficial_for_disease(hypertension, 'potatoes').
food_beneficial_for_disease(hypertension, 'spinach').
food_beneficial_for_disease(heart_disease, 'salmon').
food_beneficial_for_disease(heart_disease, 'olive oil').
food_beneficial_for_disease(heart_disease, 'berries').

% Facts: food_harmful_for_disease(Disease, Food)
food_harmful_for_disease(diabetes, 'sugar').
food_harmful_for_disease(diabetes, 'white bread').
food_harmful_for_disease(diabetes, 'sweetened drinks').
food_harmful_for_disease(hypertension, 'salty foods').
food_harmful_for_disease(hypertension, 'processed meats').
food_harmful_for_disease(heart_disease, 'fried foods').
food_harmful_for_disease(heart_disease, 'high-fat dairy').
food_harmful_for_disease(heart_disease, 'red meat').

% Rule: Recommend foods based on the disease
recommend_diet(Disease) :-
    write('For '), write(Disease), write(' disease, the following foods are beneficial:\n'),
    recommend_beneficial_foods(Disease),
    nl,
    write('The following foods should be avoided:\n'),
    recommend_harmful_foods(Disease).

% Rule: List beneficial foods for a given disease
recommend_beneficial_foods(Disease) :-
    food_beneficial_for_disease(Disease, Food),
    write(Food), write('\n'),
    fail.  % Force backtracking to find all possible foods
recommend_beneficial_foods(_).

% Rule: List harmful foods for a given disease
recommend_harmful_foods(Disease) :-
    food_harmful_for_disease(Disease, Food),
    write(Food), write('\n'),
    fail.  % Force backtracking to find all possible foods
recommend_harmful_foods(_).

