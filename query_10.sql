SELECT s.fullname AS Student_name, l.fullname AS Lecturer_name, d.name AS Disciplines
FROM grades_book gb 
JOIN disciplines d ON d.id = gb.discipline_id 
JOIN lecturers l ON l.id = d.lecturers_id 
JOIN students s ON s.id = gb.student_id 
WHERE s.id = 26 AND l.id = 1
GROUP BY d.name;

--Список курсів, які певному студенту читає певний викладач.