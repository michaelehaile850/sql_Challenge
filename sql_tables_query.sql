

CREATE TABLE departments (
    dept_no VARCHAR(6) NOT NULL,
    dept_name VARCHAR(255),
    PRIMARY KEY (dept_no)
);
	
select * from departments;


CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(6) NOT NULL,
    CONSTRAINT fk_emp FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    CONSTRAINT fk_dept FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_emp;

create table titles(
	title_id varchar(6) not null primary key,
	title varchar(255) not null
	);

select * from titles;


CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(6) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

select * from employees;


CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(6) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

select * from dept_emp;

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary numeric NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from salaries;

CREATE TABLE dept_manager (
    dept_no VARCHAR(6) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);

select * from dept_manager;



--Q1


SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;


--Q2 first_name,last_name,hire_date, who were hired in 1986
select first_name, last_name, hire_date
	from employees
	where hire_date between '01-01-1986' and '12-31-1986';
	
--Q3 

SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    departments d
JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN
    employees e ON dm.emp_no = e.emp_no;


--Q4

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_no,
    d.dept_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no;
	
--Q5
select * from employees;


select first_name, last_name,sex
from employees
where first_name ='Hercules' and last_name like 'B%'

--Q6

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
	d.dept_name -- to make sure i see the sales dpartment name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';


--Q7

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees e
JOIN
    dept_emp de ON e.emp_no = de.emp_no
JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');
	
	
--Q8

SELECT
    last_name,
    COUNT(emp_no) AS frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC, last_name;





