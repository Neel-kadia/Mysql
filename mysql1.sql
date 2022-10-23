-- Created job table 
CREATE TABLE job (
	id INT AUTO_INCREMENT NOT NULL,
    name varchar(50) NOT NULL,
    min_salary DOUBLE,
    max_salary DOUBLE,
    PRIMARY KEY(id)
);

-- Created country table 
CREATE TABLE country (
	id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50),
    PRIMARY KEY(id)
);

-- Created department table 
CREATE TABLE department (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    fk_country_id int,
    PRIMARY KEY(id),
    FOREIGN KEY(fk_country_id)
    REFERENCES country(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Created employee table 
CREATE TABLE employee (
	id INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    salary DOUBLE NOT NULL,
    fk_department_id INT,
    fk_job_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (fk_department_id)
    REFERENCES department(id),
    FOREIGN KEY (fk_job_id)
    REFERENCES job(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
ALTER TABLE employee AUTO_INCREMENT = 101;

-- Inserted multiple data in job table
INSERT INTO job (name, min_salary, max_salary)
VALUES ('tester', '5000', '35000'),
	('programmer', '8000', '75000'),
    ('designer', '7000', '56000');
 
-- Inserted multiple data in country table 
INSERT INTO country (name)
VALUES ('india'),
	('usa'),
    ('canada');

-- Inserted multiple data in department table
INSERT INTO department (name, fk_country_id)
VALUES ('tester', '1'),
	('developer', '2'),
    ('front end', '3');

-- Inserted multiple data in employee table   
INSERT INTO employee (firstname, lastname, email, salary, fk_department_id, fk_job_id)
VALUES ('mohit', 'sharma', 'mohit@gmail.com', '25000', '1', '1'),
	('nirmal', 'jain', 'nirmal@gmail.com', '35000', '2', '2'),
    ('pranav', 'barot', 'pranav@gmail.com', '45000', '3', '3');

-- Get name(firstname + lastname), department name, country name, job name
SELECT CONCAT(e.firstname, ' ', e.lastname) AS name, d.name AS department_name, c.name AS country_name, j.name AS job_name 
FROM employee AS e
LEFT JOIN department AS d
ON e.fk_department_id = d.id
LEFT JOIN country AS c
ON d.fk_country_id = c.id
LEFT JOIN job AS j
ON e.fk_job_id = j.id
ORDER BY e.id;

-- Get 2nd highest salary of the employee
SELECT MAX(salary)
FROM employee
WHERE salary <> (SELECT MAX(salary) FROM employee);

-- Get all job name and department name in single query
SELECT name FROM JOB
UNION ALL
SELECT name FROM department;