SELECT lecturers.fullname, disciplines.name 
FROM disciplines
JOIN lecturers ON lecturers.id = disciplines.lecturers_id 
WHERE lecturers.id = 1;

--Знайти, які курси читає певний викладач.