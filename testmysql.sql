-- Created hobby table 
CREATE TABLE hobby (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

-- Created employee table
CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	mobile_number varchar(15) NOT NULL,
	address VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);

-- Created employee_salary table
CREATE TABLE employee_salary (
	id INT NOT NULL AUTO_INCREMENT,
	fk_employee_id INT,
	salary DOUBLE NOT NULL,
	date DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_employee_id)
	REFERENCES employee(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

-- Created employee_hobby table
CREATE TABLE employee_hobby (
	id INT NOT NULL AUTO_INCREMENT,
	fk_employee_id INT NOT NULL,
	fk_hobby_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (fk_employee_id)
	REFERENCES employee(id),
	FOREIGN KEY (fk_hobby_id)
	REFERENCES hobby(id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

-- Inserted multiple data in hobby table
INSERT INTO hobby (name)
VALUES ('Cricket'),
('Acting'),
('Dancing'),
('Painting'),
('Cricket');

-- Inserted multiple data in employee table
INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUES ('devang', 'bajaniya', 24, '9898989898', 'bapunagar, ahmedabad'),
('Raj', 'Patel', 25, '9876589565', 'Nikol, ahmedabad'),
('Vishal', 'rathod', 26, '3698457215', 'Naroda,Ahmedabad'),
('Dashrath', 'Darji', 27, '9868754985', 'Kalupur,Ahmedabad'),
('Pranav', 'Barot', 26, '7600879568', 'Naroda, Ahmedabad');

-- Inserted multiple data in employee_salary table 
INSERT INTO employee_salary (fk_employee_id, salary, date)
Values (1, 13500, '2022-12-02'),
(2, 13000, '2021-05-11'),
(3, 15000, '2018-06-25'),
(4, 16000, '2019-07-19'),
(5, 20000, '2021-05-06');

-- Inserted multiple data in employee_hobby table
INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Updated data in hobby table
UPDATE hobby
SET name = 'Dancing' 
WHERE id = 2;

-- Updated data in employee table
UPDATE employee
SET first_name = 'Rahul', last_name = 'Sharma'
Where id = 1;

-- Updated data in employee_salary table
UPDATE employee_salary
SET salary = 21000
WHERE id = 5;

-- Updated data in employee_hobby table
UPDATE employee_hobby
SET fk_employee_id = 2
WHERE id = 1;

-- Updated data in employee_hobby table
UPDATE employee_hobby
SET fk_employee_id = 1
WHERE id = 1;

-- Deleted data from hobby table 
DELETE FROM hobby
WHERE id = 1;

-- Deleted data from hobby table
DELETE FROM hobby
WHERE id = 2;

-- Deleted data from employee table
DELETE FROM employee
WHERE id = 1;

-- Deleted data from employee table
DELETE FROM employee
WHERE id = 2;

-- Truncate hobby table 
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE hobby;
SET FOREIGN_KEY_CHECKS = 1;

-- Truncate employee table 
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee;
SET FOREIGN_KEY_CHECKS = 1;

-- Truncate employee_salary table
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee_salary;
SET FOREIGN_KEY_CHECKS = 1;

-- Truncate employee_hobby table
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee_hobby;
SET FOREIGN_KEY_CHECKS = 1;

-- Separate select queries for all tables
SELECT * FROM hobby;
SELECT * FROM employee;
SELECT * FROM employee_salary;
SELECT * FROM employee_hobby;

-- Created a select single query to get all employee name, all hobby name in single column
SELECT CONCAT(employee.first_name, ' ', employee.last_name, ' - ', hobby.name) AS employeename_hobbyname
FROM employee
CROSS JOIN hobby
WHERE employee.id = hobby.id;

-- Created a select query to get employee name, employee salary
SELECT CONCAT(employee.first_name, ' ', employee.last_name) AS full_name, employee_salary.salary
FROM employee
INNER JOIN employee_salary
ON employee.id = employee_salary.fk_employee_id;

-- Created a select query to get employee name, total salary of employee, hobby name(used subquery for hobby name)
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, SUM(es.salary) AS total_salary,
	(SELECT GROUP_CONCAT(distinct h.name) FROM hobby h INNER JOIN hobby ON h.id = eh.fk_hobby_id) AS hobby_name
FROM employee_hobby AS eh
INNER JOIN employee AS e 
ON e.id = eh.fk_employee_id
INNER JOIN employee_salary AS es 
ON es.fk_employee_id = eh.fk_employee_id
GROUP BY eh.fk_employee_id;