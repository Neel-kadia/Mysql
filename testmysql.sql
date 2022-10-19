CREATE TABLE hobby (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	mobile_number varchar(15) NOT NULL,
	address VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);

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

INSERT INTO hobby (name)
VALUES ('Cricket'),
('Acting'),
('Dancing'),
('Painting'),
('Cricket');

INSERT INTO employee (first_name, last_name, age, mobile_number, address)
VALUES ('devang', 'bajaniya', 24, '9898989898', 'bapunagar, ahmedabad'),
('Raj', 'Patel', 25, '9876589565', 'Nikol, ahmedabad'),
('Vishal', 'rathod', 26, '3698457215', 'Naroda,Ahmedabad'),
('Dashrath', 'Darji', 27, '9868754985', 'Kalupur,Ahmedabad'),
('Pranav', 'Barot', 26, '7600879568', 'Naroda, Ahmedabad');

INSERT INTO employee_salary (fk_employee_id, salary, date)
Values (1, 13500, '2022-12-02'),
(2, 13000, '2021-05-11'),
(3, 15000, '2018-06-25'),
(4, 16000, '2019-07-19'),
(5, 20000, '2021-05-06');

INSERT INTO employee_hobby (fk_employee_id, fk_hobby_id)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

UPDATE hobby
SET name = 'Dancing' 
WHERE id = 2;

UPDATE employee
SET first_name = 'Rahul', last_name = 'Sharma'
Where id = 1;

UPDATE employee_salary
SET salary = 21000
WHERE id = 5;

UPDATE employee_hobby
SET fk_employee_id = 2
WHERE id = 1;

UPDATE employee_hobby
SET fk_employee_id = 1
WHERE id = 1;

DELETE FROM hobby
WHERE id = 1;

DELETE FROM hobby
WHERE id = 2;

DELETE FROM employee
WHERE id = 1;

DELETE FROM employee
WHERE id = 2;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE hobby;
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee;
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee_salary;
SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE employee_hobby;
SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM hobby;
SELECT * FROM employee;
SELECT * FROM employee_salary;
SELECT * FROM employee_hobby;