SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE last_name = 'Baer'
) AND last_name != 'Baer';

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;

SELECT department_id, first_name, last_name, job_id
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Executive'
);

SELECT *
FROM employees
WHERE salary > ALL(
	SELECT salary
  	FROM employees
  	WHERE job_id = 'IT_PROG'
)
AND job_id != 'IT_PROG';

SELECT 
    e.employee_id,
    e.first_name, 
	e.last_name,
    e.department_id
FROM 
    employees e
JOIN
    departments d ON e.department_id = d.department_id
JOIN
    locations l ON d.location_id = l.location_id
WHERE
    l.city LIKE 'T%';

SELECT first_name,last_name,department_id
FROM employees
WHERE salary < (
	SELECT AVG(salary)
  	FROM employees
  	WHERE department_id = 60
)
ORDER BY department_id ASC;

SELECT e.first_name, e.last_name, e.department_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = 50
)
AND e.department_id != 50
ORDER BY e.first_name ASC;

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.manager_id
FROM
    employees e
WHERE
    e.employee_id NOT IN (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL);

SELECT first_name,last_name,salary,hire_date,department_id
FROM employees
WHERE hire_date > ALL(
	SELECT hire_date
  	FROM employees
  	WHERE department_id = 30
)
AND department_id != 30
ORDER BY hire_date ASC;

SELECT employee_id,first_name,last_name,job_id,salary
FROM employees
WHERE salary < ANY(
	SELECT salary
  	FROM employees
  	WHERE job_id = 'FI_ACCOUNT'
)
AND job_id != 'FI_ACCOUNT';

SELECT
    d.department_id,
    (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) AS `number of employees`
FROM
    departments d
WHERE
    (SELECT COUNT(*) FROM employees e WHERE e.department_id = d.department_id) > 
    (SELECT COUNT(*) FROM employees e WHERE e.department_id = 60);

SELECT job_id,MAX(salary)
FROM employees
GROUP BY job_id
HAVING MAX(salary) < (
	SELECT MAX(salary)
  	FROM employees
  	WHERE job_id = 'HR_REP'
);