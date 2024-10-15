-- Create the students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    school_enrollment_date DATE
);

-- Create the professors table
CREATE TABLE professors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100)
);

-- Create the courses table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(id)
);

-- Create the enrollments table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);
-- Insert students
INSERT INTO students (first_name, last_name, email, school_enrollment_date)
VALUES ('Ryan', 'Tibbo', 'ryan.tibbo@keyin.com', '2020-09-01'),
       ('Jane', 'Smith', 'jane.smith@keyin.com', '2020-09-01'),
       ('Robert', 'Brown', 'robert.brown@keyin.com', '2019-09-01'),
       ('Emily', 'Clark', 'emily.clark@keyin.com', '2021-09-01'),
       ('Michael', 'Johnson', 'michael.johnson@keyin.com', '2021-09-01');

-- Insert professors (singers/rockstars)
INSERT INTO professors (first_name, last_name, department)
VALUES ('Alice', 'Cooper', 'Physics'),
       ('Bob', 'Marley', 'Mathematics'),
       ('Charlie', 'Parker', 'Computer Science'),
       ('David', 'Bowie', 'Biology');

-- Insert courses
INSERT INTO courses (course_name, course_description, professor_id)
VALUES ('Physics 101', 'Introduction to Physics', 1),
       ('Calculus 101', 'Introduction to Calculus', 2),
       ('CS 101', 'Introduction to Computer Science', 3);

-- Insert enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES (1, 1, '2021-09-15'),
       (2, 1, '2021-09-15'),
       (3, 2, '2021-09-16'),
       (4, 3, '2021-09-17'),
       (5, 1, '2021-09-18');

-- Retrieve Full Names of Students in Physics 101
SELECT CONCAT(s.first_name, ' ', s.last_name) AS full_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE c.course_name = 'Physics 101';

-- List of Courses and Professors' Full Names
SELECT c.course_name, CONCAT(p.first_name, ' ', p.last_name) AS professor_name
FROM courses c
JOIN professors p ON c.professor_id = p.id;
