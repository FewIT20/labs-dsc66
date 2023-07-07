CREATE TABLE `MEMBER` (
	`member_id` INT(10) PRIMARY KEY,
  	`last_name` VARCHAR(25) NOT NULL,
  	`first_name` VARCHAR(25),
  	`address` VARCHAR(100),
  	`city` VARCHAR(30)
);

CREATE TABLE `MEMBER2` (
	`member_id` INT(10),
  	`last_name` VARCHAR(25) NOT NULL,
  	`first_name` VARCHAR(25),
  	`address` VARCHAR(100),
  	`city` VARCHAR(30),
  	PRIMARY KEY (member_id)
);

ALTER TABLE `lab_emp`
ADD PRIMARY KEY (id) 

ALTER TABLE `lab_location`
ADD PRIMARY KEY (location_id) 

ALTER TABLE `lab_location` ADD PRIMARY KEY (location_id);
ALTER TABLE `lab_emp` ADD CONSTRAINT `lab_emp_fk` 
FOREIGN KEY (location_id) REFERENCES lab_location(location_id)

ALTER TABLE `lab_location` ADD CONSTRAINT `loc_name_un` UNIQUE (location_name)

ALTER TABLE `lab_emp` MODIFY `last_name` VARCHAR(25) NOT NULL;
ALTER TABLE `lab_emp` MODIFY `first_name` VARCHAR(25) NOT NULL;

ALTER TABLE `countries` DROP FOREIGN KEY `countries_regions_region_id`; 
ALTER TABLE `regions` DROP PRIMARY KEY;

ALTER TABLE `locations` DROP FOREIGN KEY `locations_countries_country_id`;

ALTER TABLE `employees` DROP FOREIGN KEY `employees_departments_department_id`; 
ALTER TABLE `job_history` DROP FOREIGN KEY `job_history_departments_department_id`;
DROP TABLE `departments`;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE `regions`;
SET FOREIGN_KEY_CHECKS = 1

ALTER TABLE `countries` DROP FOREIGN KEY `countries_regions_region_id`;
DROP TABLE `regions`;

ALTER TABLE `employees` DROP FOREIGN KEY `employees_jobs_job_id`;
ALTER TABLE `employees` DROP `job_id`;
DESCRIBE `employees`;