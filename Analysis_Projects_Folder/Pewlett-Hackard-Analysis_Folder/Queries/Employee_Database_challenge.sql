-- SQL for Employee Database Challenge
-- Left join of employee and titles tables to create new retirement_titles table
-- Filtered for DOB between 1952 and 1955
SELECT emp.emp_no, emp.first_name, emp.last_name,
    ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as emp
LEFT JOIN titles as ti
ON emp.emp_no = ti.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;

-- Use Distinct on emp_no
-- Use Orderby on emp_no, to_date DESCENDING
-- limit to_date to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Created the search query first to match listed image from challenge instructions
-- Grouped by title and ordered by the count ("Retiring Titles")
Select count(title) AS "Retiring Titles Count", title 
-- Once original SQL query created, I then inserted the "INTO" to create a new table
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY "Retiring Titles Count" DESC;

-- Inspiration to join 3 tables came from: https://kb.objectrocket.com/postgresql/join-three-tables-in-postgresql-539
-- First Created the search query first to include all conditions
SELECT distinct on (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date,
              dept.from_date, dept.to_date,
              ti.title
-- Once original SQL query created and it matched the challenge image, 
-- I then inserted the "INTO" to create a new table
INTO mentorship_eligibilty
FROM employees as emp
INNER JOIN dept_emp as dept ON emp.emp_no = dept.emp_no
INNER JOIN titles as ti ON emp.emp_no = ti.emp_no
WHERE dept.to_date = ('9999-01-01')
AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;