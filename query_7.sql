SELECT g.name, d.name, s.fullname, gb.grade 
FROM grades_book gb 
JOIN disciplines d ON d.id = gb.discipline_id 
JOIN students s ON s.id = gb.student_id 
JOIN groups g ON g.id = s.group_id 
WHERE gb.discipline_id = 4 AND s.group_id = 1
GROUP BY s.fullname;

--Знайти оцінки студентів в окремій групі з певного предмета.