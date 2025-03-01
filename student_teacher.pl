% Facts: subject_teacher_subjectname_subjectcode(Teacher, SubjectName, SubjectCode)
subject_teacher_subjectname_subjectcode('Dr. Smith', math, 'MATH101').
subject_teacher_subjectname_subjectcode('Dr. Johnson', science, 'SCI102').
subject_teacher_subjectname_subjectcode('Prof. Lee', history, 'HIST103').
subject_teacher_subjectname_subjectcode('Ms. Davis', english, 'ENG104').

% Rule: Find the teacher for a given subject
find_teacher_by_subject(SubjectName, Teacher) :-
    subject_teacher_subjectname_subjectcode(Teacher, SubjectName, _).

% Rule: Find the subject code for a given subject
find_subject_code_by_name(SubjectName, SubjectCode) :-
    subject_teacher_subjectname_subjectcode(_, SubjectName, SubjectCode).

% Rule: Find subject, teacher, and code for a given teacher
find_subject_and_code_by_teacher(Teacher, SubjectName, SubjectCode) :-
    subject_teacher_subjectname_subjectcode(Teacher, SubjectName, SubjectCode).
