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
    mobile_number BIGINT NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE employee_salary (
	id INT NOT NULL AUTO_INCREMENT,
    fk_employee_id INT,
    salary INT NOT NULL,
    date DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_employee_id)
    REFERENCES employee(id)
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
);