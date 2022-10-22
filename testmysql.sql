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
ALTER TABLE employee AUTO_INCREMENT = 101;

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
('Dancing, Football'),
('Painting'),
('Cricket, Dance');

-- Inserted multiple data in employee table
INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUES ('devang', 'bajaniya', 24, '9898989898', 'bapunagar, ahmedabad'),
('Raj', 'Patel', 25, '9876589565', 'Nikol, ahmedabad'),
('Vishal', 'rathod', 26, '3698457215', 'Naroda,Ahmedabad'),
('Dashrath', 'Darji', 27, '9868754985', 'Kalupur,Ahmedabad'),
('Pranav', 'Barot', 26, '7600879568', 'Naroda, Ahmedabad');

-- Inserted multiple data in employee_salary table 
INSERT INTO employee_salary (fk_employee_id, salary, date)
Values (101, 13500, '2022-12-02'),
(102, 13000, '2021-05-11'),
(103, 15000, '2018-06-25'),
(104, 16000, '2019-07-19'),
(105, 20000, '2021-05-06');

-- Inserted multiple data in employee_hobby table
INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5);

-- Updated data in hobby table
UPDATE hobby
SET name = 'Dancing' 
WHERE id = 102;

-- Updated data in employee table
UPDATE employee
SET first_name = 'Rahul', last_name = 'Sharma'
Where id = 101;

-- Updated data in employee_salary table
UPDATE employee_salary
SET salary = 21000
WHERE id = 5;

-- Updated data in employee_hobby table
UPDATE employee_hobby
SET fk_employee_id = 102
WHERE id = 1;

-- Updated data in employee_hobby table
UPDATE employee_hobby
SET fk_employee_id = 101
WHERE id = 1;

-- Deleted data from hobby table 
DELETE FROM hobby
WHERE id = 1;

-- Deleted data from hobby table
DELETE FROM hobby
WHERE id = 2;

-- Deleted data from employee table
DELETE FROM employee
WHERE id = 101;

-- Deleted data from employee table
DELETE FROM employee
WHERE id = 102;

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
SELECT CONCAT(first_name, ' ', last_name) AS employeename_hobbyname From employee 
UNION ALL
SELECT name from hobby;

-- Created a select query to get employee name, employee salary
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, es.salary
From employee AS e 
INNER JOIN employee_salary AS es
ON e.id = es.fk_employee_id;

-- Created a select query to get employee name, total salary of employee, hobby name(used subquery for hobby name)
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, SUM(es.salary) AS total_salary,
	(SELECT h.name FROM hobby AS h WHERE h.id = eh.fk_hobby_id) AS hobby_name
FROM employee AS e
INNER JOIN employee_salary AS es
ON es.fk_employee_id = e.id
INNER JOIN employee_hobby AS eh
ON eh.fk_employee_id = e.id
GROUP BY e.id;