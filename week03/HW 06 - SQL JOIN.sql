SELECT e.employee_id, e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d 
USING (department_id)

SELECT e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON (e.department_id = d.department_id);

SELECT e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT e.first_name, e.last_name, e.employee_id AS `Emp`,m.first_name AS `MGR First Name`, m.last_name AS `MGR Last Name`, m.employee_id AS `Mgr`
FROM employees e JOIN employees m
ON (e.manager_id = m.employee_id)

SELECT DISTINCT m.first_name AS `MGR First Name`, m.last_name AS `MGR Last Name`, m.manager_id AS `MGR` 
FROM employees e JOIN employees m
ON (e.manager_id = m.employee_id) ORDER BY `MGR` ASC;

SELECT 
e.first_name, e.last_name, e.hire_date,
m.first_name AS `Mgr First Name`, m.last_name AS `Mgr Last Name`, m.hire_date AS `Mgr Hired`
FROM employees e JOIN employees m
ON (m.hire_date > e.hire_date) AND (e.manager_id = m.employee_id)

SELECT 
e.first_name, e.last_name, e.hire_date, e.salary
FROM employees e JOIN employees Ernst
ON (Ernst.last_name = "Ernst") AND (Ernst.hire_date < e.hire_date)

SELECT
l.location_id, l.street_address, l.city, l.state_province
FROM locations l
JOIN countries
USING (country_id)
JOIN regions
USING (region_id)
WHERE region_name = 'Europe'

SELECT 
d.department_id, d.department_name, l.street_address
FROM departments d JOIN locations l
ON (d.location_id = l.location_id)
JOIN countries c
ON (l.country_id = c.country_id) AND (c.country_name LIKE "U%")