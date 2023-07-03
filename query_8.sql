SELECT l.fullname, d.name, ROUND(AVG(gb.grade), 2) AS averagegrade
FROM grades_book gb 
JOIN disciplines d ON d.id  = gb.discipline_id  
JOIN lecturers l ON l.id = d.lecturers_id
WHERE l.id = 2
GROUP BY d.name;

--Знайти середній бал, який ставить певний викладач зі своїх предметів.