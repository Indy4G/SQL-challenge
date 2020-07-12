-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no AS employee_number,employees.last_name,employees.first_name,employees.gender,salaries.salary 
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no

-- List employees who were hired in 1986.
SELECT emp_no AS employee_number,* FROM employees WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01'

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no AS department_number,dept_manager.emp_no AS employee_number,employees.last_name,employees.first_name,dept_manager.from_date AS start_date,dept_manager.to_date AS end_date 
FROM dept_manager
JOIN employees ON employees.emp_no = dept_manager.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no AS employee_number,employees.last_name,employees.first_name,dept_emp.dept_no AS department_number,departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no AS employee_number,employees.last_name,employees.first_name,dept_emp.dept_no AS department_number,departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no AS employee_number,employees.last_name,employees.first_name,dept_emp.dept_no AS department_number,departments.dept_name AS department_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT count(emp_no) AS employee_count,last_name FROM employees
GROUP BY last_name
ORDER BY employee_count DESC