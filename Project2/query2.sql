--CONSULTA 1
SELECT 
    students.name AS student_name, 
    courses.title AS course_title, 
    enrollments.completion_percentage
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id;

---CONSULTA 2
SELECT 
    students.name AS student_name, 
    students.email AS student_email, 
    courses.title AS approved_course_title
FROM enrollments
JOIN students ON enrollments.student_id = students.id
JOIN courses ON enrollments.course_id = courses.id
WHERE enrollments.passed = TRUE;

--CONSULTA 3
SELECT 
    courses.instructor_name, 
    AVG(enrollments.completion_percentage) AS average_completion
FROM enrollments
JOIN courses ON enrollments.course_id = courses.id
GROUP BY courses.instructor_name
ORDER BY average_completion DESC;

--CONSULTA 4
SELECT students.*
FROM students
LEFT JOIN enrollments ON students.id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

--CONSULTA 5
SELECT courses.*
FROM courses
LEFT JOIN enrollments ON courses.id = enrollments.course_id
WHERE enrollments.course_id IS NULL;

--CONSULTA 6
SELECT 
    students.id,
    students.name, 
    COUNT(enrollments.course_id) AS total_courses
FROM students
JOIN enrollments ON students.id = enrollments.student_id
GROUP BY students.id, students.name
HAVING COUNT(enrollments.course_id) > 1;

--CONSULTA 7
SELECT 
    courses.category, 
    SUM(courses.monthly_fee) AS total_potential_revenue
FROM enrollments
JOIN courses ON enrollments.course_id = courses.id
GROUP BY courses.category;

--CONSULTA 8
SELECT 
    courses.instructor_name, 
    COUNT(enrollments.student_id) AS total_students
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.instructor_name;

--CONSULTA 9
SELECT enrollments.*
FROM enrollments
LEFT JOIN students ON enrollments.student_id = students.id
WHERE students.id IS NULL;

--CONSULTA 10
SELECT enrollments.*
FROM enrollments
LEFT JOIN courses ON enrollments.course_id = courses.id
WHERE courses.id IS NULL;





