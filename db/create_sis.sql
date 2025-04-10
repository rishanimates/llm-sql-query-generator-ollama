-- Create Students table
CREATE TABLE IF NOT EXISTS Students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    grade INTEGER,
    email TEXT
);

-- Create Courses table
CREATE TABLE IF NOT EXISTS Courses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    teacher TEXT,
    credits INTEGER
);

-- Create Enrollments table
CREATE TABLE IF NOT EXISTS Enrollments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    marks FLOAT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (course_id) REFERENCES Courses(id)
);

-- Insert sample data
INSERT INTO Students (name, age, grade, email) VALUES
    ('John Doe', 15, 10, 'john.doe@school.com'),
    ('Jane Smith', 16, 11, 'jane.smith@school.com'),
    ('Bob Johnson', 14, 9, 'bob.johnson@school.com'),
    ('Alice Brown', 15, 10, 'alice.brown@school.com'),
    ('Charlie Davis', 16, 11, 'charlie.davis@school.com');

INSERT INTO Courses (name, teacher, credits) VALUES
    ('Mathematics', 'Mr. Anderson', 4),
    ('Physics', 'Mrs. Thompson', 4),
    ('Chemistry', 'Dr. Wilson', 4),
    ('English', 'Ms. Parker', 3),
    ('History', 'Mr. Roberts', 3);

INSERT INTO Enrollments (student_id, course_id, marks) VALUES
    (1, 1, 85),
    (1, 2, 78),
    (2, 1, 92),
    (2, 3, 88),
    (3, 2, 75),
    (3, 4, 90),
    (4, 3, 95),
    (4, 5, 87),
    (5, 4, 82),
    (5, 5, 88); 