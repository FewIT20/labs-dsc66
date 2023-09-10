SELECT CONCAT(email, ' ', phone_number) AS `Contact` FROM `employees`;

SELECT CONCAT(first_name, ' ', last_name) AS `full name` FROM `employees`;

SELECT `country_id`, `region_id` FROM `countries` ORDER BY `country_name` DESC;

SELECT CONCAT(first_name, ' ', last_name) AS `Employee name`, salary*commission_pct AS `Net Commission` FROM `employees` ORDER BY `Net Commission` DESC

SELECT `job_id`, `job_title`, `min_salary`, `max_salary`, (max_salary-min_salary)/1.25 AS `index of salary` FROM jobs;

SELECT DISTINCT `job_id` FROM `employees` 

SELECT * FROM `departments` ORDER BY `location_id` ASC, `manager_id` ASC

SELECT CONCAT(first_name, ' ', last_name, ' (', email, ') is ', job_id) AS `short description` FROM `employees`