select * from employees;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp
left join salaries as sal 
on sal.emp_no = emp.emp_no
order by emp.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select last_name, first_name, hire_date
from employees
where date_part('year', hire_date) = '1986';

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
select emp.first_name, emp.last_name, dep.dept_name, dep.dept_no, emp.emp_no
from employees as emp
right join dept_manager as depman
on depman.emp_no = emp.emp_no
left join departments as dep
on depman.dept_no = dep.dept_no;

--4. List the department of each employee with the following 
--information: employee number, last name, first name, and department name.

select emp.first_name, emp.last_name, dep.dept_name, emp.emp_no
from employees as emp
left join dept_emp as depemp
on depemp.emp_no = emp.emp_no
right join departments as dep
on dep.dept_no = depemp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex 
from employees
where first_name = 'Hercules' AND last_name LIKE 'B%';

--6.List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

select emp.first_name, emp.last_name, dep.dept_name, emp.emp_no
from employees as emp
left join dept_emp as depemp
on depemp.emp_no = emp.emp_no
right join departments as dep
on dep.dept_no = depemp.dept_no
where dep.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

select emp.first_name, emp.last_name, dep.dept_name, emp.emp_no
from employees as emp
left join dept_emp as depemp
on depemp.emp_no = emp.emp_no
right join departments as dep
on dep.dept_no = depemp.dept_no
where dep.dept_name = 'Sales' OR dep.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

select count(*), last_name
from employees
group by last_name
order by count desc;



