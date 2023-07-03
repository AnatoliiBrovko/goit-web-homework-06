SELECT students.fullname, ROUND(AVG(grades_book.grade), 2) AS averagegrade 
FROM grades_book
JOIN students ON students.id = grades_book.student_id 
GROUP BY students.fullname
ORDER BY averagegrade DESC
LIMIT 5;

--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.