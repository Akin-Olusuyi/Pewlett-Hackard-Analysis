select * from dept_emp;

select * from employees 
where birth_date between '1952-01-01' and '1952-12-31'

select first_name, last_name from employees 
where birth_date between '1952-01-01' and '1952-12-31'


-- Retirement eligibility
select first_name, last_name from employees
where (birth_date between '1952-01-01' and '1955-12-31') 
AND (hire_date between '1985-01-01' and '1988-12-31');


-- Numbers of employees retiring
select count(first_name) from employees
where (birth_date between '1952-01-01' and '1955-12-31') 
AND (hire_date between '1985-01-01' and '1988-12-31');

--create a new table to insert retirement info
select first_name, last_name INTO retirement_info FROM employees
WHERE (birth_date between '1952-01-01' and '1955-12-31') AND
(hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info;


-- Retirement eligibility
select first_name, last_name from employees
where (birth_date between '1952-01-01' and '1955-12-31') 
AND (hire_date between '1985-01-01' and '1988-12-31');


-- Numbers of employees retiring
select count(first_name) from employees
where (birth_date between '1952-01-01' and '1955-12-31') 
AND (hire_date between '1985-01-01' and '1988-12-31');

--create a new table to insert retirement info
select first_name, last_name INTO retirement_info FROM employees
WHERE (birth_date between '1952-01-01' and '1955-12-31') AND
(hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info;

DROP TABLE retirement_info; 

SELECT emp_no, first_name, last_name INTO retirement_info
FROM employees WHERE (birth_date between '1952-01-01' and '1955-12-31') AND
(hire_date between '1985-01-01' and '1988-12-31');

select * from retirement_info;

select count(first_name) from retirement_info;

--Joining departments an dept_manager tables
SELECT departments.dept_name,
	   departments.emp_no,
	   departments.from_date,
	   departments.to_date
FROM departments INNER JOIN dept_manager 
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
	   retirement_info.first_name,
	   retirement_info.last_name,
	   dept_emp.to_date
FROM retirement_info LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Using aliases
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   de.to_date
FROM retirement_info as ri LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

--left join into another table
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   de.to_date
INTO current_emp
FROM retirement_info as ri LEFT JOIN dept_emp as de 
ON ri.emp_no = de.emp_no WHERE de.to_date = ('9999-01-01')

	   

select * from current_emp;
select count(first_name) from current_emp;

-- Employee count by department number & add into a new table
SELECT COUNT (ce.emp_no), de.dept_no
INTO emp_retiring_by_dept
FROM current_emp as ce LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

select * from salaries order by to_date DESC;


-- creating additional list

SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   e.gender,
	   s.salary,
	   de.to_date
INTO emp_info
FROM employees as e INNER JOIN salaries as s
ON(e.emp_no = s.emp_no)
INNER JOIN dept_emp as de ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

--Department Retirees
SELECT ce.emp_no,
	   ce.first_name,
	   ce.last_name,
	   d.dept_name
INTO dept_info
FROM current_emp as ce INNER JOIN dept_emp as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);

select * from dept_info;

--retirement list for the sales team
select ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   di.dept_name
FROM retirement_info as ri INNER JOIN dept_info as di
ON ri.emp_no = di.emp_no WHERE di.dept_name = 'Sales'



--retirement list for the sales and development team
select ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   di.dept_name
FROM retirement_info as ri INNER JOIN dept_info as di
ON ri.emp_no = di.emp_no WHERE di.dept_name IN ('Sales', 'Development')
