SELECT groups.name, students.fullname  
FROM groups 
JOIN students ON students.group_id = groups.id
WHERE groups.id = 2
GROUP BY students.fullname;

--Знайти список студентів у певній групі.