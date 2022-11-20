-- CREATE TABLES 
-- CREATE departments table

CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE (dept_name)
);
select * from departments
-- CREATE employees table
CREATE TABLE employees (
  emp_no INT NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);
select * from employees
-- CREATE dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
select * from dept_manager
-- CREATE dept_emp table
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
select * from dept_em
-- CREATE titles table
CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, title, from_date)
);
select * from titles
--CREATE salaries table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY (emp_no, from_date)
);
select * from salaries
-- Determine who was born between 1952 & 1955

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Determine who was born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Determine who was born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Determine who was born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Determine who was born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';



-- Retirement eligibility born between 1952 & 1955 & hired bewteen 1985 & 1988
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


--                 CHALLENGE 7 SQL DELIVERABLE #1
-- 1) Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees
-- 2) Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT *
FROM titles;

SELECT title, from_date, to_date
FROM titles;
-- 3) Create a new table using the INTO clause.
-- 4) Join both tables on the primary key.
-- 5) Filter the data on the birth_date column to retrieve the employees who 
--    were born between 1952 and 1955. Then, order by the employee number.
SELECT em.emp_no, em.first_name, em.last_name, em.birth_date, ti.title, ti.from_date, ti.to_date
INTO temp_table
FROM employees as em
JOIN titles as ti on 
em.emp_no = ti.emp_no;

SELECT emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles2
FROM temp_table
WHERE (birth_date 	between '1952-01-01' AND '1955-12-31')
ORDER BY emp_no, first_name, last_name, title, from_date, to_date


-- 6) Export the Retirement Titles table from the previous step as 
--    retirement_titles2.csv and save it to your Data folder in the 
--    Pewlett-Hackard-Analysis folder.

-- EXPORTED FILE NAME retirement_titles2.csv

-- 7) Before you export your table, confirm that it looks like this image:
SELECT * from retirement_titles2
-- Confirmed!

-- 8) Copy the query from the Employee_Challenge_starter_code.sql and add it to 
--    your Employee_Database_challenge.sql file.
-- 9) Retrieve the employee number, first and last name, and title columns from 
--    the Retirement Titles table.
-- 9a) These columns will be in the new table that will hold the most recent 
--     title of each employee.
-- 10) Use the DISTINCT ON statement to retrieve the first occurrence of the 
--     employee number for each set of rows defined by the ON () clause.
-- 11) Exclude those employees that have already left the company by filtering on 
--     to_date to keep only those dates that are equal to '9999-01-01'.
-- 12) Create a Unique Titles table using the INTO clause.
-- 13) Sort the Unique Titles table in ascending order by the employee number and 
--     descending order by the last date (i.e., to_date) of the most recent title.
--  -- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO uniqueretirement_titles2
FROM retirement_titles2
WHERE to_date = '9999=01-01'
ORDER BY emp_no ASC, to_date DESC; 


-- 14) Export the Unique Titles table as unique_titles.csv and save it to your 
--     Data folder in the Pewlett-Hackard-Analysis folder.

-- EXPORTED FILE NAME uniqueretirement_titles2.csv

-- 15) Before you export your table, confirm that it looks like this image:

SELECT * FROM uniqueretirement_titles2
-- Confirmed!

-- 16) Write another query in the Employee_Database_challenge.sql file to 
--     retrieve the number of employees by their most recent job title who 
--     are about to retire.
-- 17) First, retrieve the number of titles from the Unique Titles table.
-- 18) Then, create a Retiring Titles table to hold the required information.
-- 19) Group the table by title, then sort the count column in descending order.
-- 20) Export the Retiring Titles table as retiring_titles.csv and save it to your 
--     Data folder in the Pewlett-Hackard-Analysis folder.
SELECT COUNT(title), title 
INTO retiring_titles
FROM uniqueretirement_titles2
GROUP BY title
ORDER BY COUNT(title) DESC;

-- 21) Before you export your table, confirm that it looks like this image:
SELECT * FROM retiring_titles
-- -- Confirmed!
-- 22) Save your Employee_Database_challenge.sql file in your Queries folder in the 
--     Pewlett-Hackard folder.
-- EXPORTED FILE NAME retireing_titles.csv

--                         CHALLENGE 7 SQL DELIVERABLE #2
-- 1) Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- 2) Retrieve the from_date and to_date columns from the Department Employee table.
-- 3) Retrieve the title column from the Titles table.
-- 4) Use a DISTINCT ON statement to retrieve the first occurrence of the employee number
--   for each set of rows defined by the ON () clause.
-- 5) Create a new table using the INTO clause.
-- 6) Join the Employees and the Department Employee tables on the primary key.
-- 7) Join the Employees and the Titles tables on the primary key.
-- 8) Filter the data on the to_date column to all the current employees, then filter 
--    the data on the birth_date columns to get all the employees whose birth dates 
--    are between January 1, 1965 and December 31, 1965.
-- 9) Order the table by the employee number.
SELECT DISTINCT ON (emp_no) em.emp_no, 
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_program
FROM employees AS em
LEFT JOIN dept_emp AS de
ON em.emp_no = de.emp_no
LEFT JOIN titles AS ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;

-- 10) Export the Mentorship Eligibility table as mentorship_eligibilty.csv and 
--     save it to your Data folder in the Pewlett-Hackard-Analysis folder.
SELECT * FROM mentorship_program
-- -- Confirmed!
-- 11) Before you export your table, confirm that it looks like this image:
-- EXPORTED FILE NAME mentorship_program.csv
