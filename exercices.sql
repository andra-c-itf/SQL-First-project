use employees;

SELECT 
    dept_no
FROM
    departments;
    
SELECT 
    *
FROM
    departments;
    
 SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' or first_name = 'Aruna';
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
# all employyes hired in the year 2000
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
# all employees whose employee number is written with 5 characters, and starts with “1000”.    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_'); 
    
# all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

# names of employees that do not contain “Jack”.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
# Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

#Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
#Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
#Select the names of all departments whose department number value is not null.
SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
#Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';

#Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;

#Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT
    hire_date
FROM
    employees;
    
#How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

#How many managers do we have in the “employees” database?
SELECT 
    COUNT(*)
FROM
    dept_manager;

#Select all data from the “employees” table, ordering it by “hire date” in descending order.   
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

#calculate the number of times each name encounters in the database ordered descending
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

#extract all first names that appear more than 250 times in the employees table
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

#Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. Lastly, sort the output by the first column.
SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

#Select all employees whose average salary is higher than $120,000 per annum.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

#extract a list of names that are encountered less than 200 times. Let the data refer to people hired after 1st of January 1999
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

#Show the employee numbers of the 10 highest paid employees in the DB
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
limit 10;

#Select the first 100 rows from the ‘dept_emp’ table. 
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

#Adding more records
insert into employees 
(
	emp_no, 
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) values
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

insert into employees 
(
    birth_date,
    emp_no,
    first_name,
    last_name,
    gender,
    hire_date
) values
(
    '1973-03-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
);

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

insert into employees
values
(
	999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

SELECT 
    *
FROM
    titles
LIMIT 10;

insert into titles
(
	emp_no,
    title,
    from_date
)values
(
	999903,
    'Senior Engineer',
    '1997-10-01'
);

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;


SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

insert into dept_emp
(
	emp_no,
    dept_no,
    from_date,
    to_date
) values
(
	999903,
    'd005',
    '1997-10-01',
    '1999-01-01'
);

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

#creating a copy of the departments table
SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

#checking if the new table in empty
SELECT 
    *
FROM
    departments_dup;

INSERT INTO departments_dup
(
	dept_no,
    dept_name
)
SELECT
	* 
FROM
	departments;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

#Create a new department called “Business Analysis”. Register it under number ‘d010’.
INSERT INTO 
	departments 
VALUES 
(
	'd010', 
    'Business Analysis'
);
SELECT 
    *
FROM
    departments
ORDER BY dept_no;

# update values of one of the employees
use employees;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

#USING THE COMMIT AND ROLLLBACK
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

update departments_dup
set
	dept_no = 'd011',
    dept_name = 'Quality Control';
    
ROLLBACK;

COMMIT;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';

#deleting 
use employees;

commit;
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
 
 SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
DELETE FROM employees 
WHERE
    emp_no = 999903;
    
rollback;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

DELETE FROM departments_dup;

rollback;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
# Aggregate functions
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;

#How many employees start dates are in the database?
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
