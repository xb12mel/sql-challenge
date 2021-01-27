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