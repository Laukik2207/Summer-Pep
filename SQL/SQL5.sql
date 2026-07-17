Create database D_triggers;

Use D_triggers;

create table employees(
	emp_id INT Primary key auto_increment,
    emp_name varchar(50),
    department varchar(30),
    salary decimal(10,2)
);

create table employee_logs(
	log_id INt primary key auto_increment,
    emp_id int,
    action_type varchar(30),
    old_salary decimal(10,2),
    new_salary decimal(10,2),
    action_time timestamp default current_timestamp
);

INSERT INTO employees (emp_name, department, salary)
VALUES
('Amit Sharma', 'IT', 65000.00),
('Priya Verma', 'HR', 48000.00),
('Rahul Mehta', 'Finance', 72000.00),
('Sneha Patil', 'Marketing', 55000.00),
('Rohit Kumar', 'Sales', 45000.00),
('Anjali Singh', 'IT', 85000.00),
('Vikas Gupta', 'Operations', 60000.00),
('Neha Joshi', 'HR', 52000.00),
('Arjun Desai', 'Finance', 90000.00),
('Kiran Rao', 'Sales', 40000.00);

INSERT INTO employee_logs
(emp_id, action_type, old_salary, new_salary)
VALUES
(1, 'INSERT', NULL, 65000.00),
(2, 'INSERT', NULL, 48000.00),
(3, 'INSERT', NULL, 72000.00),
(4, 'INSERT', NULL, 55000.00),
(5, 'INSERT', NULL, 45000.00),
(6, 'INSERT', NULL, 85000.00),
(1, 'UPDATE', 65000.00, 70000.00),
(5, 'UPDATE', 45000.00, 50000.00),
(3, 'UPDATE', 72000.00, 76000.00),
(2, 'DELETE', 48000.00, NULL);

DELIMITER $$
create trigger trg_before_insert_salary
before insert 
on employees
for each row
begin
	if new.salary < 10000 then
		signal sqlstate '45000'
		set message_text = 'Salary cannot be below 10000';
	end if;
end$$
DELIMITER ;

insert into employees(emp_name,department,salary)
value('Amit','IT',25000);

select * from employees;
insert into employees(emp_name,department,salary)
value('Aman','IT',5000);


DELIMITER $$

create trigger trg_after_insert_log
after insert
on employees
for each row
begin
	INSERt into employee_logs(emp_id,action_type,new_salary)
    values(new.emp_id,'insert',new.salary);
end$$
DELIMITER ;


DELIMITER $$

create trigger trg_before_update
before update
on employees
for each row
begin
	if new.salary <= 0 then
    signal sqlstate '45000'
    set message_text = 'Invalid salary';
    end if;
end$$
DELIMITER ;


update employees
set salary = 32000
where emp_id = 1;