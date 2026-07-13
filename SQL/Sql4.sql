CREATE DATABASE IF NOT EXISTS sql_training;
USE sql_training;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    department    VARCHAR(50),
    salary        DECIMAL(10,2),
    bonus_pct     DECIMAL(5,2),
    hire_date     DATE,
    birth_date    DATE,
    last_login    DATETIME
);

INSERT INTO employees
(first_name, last_name, email, department, salary, bonus_pct, hire_date, birth_date, last_login)
VALUES
('Amit',    'Sharma',   'amit.sharma@company.com',    'Sales',       55000.756, 8.5,  '2019-03-15', '1990-06-12', '2026-07-01 09:15:00'),
('Priya',   'Verma',    'priya.verma@company.com',    'Marketing',   62000.333, 10.25,'2020-07-22', '1988-11-25', '2026-07-05 14:42:00'),
('Rahul',   'Nair',     'rahul.nair@company.com',     'IT',          78500.999, 12.0, '2018-01-10', '1992-02-18', '2026-07-10 08:05:00'),
('Sneha',   'Iyer',     'sneha.iyer@company.com',     'Finance',     49500.125, 6.75, '2021-11-05', '1995-09-30', '2026-06-28 17:30:00'),
('Karan',   'Malhotra', 'karan.malhotra@company.com', 'IT',          91000.5,   15.0, '2016-05-19', '1985-04-02', '2026-07-11 11:20:00'),
('Neha',    'Gupta',    'neha.gupta@company.com',     'Sales',       53000.0,   9.4,  '2022-02-28', '1998-01-15', NULL),
('Vikram',  'Singh',    'vikram.singh@company.com',   'HR',          47000.45,  5.5,  '2023-08-14', '1993-07-08', '2026-07-12 19:10:00'),
('Ananya',  'Das',      'ananya.das@company.com',     'Marketing',   58000.876, 7.2,  '2017-09-01', '1991-12-20', '2026-07-09 10:00:00'),
('Rohan',   'Kapoor',   'rohan.kapoor@company.com',   'Finance',     67000.654, 11.1, '2019-12-12', '1989-03-27', '2026-07-02 13:55:00'),
('Ishita',  'Joshi',    'ishita.joshi@company.com',   'HR',          51000.2,   8.0,  '2020-04-04', '1996-10-10', '2026-07-07 16:25:00');


select * from employees;

select * from employees;

select first_name,round(salary) from employees;

SELECT first_name, TRUNCATE(salary, 1) AS truncated_salary
FROM employees;

SELECT first_name, salary, ROUND(salary / 12, 2) AS monthly_salary FROM employees;

select first_name , Round(salary * bonus_pct / 100 , 2) as bonus from employees;

SELECT first_name, salary,ABS(salary - (SELECT AVG(salary) FROM employees)) AS salary_difference
FROM employees;


select first_name, ceiling(salary ) as ceil , floor(salary) as flor from employees;

SELECT emp_id,first_name FROM employees WHERE MOD(emp_id, 2) = 1;


select first_name,round(sqrt(salary),2) from employees;

SELECT first_name, salary, bonus_pct,GREATEST(salary, bonus_pct*10000) AS greater_value FROM employees;

SELECT first_name,DATE_FORMAT(hire_date, '%d %M %Y') AS formatted_hire_date FROM employees;

SELECT first_name, hire_date,DATEDIFF(CURDATE(), hire_date) AS days_worked FROM employees;

SELECT first_name, birth_date,TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS current_age FROM employees;


SELECT first_name, hire_date,DAYNAME(hire_date) AS hire_day FROM employees;

SELECT first_name, hire_date FROM employees WHERE MONTH(hire_date) = 12;

SELECT first_name, hire_date, DATE_ADD(hire_date, INTERVAL 3 YEAR) AS pension_eligible_date FROM employees;

SELECT first_name, birth_date, LAST_DAY(birth_date) AS last_date_of_birth_month FROM employees;

SELECT first_name, hire_date FROM employees WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR) ORDER BY hire_date DESC;

SELECT first_name, hire_date, 
YEAR(hire_date) AS hire_year, QUARTER(hire_date) AS hire_quarter
FROM employees;