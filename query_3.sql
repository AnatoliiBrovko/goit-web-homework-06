SELECT disciplines.name AS disciplines_name, groups.name AS groups_name, ROUND(AVG(grades_book.grade), 2) AS averagegrade 
FROM grades_book
JOIN students ON students.id = grades_book.student_id
JOIN groups ON groups.id = students.group_id
JOIN disciplines ON disciplines.id = grades_book.discipline_id
where disciplines.id = 5
GROUP BY groups.name;

--Знайти середній бал у групах з певного предмета