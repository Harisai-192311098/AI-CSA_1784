% Facts: Person's name and their date of birth (Date format: year-month-day)
dob(john, 1990, 5, 15).
dob(mary, 1985, 8, 22).
dob(alice, 1993, 12, 10).
dob(bob, 2000, 2, 5).

% Rule: Find the date of birth for a person
find_dob(Name, Year, Month, Day) :-
    dob(Name, Year, Month, Day).
