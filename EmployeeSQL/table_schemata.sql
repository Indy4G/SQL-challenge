-- Drop Tables if They Already Exist **Use 'CASCADE' to Drop Tables With Dependencies Through Foreign Keys**
-- DROP TABLE departments CASCADE;
-- DROP TABLE employees CASCADE;
-- DROP TABLE dept_emp;
-- DROP TABLE dept_manager;
-- DROP TABLE salaries;
-- DROP TABLE titles;

-- Create Tables to Import Data Into **Import Data Into Tables Referenced By Foreign Keys First**
CREATE TABLE departments(
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30)
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(30),
	hire_date VARCHAR(30)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(30),
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(30),
	emp_no INT,
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(30),
	from_date VARCHAR(30),
	to_date VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Import Data
-- View Tables to Ensure Correct Impotation of Data
-- SELECT * FROM departments;
-- SELECT * FROM employees;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM salaries;
-- SELECT * FROM titles;
