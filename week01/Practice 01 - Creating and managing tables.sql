CREATE TABLE `EMP` (
	`id` int(7),
  	`last_name` varchar(25),
  	`first_name` varchar(25),
  	`dept_id` int(7)
);

ALTER TABLE `job_it` ADD `emp_id` int(11);
DESCRIBE `job_it`;

ALTER TABLE `job_it` MODIFY `job_title` varchar(50);
DESCRIBE `job_it`;

ALTER TABLE `job_it` DROP `MAX_SALARY`;
DESCRIBE `job_it`;