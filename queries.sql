--QUERY 1--
--*Total employees: 300,024
-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

CREATE VIEW Q1 AS --Saved as a view 'Q1' in Database

	SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
	FROM Employees emp
	LEFT JOIN Salaries sal
		ON emp.emp_no = sal.emp_no;   


SELECT *
FROM 