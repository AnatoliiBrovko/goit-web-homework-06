SELECT d.name AS Discipline_name, g.name, (SELECT MAX(gb.date_of) FROM grades_book gb WHERE discipline_id = d.id) AS Last_lesson, s.fullname, gb2.grade 
FROM grades_book gb2  
JOIN disciplines d ON d.id = gb2.discipline_id 
JOIN students s ON s.id = gb2.student_id 
JOIN groups g ON g.id = s.group_id 
WHERE g.id = 1 AND d.id = 4 AND gb2.date_of = Last_lesson 
GROUP BY s.fullname;

--Оцінки студентів у певній групі з певного предмета на останньому занятті.