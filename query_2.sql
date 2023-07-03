SELECT disciplines.name, students.fullname, ROUND(AVG(grades_book.grade), 2) AS averagegrade 
FROM grades_book
JOIN students ON students.id = grades_book.student_id
JOIN disciplines ON disciplines.id = grades_book.discipline_id
where disciplines.id = 5
GROUP BY students.fullname
ORDER BY averagegrade DESC
LIMIT 1;

--Знайти студента із найвищим середнім балом з певного предмета.