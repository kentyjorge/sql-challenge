
drop table if exists titles cascade;
CREATE TABLE titles (
    title_id varchar NOT NULL,
    title varchar NOT NULL,
    Primary key (title_id)
);

drop table if exists employees cascade;
CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id varchar   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
    Primary Key (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

drop table if exists departments cascade;
CREATE TABLE departments (
    dept_no varchar  NOT NULL,
    dept_name varchar  NOT NULL,
    Primary Key (dept_no)
);

drop table if exists dept_emp cascade;
CREATE TABLE dept_emp (
    emp_no int NOT NULL,
    dept_no varchar NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

drop table if exists dept_manager cascade;
CREATE TABLE dept_manager (
    dept_no varchar NOT NULL,
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

drop table if exists salaries cascade;
CREATE TABLE salaries (
    emp_no int NOT Null,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    Primary Key (emp_no)
);

select * from dept_manager;