SELECT l.fullname AS Lecturers_name, s.fullname AS Students_name, AVG(gb.grade) AS averagegrade 
FROM grades_book gb 
JOIN students s ON s.id = gb.student_id 
JOIN disciplines d ON d.id = gb.discipline_id 
JOIN lecturers l ON l.id = d.lecturers_id 
WHERE l.id = 5 AND s.id = 44
GROUP BY Students_name;

--Середній бал, який певний викладач ставить певному студентові.