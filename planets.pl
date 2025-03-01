% Facts: planet(Name, DistanceFromSun (in millions of km), NumberOfMoons, Diameter (in km), Type)
planet(mercury, 57.91, 0, 4879, terrestrial).     % 57.91 million km
planet(venus, 108.2, 0, 12104, terrestrial).      % 108.2 million km
planet(earth, 149.6, 1, 12742, terrestrial).      % 149.6 million km
planet(mars, 227.9, 2, 6779, terrestrial).        % 227.9 million km
planet(jupiter, 778.5, 79, 139820, gas_giant).    % 778.5 million km
planet(saturn, 1433.5, 82, 116460, gas_giant).    % 1433.5 million km
planet(uranus, 2872.5, 27, 50724, ice_giant).     % 2872.5 million km
planet(neptune, 4495.1, 14, 49244, ice_giant).    % 4495.1 million km
planet(pluto, 5906, 5, 2376, dwarf_planet).       % 5906 million km

% Rule: Find the type of a planet
find_planet_type(Planet, Type) :-
    planet(Planet, _, _, _, Type).

% Rule: Find the number of moons of a planet
find_number_of_moons(Planet, Moons) :-
    planet(Planet, _, Moons, _, _).

% Rule: Find the diameter of a planet
find_planet_diameter(Planet, Diameter) :-
    planet(Planet, _, _, Diameter, _).

% Rule: Find the distance from the sun of a planet
find_distance_from_sun(Planet, Distance) :-
    planet(Planet, Distance, _, _, _).

% Rule: Find all planets of a certain type (e.g., gas giants)
find_planets_by_type(Type, Planet) :-
    planet(Planet, _, _, _, Type).
