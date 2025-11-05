
-- Students Table

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    class_id INT
);

INSERT INTO Students VALUES
(1, 'Amit', 101),
(2, 'Priya', 102),
(3, 'Rahul', 101),
(4, 'Sneha', 103),
(5, 'Vikas', NULL);
SELECT * FROM Classes;
SELECT * FROM Students;
-- Classes Table

CREATE TABLE Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50),
    teacher_id INT
);

INSERT INTO Classes VALUES
(101, 'Mathematics', 201),
(102, 'Science', 202),
(103, 'English', 203),
(104, 'History', NULL);

SELECT * FROM Classes;

-- Teachers Table

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50)
);

INSERT INTO Teachers VALUES
(201, 'Mr. Sharma'),
(202, 'Mrs. Kapoor'),
(203, 'Mr. Khan'),
(204, 'Ms. Mehta');

SELECT * FROM Teachers;

-- Marks Table
CREATE TABLE Marks (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

INSERT INTO Marks VALUES
(1, 'Math', 85),
(1, 'Science', 78),
(2, 'Science', 92),
(3, 'Math', 74),
(4, 'English', 88),
(6, 'History', 80); 

SELECT * FROM Marks;

---Assignment Questions

---1. Write a query to display all students with their class name. (INNER JOIN)

SELECT s.student_id,s.student_name,c.class_name
FROM students s
INNER JOIN classes c 
ON s.class_id=c.class_id;

---2. Find all students and their class names
---(including students who are not assigned to any class). (LEFT JOIN)

SELECT 
s.student_id,s.student_name,c.class_name
FROM students s
LEFT JOIN classes c
ON s.class_id=c.class_id;

---3. List all classes and the students enrolled in them 
---(including classes with no students). (RIGHT JOIN)
SELECT 
s.student_id,s.student_name,c.class_name
FROM students s
LEFT JOIN classes c
ON s.class_id=c.class_id;

----4. Display all students and all classes, matching
----wherever possible. (FULL OUTER JOIN)
SELECT 
s.student_id,s.student_name,c.class_name
FROM students s
JOIN classes c
ON s.class_id=c.class_id;

---5. Show all students with their class name and 
----teacher’s name. (Multiple Joins)

SELECT 
s.student_id,s.student_name,t.teacher_name
FROM students s
 INNER JOIN Classes c ON s.class_id = c.class_id
INNER JOIN Teachers t ON c.teacher_id = t.teacher_id;

--6. Using a LEFT JOIN, find students who are not assigned to any class.
SELECT s.student_id, s.student_name
FROM Students s
LEFT JOIN Classes c ON s.class_id = c.class_id
WHERE c.class_id IS NULL;


----7. Classes that do not have a teacher assigned
SELECT c.class_id, c.class_name
FROM Classes c
LEFT JOIN Teachers t 
ON c.teacher_id = t.teacher_id
WHERE t.teacher_id IS NULL;

---8. Students and their marks
SELECT s.student_name, m.subject, m.marks
FROM Students s
INNER JOIN Marks m 
ON s.student_id = m.student_id;

---9. Marks records that do not belong to any student
SELECT m.student_id, m.subject, m.marks
FROM Marks m
LEFT JOIN Students s ON m.student_id = s.student_id
WHERE s.student_id IS NULL;

---10. Each teacher, the class they handle, 
-------and the students in that class
SELECT t.teacher_name, c.class_name, s.student_name
FROM Teachers t
INNER JOIN Classes c
ON t.teacher_id = c.teacher_id
LEFT JOIN Students s
ON c.class_id = s.class_id;
