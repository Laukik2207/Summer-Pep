-- Create Database
CREATE DATABASE CollegeDB;

-- Use Database
USE CollegeDB;

DROP table student;

-- Create Student Table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT check(age>=18),
    gender ENUM('Male', 'Female', 'Other'),
    branch VARCHAR(50)NOT NULL,
    semester INT CHECK(semester BETWEEN 1 AND 8),
    cgpa DECIMAL(3,2) CHECK(cgpa between 0 and 10),
    city VARCHAR(50) default 'Delhi',
    email VARCHAR(100) UNIQUE,
    phone_no VARCHAR(15) UNIQUE,
    admission_date DATE,
    fees DECIMAL(10,2) check(fees > 0),
    attendance DECIMAL(5,2) CHECK(attendance between 0 and 100)
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

select count(student_id) from student;

select max(attendance) from student;

select count(student_id) from student where city = "Delhi";

select avg(age) from student where branch = "IT";

select min(cgpa) from student where branch = "CSE";

select count(student_id) from student where student_name like 'a%';

select sum(fees) from student where cgpa > 8.0;

select avg(fees) from student where city in ('delhi','jaipur') and cgpa > 8.0;

select count(student_id) from student where student_name like '%a' and age between 18 and 22;

select sum(fees) from student where email is not null;

select min(cgpa) from student where  student_name like 's%';

select branch,avg(cgpa) from student group by branch;

select branch,count(student_id) from student group by branch;

select city ,count(student_id) from student group by city;

select branch,max(cgpa) from student group by branch;

select branch,sum(fees) from student group by branch;

select branch,min(attendance) from student group by branch;

select branch,avg(cgpa) from student group by branch having avg(cgpa) > 8;

select city,count(student_id) from student group by city having count(student_id) > 1;

select branch , sum(fees) from student group by branch having sum(fees) > 50000;

select city , avg(attendance) from student group by city having avg(attendance) > 80;

select branch , count(student_id) from student group by branch;

select branch , avg(cgpa) from student group by branch;

select city , max(attendance) from student group by city;

select branch,min(fees) from student group by branch;

select city , avg(cgpa) from student group by city having avg(cgpa) > 8;

select city,sum(fees) from student group by city ;

select branch, max(cgpa) from student group by branch;

select branch , min(attendance) from student group by branch having min(attendance) < 90;

select branch, sum(fees) from student group by branch limit 1;

select branch , avg(attendance) from student group by branch;

select city,count(student_id) from student group by city;

select branch,avg(cgpa) from student group by branch having avg(cgpa) > 8;

INSERT INTO student
(
	student_id, student_name, age, gender, branch, semester, cgpa, city, email, phone_no, admission_date, fees, attendance
)
VALUES
	(124,'Raghav Sharma',22,'Male','CSE',7,8.75,"",'raghav.sharma@gmail.com','0623581479','2024-08-01',85000.00,91.50),
    (125,'Raghav Sharma',20,'Male','IT',4,7.80,"Mumbai",'raghav.sharma25@gmail.com','0623581445','2025-08-01',85000.00,85.00);


INSERT INTO student
(
	student_id, student_name, age, gender, branch, semester, cgpa, city, email, phone_no, admission_date, fees, attendance
)
VALUES
(
	126,'vivek Sharma',20,'Male','CSE',5,8.75,'Delhi','vivek.sharma@gmail.com','0623181469','2024-08-01',85000.00,91.50
);
INSERT INTO student
(
    student_id, student_name, age, gender, branch, semester, cgpa,
    city, email, phone_no, admission_date, fees, attendance
)
VALUES
(127,'Aman Yadav',18,'Male','CSE',1,6.12,'Noida','aman127@gmail.com','9876500011','2025-08-01',85000,61.40),

(128,'Pooja Sharma',21,'Female','IT',6,9.76,'Delhi','pooja128@gmail.com','9876500012','2022-08-01',79500,99.10),

(129,'Harsh Patel',23,'Male','ECE',8,7.18,'Ahmedabad','harsh129@gmail.com','9876500013','2021-08-01',88000,73.60),

(130,'Simran Kaur',20,'Female','Mechanical',4,8.02,'Amritsar','simran130@gmail.com','9876500014','2024-01-15',76500,84.20),

(131,'Mohit Jain',22,'Male','Civil',7,5.94,'Indore','mohit131@gmail.com','9876500015','2022-08-01',72000,57.90),

(132,'Kavya Nair',19,'Female','EEE',2,9.41,'Kochi','kavya132@gmail.com','9876500016','2025-01-15',81500,96.70),

(133,'Arjun Malhotra',24,'Male','MBA',3,8.28,'Gurgaon','arjun133@gmail.com','9876500017','2024-08-01',112000,81.50),

(134,'Nikita Das',20,'Female','BCA',4,7.51,'Bhubaneswar','nikita134@gmail.com','9876500018','2024-01-15',68000,77.80),

(135,'Sahil Khan',25,'Male','MCA',2,8.94,'Patna','sahil135@gmail.com','9876500019','2025-08-01',98000,90.40),

(136,'Meera Iyer',18,'Female','CSE',1,9.92,'Chennai','meera136@gmail.com','9876500020','2025-08-01',85000,100.00),

(137,'Yash Thakur',21,'Male','IT',5,6.58,'Bhopal','yash137@gmail.com','9876500021','2023-08-01',81000,69.30),

(138,'Ritika Sinha',20,'Female','CSE',5,8.89,'Ranchi','ritika138@gmail.com','9876500022','2023-08-01',83500,93.20),

(139,'Deepak Verma',22,'Male','EEE',7,5.61,'Kanpur','deepak139@gmail.com','9876500023','2022-08-01',79000,55.80),

(140,'Shruti Kulkarni',21,'Female','ECE',6,9.34,'Pune','shruti140@gmail.com','9876500024','2022-08-01',86000,97.10),

(141,'Akash Mishra',20,'Male','Civil',3,7.84,'Varanasi','akash141@gmail.com','9876500025','2024-08-01',70500,79.50),

(142,'Tanvi Joshi',19,'Female','BCA',2,8.43,'Jaipur','tanvi142@gmail.com','9876500026','2025-01-15',69000,88.60),

(143,'Nitin Chauhan',23,'Male','Mechanical',8,6.74,'Dehradun','nitin143@gmail.com','9876500027','2021-08-01',77000,64.20),

(144,'Isha Arora',22,'Female','MBA',4,9.13,'Delhi','isha144@gmail.com','9876500028','2024-01-15',115000,95.80),

(145,'Rohit Bansal',20,'Male','CSE',5,7.02,'Ludhiana','rohit145@gmail.com','9876500029','2023-08-01',84500,71.90),

(146,'Diya Menon',21,'Female','IT',6,8.65,'Bengaluru','diya146@gmail.com','9876500030','2022-08-01',83000,92.30);

select * from student;

select * from student where cgpa > 8;

select * from student where attendance > 75;

select * from student order by fees desc limit 10;

select city,count(student_id) from student group by city;

select branch,avg(cgpa) from student group by branch;

select branch,count(student_id) from student group by branch having count(student_id) < 30;

select * from student where admission_date like "%2025%";

select * from student where city in ('delhi','noida');

select * from student where student_name like 'a%';