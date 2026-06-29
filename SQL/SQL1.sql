-- Create Database
CREATE DATABASE CollegeDB;

-- Use Database
USE CollegeDB;

-- Create Student Table
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male', 'Female', 'Other'),
    branch VARCHAR(50),
    semester INT,
    cgpa DECIMAL(3,2),
    city VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    admission_date DATE,
    fees DECIMAL(10,2),
    attendance DECIMAL(5,2)
);

select * from student;

INSERT INTO student
(
	student_id, student_name, age, gender, branch, semester, cgpa, city, email, phone_no, admission_date, fees, attendance
)
VALUES
(
	112,'Aarav Sharma',20,'Male','CSE',5,8.75,'Delhi','arav.sharma@gmail.com','0623581469','2024-08-01',85000.00,91.50
);

INSERT INTO student
(student_id, student_name, age, gender, branch, semester, cgpa, city, email, phone_no, admission_date, fees, attendance)
VALUES
(113,'Priya Verma',21,'Female','IT',5,9.12,'Mumbai','priya.verma@gmail.com','9876543211','2023-08-01',82000.00,94.20),

(114,'Rohan Mehta',20,'Male','ECE',5,8.45,'Pune','rohan.mehta@gmail.com','9876543212','2023-08-01',81000.00,88.75),

(115,'Ananya Gupta',19,'Female','CSE',3,9.56,'Jaipur','ananya.gupta@gmail.com','9876543213','2024-08-01',85000.00,96.30),

(116,'Karan Singh',22,'Male','Mechanical',7,7.98,'Lucknow','karan.singh@gmail.com','9876543214','2022-08-01',79000.00,84.60),

(117,'Sneha Patil',21,'Female','Civil',5,8.89,'Nagpur','sneha.patil@gmail.com','9876543215','2023-08-01',78000.00,91.80),

(118,'Aditya Joshi',20,'Male','EEE',5,8.21,'Bhopal','aditya.joshi@gmail.com','9876543216','2023-08-01',80500.00,87.40),

(119,'Neha Kapoor',22,'Female','MBA',3,9.03,'Chandigarh','neha.kapoor@gmail.com','9876543217','2024-01-15',95000.00,93.10),

(120,'Rahul Nair',21,'Male','CSE',5,8.67,'Kochi','rahul.nair@gmail.com','9876543218','2023-08-01',85000.00,89.95),

(121,'Ishita Roy',20,'Female','BCA',3,9.40,'Kolkata','ishita.roy@gmail.com','9876543219','2024-08-01',70000.00,97.20),

(122,'Vikram Rao',23,'Male','MCA',1,8.10,'Hyderabad','vikram.rao@gmail.com','9876543220','2025-08-01',90000.00,86.50);

DESCRIBE student;

SELECT * from student;

SELECT student_id,student_name,branch from student;

SELECT distinct city from student;

SELECT student_name FROM student where branch is DISTINCT;

SELECT student_name from student where branch = 'cse';

SELECT student_name,age from student where age > 20;

SELECT student_name,cgpa from student where cgpa > 8.5;

SELECT student_name,city from student where city in ('Delhi','Noida','Lucknow');

SELECT student_name,age from student where age between 18 AND 21;

SELECT student_name,cgpa from student where cgpa between 7.5 and 9.0;

SELECT * from student where student_name like 'a%';

SELECT * from student where student_name like '%a';

SELECT * from student where student_name like '%an';

SELECT * from student where city like 'n%';

SELECT student_name,branch,cgpa from student where branch = 'Cse' AND cgpa > 8;

Select student_name from student where city = 'Delhi' OR branch='It';

select * from student order by cgpa DESC;

select * from student order by student_name asc;

select * from student order by student_name ASC, cgpa DEsc;

SELECT * from student where city ='Delhi' and cgpa > 8.5;

Select * from student where city != 'Delhi';

Select * from student where student_name like 's%' and city in ('Delhi','Jaipur');

Select * from student where branch in ('CSE','IT') and age > 20;

Select * from student where city like '%a%' ORDER BY student_name ASC;

Select * from student where cgpa between 8 and 9;

Select * from student where email is not null;