SELECT `first_name`, `last_name`, salary * 12 AS `Annual Salary` FROM `employees` WHERE salary * 12 > 30000;

SELECT first_name, last_name, salary 
FROM employees 
WHERE first_name LIKE 'S%'
ORDER BY first_name ASC

select first_name, last_name, salary
from employees
where manager_id is null;

select country_name, region_id
from countries
where country_name like 'United%'
order by region_id desc;

SELECT job_id, department_id FROM  job_history WHERE end_date < '1998-01-30' ORDER BY employee_id ASC

select *
from employees
where job_id like 'SA&_%' escape '&'
or job_id like 'IT&_%' escape '&';

SELECT street_address, city, postal_code
from locations
where state_province is not null
and city like 'S______'; 

select street_address, country_id
from locations
where postal_code like '1%0';

select concat(first_name, ' ', last_name) 'full name', phone_number 'phone'
from employees
where commission_pct is not null and commission_pct > 0;

select first_name, last_name, salary
from employees
where job_id not in ('IT_PROG','AD_VP','AD_PRES')
order by job_id desc;

SELECT department_name
FROM departments
WHERE department_name LIKE 'IT%';

SELECT first_name, last_name, phone_number
FROM employees
WHERE phone_number LIKE '515%'
OR last_name LIKE '_e%';

SELECT employee_id, end_date, job_id
FROM job_history
WHERE end_date < "2000-01-01";

SELECT employee_id, first_name, last_name, commission_pct + 0.5 AS `New Commission`
FROM employees
WHERE commission_pct + 0.5 > 0.7
ORDER BY `New Commission` DESC;

SELECT location_id, street_address, state_province
FROM locations
WHERE country_id <> 'CN'
AND state_province IS NOT null;

SELECT CONCAT(street_address, '_', city) AS `Address` FROM `locations` WHERE `country_id` NOT IN ('CA', 'CN', 'CH')

SELECT `TradeName`, `GenericMark` FROM `Medicine` WHERE `TradeName` LIKE '%2.5$%' ESCAPE '$';