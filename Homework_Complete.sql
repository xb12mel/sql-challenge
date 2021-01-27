--Build the tables for the database sourced from QuickERD, be sure to modify table names to prevent errors/
CREATE TABLE departments (
    "dept_no" VARCHAR (10)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE dept_emp (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR (10)   NOT NULL
);

CREATE TABLE dept_manager (
    "dept_no" VARCHAR (10)   NOT NULL,
    "emp_no" INT   NOT NULL
);

CREATE TABLE employees (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR (10) NOT NULL,
    "birth_date" VARCHAR NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(2)   NOT NULL,
    "hire_date" VARCHAR (10)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE salaries (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE titles (
    "title_id" VARCHAR (10)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

--Import CSV resource files into respective tables to fill the database

-- List the following details of each employee: employee no, last name, first name, sex and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries 
ON employees.emp_no = salaries.emp_no

--List first name, last name and hire date for employees who where hired in 1986.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '1/1/1986' AND '12/31/1986'

--List the department of each employee with the following info: employee no., last name, first name & department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no

-- List the manager of each department with the following info: employee number, last name, first name & department name
SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no

--List first name, last name and sex for employees whos first name is "Hercules" and last names begin with "B"
SELECT employees.last_name, employees.first_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%%'

--List all employees in the Sales & Development departments, including their employee no, last name first name & department.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name LIKE 'Sales' OR departments.dept_name LIKE 'Developement'

-- In decending order, list the frequency count of employee last names. 
SELECT COUNT (1), employees.last_name 
FROM employees GROUP BY employees.last_name 
ORDER BY employees.last_name DESC;
