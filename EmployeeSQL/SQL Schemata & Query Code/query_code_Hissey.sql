CREATE TABLE departments (
    dept_no VARCHAR(50),
    dept_name VARCHAR(50));
    
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(50),
    from_date VARCHAR(50),
    to_date VARCHAR(50));
    
CREATE TABLE dept_manager (
    dept_no VARCHAR(50),
    emp_no SERIAL PRIMARY KEY,
    from_date VARCHAR (50),
    to_date VARCHAR(50));

CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY,
    birth_date VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR (50),
    gender VARCHAR (10),
    hire_date VARCHAR(50));

CREATE TABLE salaries (
    emp_no SERIAL PRIMARY KEY,
    salary INT,
    from_date VARCHAR(50),
    to_date VARCHAR(50));

CREATE TABLE titles (
    emp_no INT,
    title VARCHAR(50),
    from_date VARCHAR(50),
    to_date VARCHAR(50));

--Question 1. displaying the following details
-- of each employee: employee number, last name,
-- first name, gender, and salary
-- Inner join with the salary and employee tables

SELECT
    DISTINCT e.emp_no,
    e.last_name,
    e.first_name,
    e.gender,
    s.salary
FROM employees e
INNER JOIN salaries s
    ON e.emp_no=s.emp_no limit 5;
    
--2. List employees who were hired in 1986.
SELECT DISTINCT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= ‘1986-01-01’ AND hire_date <= ‘1986-12-31’;

--3. List the manager of each department with the following information:
-- department number, department name, the manager’s employee number,
-- last name, first name, and start and end employment dates

-- first update the records of managers who are currently employed and have not departed
UPDATE dept_manager
SET
    to_date = ‘Current Employee’
WHERE to_date = ‘9999-01-01’;

--now that the records are updated display the relevant details
SELECT
    dm.dept_no,    
    d.dept_name,
    dm.emp_no,
    e.last_name,
    e.first_name,
    dm.from_date,
    dm.to_date
FROM dept_manager dm
JOIN employees e
    ON dm.emp_no=e.emp_no
JOIN departments d
    ON dm.dept_no=d.dept_no;

-- 4. List the department of each employee with the
-- following information: employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
    ON e.emp_no=de.emp_no
JOIN departments d
    ON de.dept_no=d.dept_no limit 20;
    
--5. List all employees whose first name is “Hercules” and last names begin with “B.”

SELECT
    first_name,
    last_name
FROM employees
WHERE first_name = ‘Hercules’ AND last_name LIKE ‘B%’;


-- 6. List all employees in the Sales department,
-- including their employee number, last name, first name, and department name
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
    ON e.emp_no=de.emp_no
JOIN departments d
    ON de.dept_no=d.dept_no
WHERE d.dept_name=‘Sales’;
    

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM employees e
JOIN dept_emp de
    ON e.emp_no=de.emp_no
JOIN departments d
    ON de.dept_no=d.dept_no
WHERE d.dept_name=‘Sales’ OR d.dept_name=‘Development’;

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
--Select all employees
SELECT
    emp_no,
    last_name
FROM employees;

--change last name to uppercase as the lowercase name ‘dAstous’ is coming up first when organizing in descending orde
UPDATE employees
SET
    last_name = ‘Dastous’
WHERE last_name = ‘dAstous’;

-- Count the last names from distinct list
SELECT COUNT(last_name) FROM employees;


-- Group by last_name
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;