--CONSULTA 1
SELECT student_name,student_email,completion_percentage FROM enrollments
WHERE course_title = 'Intro to Python';

---CONSULTA 2
SELECT * fROM enrollments
WHERE completion_percentage < 10;

--CONSULTA 3
SELECT * FROM enrollments
WHERE instructor IS NULL;

--CONSULTA 4
SELECT * FROM enrollments
WHERE passed = false
ORDER BY completion_percentage DESC
LIMIT 5;

--CONSULTA 5
SELECT *
FROM enrollments
WHERE enrollment_date >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY enrollment_date DESC;
--CONSULTA 6
INSERT INTO enrollments (
    id, 
    student_id, 
    student_name, 
    student_email, 
    course_id, 
    course_title, 
    category, 
    enrollment_date, 
    completion_percentage, 
    passed, 
    monthly_fee_paid, 
    instructor
) VALUES (
    18, 
    3, 
    'Lucia Fernandes', 
    'lucia.fernandes@student.edutrack.com', 
    5, 
    'Advanced Python', 
    'Programming', 
    '2025-04-01', 
    0, 
    false, 
    69.99, 
    'Carlos Vega'
);

--CONSULTA 7
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;

--CONSULTA 8
--primero la consulta:
SELECT * 
FROM enrollments 
WHERE student_email ILIKE '%@test.com';
--luego el DELETE:
DELETE FROM enrollments 
WHERE student_email ILIKE '%@test.com';
--CONSULTA 9
SELECT category, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY category;

--CONSULTA 10
SELECT course_title, AVG(completion_percentage) AS average_completion
FROM enrollments
GROUP BY course_title
ORDER BY average_completion ASC;

--CONSULTA 11
SELECT course_title, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;

--CONSULTA 12
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;



