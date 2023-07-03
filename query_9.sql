SELECT s.fullname, d.name 
FROM grades_book gb 
JOIN students s ON s.id = gb.student_id
JOIN disciplines d ON d.id = gb.discipline_id 
WHERE s.id = 5
GROUP BY d.name;

--Знайти список курсів, які відвідує студент.