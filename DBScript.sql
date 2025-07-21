-- Create database
CREATE DATABASE EZSEOnlineCourses
GO

USE EZSEOnlineCourses
GO

-- Create tables
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    FullName NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address NVARCHAR(200),
    Role VARCHAR(20) DEFAULT 'user' -- 'user' or 'admin'
)
GO

CREATE TABLE Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500)
)
GO

CREATE TABLE Course (
    CourseID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(10,2) NOT NULL,
    ImageURL VARCHAR(500),
    CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID),
    InstructorID INT FOREIGN KEY REFERENCES [User](UserID),
    CreatedDate DATETIME DEFAULT GETDATE(),
    Duration INT, -- in hours
    Level NVARCHAR(50) -- Beginner, Intermediate, Advanced
)
GO

CREATE TABLE [Order] (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(50) DEFAULT 'Pending' -- Pending, Completed, Cancelled
)
GO

CREATE TABLE OrderDetail (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES [Order](OrderID),
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    Price DECIMAL(10,2)
)
GO

CREATE TABLE Cart (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    CourseID INT FOREIGN KEY REFERENCES Course(CourseID),
    AddedDate DATETIME DEFAULT GETDATE()
)
GO

-- Insert sample data
-- Insert admin user (password: admin123)
INSERT INTO [User] (Username, Password, FullName, Email, Role)
VALUES ('admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', N'Administrator', 'admin@ezse.com', 'admin')
GO

-- Insert sample categories
INSERT INTO Category (CategoryName, Description) VALUES
(N'Programming', N'Learn programming languages and software development'),
(N'Web Development', N'Master web technologies and frameworks'),
(N'Data Science', N'Explore data analysis and machine learning'),
(N'Business', N'Business and entrepreneurship courses'),
(N'Design', N'Graphic design and UI/UX courses')
GO

-- Insert sample instructors
INSERT INTO [User] (Username, Password, FullName, Email, Role) VALUES
('john.doe', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', N'John Doe', 'john.doe@ezse.com', 'user'),
('jane.smith', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', N'Jane Smith', 'jane.smith@ezse.com', 'user')
GO

-- Insert sample courses
INSERT INTO Course (Title, Description, Price, CategoryID, InstructorID, Duration, Level) VALUES
(N'Java Programming Fundamentals', N'Learn the basics of Java programming language', 49.99, 1, 2, 30, N'Beginner'),
(N'Advanced Web Development with React', N'Master React.js and modern web development', 69.99, 2, 3, 40, N'Intermediate'),
(N'Python for Data Science', N'Introduction to data analysis using Python', 59.99, 3, 2, 35, N'Beginner'),
(N'Digital Marketing Essentials', N'Learn digital marketing strategies', 39.99, 4, 3, 25, N'Beginner'),
(N'UI/UX Design Principles', N'Master the fundamentals of UI/UX design', 49.99, 5, 3, 30, N'Intermediate')
GO 