% Facts: fruit_color(Fruit, Color)
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grapes, purple).
fruit_color(orange, orange).
fruit_color(kiwi, green).
fruit_color(lemon, yellow).
fruit_color(strawberry, red).
fruit_color(blueberry, blue).
fruit_color(peach, orange).
fruit_color(cherry, red).

% Rule: Find the color of a given fruit
find_fruit_color(Fruit, Color) :-
    fruit_color(Fruit, Color).
