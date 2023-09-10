SELECT employee_id,first_name,last_name,department_id,department_name
FROM employees
LEFT OUTER JOIN departments
USING (department_id);

SELECT employee_id,first_name,last_name,department_id,department_name
FROM employees
RIGHT OUTER JOIN departments
USING (department_id);

SELECT e.first_name,e.last_name,e.employee_id `Emp`,m.first_name `mgr_first_name`,m.last_name `mgr_last_name`,m.employee_id `Mgr`
FROM employees e
LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
WHERE m.employee_id IS NULL;

SELECT e.employee_id, e.job_id 
FROM job_history j
RIGHT OUTER JOIN employees e
ON (e.employee_id = j.employee_id)
WHERE j.employee_id IS NULL;

SELECT l.location_id, l.city FROM locations l
LEFT OUTER JOIN departments d
ON l.location_id = d.location_id
WHERE d.location_id IS NULL
ORDER BY l.city ASC

SELECT country_id,country_name
FROM departments
JOIN locations
USING (location_id)
RIGHT OUTER JOIN countries
USING (country_id)
WHERE department_id IS NULL
ORDER BY country_name DESC;
SELECT country_id,country_name,region_name
FROM locations
RIGHT OUTER JOIN countries
USING (country_id)
JOIN regions
USING (region_id)
WHERE location_id IS NULL
ORDER BY country_id ASC;

SELECT e.firstName,e.lastName
FROM employees e
LEFT OUTER JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE c.salesRepEmployeeNumber IS NULL;

Select customerNumber, customerName
from payments
right outer join customers
using (customerNumber)
where payments.customerNumber IS NULL